package com.muko.service.impl.administratorServiceImpl;

import com.muko.dao.CategoryDao;
import com.muko.dao.PackingDao;
import com.muko.dao.Wares_basic_infoDao;
import com.muko.domain.Category;
import com.muko.domain.Packing;
import com.muko.domain.Wares_basic_info;
import com.muko.service.administratorService.WaresService;
import com.muko.utils.ImgUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

/**
 * @ description:
 */
@Service("waresService")
public class WaresServiceImpl implements WaresService {


    private PackingDao packingDao;
    private CategoryDao categoryDao;
    private Wares_basic_infoDao wbiDao;

    @Autowired
    public void setPackingDao(PackingDao packingDao) {
        this.packingDao = packingDao;
    }

    @Autowired
    public void setCategoryDao(CategoryDao categoryDao) {
        this.categoryDao = categoryDao;
    }

    @Override
    public List<String> findPkUtilsByLevel(Integer level) {
        return packingDao.findUtilsByLevel(level - 1);
    }

    @Autowired
    public void setWbiDao(Wares_basic_infoDao wbiDao) {
        this.wbiDao = wbiDao;
    }

//--------------------------------------------------------------------------------------

    @Override
    public Map<String, String> addWBI(MultipartFile img, Wares_basic_info wbi) {
        Map<String, String> map = new HashMap<>();
        if (img == null) {
            map.put("result", "error");
            map.put("msg", "未选择图片文件！");
            return map;
        }
        if (img.getSize() > 1024 * 1024 * 5) {
            map.put("result", "error");
            map.put("msg", "上传文件失败，文件大小不能超过5MB");
            return map;
        }
        @SuppressWarnings("ConstantConditions") String suf = img.getOriginalFilename().
                substring(img.getOriginalFilename().lastIndexOf(".") + 1);
        if (!"jpg,jpeg,gif,png".toUpperCase().contains(suf.toUpperCase())) {
            map.put("result", "error");
            map.put("msg", "请选择jpg,jpeg,gif,png格式的图片！");
            return map;
        }

        String savePath = ImgUtil.getImgFolderPath(ImgUtil.WIPP);
        String fileName = UUID.randomUUID().toString().replaceAll("-", "") + "." + suf;
        wbi.setWbi_imgURL(ImgUtil.getImgFolderPath(ImgUtil.WIVP) + fileName);
        String cp = wbi.getWbi_ct_code() + wbi.getWbi_pk_code();
        Integer num = wbiDao.findCountsByCtPk(cp);
        String code = String.format("%02d", num + 1);
        wbi.setWbi_code(cp + code);

        System.out.println(wbi);

        try {
            wbiDao.addRecord(wbi);
        } catch (Exception e){
            map.put("result", "error");
            map.put("msg", "保存商品基本信息异常");
            e.printStackTrace();
            return map;
        }

        try {
            img.transferTo(new File(savePath + fileName));
        } catch (IOException e) {
            map.put("result", "error");
            map.put("msg", "保存图片文件异常");
            e.printStackTrace();
            return map;
        }



        map.put("result", "success");
        map.put("msg", "保存成功！");
        return map;

    }


//--------------------------------------------------------------------------------------
    @Override
    public String addPacking(Packing packing) {
        try {
            Integer lv = packing.getPk_level();
            String upk = packing.getUpk_code();
            String code = String.format("%03d", packingDao.findCountsByLevel(lv) + 1);
            packing.setPk_code(lv.toString() + code);
            if (lv.equals(1))
                packing.setUpk_code(null);
            else
                packing.setUpk_code(packingDao.findCodeByUnit(upk, lv - 1));
            packingDao.addRecord(packing);
        } catch (Exception e) {
            e.printStackTrace();
            return "添加失败！";
        }
        return "添加成功！";

    }

    @Override
    public List<Packing> findAllPks() {
        return packingDao.findAll();
    }

    @Override
    public List<Packing> findPksByCondition(Packing packing) {
        return packingDao.findByCondition(packing);
    }

    @Override
    public Packing findPkByCode(String pk_code) {
        return packingDao.findByCode(pk_code);
    }

    @Override
    public String removePkByCode(String pk_code) {
        try {
            packingDao.deleteByCode(pk_code);
        } catch (Exception e) {
            e.printStackTrace();
            return "删除失败！";
        }
        return "删除成功！";
    }

    @Override
    public String saveEditPk(Packing packing) {
        try {
            packingDao.updateEdit(packing);
        } catch (Exception e) {
            e.printStackTrace();
            return "修改失败！";
        }
        return "修改成功！";
    }


//--------------------------------------------------------------------------------------


    @Override
    public List<Category> findAllCts() {
        return categoryDao.findAll();
    }

    @Override
    public List<Category> findCtsByCondition(Category category) {
        return categoryDao.findByCondition(category);
    }

    @Override
    public Category findCtByCode(String ct_code) {
        return categoryDao.findByCode(ct_code);
    }

    @Override
    public List<String> findCtNamesByLevel(Integer ct_level) {
        return categoryDao.findNameByLevel(ct_level);
    }

    @Override
    public String addCt(Category category) {
        try {
            Integer counts = categoryDao.findCountsByLevel(category.getCt_level());
            String serialNum = String.format("%02d", counts + 1);
            String pre;
            String suf;
            String uctCode;
            Integer level = category.getCt_level();
            String compCode;
            if (level == 1){
                pre = "";
                suf = "0000";
                compCode = pre + serialNum + suf;
                category.setCt_code(compCode);
                category.setUct_code(null);
            }
            if (level == 2){
                uctCode = categoryDao.findCodeByName(category.getUct_code());
                pre = uctCode.substring(0, 2);
                suf = "00";
                compCode = pre + serialNum + suf;
                category.setCt_code(compCode);
                category.setUct_code(uctCode);
            }
            if (level == 3){
                uctCode = categoryDao.findCodeByName(category.getUct_code());
                pre = uctCode.substring(0, 4);
                suf = "";
                compCode = pre + serialNum + suf;
                category.setCt_code(compCode);
                category.setUct_code(uctCode);
            }
            System.out.println(category);
            categoryDao.addRecord(category);
        } catch (Exception e) {
            e.printStackTrace();
            return "添加失败";
        }
        return "添加成功";
    }

    @Override
    public String removeCtByCode(String ct_code) {
        try {

            categoryDao.deleteByCode(ct_code);
        } catch (Exception e) {
            e.printStackTrace();
            return "删除失败,存在下级类别";
        }
        return "删除成功";
    }

    @Override
    public String saveEditCt(Category category) {
        try {

            categoryDao.updateRecord(category);
        } catch (Exception e) {
            e.printStackTrace();
            return "保存失败";
        }
        return "保存成功";
    }


}

package com.muko.service.impl.administratorServiceImpl;

import com.muko.dao.*;
import com.muko.domain.Customer;
import com.muko.domain.Staff;
import com.muko.domain.Supplier;
import com.muko.service.administratorService.PersonService;
import com.muko.utils.ImgUtil;
import com.muko.utils.PwEncryption;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.Instant;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * @ description:
 */
@Service("personManageService")
public class PersonServiceImpl implements PersonService {



    private StaffDao staffDao;
    private CategoryDao categoryDao;
    private SupplierDao supplierDao;
    private CustomerDao customerDao;


    @Autowired
    public void setStaffDao(StaffDao staffDao) {
        this.staffDao = staffDao;
    }

    @Autowired
    public void setCategoryDao(CategoryDao categoryDao) {
        this.categoryDao = categoryDao;
    }

    @Autowired
    public void setSupplierDao(SupplierDao supplierDao) {
        this.supplierDao = supplierDao;
    }

    @Autowired
    public void setCustomerDao(CustomerDao customerDao) {
        this.customerDao = customerDao;
    }

    /**
     * 查询所有员工，s_post!='--'
     *
     * @return 员工集合
     */
    @Override
    public List<Staff> findAllStaffs() {
        return staffDao.findAll();
    }

    /**
     * 通过条件查询员工
     *
     * @param staffMsg 员工信息
     * @return 员工集合
     */
    @Override
    public List<Staff> findStaffsByCondition(Staff staffMsg) {
        if (staffMsg.getS_post() != null) {
            if (!staffMsg.getS_post().equals("--"))
                return staffDao.findByCondition(staffMsg);
            else
                return staffDao.findAll();
        } else {
            List<Staff> staffs = new ArrayList<>();
            staffs.add(staffDao.findStaffByS_code(staffMsg.getS_code()));
            return staffs;
        }

    }

    /**
     * 添加员工
     *
     * @param staff 员工信息
     * @return 添加的员工信息
     */
    @Override
    public Staff addStaff(Staff staff) {
        String s_code = "";
        if (staff.getS_post().equals("销售员"))
            s_code += "1";
        if (staff.getS_post().equals("仓库管理员"))
            s_code += "2";
        if (staff.getS_post().equals("采购员"))
            s_code += "3";
        int num = staffDao.findCountsByPrefix(s_code) + 1;
        s_code += String.format("%02d", num);

        if (staffDao.findStaffByS_code(s_code) != null)
            throw new RuntimeException("重复的员工代码！");

        staff.setS_code(s_code);
        changeImg(staff, staff.getS_imgURL());
        String newPw;
        if (staff.getS_password() == null) {
            newPw = PwEncryption.md5Ep("000000");
        } else {
            newPw = PwEncryption.md5Ep(staff.getS_password());
        }
        staff.setS_password(newPw);
        staffDao.insertStaff(staff);
        return staff;
    }

    /**
     * 修改图片
     *
     * @param staff    员工信息
     * @param s_imgURL 图片虚拟路径
     */
    private void changeImg(Staff staff, String s_imgURL) {
        String base64Data = staff.getS_imgURL();
        if (base64Data.length() > 100) {
            //删除旧图片
            String fileName = Arrays.toString(s_imgURL.split("/Images/staffImages/"));
            ImgUtil.deleteImg(ImgUtil.getImgFolderPath(ImgUtil.SIPP) + fileName);
            //设置新图片
            String imgPath = ImgUtil.getImgFolderPath(ImgUtil.SIPP);
            String compFileName = ImgUtil.imgDecode(base64Data, imgPath);
            staff.setS_imgURL("/Images/staffImages/" + compFileName);
        }
    }

    /**
     * 更新员工信息
     *
     * @param staff 员工信息
     * @return 返回更新后的员工信息
     */
    @Override
    public List<Staff> updateStaff(Staff staff) {
        String post = staff.getS_post();
        String code = staff.getS_code();
        Staff oldStaff = staffDao.findStaffByS_code(code);
        List<Staff> staffs = new ArrayList<>();
        if (!post.equals(staffDao.findS_postByS_code(code))) {
            staffDao.deleteStaffByS_code(oldStaff.getS_code());
            staffs.add(addStaff(staff));
        } else {
            changeImg(staff, oldStaff.getS_imgURL());
            staffDao.updateStaff(staff);
            staffs.add(staffDao.findStaffByS_code(staff.getS_code()));
        }
        return staffs;
    }

    /**
     * 移除员工，将该员工的s_post设置为“--”
     *
     * @param s_code 员工代码
     */
    @Override
    public void removeStaffByS_code(String s_code) {
        staffDao.deleteStaffByS_code(s_code);
    }

    /**
     * 重置员工密码
     *
     * @param s_code 员工代码
     * @return 重置结果
     */
    @Override
    public String resetStaffPassword(String s_code) {
        try {
            String newPw = PwEncryption.md5Ep("000000");
            staffDao.updateStaffPwByS_code(s_code, newPw);
            return "重置员工密码成功！";
        } catch (Exception e) {
            return "重置员工密码失败！";
        }

    }

    /**
     * 通过商品类别等级查询商品类别名称
     *
     * @param level 商品类别等级
     * @return 商品类别名称列表
     */
    @Override
    public List<String> findCategoryByLevel(Integer level) {
        return categoryDao.findNameByLevel(level);
    }

    /**
     * 查询子类别名称，为‘--’时查询所有二级类别
     *
     * @param name 父类别名称
     * @return 子类别名称列表
     */
    @Override
    public List<String> findSubCategoryByName(String name) {
        if (!"--".equals(name))
            return categoryDao.findNameByUctName(name);
        else
            return categoryDao.findNameByLevel(2);
    }

    /**
     * 通过代码查询商品类别名称
     *
     * @param ct_code 类别代码
     * @return 类别名称
     */
    @Override
    public String findInputCtNameByCode(String ct_code) {
        if (categoryDao.findNameByCode(ct_code) == null)
            return "none";
        else return categoryDao.findNameByCode(ct_code);
    }

    /**
     * 添加供应商
     *
     * @param supplier 供应商信息
     * @return 添加结果
     */
    @Override
    public String addSupplier(Supplier supplier) {
        try {
//            System.out.println(supplier);
            String supCategory = categoryDao.findCodeByName(supplier.getSup_category());
            supplier.setSup_category(supCategory);
            String pre = supCategory.substring(0, 4);
            String suf = String.format("%02d", supplierDao.findCountsByPrefix(pre) + 1);
            supplier.setSup_code(pre + suf);
            supplierDao.insertRecord(supplier);
            return "添加成功！";
        } catch (Exception e) {
            e.printStackTrace();
            return "添加失败！";
        }

    }

    /**
     * 通过代码查询供应商信息
     *
     * @param sup_code 供应商代码
     * @return 供应商对象
     */
    @Override
    public Supplier findSupplierByCode(String sup_code) {
        return supplierDao.findByCode(sup_code);
    }

    /**
     * 查询所有可用供应商
     *
     * @return 可用供应商列表
     */
    @Override
    public List<Supplier> findAllSuppliers() {
        return supplierDao.findAll();
    }

    /**
     * 条件查询供应商
     *
     * @param supplier 供应商信息
     * @return 供应商列表
     */
    @Override
    public List<Supplier> findSuppliersByCondition(Supplier supplier) {
        String ct_code = categoryDao.findCodeByName(supplier.getSup_name());
        supplier.setSup_category(ct_code);
        return supplierDao.findByCondition(supplier);
    }

    /**
     * 保存编辑后的供应商信息
     *
     * @param supplier 供应商信息
     * @return 保存结果
     */
    @Override
    public String saveEditSupplier(Supplier supplier) {
        try {
            supplierDao.updateRecord(supplier);
            String ct = supplierDao.findCtByCode(supplier.getSup_code());
            if (!ct.equals(supplier.getSup_category())) {
                supplierDao.deleteByCode(supplier.getSup_code());
                //为了能正常执行添加供应商函数做的处理
                String name = categoryDao.findNameByCode(supplier.getSup_category());
                supplier.setSup_category(name);

                addSupplier(supplier);
            } else {
                supplierDao.updateRecord(supplier);
            }
        } catch (Exception e) {
            e.printStackTrace();
            return "保存失败";
        }
        return "保存成功！";
    }

    /**
     * 根据代码删除供应商（设置供应商品类别为空）
     *
     * @param sup_code 代码
     * @return 删除结果
     */
    @Override
    public String removeSupplierByCode(String sup_code) {
        try {
            supplierDao.deleteByCode(sup_code);
        } catch (Exception e) {
            e.printStackTrace();
            return "删除失败！";
        }
        return "删除成功！";
    }

    /**
     * 查询所有会员
     *
     * @return 会员列表
     */
    @Override
    public List<Customer> findAllCustomers() {
        return customerDao.findAll();
    }

    /**
     * 添加会员
     *
     * @param customer 会员信息
     * @return 添加结果
     */
    @Override
    public String addCustomer(Customer customer) {
        try {
            customer.setC_code(String.valueOf(Instant.now().getEpochSecond()));
            customerDao.addRecord(customer);
        } catch (Exception e) {
            e.printStackTrace();
            return "添加失败！";
        }
        return "添加成功！";
    }

    /**
     * 条件查询会员
     * @param customer 条件
     * @return 会员列表
     */
    @Override
    public List<Customer> findCustomersByCondition(Customer customer) {
        return customerDao.findByCondition(customer);
    }

    /**
     * 通过代码查询会员
     * @param c_code 会员代码
     * @return 会员信息
     */
    @Override
    public Customer findCustomerByCode(String c_code) {
        return customerDao.findByCode(c_code);
    }

    /**
     * 通过代码删除会员
     * @param c_code 会员代码
     * @return 删除结果
     */
    @Override
    public String removeCustomerByCode(String c_code) {
        try {
            //todo: 先设置该会员的销售单会员信息为null
            customerDao.deleteByCode(c_code);
        } catch (Exception e){
            e.printStackTrace();
            return "删除失败！";
        }
        return "删除成功！";
    }

    /**
     * 保存编辑后的会员信息
     * @param customer 会员信息
     * @return 保存结果
     */
    @Override
    public String saveEditCustomer(Customer customer) {
        try {
            //todo: 先设置该会员的销售单会员信息为null
            customerDao.updateRecord(customer);
        } catch (Exception e){
            e.printStackTrace();
            return "保存失败！";
        }
        return "保存成功！";
    }
}

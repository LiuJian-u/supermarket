package com.muko.controller.administratorController;

import com.muko.domain.Category;
import com.muko.domain.Packing;
import com.muko.domain.Wares_basic_info;
import com.muko.service.administratorService.WaresService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;
import java.util.Map;

/**
 * @ description:
 */
@Controller
@RequestMapping("/administrator/wares_info_manage")
public class WaresController {

    private WaresService waresService;

    @Autowired
    public void setWaresService(WaresService waresService) {
        this.waresService = waresService;
    }

    @RequestMapping("/main")
    public String toMain() {
        return "administrator/wares_management";
    }


    @RequestMapping("/addWBI")
    public @ResponseBody
    Map<String, String> addWBI(MultipartFile img, Wares_basic_info wbi){
        return waresService.addWBI(img, wbi);
    }



//---------------------------------------------------------------------------
    @RequestMapping("/findPkUtilsByLevel")
    public @ResponseBody
    List<String> findPkUtilsByLevel(@RequestParam Integer level) {
        return waresService.findPkUtilsByLevel(level);
    }

    @RequestMapping("/addPacking")
    public @ResponseBody
    String addPacking(@RequestBody Packing packing) {
        return waresService.addPacking(packing);
    }

    @RequestMapping("/findAllPks")
    public @ResponseBody
    List<Packing> findAllPks() {
        return waresService.findAllPks();
    }

    @RequestMapping("/findPksByCondition")
    public @ResponseBody
    List<Packing> findPksByCondition(@RequestBody Packing packing) {
        return waresService.findPksByCondition(packing);
    }

    @RequestMapping("/findPkByCode")
    public @ResponseBody
    Packing findPkByCode(@RequestParam String pk_code) {
        return waresService.findPkByCode(pk_code);
    }

    @RequestMapping("/removePkByCode")
    public @ResponseBody
    String removePkByCode(@RequestParam String pk_code) {
        return waresService.removePkByCode(pk_code);
    }

    @RequestMapping("/saveEditPk")
    public @ResponseBody
    String saveEditPk(@RequestBody Packing packing) {
        return waresService.saveEditPk(packing);
    }

//-------------------------------------------------------------------------

    @RequestMapping("/findAllCts")
    public @ResponseBody
    List<Category> findAllCts() {
        return waresService.findAllCts();
    }

    @RequestMapping("/findCtsByCondition")
    public @ResponseBody
    List<Category> findCtsByCondition(@RequestBody Category category) {
        return waresService.findCtsByCondition(category);
    }

    @RequestMapping("/findCtByCode")
    public @ResponseBody
    Category findCtByCode(@RequestParam String ct_code) {
        return waresService.findCtByCode(ct_code);
    }

    @RequestMapping("/findCtNamesByLevel")
    public @ResponseBody
    List<String> findCtNamesByLevel(@RequestParam Integer ct_level) {
        return waresService.findCtNamesByLevel(ct_level-1);
    }

    @RequestMapping("addCt")
    public @ResponseBody
    String addCt(@RequestBody Category category) {
        return waresService.addCt(category);
    }

    @RequestMapping("/removeCtByCode")
    public @ResponseBody
    String removeCtByCode(@RequestParam String ct_code) {
        return waresService.removeCtByCode(ct_code);
    }

    @RequestMapping("/saveEditCt")
    public @ResponseBody
    String saveEditCt(@RequestBody Category category) {
        return waresService.saveEditCt(category);
    }



}

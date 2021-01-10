package com.muko.controller.administratorController;

import com.muko.domain.Customer;
import com.muko.domain.Staff;
import com.muko.domain.Supplier;
import com.muko.service.administratorService.PersonService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * @ description:
 */
@Controller
@RequestMapping("/administrator/per_info_manage")
public class PersonController {

    private PersonService personService;

    @Autowired
    public void setPersonService(PersonService personService) {
        this.personService = personService;
    }

    @RequestMapping("/main")
    public String per_info_manage() {
        return "administrator/personnel_management";
    }

    /**
     * 查询所有员工
     *
     * @return 员工列表
     */
    @RequestMapping("/findAllStaffs")
    public @ResponseBody
    List<Staff> queryStaffs() {
        return personService.findAllStaffs();
    }

    /**
     * 条件查询员工
     *
     * @param staffMsg 查询条件
     * @return 员工列表
     */
    @RequestMapping("/findStaffsByCondition")
    public @ResponseBody
    List<Staff> queryStaffsByCondition(@RequestBody Staff staffMsg) {
        return personService.findStaffsByCondition(staffMsg);
    }

    /**
     * 添加员工
     *
     * @param staff 员工信息
     * @return 添加结果
     */
    @RequestMapping("/addStaff")
    public @ResponseBody
    String addStaff(@RequestBody Staff staff) {
        System.out.println(staff);
        Staff result = personService.addStaff(staff);
        if (result != null)
            return "添加员工成功！";
        else
            return "添加失败！";
    }

    /**
     * 保存编辑的员工信息
     *
     * @param staff 员工信息
     * @return 修改的员工列表
     */
    @RequestMapping("/saveEditStaff")
    public @ResponseBody
    List<Staff> saveEditStaff(@RequestBody Staff staff) {
        return personService.updateStaff(staff);
    }

    /**
     * 重置员工密码
     *
     * @param s_code 员工代码
     * @return 重置结果
     */
    @RequestMapping("/resetStaffPassword")
    public @ResponseBody
    String resetStaffPassword(@RequestParam String s_code) {
        return personService.resetStaffPassword(s_code);
    }

    /**
     * 删除员工
     *
     * @param s_code 员工代码
     * @return 删除结果
     */
    @RequestMapping("/removeStaff")
    public @ResponseBody
    String removeStaff(@RequestParam String s_code) {
        personService.removeStaffByS_code(s_code);
        return "删除成功！";
    }

    /**
     * 查询商品类别
     *
     * @param level 商品类别等级
     * @return 商品类别列表
     */
    @RequestMapping("/findCategory")
    public @ResponseBody
    List<String> queryWaresCategory(@RequestParam Integer level) {
        return personService.findCategoryByLevel(level);
    }

    /**
     * 查询子类别名称
     *
     * @param name 主类别名称
     * @return 子类别名称列表
     */
    @RequestMapping("/findSubCategoryByName")
    public @ResponseBody
    List<String> findSubCategoryByName(@RequestParam String name) {
        return personService.findSubCategoryByName(name);
    }

    /**
     * 通过代码查询类别名称
     *
     * @param ct_code 类别代码
     * @return 类别名称
     */
    @RequestMapping("/findInputCtNameByCode")
    public @ResponseBody
    String findInputCtNameByCode(@RequestParam String ct_code) {
        return personService.findInputCtNameByCode(ct_code);
    }

    /**
     * 添加供应商
     *
     * @param supplier 供应商信息
     * @return 添加结果
     */
    @RequestMapping("/addSupplier")
    public @ResponseBody
    String addSupplier(@RequestBody Supplier supplier) {
        return personService.addSupplier(supplier);
    }

    /**
     * 查询所有供应商
     *
     * @return 供应商列表
     */
    @RequestMapping("/findAllSuppliers")
    public @ResponseBody
    List<Supplier> findAllSuppliers() {
        return personService.findAllSuppliers();
    }

    /**
     * 通过代码查询供应商
     *
     * @param sup_code 供应商代码
     * @return 供应商
     */
    @RequestMapping("/findSupplierByCode")
    public @ResponseBody
    Supplier findSupplierByCode(@RequestParam String sup_code) {
        return personService.findSupplierByCode(sup_code);
    }

    /**
     * 条件查询供应商
     *
     * @param supplier 供应商信息
     * @return 供应商列表
     */
    @RequestMapping("/findSuppliersByCondition")
    public @ResponseBody
    List<Supplier> findSuppliersByCondition(@RequestBody Supplier supplier) {
        return personService.findSuppliersByCondition(supplier);
    }

    /**
     * 保存编辑后的供应商
     *
     * @param supplier 供应商信息
     * @return 保存结果
     */
    @RequestMapping("/saveEditSupplier")
    public @ResponseBody
    String saveEditSupplier(@RequestBody Supplier supplier) {
        return personService.saveEditSupplier(supplier);
    }

    /**
     * 删除供应商
     *
     * @param sup_code 供应商代码
     * @return 删除结果
     */
    @RequestMapping("/removeSupplier")
    public @ResponseBody
    String removeSupplier(@RequestParam String sup_code) {
        return personService.removeSupplierByCode(sup_code);
    }

    /**
     * 查询所有会员
     *
     * @return 会员列表
     */
    @RequestMapping("/findAllCustomers")
    public @ResponseBody
    List<Customer> findAllCustomers() {
        return personService.findAllCustomers();
    }

    /**
     * 添加会员
     *
     * @param customer 会员信息
     * @return 添加结果
     */
    @RequestMapping("/addCustomer")
    public @ResponseBody
    String addCustomer(@RequestBody Customer customer) {
        return personService.addCustomer(customer);
    }

    /**
     * 条件查询会员
     *
     * @param customer 条件
     * @return 会员列表
     */
    @RequestMapping("/findCustomersByCondition")
    public @ResponseBody List<Customer> findCustomersByCondition(@RequestBody Customer customer) {
        return personService.findCustomersByCondition(customer);
    }

    /**
     * 通过代码查询会员
     *
     * @param c_code 会员代码
     * @return 会员信息
     */
    @RequestMapping("/findCustomerByCode")
    public @ResponseBody
    Customer findCustomerByCode(@RequestParam String c_code) {
        return personService.findCustomerByCode(c_code);
    }

    /**
     * 通过代码删除会员
     *
     * @param c_code 会员代码
     * @return 删除结果
     */
    @RequestMapping("/removeCustomerByCode")
    public @ResponseBody
    String removeCustomerByCode(@RequestParam String c_code) {
        return personService.removeCustomerByCode(c_code);
    }

    /**
     * 保存编辑后的会员信息
     *
     * @param customer 会员信息
     * @return 保存结果
     */
    @RequestMapping("/saveEditCustomer")
    public @ResponseBody
    String saveEditCustomer(@RequestBody Customer customer) {
        return personService.saveEditCustomer(customer);
    }
}

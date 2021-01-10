package com.muko.service.administratorService;

import com.muko.domain.Category;
import com.muko.domain.Packing;
import com.muko.domain.Wares_basic_info;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;
import java.util.Map;

/**
 * @ description:
 */
public interface WaresService {
    List<String> findPkUtilsByLevel(Integer level);

    List<Packing> findAllPks();

    String addPacking(Packing packing);

    Packing findPkByCode(String pk_code);

    String removePkByCode(String pk_code);

    List<Packing> findPksByCondition(Packing packing);

    String saveEditPk(Packing packing);

    List<Category> findAllCts();

    List<Category> findCtsByCondition(Category category);

    Category findCtByCode(String ct_code);

    String addCt(Category category);

    String removeCtByCode(String ct_code);

    String saveEditCt(Category category);

    List<String> findCtNamesByLevel(Integer ct_level);

    Map<String, String> addWBI(MultipartFile img, Wares_basic_info wbi);
}

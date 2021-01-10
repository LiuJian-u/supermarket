package com.muko.dao;

import com.muko.domain.Wares_basic_info;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

/**
 * @ description:
 */
@Repository
public interface Wares_basic_infoDao {
    Integer findCountsByCtPk(@Param("cp") String cp);
    void addRecord(Wares_basic_info wares_basic_info);
}

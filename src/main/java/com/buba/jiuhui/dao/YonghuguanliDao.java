package com.buba.jiuhui.dao;

import com.buba.jiuhui.bean.User;
import com.buba.jiuhui.bean.Yonghuguanli;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface YonghuguanliDao {

    List<Yonghuguanli>findAllyonghu();

    List<Yonghuguanli>finaAllzhanshiyonghu(Integer id);


    int insertuser(@Param("userName") String userName, @Param("pId")Integer pId, @Param("userCode")String userCode,@Param("password")String password,@Param("level")String level);

List<User>chaxunlevel(Integer id);

}

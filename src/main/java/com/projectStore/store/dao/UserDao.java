package com.projectStore.store.dao;
import com.projectStore.store.domain.*;

import org.springframework.stereotype.Service;



public interface UserDao {
    User selectUser(String id) throws Exception;
    int deleteUser(String id) throws Exception;
    int insertUser(User user) throws Exception;
    int updateUser(User user) throws Exception;
    int count() throws Exception;
    void deleteAll() throws Exception;

    int idCheck(String id) throws Exception;
}
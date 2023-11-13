package com.projectStore.store.dao;

import com.projectStore.store.domain.User;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.sql.SQLException;

import static org.junit.Assert.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class UserDaoImplTest {
@Autowired
UserDao userDao;
    @Test
    public void insertUser() throws Exception{
        userDao.deleteAll();
        userDao.insertUser(new User("asdf22202","1234","kim","aaaa@aaa.com", "299229292","123456"));
        assertTrue(userDao.count() ==1);

    }

    @Test
    public void updateUser() {
    }

    @Test
    public void deleteUser()  throws Exception{

     userDao.deleteUser("kdst6156");
     assertTrue(userDao.count()!=1);







    }



        @Test
        public void idCheck() throws Exception {
            String existingId = "kdst6156";
            String nonExistingId = "test1234";

            // 이미 존재하는 아이디를 사용하여 테스트
            int resultExisting = userDao.idCheck(existingId);
            assertTrue(resultExisting ==1);

            // 존재하지 않는 아이디를 사용하여 테스트
            int resultNonExisting = userDao.idCheck(nonExistingId);
            assertTrue(resultNonExisting == 0);
        }

    }







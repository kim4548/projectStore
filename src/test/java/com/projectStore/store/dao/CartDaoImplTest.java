package com.projectStore.store.dao;

import com.projectStore.store.dto.CartDto;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import static org.junit.Assert.*;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class CartDaoImplTest {
@Autowired
CartDao cartDao;



    @Test
    public void insertCart() throws Exception {
     CartDto   cart = new CartDto("kdst6156",1,1,"매병",50000,1);



assertTrue(cartDao.insertCart(cart)==1);



    }

    @Test
    public void deleteCart() {
    }

    @Test
    public void updateCart() {
    }

    @Test
    public void getCart() {
    }

    @Test
    public void selectCart() {
    }
}
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
     cartDao.insertCart(new CartDto("kdst6156",2,3,"접시",50000,1));






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
    public void selectCart() throws Exception {

    CartDto cartDto = new CartDto("kdst61561",1,1,"화병",25000 ,1 );
   cartDao.selectCart(cartDto.getId());





    }
}
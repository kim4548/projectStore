package com.projectStore.store.dao;

import com.projectStore.store.dto.CartDto;

import java.util.List;


public interface CartDao {

    public int insertCart(CartDto cartDto) throws  Exception;

    public int deleteCart(CartDto cartDto)throws  Exception;

    public int updateCart(CartDto cartDto)throws  Exception;

    public List<CartDto> getCart(String id)throws  Exception;

    public CartDto selectCart(CartDto cartDto)throws  Exception;
    int count() throws Exception;



}

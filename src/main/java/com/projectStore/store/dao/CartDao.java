package com.projectStore.store.dao;

import com.projectStore.store.dto.CartDto;

import java.util.List;


public interface CartDao {

    public int addCart(CartDto cartDto);

    public int deleteCart(CartDto cartDto);

    public int modifyCount(CartDto cartDto);

    public List<CartDto> getCart(String memberId);

    public CartDto checkCart(CartDto cartDto);




}

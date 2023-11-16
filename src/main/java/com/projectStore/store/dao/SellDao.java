package com.projectStore.store.dao;

import com.projectStore.store.dto.CartDto;
import com.projectStore.store.dto.SellDto;

public interface SellDao {


    public int insertSell(CartDto cartDto) throws Exception;
    public int deleteSell(String id) throws Exception;

    public SellDto selectSell(String id)throws Exception;
    public int updateSell(String id ) throws Exception;




}

package com.projectStore.store.service;


import com.projectStore.store.domain.AttachImageVO;
import com.projectStore.store.mapper.AttachMapper;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class AttachServiceImpl implements AttachService{
    @Autowired
    AttachMapper attachMapper;
    @Override
    public List<AttachImageVO> getAttachList(int sellId) {
         return attachMapper.getAttachList(sellId);
    }
}

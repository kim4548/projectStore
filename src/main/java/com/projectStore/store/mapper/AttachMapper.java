package com.projectStore.store.mapper;

import com.projectStore.store.domain.AttachImageVO;

import java.util.List;

public interface AttachMapper {
    /* 이미지 데이터 반환 */
    public List<AttachImageVO> getAttachList(int sellId);
}

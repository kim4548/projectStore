package com.projectStore.store.service;

import com.projectStore.store.domain.AttachImageVO;
import com.projectStore.store.dto.ProductDto;

import java.util.List;

public interface AdminService {
    //상품 등록
    public void productEnroll(ProductDto productDto);


    /* 상품 수정 */
    public int goodsModify(ProductDto productDto);

    /* 상품 정보 삭제 */
    public int goodsDelete(int sellId);

    /* 지정 상품 이미지 정보 얻기 */
    public List<AttachImageVO> getAttachInfo(int sellId);

    /* 상품 리스트 */
    public List<ProductDto> goodsGetList();

    /* 상품 총 개수 */
    public int goodsGetTotal(ProductDto productDto);

}

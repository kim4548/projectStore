package com.projectStore.store.service;

import com.projectStore.store.domain.AttachImageVO;
import com.projectStore.store.dto.ProductDto;
import com.projectStore.store.mapper.ProductMapper;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class AdminServiceImpl implements AdminService{


    @Autowired
    private ProductMapper productMapper;



    public AdminServiceImpl(ProductMapper productMapper) {
        this.productMapper = productMapper;
    }


    @Transactional
    @Override
    public void productEnroll(ProductDto productDto) {
        productMapper.sellEnroll(productDto);
        if (productDto.getImageDtoList() == null || productDto.getImageDtoList().size() <= 0){
            return;
        }
        productDto.getImageDtoList().forEach(attachImageVO -> {
            attachImageVO.setSellId(productDto.getSellId());
            productMapper.imageEnroll(attachImageVO);
        });

    }

   @Transactional
    @Override
    public int goodsModify(ProductDto productDto) {
       int result = productMapper.goodsModify(productDto);

        if(result == 1 && productDto.getImageDtoList() != null && productDto.getImageDtoList().size() > 0) {

            productMapper.deleteImageAll(productDto.getSellId());

            productDto.getImageDtoList().forEach(attach -> {

                attach.setSellId(productDto.getSellId());
                productMapper.imageEnroll(attach);

            });

        }


        return result;
    }

    @Transactional
    @Override
    public int goodsDelete(int sellId) {

        productMapper.deleteImageAll(sellId);
        return productMapper.goodsDelete(sellId);

    }

    @Override
    public List<AttachImageVO> getAttachInfo(int sellId) {

        return productMapper.getAttachInfo(sellId);

    }

    @Override
    public List<ProductDto> goodsGetList() {
        return productMapper.goodsGetList();
    }

    @Override
    public int goodsGetTotal(ProductDto productDto) {
        return productMapper.goodsGetTotal(productDto);
    }
}

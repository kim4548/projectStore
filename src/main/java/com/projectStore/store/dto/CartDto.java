package com.projectStore.store.dto;

import com.projectStore.store.domain.AttachImageVO;

import java.util.List;
import java.util.Objects;



// 장바구니 dto
public class CartDto {

    // user.getId()
  private   String id;

  // cart Id


  //상품 id
  private   int sellId;

  //상품 수량
  private   int sellCount;

  //상품 이름
  private   String sellName;

  //상품 가격
  private   int sellPrice;

  //토탈 가격
  private   int totalPrice;

  private int cartId ;

  //상품 이미지
    private List<AttachImageVO> sellImageDTOList;

    public int getCartId() {
        return cartId;
    }

    public void setCartId(int cartId) {
        this.cartId = cartId;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public List<AttachImageVO> getSellImageDTOList() {
        return sellImageDTOList;
    }

    public void setSellImageDTOList(List<AttachImageVO> sellImageDTOList) {
        this.sellImageDTOList = sellImageDTOList;
    }



    public int getSellId() {
        return sellId;
    }

    public void setSellId(int sellId) {
        this.sellId = sellId;
    }

    public int getSellCount() {
        return sellCount;
    }

    public void setSellCount(int sellCount) {
        this.sellCount = sellCount;
    }

    public String getSellName() {
        return sellName;
    }

    public void setSellName(String sellName) {
        this.sellName = sellName;
    }

    public int getSellPrice() {
        return sellPrice;
    }

    public void setSellPrice(int sellPrice) {
        this.sellPrice = sellPrice;
    }




    public int getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(int totalPrice) {
        this.totalPrice = totalPrice;
    }


    public CartDto(){}

    public CartDto(String id,String sellName ){
        this.id = id;
        this.sellName = sellName;
        this.totalPrice=this.sellPrice*this.sellCount;

    }
    public CartDto(String id, int sellId, int sellCount, String sellName, int sellPrice ,int totalPrice ) {
        this.id = id;
        this.sellId = sellId;
        this.sellCount = sellCount;
        this.sellName = sellName;
        this.sellPrice = sellPrice;
        this.totalPrice=this.sellCount*this.sellPrice;

    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        CartDto cartDto = (CartDto) o;
        return  sellId == cartDto.sellId && sellCount == cartDto.sellCount && sellPrice == cartDto.sellPrice && totalPrice == cartDto.totalPrice && Objects.equals(id, cartDto.id) && Objects.equals(sellName, cartDto.sellName);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id,  sellId, sellCount, sellName, sellPrice,  totalPrice);
    }

    @Override
    public String toString() {
        return "CartDto{" +
                "id='" + id + '\'' +
                ", sellId=" + sellId +
                ", sellCount=" + sellCount +
                ", sellName='" + sellName + '\'' +
                ", sellPrice=" + sellPrice +
                ", totalPrice=" + totalPrice +
                '}';
    }
}

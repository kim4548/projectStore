package com.projectStore.store.dto;

import java.util.Objects;

public class CartDto {
  private   String memberId;
  private   int cartId;
  private   int sellId;
  private   int sellCount;

  private   String sellName;
  private   int sellPrice;
  private   double sellDiscount;

  private   int salePrice;
  private   int totalPrice;


    public String getMemberId() {
        return memberId;
    }

    public void setMemberId(String memberId) {
        this.memberId = memberId;
    }

    public int getCartId() {
        return cartId;
    }

    public void setCartId(int cartId) {
        this.cartId = cartId;
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

    public double getSellDiscount() {
        return sellDiscount;
    }

    public void setSellDiscount(double sellDiscount) {
        this.sellDiscount = sellDiscount;
    }

    public int getSalePrice() {
        return salePrice;
    }

    public void setSalePrice(int salePrice) {
        this.salePrice = salePrice;
    }

    public int getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(int totalPrice) {
        this.totalPrice = totalPrice;
    }


    public CartDto(){}
    public CartDto(String memberId, int cartId, int sellId, int sellCount, String sellName, int sellPrice, double sellDiscount) {
        this.memberId = memberId;
        this.cartId = cartId;
        this.sellId = sellId;
        this.sellCount = sellCount;
        this.sellName = sellName;
        this.sellPrice = sellPrice;
        this.sellDiscount = sellDiscount;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        CartDto cartDto = (CartDto) o;
        return cartId == cartDto.cartId && sellId == cartDto.sellId && sellCount == cartDto.sellCount && sellPrice == cartDto.sellPrice && Double.compare(sellDiscount, cartDto.sellDiscount) == 0 && salePrice == cartDto.salePrice && totalPrice == cartDto.totalPrice && Objects.equals(memberId, cartDto.memberId) && Objects.equals(sellName, cartDto.sellName);
    }

    @Override
    public int hashCode() {
        return Objects.hash(memberId, cartId, sellId, sellCount, sellName, sellPrice, sellDiscount, salePrice, totalPrice);
    }

    @Override
    public String toString() {
        return "CartDto{" +
                "memberId='" + memberId + '\'' +
                ", cartId=" + cartId +
                ", sellId=" + sellId +
                ", sellCount=" + sellCount +
                ", sellName='" + sellName + '\'' +
                ", sellPrice=" + sellPrice +
                ", sellDiscount=" + sellDiscount +
                ", salePrice=" + salePrice +
                ", totalPrice=" + totalPrice +
                '}';
    }
}

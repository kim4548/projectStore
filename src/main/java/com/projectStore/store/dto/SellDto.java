package com.projectStore.store.dto;


import java.util.Date;
import java.util.List;

// 상품 Dto
public class SellDto {
    private int sellId;
    private String sellName;

    //상품가격
    private  int sellPrice;
    private  int sellCount;


    //상품소개
    private String sellIntro;

    //상품 목차
    private String sellContents;

    //등록 날짜
    private Date sell_regDate;

    private Date sell_updateDate;

    //이미지 정보
    private List<SellImageDto> imageDtoList;

    public int getSellId() {
        return sellId;
    }

    public void setSellId(int sellId) {
        this.sellId = sellId;
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

    public int getSellCount() {
        return sellCount;
    }

    public void setSellCount(int sellCount) {
        this.sellCount = sellCount;
    }

    public String getSellIntro() {
        return sellIntro;
    }

    public void setSellIntro(String sellIntro) {
        this.sellIntro = sellIntro;
    }

    public String getSellContents() {
        return sellContents;
    }

    public void setSellContents(String sellContents) {
        this.sellContents = sellContents;
    }

    public Date getSell_regDate() {
        return sell_regDate;
    }

    public void setSell_regDate(Date sell_regDate) {
        this.sell_regDate = sell_regDate;
    }

    public Date getSell_updateDate() {
        return sell_updateDate;
    }

    public void setSell_updateDate(Date sell_updateDate) {
        this.sell_updateDate = sell_updateDate;
    }

    public List<SellImageDto> getImageDtoList() {
        return imageDtoList;
    }

    public void setImageDtoList(List<SellImageDto> imageDtoList) {
        this.imageDtoList = imageDtoList;
    }

    public SellDto(){}

    public SellDto(int sellId, String sellName, int sellPrice, int sellCount, String sellIntro, String sellContents, Date sell_regDate, Date sell_updateDate, List<SellImageDto> imageDtoList) {
        this.sellId = sellId;
        this.sellName = sellName;
        this.sellPrice = sellPrice;
        this.sellCount = sellCount;
        this.sellIntro = sellIntro;
        this.sellContents = sellContents;
        this.sell_regDate = sell_regDate;
        this.sell_updateDate = sell_updateDate;
        this.imageDtoList = imageDtoList;
    }
}

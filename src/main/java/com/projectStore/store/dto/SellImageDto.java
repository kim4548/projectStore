package com.projectStore.store.dto;


import java.util.Objects;

//상품 이미지 Dto
public class SellImageDto {
    //경로
    private String upLoadPath;
    private String uuid;

    private String fileName;

    private int sellId;

    public String getUpLoadPath() {
        return upLoadPath;
    }

    public void setUpLoadPath(String upLoadPath) {
        this.upLoadPath = upLoadPath;
    }

    public String getUuid() {
        return uuid;
    }

    public void setUuid(String uuid) {
        this.uuid = uuid;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public int getSellId() {
        return sellId;
    }

    public void setSellId(int sellId) {
        this.sellId = sellId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        SellImageDto that = (SellImageDto) o;
        return sellId == that.sellId && Objects.equals(upLoadPath, that.upLoadPath) && Objects.equals(uuid, that.uuid) && Objects.equals(fileName, that.fileName);
    }

    @Override
    public int hashCode() {
        return Objects.hash(upLoadPath, uuid, fileName, sellId);
    }
}

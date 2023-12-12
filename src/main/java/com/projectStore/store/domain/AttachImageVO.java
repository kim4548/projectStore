package com.projectStore.store.domain;

public class AttachImageVO {
    //경로
    private String uploadPath;


    //uuid
    private String uuid;
    //파일이름
    private String fileName;

    //상품id
    private int SellId;

    public String getUploadPath() {
        return uploadPath;
    }

    public void setUploadPath(String uploadPath) {
        this.uploadPath = uploadPath;
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
        return SellId;
    }

    public void setSellId(int sellId) {
        SellId = sellId;
    }

    @Override
    public String toString() {
        return "AttachImageVO{" +
                "uploadPath='" + uploadPath + '\'' +
                ", uuid='" + uuid + '\'' +
                ", fileName='" + fileName + '\'' +
                ", SellId=" + SellId +
                '}';
    }
}

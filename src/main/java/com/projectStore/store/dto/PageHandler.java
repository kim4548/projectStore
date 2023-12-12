package com.projectStore.store.dto;

import org.springframework.web.util.UriComponentsBuilder;

import java.util.Map;

public class PageHandler {


    private SearchCondition sc;

    // sc 안에 page,pageSize,option, keyword 포함

    public final int NAV_SIZE=10;




 private    int totalCnt;
 private    int totalPage;
 private    int beginPage;
 private    int endPage;

 private    boolean showNext= false;  //이후를 보여줄지의 여부, endPage ==totalPage 이면 ,showNext는 false

 private    boolean showPrev = false; //이전을 보여줄지의 여부, beginPage==1 이 아니면 showPrev 는 false




    public PageHandler(int totalCnt, Integer page){
        this(totalCnt,new SearchCondition(page,10));
    }

    public PageHandler(int totalCnt, Integer page,Integer pageSize){
        this(totalCnt,new SearchCondition(page,pageSize));
    }


    public  PageHandler(int totalCnt, SearchCondition sc){
        this.totalCnt= totalCnt;
        this.sc=sc;
        doPaging(totalCnt,sc);
    }



    private void doPaging(int totalCnt ,SearchCondition sc){
    this.totalPage= totalCnt/sc.getPageSize()+(totalCnt %sc.getPageSize()==0 ? 0:1);
    this.sc.setPage(Math.min(sc.getPage(),totalPage)); // page 가 totalPage 보다 크지 않게
        this.beginPage=(this.sc.getPage()-1) / NAV_SIZE* NAV_SIZE +1;   //5/10*10+1
        this.endPage=Math.min(beginPage+NAV_SIZE -1 , totalPage);
        this.showPrev =beginPage!=1;
        this.showNext= endPage!=totalPage;
    }

    public String getQueryString(){
        return getQueryString(this.sc.getPage());
    }

    public String getQueryString(Integer page){
        return UriComponentsBuilder.newInstance()
                .queryParam("page",page)
                .queryParam("pageSize", sc.getPageSize())
                .queryParam("option",sc.getOption())
                .queryParam("keyword",sc.getKeyword())
                .build().toString();
    }

    void print(){
        System.out.println("page=" +sc.getPage());
        System.out.println(showPrev? "PREV" :"");


    for(int i= beginPage; i<=endPage; i++){
        System.out.println(i+" ");
    }
        System.out.println(showNext? "NEXT" : "");
}

    public SearchCondition getSc() {
        return sc;
    }

    public void setSc(SearchCondition sc) {
        this.sc = sc;
    }



    public int getTotalCnt() {
        return totalCnt;
    }

    public void setTotalCnt(int totalCnt) {
        this.totalCnt = totalCnt;
    }


    public int getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }

    public boolean getShowPrev() {
        return showPrev;
    }

    public void setShowPrev(boolean showPrev) {
        this.showPrev = showPrev;
    }

    public boolean getShowNext() {
        return showNext;
    }

    public void setShowNext(boolean showNext) {
        this.showNext = showNext;
    }

    public int getBeginPage() {
        return beginPage;
    }

    public void setBeginPage(int beginPage) {
        this.beginPage = beginPage;
    }

    public int getEndPage() {
        return endPage;
    }

    public void setEndPage(int endPage) {
        this.endPage = endPage;
    }

    public int getNAV_SIZE() {
        return NAV_SIZE;
    }

    public boolean isShowNext() {
        return showNext;
    }

    public boolean isShowPrev() {
        return showPrev;
    }

    @Override
    public String toString() {
        return "PageHandler{" +
                "sc=" + sc +
                ", NAV_SIZE=" + NAV_SIZE +
                ", totalCnt=" + totalCnt +
                ", totalPage=" + totalPage +
                ", beginPage=" + beginPage +
                ", endPage=" + endPage +
                ", showNext=" + showNext +
                ", showPrev=" + showPrev +
                '}';
    }
}

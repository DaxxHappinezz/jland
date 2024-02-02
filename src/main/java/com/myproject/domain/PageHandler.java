package com.myproject.domain;

import java.util.List;

public class PageHandler {
    private int totalReviewCnt;
    private int totalPageCnt;
    private int navSize;
    private int pageSize;
    private int currentPage;
    private int headPage;
    private int beginPage;
    private int endPage;
    private boolean showPrev;
    private boolean showNext;
    private List<?> itemsList;

    public PageHandler() {}
    public PageHandler(int totalReviewCnt, int currentPage, int pageSize, List<?> itemsList) {

        this.totalReviewCnt = totalReviewCnt;
        this.currentPage = currentPage;
        this.pageSize = pageSize;
        this.itemsList = itemsList;

        totalPageCnt = (int) Math.ceil(totalReviewCnt / (double) pageSize);
        headPage = (currentPage - 1) / 10 * 10 + 1;
        beginPage = currentPage - headPage < 5 ? headPage : headPage + 5;
        endPage = Math.min(beginPage + pageSize - 1, totalPageCnt);
        showPrev = beginPage != 1;
        showNext = endPage != totalPageCnt;

    }

    void print() {
        System.out.print(showPrev ? "[prev] " : "");
        for (int i = beginPage; i <= endPage; i++) {
            System.out.print(i+" ");
        }
        System.out.println(showNext ? "[next]" : "");
        System.out.println("objectList = " + itemsList);
    }

    public List<?> getItemsList() {
        return itemsList;
    }

    public void setItemsList(List<?> itemsList) {
        this.itemsList = itemsList;
    }

    public int getTotalReviewCnt() {
        return totalReviewCnt;
    }

    public void setTotalReviewCnt(int totalReviewCnt) {
        this.totalReviewCnt = totalReviewCnt;
    }

    public int getTotalPageCnt() {
        return totalPageCnt;
    }

    public void setTotalPageCnt(int totalPageCnt) {
        this.totalPageCnt = totalPageCnt;
    }

    public int getNavSize() {
        return navSize;
    }

    public void setNavSize(int navSize) {
        this.navSize = navSize;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
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

    public boolean isShowPrev() {
        return showPrev;
    }

    public void setShowPrev(boolean showPrev) {
        this.showPrev = showPrev;
    }

    public boolean isShowNext() {
        return showNext;
    }

    public void setShowNext(boolean showNext) {
        this.showNext = showNext;
    }

    @Override
    public String toString() {
        return "PageHandler{" +
                "totalReviewCnt=" + totalReviewCnt +
                ", totalPageCnt=" + totalPageCnt +
                ", navSize=" + navSize +
                ", pageSize=" + pageSize +
                ", currentPage=" + currentPage +
                ", beginPage=" + beginPage +
                ", endPage=" + endPage +
                ", showPrev=" + showPrev +
                ", showNext=" + showNext +
                '}';
    }
}

package cds.com.demo.webapp.model;

import java.util.Collections;
import java.util.List;
import java.util.Map;

/**
 * Created by edison on 2017/8/4.
 */
public class PageDto {

    /* 总数 */
    private int total;

    /* 每页显示条数，默认 10 */
    private int size = 10;

    /* 总页数 */
    private int pages;

    /* 当前页 */
    private int current = 1;

    /* 查询总记录数（默认 true） */
    private boolean searchCount = true;

    /**
     * 查询数据列表
     */
    private List<?> records = Collections.emptyList();

    /**
     * 查询参数
     */
    private Map<String, Object> condition;

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public int getSize() {
        return size;
    }

    public void setSize(int size) {
        this.size = size;
    }

    public int getPages() {
        return pages;
    }

    public void setPages(int pages) {
        this.pages = pages;
    }

    public int getCurrent() {
        return current;
    }

    public void setCurrent(int current) {
        this.current = current;
    }

    public boolean isSearchCount() {
        return searchCount;
    }

    public void setSearchCount(boolean searchCount) {
        this.searchCount = searchCount;
    }

    public List<?> getRecords() {
        return records;
    }

    public void setRecords(List<?> records) {
        this.records = records;
    }

    public Map<String, Object> getCondition() {
        return condition;
    }

    public void setCondition(Map<String, Object> condition) {
        this.condition = condition;
    }
}

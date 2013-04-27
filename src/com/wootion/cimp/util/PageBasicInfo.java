package com.wootion.cimp.util;

import java.util.Map;

/**
 */
public class PageBasicInfo
{
    /**总共的记录数**/
    private int    totalRecords;

    /**每页最多显示记录数**/
    private int    maxRecords  = 10;

    /**当前第几页**/
    private int    currentPage = 1;

    /**总共多少页**/
    private int    totalPages  = 1;

    /**处理的action**/
    private String pageAction  = "";

    /**工程路径**/
    private String basePath    = "";

    /** default constructor */
    public PageBasicInfo()
    {
    }

    public PageBasicInfo(String url, Map<String, String> map)
    {
        this.setBasePath(map.get("basePath"));
        this.setPageAction(url);
        if (map.get("maxRecords") != null && !"".equals(map.get("maxRecords").trim()))
        {
            this.setMaxRecords(Integer.valueOf(map.get("maxRecords").trim()));
        }
        if (map.get("currentPage") != null && !"".equals(map.get("currentPage").trim()))
        {
            this.setCurrentPage(Integer.valueOf(map.get("currentPage").trim()));
        }
    }

    /**
     * @return Returns the totalRecords.
     */
    public int getTotalRecords()
    {
        return totalRecords;
    }

    /**
     * @param totalRecords The totalRecords to set.
     */
    public void setTotalRecords(int totalRecords)
    {
        this.totalRecords = totalRecords;
    }

    /**
     * @return Returns the maxRecords.
     */
    public int getMaxRecords()
    {
        return maxRecords;
    }

    /**
     * @param maxRecords The maxRecords to set.
     */
    public void setMaxRecords(int maxRecords)
    {
        this.maxRecords = maxRecords;
    }

    /**
     * @return Returns the currentPage.
     */
    public int getCurrentPage()
    {
        return currentPage;
    }

    /**
     * @param currentPage The currentPage to set.
     */
    public void setCurrentPage(int currentPage)
    {
        this.currentPage = currentPage;
    }

    /**
     * @return Returns the totalPages.
     */
    public int getTotalPages()
    {
        return totalPages;
    }

    /**
     * @param totalPages The totalPages to set.
     */
    public void setTotalPages(int totalPages)
    {
        this.totalPages = totalPages;
    }

    /**
     * @return Returns the basePath.
     */
    public String getBasePath()
    {
        return basePath;
    }

    /**
     * @param basePath The basePath to set.
     */
    public void setBasePath(String basePath)
    {
        this.basePath = basePath;
    }

    /**
     * 根据所有用户的数量，计算总的页数
     * @param PageBasicInfo obj 
     */
    public void accountTotalPages(PageBasicInfo obj)
    {
        int size = obj.getTotalRecords();
        maxRecords = obj.getMaxRecords();
        if (size % maxRecords == 0)
        {
            totalPages = size / maxRecords;
        }
        else
        {

            totalPages = size / maxRecords + 1;
        }
        obj.setTotalPages(totalPages);
    }

    /**
     * @return Returns the pageAction.
     */
    public String getPageAction()
    {
        return pageAction;
    }

    /**
     * @param pageAction The pageAction to set.
     */
    public void setPageAction(String pageAction)
    {
        this.pageAction = pageAction;
    }

    public String toString()
    {
        return "共" + this.getTotalRecords() + "记录，共" + this.getTotalPages() + "页，当前是" + this.getCurrentPage()
                + "页，每页最多显示" + this.getMaxRecords();
    }

    public static void main(String[] args)
    {
        PageBasicInfo obj = new PageBasicInfo();
        obj.setCurrentPage(1);
        obj.setMaxRecords(10);
        obj.setTotalRecords(2);
        obj.accountTotalPages(obj);

    }
}

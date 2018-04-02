package page;

import java.io.Serializable;

/**
 * 分页类
 * @author yejianyi
 *
 */
public class PageInfo implements Serializable {

	private static final long serialVersionUID = 1878154374135400744L;

    private String firstResult = "0"; //分页从第几条记录开始

    private String maxResults = "10"; //一页最多多少条记录

    private int pageNo = 0; //当前页

    private transient String itemCount = "0"; //总记录数
    
    public boolean isPage = false;

	public String getFirstResult() {
		return firstResult;
	}

	public void setFirstResult(String firstResult) {
		this.firstResult = firstResult;
	}

	public String getItemCount() {
		return itemCount;
	}

	public void setItemCount(String itemCount) {
		this.itemCount = itemCount;
	}

	public String getMaxResults() {
		return maxResults;
	}

	public void setMaxResults(String maxResults) {
		this.maxResults = maxResults;
	}

	public int getPageNo() {
		return pageNo;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}


 
}

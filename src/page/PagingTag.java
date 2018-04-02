/*
 * Created on 2004-2-6
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package page;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;


/**
 * @author vikings
 *
 */
public class PagingTag extends TagSupport{

	private static final long serialVersionUID = 1L;
	//总页数
	private int maxResults = 0; //recordsPerPage
	private int firstResult=0; //beginItem
	private int itemCount = 0;
	private String href = null;
		

	public int getMaxResults() {
		return maxResults;
	}
	public void setMaxResults(int maxResults) {
		this.maxResults = maxResults;
	}
	public int getFirstResult() {
		return firstResult;
	}
	public void setFirstResult(int firstResult) {
		this.firstResult = firstResult;
	}
	public int getItemCount() {
		return itemCount;
	}
	public void setItemCount(int itemCount) {
		this.itemCount = itemCount;
	}
	//链接的URL地址
	public String getHref()
	{
		return this.href;
	}
	public void setHref(String href)
	{
		this.href = href;
	}
	
	public int doStartTag() throws JspException 
	{
	  return SKIP_BODY;
	}
	
	public int doEndTag() throws JspException 
	{	

		
		int totalPages = 0;
		int currentPage=0;

        totalPages = itemCount/maxResults;
		if(itemCount==0||maxResults==0){
		  return EVAL_PAGE;
		}
		if (itemCount % maxResults != 0) {
		  totalPages = totalPages + 1;
		}
		if (totalPages<=1)
		{
		  return EVAL_PAGE;
		}
		currentPage = (firstResult) / maxResults;
		currentPage = currentPage+1;
		StringBuffer navigation = new StringBuffer();
		navigation.append("[第"+currentPage+"页/共"+totalPages+"页]&nbsp;&nbsp;");
		if (currentPage<=1){
		  navigation.append("[首页]");
		  navigation.append("&nbsp;");
		  navigation.append("[上一页]");
		} else {
		  navigation.append("<a href='"+href+"?pageInfo.firstResult=0&pageInfo.maxResults="+maxResults+"&pageInfo.isPage=true'>[首页]</a>");
		  navigation.append("&nbsp;");
		  navigation.append("<a href='"+href+"?pageInfo.firstResult="+(firstResult-maxResults)+"&pageInfo.maxResults="+maxResults+"&pageInfo.isPage=true'>[上一页]</a>");
		}
		navigation.append("&nbsp;");
		if (currentPage>=totalPages){
		  navigation.append("[下一页]");
		  navigation.append("&nbsp;");
		  navigation.append("[尾页]");
		}else {
		  navigation.append("<a href='"+href+"?pageInfo.firstResult="+(firstResult+maxResults)+"&pageInfo.maxResults="+maxResults+"&pageInfo.isPage=true'>[下一页]</a>");
		  navigation.append("&nbsp;");
		  navigation.append("<a href='"+href+"?pageInfo.firstResult="+((totalPages-1)*maxResults)+"&pageInfo.maxResults="+maxResults+"&pageInfo.isPage=true'>[尾页]&nbsp;</a>");
		}
		navigation.append("&nbsp;");
		try {
			pageContext.getOut().print(navigation.toString());
		} catch (IOException e) {
			e.printStackTrace();
		}
	   
	  return EVAL_PAGE;
	}
	
	public void release() 
	{		
		super.release();
		this.maxResults = 0; //recordsPerPage
		this.firstResult=0; //beginItem
		this.itemCount = 0;
		this.href = null;
	}
}

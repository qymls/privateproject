package control;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;

import enity.Customter;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import page.PageInfo;
import service.CustomterServiceI;

public class CustomterAction extends BaseAction{
/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
private CustomterServiceI CustomterServiceI;
private Customter Customter;



public Customter getCustomter() {
	return Customter;
}


public void setCustomter(Customter Customter) {
	this.Customter = Customter;
}


public CustomterServiceI getCustomterServiceI() {
	return CustomterServiceI;
}


public void setCustomterServiceI(CustomterServiceI CustomterServiceI) {
	this.CustomterServiceI = CustomterServiceI;
}



//查询所有
public String findAllCustomter()throws Exception{
	ServletActionContext.getRequest().setCharacterEncoding("utf-8");
	ServletActionContext.getResponse().setCharacterEncoding("utf-8");
	ServletActionContext.getResponse().setContentType("text/html;charset=utf-8");
	if (pageInfo == null) {
		pageInfo = new PageInfo();
	}

	PrintWriter out=ServletActionContext.getResponse().getWriter();
	List<Customter> Customters = CustomterServiceI.findAllCustomter(pageInfo);
	JSONArray jsonarrayactive = JSONArray.fromObject(Customters);
	out.print(jsonarrayactive);
	out.print("&");
	out.print(pageInfo.getItemCount());
	out.print("@");
	out.print(pageInfo.getPageNo());
	return null;
  }

//添加
public String addCustomter()throws Exception{
	ServletActionContext.getRequest().setCharacterEncoding("utf-8");
	ServletActionContext.getResponse().setCharacterEncoding("utf-8");
	ServletActionContext.getResponse().setContentType("text/html;charset=utf-8");
	//System.out.println(Customter.getLoginName());
	 CustomterServiceI.addCustomter(Customter);
	
	return null;
  }
//查询详细信息
public String findCustomterByID() throws IOException{
	ServletActionContext.getRequest().setCharacterEncoding("utf-8");
	ServletActionContext.getResponse().setCharacterEncoding("utf-8");
	ServletActionContext.getResponse().setContentType("text/html;charset=utf-8");
	PrintWriter out=ServletActionContext.getResponse().getWriter();
	String id=Customter.getCId();
//	System.out.println(id);
	Customter Customters=CustomterServiceI.findCustomterByID(id);
	//System.out.println(Customters.getLoginName());
	JSONObject jsoncustomters = JSONObject.fromObject(Customters);
	out.print(jsoncustomters);
	return null;
}
//修改
public String updateCustomter()throws Exception{
	ServletActionContext.getRequest().setCharacterEncoding("utf-8");
	ServletActionContext.getResponse().setCharacterEncoding("utf-8");
	ServletActionContext.getResponse().setContentType("text/html;charset=utf-8");
	 CustomterServiceI.updateCustomter(Customter);
	
	return null;
  }


//删除
public String delCustomter() throws Exception{
	CustomterServiceI.delCustomter(Customter);
	return null;
}
//批量删除
public String delCustomtermore() throws Exception{
	String[] customterIds = ServletActionContext.getRequest().getParameterValues("userids");
	
	
	for(String customterId : customterIds){
		//System.out.println(customterId);
		Customter.setCId(customterId);
		CustomterServiceI.delCustomter(Customter);
	}
		
	
	
	return null;
}

}

package control;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;

import enity.User;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import page.PageInfo;
import service.UserServiceI;

public class UserAction extends BaseAction{
/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
private UserServiceI UserServiceI;
private User User;



public User getUser() {
	return User;
}


public void setUser(User User) {
	this.User = User;
}


public UserServiceI getUserServiceI() {
	return UserServiceI;
}


public void setUserServiceI(UserServiceI UserServiceI) {
	this.UserServiceI = UserServiceI;
}



//查询所有
public String findAllUser()throws Exception{
	ServletActionContext.getRequest().setCharacterEncoding("utf-8");
	ServletActionContext.getResponse().setCharacterEncoding("utf-8");
	ServletActionContext.getResponse().setContentType("text/html;charset=utf-8");
	if (pageInfo == null) {
		pageInfo = new PageInfo();
	}

	PrintWriter out=ServletActionContext.getResponse().getWriter();
	List<User> Users = UserServiceI.findAllUser(pageInfo);
	JSONArray jsonarrayactive = JSONArray.fromObject(Users);
	out.print(jsonarrayactive);
	out.print("&");
	out.print(pageInfo.getItemCount());
	out.print("@");
	out.print(pageInfo.getPageNo());
	return null;
  }

//添加
public String addUser()throws Exception{
	ServletActionContext.getRequest().setCharacterEncoding("utf-8");
	ServletActionContext.getResponse().setCharacterEncoding("utf-8");
	ServletActionContext.getResponse().setContentType("text/html;charset=utf-8");
	//System.out.println(User.getLoginName());
	 UserServiceI.addUser(User);
	
	return null;
  }
//查询详细信息
public String findUserByID() throws IOException{
	ServletActionContext.getRequest().setCharacterEncoding("utf-8");
	ServletActionContext.getResponse().setCharacterEncoding("utf-8");
	ServletActionContext.getResponse().setContentType("text/html;charset=utf-8");
	PrintWriter out=ServletActionContext.getResponse().getWriter();
	String id=User.getUserId().toString();
	//System.out.println(id);
	User Users=UserServiceI.findUserByID(id);
	System.out.println(Users.getLoginName());
	JSONObject jsonusers = JSONObject.fromObject(Users);
	out.print(jsonusers);
	return null;
}
//修改
public String updateUser()throws Exception{
	ServletActionContext.getRequest().setCharacterEncoding("utf-8");
	ServletActionContext.getResponse().setCharacterEncoding("utf-8");
	ServletActionContext.getResponse().setContentType("text/html;charset=utf-8");
	 UserServiceI.updateUser(User);
	
	return null;
  }


//删除
public String delUser() throws Exception{
	UserServiceI.delUser(User);
	return null;
}
//批量删除
public String delUsermore() throws Exception{
	String[] userIds = ServletActionContext.getRequest().getParameterValues("userids");
	
	
	for(String userId : userIds){
		User.setUserId(userId);
		UserServiceI.delUser(User);
	}
		
	
	
	return null;
}

}

package service;

import java.util.List;

import dao.EntityDaoI;
import enity.User;

import page.PageInfo;



public class UserServiceimp implements UserServiceI{
private EntityDaoI entityDaoI;
	
	public EntityDaoI getEntityDaoI() {
		return entityDaoI;
	}

	public void setEntityDaoI(EntityDaoI entityDaoI) {
		this.entityDaoI = entityDaoI;
	}
//查询所有
	public List findAllUser(PageInfo pageInfo)throws Exception{
		return entityDaoI.findAllObject(User.class,pageInfo);
	}

//添加
	public void addUser(User User) throws Exception {
		entityDaoI.addObject(User);
		
	}
	//修改
	public void updateUser(User User) throws Exception {
		entityDaoI.updateObject(User);
		
	}
	
	
//查询通过id
	public User findUserByID(String id) {
	
		return (User) entityDaoI.findObjectByIDnoloadorget(User.class, id);
	}

	//删除
	public void delUser(User User) throws Exception {
		
		 entityDaoI.delObject(User);
	}


	 
	
}

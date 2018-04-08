package service;

import java.util.List;

import dao.EntityDaoI;
import enity.Customter;

import page.PageInfo;



public class CustomterServiceimp implements CustomterServiceI{
private EntityDaoI entityDaoI;
	
	public EntityDaoI getEntityDaoI() {
		return entityDaoI;
	}

	public void setEntityDaoI(EntityDaoI entityDaoI) {
		this.entityDaoI = entityDaoI;
	}
//查询所有
	public List findAllCustomter(PageInfo pageInfo)throws Exception{
		return entityDaoI.findAllObject(Customter.class,pageInfo);
	}

//添加
	public void addCustomter(Customter Customter) throws Exception {
		entityDaoI.addObject(Customter);
		
	}
	//修改
	public void updateCustomter(Customter Customter) throws Exception {
		entityDaoI.updateObject(Customter);
		
	}
	
	
//查询通过id
	public Customter findCustomterByID(String id) {
	
		return (Customter) entityDaoI.findObjectByIDnoloadorget(Customter.class, id,"CId");
	}

	//删除
	public void delCustomter(Customter Customter) throws Exception {
		
		 entityDaoI.delObject(Customter);
	}


	 
	
}

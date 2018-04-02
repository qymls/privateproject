package dao;

import java.util.List;

import page.PageInfo;



public interface EntityDaoI {
	public Object findObjectByID(Class cls,String id);
	public Object findObjectByIDnoloadorget(Class cls,String id);
	public void updateObject(Object obj)throws Exception;
	public List<Object> findAllObject(Class cls,PageInfo pageInfo)throws Exception;
	public void delObject(Object obj) throws Exception;
	public void addObject(Object obj) throws Exception;
	
}

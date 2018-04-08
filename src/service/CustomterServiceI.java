package service;

import java.util.List;

import dao.EntityDaoI;
import enity.Customter;
import enity.Customter;
import page.PageInfo;



public interface CustomterServiceI {
	public Customter findCustomterByID(String id);
	public List<Customter> findAllCustomter(PageInfo pageInfo)throws Exception;
	public void addCustomter(Customter Customter)throws Exception;
	public void updateCustomter(Customter Customter)throws Exception;	
	public void delCustomter(Customter Customter) throws Exception;
}

package service;

import java.util.List;

import dao.EntityDaoI;
import enity.User;
import enity.User;
import page.PageInfo;



public interface UserServiceI {
	public User findUserByID(String id);
	public List<User> findAllUser(PageInfo pageInfo)throws Exception;
	public void addUser(User User)throws Exception;
	public void updateUser(User User)throws Exception;	
	public void delUser(User User) throws Exception;
}

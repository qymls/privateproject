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
//��ѯ����
	public List findAllUser(PageInfo pageInfo)throws Exception{
		return entityDaoI.findAllObject(User.class,pageInfo);
	}

//���
	public void addUser(User User) throws Exception {
		entityDaoI.addObject(User);
		
	}
	//�޸�
	public void updateUser(User User) throws Exception {
		entityDaoI.updateObject(User);
		
	}
	
	
//��ѯͨ��id
	public User findUserByID(String id) {
	
		return (User) entityDaoI.findObjectByIDnoloadorget(User.class, id);
	}

	//ɾ��
	public void delUser(User User) throws Exception {
		
		 entityDaoI.delObject(User);
	}


	 
	
}

package dao;



import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.hibernate.transform.Transformers;
import dao.BaseDaoImp;
import enity.User;
import page.PageInfo;

public class EntityDaoImp extends BaseDaoImp implements EntityDaoI {
	public Object findObjectByID(Class cls,String id) {
		Session session =HibernateSessionFactory.getSession();
		return (Object)session.get(cls, id);
	}
	
	public Object findObjectByIDnoloadorget(Class cls,String id,String tiaojian) {
		Session session =HibernateSessionFactory.getSession();
		Query query=session.createQuery("From "+cls.getName()+" where "+tiaojian+" = "+id+"");
		session.clear(); 
		return (Object) query.uniqueResult();
	}

	public void updateObject(Object obj) throws Exception {
		this.getHibernateTemplate().merge(obj);
		// 事务没有提交
	}
	public List<Object> findAllObject(Class cls,PageInfo pageInfo) throws Exception {
		return getPage("From "+cls.getName(), pageInfo);
	}
	public void delObject(Object obj) throws Exception{
        obj = this.getHibernateTemplate().merge(obj);
		this.getHibernateTemplate().delete(obj);
	}
	public void addObject(Object obj) throws Exception {
		this.getHibernateTemplate().save(obj);
		// 事务没有提交
	}

public static void main(String[] args) {
	User user = (User) new EntityDaoImp().findObjectByIDnoloadorget(User.class, "105","userId");
	System.out.println(user.getLoginName());
}
	
}

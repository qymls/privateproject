package dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import page.PageInfo;

/**
 * 
 * 实现基础DAO接口的DAO基础类,所有的DAO都要继承该类
 * 
 * @author vikings
 * @version 1.0
 */

public class BaseDaoImp extends HibernateDaoSupport {
	/**
	 * 分页查询
	 * 
	 * @param session
	 * @param sqlString
	 * @param pageInfo
	 * @return list
	 */
	protected List getPage(String sqlString, final PageInfo pageInfo) {
		Session session = getSession();
		Query query;
		// 如果分页的状态为需要
		if (pageInfo.isPage) {
			if (pageInfo != null) {
				query = session.createQuery("select count(*) " + sqlString);// 查询总记录数sql
				Number count = (Number) query.uniqueResult();
				pageInfo.setItemCount(String.valueOf(count.intValue()));// 返回总记录数
			}
			query = session.createQuery(sqlString);
			if (pageInfo != null) {
				int firstResult = Integer.parseInt(pageInfo.getFirstResult());
				int maxResults = Integer.parseInt(pageInfo.getMaxResults());
//				System.out.println(pageInfo.getPageNo());
//				System.out.println(pageInfo.getMaxResults());
				int firstresult = (pageInfo.getPageNo()-1)*Integer.parseInt(pageInfo.getMaxResults());
				query.setFirstResult(firstresult);// 第几条记录开始
				query.setMaxResults(Integer.parseInt(pageInfo.getMaxResults()));// 每页最大记录数
			}
		} else {
			query = session.createQuery(sqlString);
		}
		return query.list();
	}
}

package dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import page.PageInfo;

/**
 * 
 * ʵ�ֻ���DAO�ӿڵ�DAO������,���е�DAO��Ҫ�̳и���
 * 
 * @author vikings
 * @version 1.0
 */

public class BaseDaoImp extends HibernateDaoSupport {
	/**
	 * ��ҳ��ѯ
	 * 
	 * @param session
	 * @param sqlString
	 * @param pageInfo
	 * @return list
	 */
	protected List getPage(String sqlString, final PageInfo pageInfo) {
		Session session = getSession();
		Query query;
		// �����ҳ��״̬Ϊ��Ҫ
		if (pageInfo.isPage) {
			if (pageInfo != null) {
				query = session.createQuery("select count(*) " + sqlString);// ��ѯ�ܼ�¼��sql
				Number count = (Number) query.uniqueResult();
				pageInfo.setItemCount(String.valueOf(count.intValue()));// �����ܼ�¼��
			}
			query = session.createQuery(sqlString);
			if (pageInfo != null) {
				int firstResult = Integer.parseInt(pageInfo.getFirstResult());
				int maxResults = Integer.parseInt(pageInfo.getMaxResults());
//				System.out.println(pageInfo.getPageNo());
//				System.out.println(pageInfo.getMaxResults());
				int firstresult = (pageInfo.getPageNo()-1)*Integer.parseInt(pageInfo.getMaxResults());
				query.setFirstResult(firstresult);// �ڼ�����¼��ʼ
				query.setMaxResults(Integer.parseInt(pageInfo.getMaxResults()));// ÿҳ����¼��
			}
		} else {
			query = session.createQuery(sqlString);
		}
		return query.list();
	}
}

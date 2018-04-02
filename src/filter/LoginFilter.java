package filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginFilter implements Filter {
	String[] exludeURls = { "login.jsp", "login","loginAction","index.jsp","introduction.jsp","/Admin","exception.jsp","active.jsp"};
String projectName;
	public void destroy() {
		// TODO Auto-generated method stub

	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		// TODO Auto-generated method stub

		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		// httpServletReuest�Ŵ���url���������ԣ���Ҫ��ServletRequestת��
		// ȡ���Ự�еı�־
		Object obj = req.getSession().getAttribute("customter");
		// �������жϱ�־�Ƿ����֮ǰ���������ų��������������login.jsp�͵�¼���
		// ҳ��֮��,��������ȫ��Ҫ�жϵ�¼
		String url = req.getRequestURL().toString();
		// ������������¼�����������1.����Ҫ����ҳ���ú����ж�
		// 2.����Ҫ����servlet����
//	  if(url.contains(".css") || url.contains(".js") || url.contains(".png")|| url.contains(".jpg")){
//        //���������css����js�ļ���ֱ�ӷ���
//      chain.doFilter(request, response);
//          }else{
	           
		
		  if (!check(exludeURls, url)) {// ���ų�����ҳ��
			if (obj == null ) {
				res.sendRedirect("/"+projectName+"/login.jsp");
				return;
			}
		}
	
		chain.doFilter(request, response);
		 //}
	}

	public void init(FilterConfig config) throws ServletException {
		// TODO Auto-generated method stub
        projectName =  config.getInitParameter("projectName");
	}

	public boolean check(String[] strs, String url) {
		for (String str : strs) {
			if (url.indexOf(str) >= 0) {
				return true;
			}
		}
		return false;
	}

}

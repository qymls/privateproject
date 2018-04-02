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
		// httpServletReuest才带有url等网络特性，需要将ServletRequest转换
		// 取出会话中的标志
		Object obj = req.getSession().getAttribute("customter");
		// 但是在判断标志是否存在之前，必须先排除特殊情况，除了login.jsp和登录结果
		// 页面之外,其余请求全部要判断登录
		String url = req.getRequestURL().toString();
		// 过滤器不检查登录的条件无外乎1.不需要检查的页面用和来判断
		// 2.不需要检查的servlet请求
//	  if(url.contains(".css") || url.contains(".js") || url.contains(".png")|| url.contains(".jpg")){
//        //如果发现是css或者js文件，直接放行
//      chain.doFilter(request, response);
//          }else{
	           
		
		  if (!check(exludeURls, url)) {// 不排除检查的页面
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

package exception;

import java.io.IOException;
import java.lang.reflect.Method;
import java.sql.SQLException;

import org.apache.struts2.ServletActionContext;
import org.hibernate.exception.JDBCConnectionException;
import org.springframework.aop.ThrowsAdvice;
import org.springframework.dao.DataAccessException;
import org.springframework.dao.DataIntegrityViolationException;

public class ExceptionAdvice implements ThrowsAdvice {
	BusinessException be;
	public void afterThrowing(Method method, Object[] args, Object target,
			Exception ex) throws Exception {
		// 在后台中输出错误异常异常信息，可以通过log4j输出，自己修改即可。
		System.out.println("*************************************");
		System.out.println("Error happened in class: "
				+ target.getClass().getName());
		System.out.println("Error happened in method: " + method.getName());
		for (int i = 0; i < args.length; i++) {
			System.out.println("arg[" + i + "]: " + args[i]);
		}
		System.out.println("Exception class: " + ex.getClass().getName());
		System.out.println("ex.getMessage():" + ex.getMessage());
		ex.printStackTrace();
		System.out.println("*************************************");
		// 在这里判断异常，根据不同的异常返回错误。
		if (ex.getClass().equals(DataAccessException.class)) {
			//ex.printStackTrace();
			be =  new BusinessException("数据库操作失败！");
		} else if (ex.getClass().toString().equals(
				NullPointerException.class.toString())) {
			//ex.printStackTrace();
			be = new BusinessException("调用了未经初始化的对象或者是不存在的对象！");
		} else if (ex.getClass().equals(IOException.class)) {
			//ex.printStackTrace();
			be = new BusinessException("IO异常！");
		} else if (ex.getClass().equals(ClassNotFoundException.class)) {
			//ex.printStackTrace();
			be = new BusinessException("指定的类不存在！");
		} else if (ex.getClass().equals(ArithmeticException.class)) {
			//ex.printStackTrace();
			be = new BusinessException("数学运算异常！");
		} else if (ex.getClass().equals(ArrayIndexOutOfBoundsException.class)) {
			//ex.printStackTrace();
			be = new BusinessException("数组下标越界!");
		} else if (ex.getClass().equals(IllegalArgumentException.class)) {
			//ex.printStackTrace();
			be = new BusinessException("方法的参数错误！");
		} else if (ex.getClass().equals(ClassCastException.class)) {
			//ex.printStackTrace();
			be = new BusinessException("类型强制转换错误！");
		} else if (ex.getClass().equals(SecurityException.class)) {
			//ex.printStackTrace();
			be = new BusinessException("违背安全原则异常！");
		} else if (ex.getClass().equals(SQLException.class)) {
			//ex.printStackTrace();
			be = new BusinessException("操作数据库异常！");
		} else if (ex.getClass().equals(NoSuchMethodError.class)) {
			//ex.printStackTrace();
			be = new BusinessException("方法末找到异常！");
		} else if (ex.getClass().equals(InternalError.class)) {
			//ex.printStackTrace();
			be = new BusinessException("Java虚拟机发生了内部错误");
		} else if(ex.getClass().equals(DataIntegrityViolationException.class)){
			be = new BusinessException("该用户已经注册");
		}else if(ex.getClass().equals(JDBCConnectionException.class)){
			be = new BusinessException("数据库连接失败");
		}
		
		else {
			ex.printStackTrace();
			System.out.println(ex.getClass().getName());
			be = new BusinessException("程序内部错误，操作失败！" + ex.getMessage());
		}
		System.out.println(be.getMessage()+"1111111111111111111");
		ServletActionContext.getRequest().setAttribute("error", be.getMessage());
		throw be;
	}
}

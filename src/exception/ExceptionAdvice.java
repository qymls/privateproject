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
		// �ں�̨����������쳣�쳣��Ϣ������ͨ��log4j������Լ��޸ļ��ɡ�
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
		// �������ж��쳣�����ݲ�ͬ���쳣���ش���
		if (ex.getClass().equals(DataAccessException.class)) {
			//ex.printStackTrace();
			be =  new BusinessException("���ݿ����ʧ�ܣ�");
		} else if (ex.getClass().toString().equals(
				NullPointerException.class.toString())) {
			//ex.printStackTrace();
			be = new BusinessException("������δ����ʼ���Ķ�������ǲ����ڵĶ���");
		} else if (ex.getClass().equals(IOException.class)) {
			//ex.printStackTrace();
			be = new BusinessException("IO�쳣��");
		} else if (ex.getClass().equals(ClassNotFoundException.class)) {
			//ex.printStackTrace();
			be = new BusinessException("ָ�����಻���ڣ�");
		} else if (ex.getClass().equals(ArithmeticException.class)) {
			//ex.printStackTrace();
			be = new BusinessException("��ѧ�����쳣��");
		} else if (ex.getClass().equals(ArrayIndexOutOfBoundsException.class)) {
			//ex.printStackTrace();
			be = new BusinessException("�����±�Խ��!");
		} else if (ex.getClass().equals(IllegalArgumentException.class)) {
			//ex.printStackTrace();
			be = new BusinessException("�����Ĳ�������");
		} else if (ex.getClass().equals(ClassCastException.class)) {
			//ex.printStackTrace();
			be = new BusinessException("����ǿ��ת������");
		} else if (ex.getClass().equals(SecurityException.class)) {
			//ex.printStackTrace();
			be = new BusinessException("Υ����ȫԭ���쳣��");
		} else if (ex.getClass().equals(SQLException.class)) {
			//ex.printStackTrace();
			be = new BusinessException("�������ݿ��쳣��");
		} else if (ex.getClass().equals(NoSuchMethodError.class)) {
			//ex.printStackTrace();
			be = new BusinessException("����ĩ�ҵ��쳣��");
		} else if (ex.getClass().equals(InternalError.class)) {
			//ex.printStackTrace();
			be = new BusinessException("Java������������ڲ�����");
		} else if(ex.getClass().equals(DataIntegrityViolationException.class)){
			be = new BusinessException("���û��Ѿ�ע��");
		}else if(ex.getClass().equals(JDBCConnectionException.class)){
			be = new BusinessException("���ݿ�����ʧ��");
		}
		
		else {
			ex.printStackTrace();
			System.out.println(ex.getClass().getName());
			be = new BusinessException("�����ڲ����󣬲���ʧ�ܣ�" + ex.getMessage());
		}
		System.out.println(be.getMessage()+"1111111111111111111");
		ServletActionContext.getRequest().setAttribute("error", be.getMessage());
		throw be;
	}
}

<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery-1.10.2.js"></script>



</head>
<body>
 <div class="content">



 <s:form  action="testAction_updateTest" method="post">

	<s:textfield  name="test.patientBumber" label="住院号"/>
	<s:textfield name="test.inhosDate" label="入院日期"/>
	<s:textfield name="test.cardId" label="身份证号"/>
	<s:textfield name="test.customerName" label="姓名"/>
	<s:radio name="test.sex" list="#{'男':'男','女':'女'}" listKey="key" listValue="value" label="性别"/>
	<s:textfield name="test.sectionoffice" label="就诊科室"/>
	<s:textfield name="test.bedNumber" label="床位号"/>
	<s:textfield name="test.faultName" label="初始诊断"/>
	<s:textfield name="test.customerMobilephone" label="联系电话"/>
	<s:textfield name="test.unitWork" label="工作单位"/>
	<s:textfield name="test.commonalityName" label="社保机构"/>
	<s:textfield name="test.medicalModal" label="就诊方式"/>
	<s:textfield name="test.medicalCause" label="出险原因"/>
	<s:textfield name="test.medicalState" label="就诊状态"/>
   <s:textfield name="test.patientIdentification" label="病人身份"/>
   <s:textfield name="test.occupation" label="职业"/>
     <s:submit value="确认"/>
 </s:form>	
 </div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<script type="text/javascript" src="js/selSno.js"></script>
<script type="text/javascript" src="js/ajaxfileupload.js"></script>
<script type="text/javascript" src="js/headupload.js"></script>
<style type="text/css">
#myFile{display: none;}
 .content{border:solid 1px; width:800px;margin-left:auto;margin-right: auto;font-family: "微软雅黑";font-size: 14px;}
 #headForm,#contentForm{width:400px;margin-left:auto;margin-right: auto;}
</style>
</head>
<body>

 <s:action name="testAction_findTestByID" executeResult="false">
    <s:param name="test.patientBumber" ><%=request.getParameter("patientBumber")%></s:param>  
 </s:action>
  <div class="content">
 
 <s:form  action="testAction_updateTest" method="post">

	<s:textfield  name="test.patientBumber" label="住院号" value="%{#request.test.patientBumber}"/>
	<s:textfield name="test.inhosDate" label="入院日期"  value="%{#request.test.inhosDate}"/>
	<s:textfield name="test.cardId" label="身份证号"  value="%{#request.test.cardId}"/>
	<s:textfield name="test.customerName" label="姓名" value="%{#request.test.customerName}"/>
	<s:radio name="test.sex" list="#{'男':'男','女':'女'}" listKey="key" listValue="value" label="性别" value="%{#request.test.sex}"/>
	<s:textfield name="test.sectionoffice" label="就诊科室"  value="%{#request.test.sectionoffice}"/>
	<s:textfield name="test.bedNumber" label="床位号"  value="%{#request.test.bedNumber}"/>
	<s:textfield name="test.faultName" label="初始诊断"  value="%{#request.test.faultName}"/>
	<s:textfield name="test.customerMobilephone" label="联系电话"  value="%{#request.test.customerMobilephone}"/>
	<s:textfield name="test.unitWork" label="工作单位" value="%{#request.test.unitWork}"/>
	<s:textfield name="test.commonalityName" label="社保机构"  value="%{#request.test.commonalityName}"/>
	<s:textfield name="test.medicalModal" label="就诊方式"  value="%{#request.test.medicalModal}"/>
	<s:textfield name="test.medicalCause" label="出险原因" value="%{#request.test.medicalCause}"/>
	<s:textfield name="test.medicalState" label="就诊状态"  value="%{#request.test.medicalState}"/>
   <s:textfield name="test.patientIdentification" label="病人身份"  value="%{#request.test.patientIdentification}"/>
   <s:textfield name="test.occupation" label="职业"  value="%{#request.test.occupation}"/>
     <s:submit value="确认"/>
 </s:form>	
 </div>
</body>
</html>
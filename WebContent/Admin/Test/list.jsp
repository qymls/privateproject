<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="paging" uri="/WEB-INF/paging.tld" %>
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
<style type="text/css">
 .content{width:800px;margin-left:auto;margin-right: auto;font-family: "微软雅黑";font-size: 14px;}
 .listab{border: solid 1px;}
 .imgtd > img{width:60px;height:60px;}
</style>
</head>
<body>

  <s:action name="testAction_findAllTest" executeResult="false"/>
  <div class="content">
  <table class="listab">
  <tr><th>住院号</th><th>入院日期</th><th>身份证号</th><th>姓名</th><th>性别</th><th>就诊科室</th>
  <th>床位号</th><th>初始诊断</th><th>联系电话</th><th>工作单位</th>
  <th>社保机构</th><th>就诊方式</th><th>出险原因</th><th>就诊状态</th><th>病人身份</th><th>职业</th>
  <th colspan="2">操作</th></tr>
  <c:forEach items="${tests}" var="test">
   <tr>
   <td>${test.patientBumber}</td>
    <td><fmt:formatDate value='${test.inhosDate}' pattern='yyyy-MM-dd'/></td>
  
   <td>${test.cardId}</td>
   <td>${test.customerName}</td>
   <td>${test.sex}</td>
   <td>${test.sectionoffice}</td>
   <td>${test.bedNumber}</td>
   <td>${test.faultName}</td>
   <td>${test.customerMobilephone}</td>
   <td>${test.unitWork}</td>
   <td>${test.commonalityName}</td>
   <td>${test.medicalModal}</td>
   <td>${test.medicalCause}</td>
   <td>${test.medicalState}</td>
   <td>${test.patientIdentification}</td>
   <td>${test.occupation}</td>
   
   <td><a href="Admin/Test/update.jsp?patientBumber=${test.patientBumber}">修改</a></td>
   <td><a href="testAction_delTest?test.patientBumber=${test.patientBumber}">删除</a></td>
   </tr>
  </c:forEach>
  <tr><td colspan="11">
  <paging:paging href="Admin/Test/list.jsp" 
  itemCount="${pageInfo.itemCount}" 
  firstResult="${pageInfo.firstResult}"
  maxResults="${pageInfo.maxResults}"/>
  </tr>
  <tr><td colspan="11"><a href="Admin/Test/add.jsp">增加记录</a></td></tr>
  </table>
  </div>
</body>
</html>
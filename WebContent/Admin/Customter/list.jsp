<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE>
<html>
<head>
<html xmlns="http://www.w3.org/1999/xhtml">
<meta charset="utf-8">
<base href="<%=basePath%>">  
<link rel="stylesheet" type="text/css" href="http://unpkg.com/iview/dist/styles/iview.css">
<script type="text/javascript" src="Admin/adminjs/vue.min.js"></script>
<script type="text/javascript" src="Admin/adminjs/iview.min.js"></script>
<script src="Admin/adminjs/jquery.js"></script>
<script src="Admin/adminjs/vue-resource.min.js"></script>
<script src="Admin/adminjs/vue-router.js"></script>

<style>
.ivu-icon{line-height: 2}
.ivu-select-arrow{line-height:1}
.ivu-table{  height: auto;}
</style>
<title>菜谱管理</title>
</head>

<body>
<div id ="app">


  <Row>
        <Col span="24">
            <Card>
                <p slot="title">
                    <Icon type="ios-list"></Icon>
                              用户详情
                </p>
   
                <Row>
                 <Col offset="0">
                  <i-button type="primary" icon="person-add" @click="newUser">新增</i-button>
                   <Poptip placement="right" confirm title="您确认删除这条内容吗?" @on-ok="deleteUser">
                    <i-button type="error" icon="trash-a" v-if ="rows.length > 0">删除</i-button>
                   </Poptip>
                 </Col>
                </Row>
                
                <Row type="" justify="center" align="middle">
                    <div style="margin-top:20px" > 
                        <i-table :loading="loading" ref="selection" :columns='columnsList' :data="items" 
                            @on-selection-change="onSelectRows"></i-table>
                    <div>
                </Row>
                
                <Row type="" justify="end" align="middle">
         
                    <div style="margin: 10px;overflow: hidden;">
                        <div style="float: right;">
                         <Page  :total="total" :current="recordPage" :page-size="pageSize" 
                         @on-change="changePage" @on-page-size-change="changePageSize"
                         show-total show-sizer ></Page>
                        </div>
                    </div> 
                </Row>
           
            </Card>
        </Col>
    </Row>





</div>


<script src="Admin/Customter/list.js"></script>

</body>
</html>
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
<script type="text/javascript" src="http://vuejs.org/js/vue.min.js"></script>
<script type="text/javascript" src="http://unpkg.com/iview/dist/iview.min.js"></script>
<script src="http://libs.baidu.com/jquery/2.0.0/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/vue.resource/1.0.3/vue-resource.min.js"></script>
<style>
.ivu-icon{line-height: 2}
.ivu-select-arrow{line-height:1}

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
                                菜单详情
                </p>
                
                <Row>
                 <Col offset="0">
                  <i-button type="primary" icon="person-add" @click="newUser">新增</i-button>
                   <Poptip confirm title="您确认删除这条内容吗?" @on-ok="deleteUser">
                    <i-button type="error" icon="trash-a" v-if ="rows.length > 0">删除</i-button>
                   </Poptip>
                 </Col>
                </Row>
                
                <Row type="flex" justify="center" align="middle">
                    <div style="margin-top:20px"> 
                        <i-table height="275" ref="selection" :columns='columnsList' :data="items" 
                            @on-selection-change="onSelectRows"></i-table>
                    <div>
                </Row>
                
                <Row type="flex" justify="end" align="middle">
                    <div style="margin: 10px;overflow: hidden;">
                        <div style="float: right;">
                         <Page line-height="0" :total="100" :current="records.page" :page-size="pageSize" 
                         @on-change="changePage" @on-page-size-change="changePageSize"
                         show-total show-sizer ></Page>
                        </div>
                    </div> 
                </Row>
           
            </Card>
        </Col>
    </Row>





</div>
<script src="Admin/CookBook/list.js"></script>
</body>
</html>
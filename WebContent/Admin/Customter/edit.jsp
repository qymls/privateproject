<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">  
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" type="text/css" href="http://unpkg.com/iview/dist/styles/iview.css">
<script type="text/javascript" src="Admin/adminjs/vue.min.js"></script>
<script type="text/javascript" src="Admin/adminjs/iview.min.js"></script>
<script src="Admin/adminjs/jquery.js"></script>
<script src="Admin/adminjs/vue-resource.min.js"></script>
<script src="Admin/adminjs/vue-router.js"></script>
<title>新增用户</title>
</head>
<body>
<div id="app">
<Row>
        <Col span="24">
            <Card>
                <p slot="title">
                    <Icon type="ios-list"></Icon>
                   更新用户
                </p>
                
                <i-form   ref="formValidate" :model="vdata" :rules="ruleValidate" label-width="80" style="margin-left:300px;height:432px ;overflow:auto">   
              
                    <Form-item label="登录名" prop="CName">
                        <i-input v-model="vdata.CName" placeholder="" size="large"  style="width:50%"></i-input>
                    </Form-item>
                     
                    <Form-item label="电话" prop="CIphone">
                        <i-input v-model="vdata.CIphone" placeholder="" size="large" style="width:50%"></i-input>
                    </Form-item>
                
                   <Form-item label="地址" prop="CAddress">
                       <i-input v-model="vdata.CAddress" type="textarea" :rows="4" style="width:50%"></i-input>
                   </Form-item>
                  
                   
                   <Form-item label="密码" prop="CPassword">
                       <i-input v-model="vdata.CPassword" type="password"  size="large" style="width:50%"></i-input>
                   </Form-item>
                   
                   
                   <Form-item label="确认密码" prop="confirm">
                       <i-input v-model="vdata.confirm" type="password"  size="large" style="width:50%"></i-input>
                   </Form-item>
                   
                   <Form-item label="头像" prop="CImg">
                   <i-input v-model="vdata.CImg" type="text" size="large" style="width:50%"></i-input>
                   </Form-item>
                   
                   <Form-item>
                       <i-button type="primary" @click="update(vdata)">更新用户</i-button>
                   </Form-item>
                
               </i-form>
                
            </Card>
        </Col>
    </Row>
</div>
<script src="Admin/Customter/edit.js"></script>
</body>
</html>
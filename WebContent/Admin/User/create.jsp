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
                    新增用户
                </p>
                
                <i-form   ref="formValidate" :model="formValidate" :rules="ruleValidate" label-width="80" style="margin-left:300px;height:432px ;overflow:auto">   
              
                    <Form-item label="登录名" prop="loginName">
                        <i-input v-model="formValidate.loginName" placeholder="" size="large"  style="width:50%"></i-input>
                    </Form-item>
                     
                    <Form-item label="姓名" prop="userName">
                        <i-input v-model="formValidate.userName" placeholder="" size="large" style="width:50%"></i-input>
                    </Form-item>
                
                   <Form-item label="描述" prop="description">
                       <i-input v-model="formValidate.description" type="textarea" :rows="4" style="width:50%"></i-input>
                   </Form-item>
                  
                   
                   <Form-item label="密码" prop="password">
                       <i-input v-model="formValidate.password" type="password"  size="large" style="width:50%"></i-input>
                   </Form-item>
                   
                   
                   <Form-item label="确认密码" prop="confirm">
                       <i-input v-model="formValidate.confirm" type="password"  size="large" style="width:50%"></i-input>
                   </Form-item>
                   
                   <Form-item label="激活" prop="activeState">
                   <Checkbox v-model="formValidate.activeState" style="margin-top:9px"></Checkbox>
                   </Form-item>
                   
                   <Form-item>
                       <i-button type="primary" @click="create(formValidate)">创建用户</i-button>
                   </Form-item>
                
               </i-form>
                
            </Card>
        </Col>
    </Row>
</div>
<script src="Admin/User/create.js"></script>
</body>
</html>
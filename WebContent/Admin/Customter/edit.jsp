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
<script src="Admin/adminjs/ajaxfileupload.js"></script>
<style type="text/css">
.demo-upload-list{
        float: left;
        display: inline-block;
        width: 60px;
        height: 60px;
        text-align: center;
        line-height: 60px;
        border: 1px solid transparent;
        border-radius: 4px;
        overflow: hidden;
        background: #fff;
        position: relative;
        box-shadow: 0 1px 1px rgba(0,0,0,.2);
        margin-right: 4px;
    }
    .demo-upload-list img{
        width: 100%;
        height: 100%;
    }
    .demo-upload-list-cover{
        display: none;
        position: absolute;
        top: 0;
        bottom: 0;
        left: 0;
        right: 0;
        background: rgba(0,0,0,.6);
    }
    .demo-upload-list:hover .demo-upload-list-cover{
        display: block;
    }
    .demo-upload-list-cover i{
        color: #fff;
        font-size: 20px;
        cursor: pointer;
        margin: 20px 2px;
    }

</style>
<title>新增用户</title>
</head>
<body>
<form action="uploadAction.action" enctype="multipart/form-data" method="post" style="visibility: hidden; position: absolute">
    <input type="file"  id="myFile" name="myFile">
    <input type="hidden"  name="savePath" value="upload">
   
</form>
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
                   
                      <Form-item label="头像">
               <div class="demo-upload-list " v-for="item in uploadList">
                <img :src="item.url">
                <div class="demo-upload-list-cover">
                <Icon type="ios-eye-outline" @click.native="handleView(item.name)"></Icon> 
                 </div>
               </div>
    
              <div class="ivu-upload ivu-upload-drag" style="width: 60px;">
              <div  v-on:click="changeimg" style="width: 58px;height:58px;line-height: 58px;">
              <Icon type="camera" size="20" style="line-height: 2.9"></Icon>
             </div>
             </div>
                   
                   </Form-item>
                   
                   <Form-item>
                       <i-button type="primary" @click="update(vdata)">更新用户</i-button>
                   </Form-item>
                 
    <Modal title="View Image" v-model="visible">
        <img :src="imgUrl" v-if="visible" style="width: 100%">
    </Modal>
                
               </i-form>
                
            </Card>
        </Col>
    </Row>
</div>
<script src="Admin/Customter/edit.js"></script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
		
		<title></title>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bulma/0.6.2/css/bulma.min.css">
	 <script src="https://libs.baidu.com/jquery/2.0.0/jquery.js"></script>
	<script src="https://g.alicdn.com/dingding/dinglogin/0.0.5/ddLogin.js"></script>
<style>
	.login_content{width: 356px;height: 400px;border: 1px solid #e8e8e8;border-radius: 5px;background: #f9f9f9; overflow: hidden;position: relative;margin-left: 69%;margin-top: 6%;}
    .login_header{width: 100%;height: 64px;font-size: 18px;color: #898d90;overflow: hidden;border-bottom: 1px solid #e8e8e8;}
	.login_type{width: 50%;line-height: 60px;text-align: center;border-bottom: 4px solid transparent;float: left;cursor: pointer;}
	.login_type_active{color: #38adff;border-bottom: 4px solid #38adff;cursor: default;}
	.login_body{width: 100%;height: 336px;padding: 40px auto; text-align: center;position: relative;}
	.logininput{width: 100%;display: block;border-radius: 4px;border: 1px solid #e8e8e8;background: #fff;height: 48px;line-height: 48px;padding: 0px 20px;font-size: 16px;color: #73787c;float: left;}
    .has-addons-centered{margin-top: 43px;}
    #selectheigth{ height: 48px;}
    #reselect{height:48px;border-radius: 4px;background: #fff;}
	#password{width: 84%;margin-left: 8%;margin-top: 5%;}
	#save{width: 84%;margin-left: 1%;margin-top: 9%;height: 48px;}
	.divcode{text-align: center;width: 210px;height: 210px;margin: auto;margin-top: 40px;}
    body{background-image: url(https://gw.alicdn.com/tfs/TB1ShD4lOqAXuNjy1XdXXaYcVXa-4000-1000.jpg);background-position :60% }	
    .backdiv{height: 654px;padding-top: 50px;}
 </style>
	<script>
	$(document).ready(function(){
	
	$('.pass').click(function(){
		$('.pass').attr('class','login_type login_type_active pass')
		$('.code').attr('class','login_type code')
		window.location.reload(true)
	});
	
	$('.code').click(function(){
		$('.pass').attr('class','login_type  pass')
		$('.code').attr('class','login_type login_type_active code')
		$('.login_body').html('')
		code()
		
	});

//$('.code').trigger('click')
//二维码	
	function code(){
		url ="https://oapi.dingtalk.com/connect/oauth2/sns_authorize?appid=dingoaywoerpkfqos3cgsq&response_type=code&scope=snsapi_login&state=STATE&redirect_uri=http://localhost:8080/OrderSystem/Admin/index.jsp"
		var obj = DDLogin({
     id:"login_body",//这里需要你在自己的页面定义一个HTML标签并设置id，例如<div id="login_container"></div>或<span id="login_container"></span>
     goto:encodeURIComponent(url) ,
     style: "border:none;background-color:#FFFFFF;",
     width : "365",
     height: "400"
     
     
 });	
 return obj
}
//参数构造


	var hanndleMessage = function (event) {
        var origin = event.origin;
        console.log("origin", event.origin);
        if( origin == "https://login.dingtalk.com" ) { //判断是否来自ddLogin扫码事件。
            var loginTmpCode = event.data; //拿到loginTmpCode后就可以在这里构造跳转链接进行跳转了
            url="https://oapi.dingtalk.com/connect/oauth2/sns_authorize?appid=dingoaywoerpkfqos3cgsq&response_type=code&scope=snsapi_login&state=STATE&redirect_uri=http://localhost:8080/OrderSystem/Admin/index.jsp&loginTmpCode="+loginTmpCode+""

            window.location.href=url
            
        }
 
};
 
if (typeof window.addEventListener != 'undefined') {
    window.addEventListener('message', hanndleMessage, false);
} else if (typeof window.attachEvent != 'undefined') {
    window.attachEvent('onmessage', hanndleMessage);
}

	

	
	
	});
	</script>
	<script>
		

		
	</script>
	</head>
	<body>
    <div class="backdiv">
<div class="login_content">
	
	<div class="login_header">
	<div class="login_type  login_type_active pass">帐号登录</div>	
	<div class="login_type  code">扫码登录</div>	
	</div>
	
<div class="login_body" id="login_body">
	<div class="field has-addons has-addons-centered">
  <p class="control countrycode">
    <span class="select" id="reselect">
      <select id="selectheigth">
        <option>+86</option>
        <option>+89</option>
        <option>+90</option>
      </select>
    </span>
  </p>
  <p class="control">
    <input class="input logininput" type="text" placeholder="请输入钉钉手机号码">
  </p>

</div>
	<div class="control">
    <input class="input logininput" id="password" type="text" placeholder="请输入钉钉帐号密码">
  </div>
  
  <div class="controls">

  <span class="button is-info" id="save">登录</span>
 
</div>
  
</div>
</div>
</div>





	</body>
</html>

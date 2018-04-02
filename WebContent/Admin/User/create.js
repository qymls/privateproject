var vue = new Vue({  
    el:'#app',  
    data: function() {
        return {
            formValidate: 
            {
                userName:"",
                description:"",
                password:"",
                confirm:"",
                activeState:"",
            },
            ruleValidate: {
                loginName:[
                {required: true, message: '登 录 名 不 能 为 空', trigger: 'blur' }
                ],

            },
           
        }
    },
    created() {
//    	this.$Notice.success({
//            title: '添加用户成功',
//            duration: 0
//             });
    },
    methods: {
        create: function(formValidate){
        	$page = this
           console.log(formValidate)        
           this.$http.post('userAction_addUser',
        	{
       	    "user.userName" : formValidate.userName,
			"user.loginName" : formValidate.loginName,
			"user.description" : formValidate.description,
			"user.activeState" : formValidate.activeState,
			"user.password" : formValidate.password,
			},{emulateJSON:true}).then(function(res){
				
				window.history.go(-1);
             
               
               },function(){
                 console.log('请求失败处理');
               });
        },
        
        
    }
          
    
    
});  
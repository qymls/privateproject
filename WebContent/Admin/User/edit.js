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
            user: {}
        }
    },
    created() {
    	$page = this;
    	//自定义加载样式
    	this.$Spin.show({
            render: (h) => {
                return h('div', [
                    h('Icon', {
                        'class': 'demo-spin-icon-load',
                        props: {
                            type: 'load-c',
                            size: 18
                        }
                    }),
                    h('div', 'Loading')
                ])
            }
        });
    	
         var userid  = this.getParam();
         $page.getUser(userid)
         
    },
    methods: {
        getUser: function(userid){
        	this.$http.post('userAction_findUserByID',
                	{
               	    "user.userId" : parseInt(userid),
        			},{emulateJSON:true}).then(function(res){
        				$page.$Spin.hide();
        			   var user = this.parseArray(res.data)
                       this.user = user
                       },function(){
                         console.log('请求失败处理');
                       });
        },
    	update: function(user){
        	$page = this
           console.log(user)        
           this.$http.post('userAction_updateUser',
        	{
        	"user.userId" : user.userId,
       	    "user.userName" : user.userName,
			"user.loginName" : user.loginName,
			"user.description" : user.description,
			"user.activeState" : user.activeState,
			"user.password" : user.password,
			},{emulateJSON:true}).then(function(res){
				$page.$Notice.success({
		               title: '更新用户成功',
		                });
				window.history.go(-1);
             
               
               },function(){
                 console.log('请求失败处理');
               });
        },
        getParam: function(){
        	C1=window.location.href.split("?")[1]; 
            C2=C1.split("=")[1]; 
               return C2
        },
        parseArray (arrStr) {  
    	    var tempKey = 'arr23' + new Date().getTime();//arr231432350056527  
    	    var arrayJsonStr = '{"' + tempKey + '":' + arrStr + '}';  
    	    var arrayJson;  
    	    if (JSON && JSON.parse) {  
    	        arrayJson = JSON.parse(arrayJsonStr);  
    	    } else {  
    	        arrayJson = eval('(' + arrayJsonStr + ')');  
    	    }  
    	    return arrayJson[tempKey];  
    	},
        
    }
          
    
    
});  
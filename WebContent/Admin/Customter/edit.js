var vue = new Vue({  
    el:'#app',  
    data: function() {
        return {
            formValidate: 
            {
            	CIphone:"",
            	CAddress:"",
                CPassword:"",
                confirm:"",
                CImg:"",
            },
            ruleValidate: {
            	CName:[
                {required: true, message: '登 录 名 不 能 为 空', trigger: 'blur' }
                ],

            },
            vdata: {}
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
    	
         var customterid  = this.getParam();
         $page.getUser(customterid)
         
    },
    methods: {
        getUser: function(customterid){
        	this.$http.post('customterAction_findCustomterByID',
                	{
               	    "customter.CId" : parseInt(customterid),
        			},{emulateJSON:true}).then(function(res){
        				$page.$Spin.hide();
        			   var customter = this.parseArray(res.data)
                       this.vdata = customter
                       },function(){
                         console.log('请求失败处理');
                       });
        },
    	update: function(vdata){
        	$page = this
           console.log(vdata)        
           this.$http.post('customterAction_updateCustomter',
        	{
        	"customter.CId" : vdata.CId,
        	"customter.CName" : vdata.CName,
   			"customter.CPassword" : vdata.CPassword,
   			"customter.CIphone" : vdata.CIphone,
   			"customter.CAddress" : vdata.CAddress,
   			"customter.CImg" : vdata.CImg,
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
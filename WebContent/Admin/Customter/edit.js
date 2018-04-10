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
            vdata: {},
            //图片上传
            
            imgUrl: '',
            visible: false,
            uploadList:[],
            imgurltime:""
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
    	changeimg: function(){
   		 this.ajaxUpload();

   		
   	},
    	getUser: function(customterid){
        	this.$http.post('customterAction_findCustomterByID',
                	{
               	    "customter.CId" : parseInt(customterid),
        			},{emulateJSON:true}).then(function(res){
        				$page.$Spin.hide();
        			   var customter = this.parseArray(res.data)
                       this.vdata = customter
                       imgdata =[{"name" : "upload/"+customter.CImg+"","url" :  "upload/"+customter.CImg+"",}]
      		            $page.uploadList = imgdata
                       this.imgurltime = customter.CImg
                      
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
   			"customter.CImg" : $page.imgurltime,
			},{emulateJSON:true}).then(function(res){
				$page.$Notice.success({
		               title: '更新用户成功',
		                });
				window.history.go(-1);
             
               
               },function(){
                 console.log('请求失败处理');
               });
        },
        //图片上传
        ajaxUpload :function(){
        	$page = this;
        	
        	$('#myFile').trigger("click");
   		    $("#myFile").change(function(){
   			   $.ajaxFileUpload({
   		            url: 'uploadAction', 
   		            type: 'post',
   		            secureuri: false, //一般设置为false
   		            fileElementId: 'myFile', // 上传文件的id、name属性名
   		            dataType: 'text', //返回值类型，一般设置为json、application/json
   		            success : function(data) {  
   		         if(data!=0){
   		            imgdata =[{"name" : "upload/"+data+"","url" :  "upload/"+data+"",}]
   		            $page.uploadList = imgdata
   		            $page.imgurltime = data
   		  
   		           }else{
   		            alert('上传的头像不符合格式要求，请使用标准软件编辑的图片');
   		           } 
   		         }
   		        }); 
   		 });
        },
        handleView : function (url) {
            this.imgUrl = url;
            this.visible = true;
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
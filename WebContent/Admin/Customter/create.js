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
               
            },
            ruleValidate: {
            	CName:[
                {required: true, message: '登 录 名 不 能 为 空', trigger: 'blur' }
                ],

            },
            //图片上传
           
            imgUrl: '',
            visible: false,
            uploadList:[],
            imgurltime:""
        }
    },
    created() {
    	
    },
    methods: {
    	changeimg: function(){
    		 this.ajaxUpload();

    		
    	},
    	create: function(formValidate){
        	$page = this
           console.log(formValidate)        
           this.$http.post('customterAction_addCustomter',
        	{
       	    "customter.CName" : formValidate.CName,
			"customter.CPassword" : formValidate.CPassword,
			"customter.CIphone" : formValidate.CIphone,
			"customter.CAddress" : formValidate.CAddress,
			"customter.CImg" : $page.imgurltime,
			},{emulateJSON:true}).then(function(res){
				
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
        
        
    }
          
    
    
});  

var vue = new Vue({  
    el:'#app',  
        data :function() {
            return {
            	 columnsList: [
                     {
                     type: 'selection',
                     width: 60,
                     align: 'center'
                     }, 
                    {
                         title: '姓名',
                         key: 'userName',
                     },
                     {
                         title: '登录名',
                         key: 'loginName',
                     },
                  
                     {
                         title: '描述',
                         key: 'description',
                     },
                    
                     {
                         title: '状态',
                         key: 'activeState'
                     },
                    
                     {
                         title: '操作',
                         key: 'action',
                         render: (h, params) => {
                            // console.log(this)
                        	 return h('div', [
                                 h('Poptip',{
                                   attrs:{
                                   confirm,
                                   title: '确定删除',
                                   },
                                     on:{
                                     'on-ok': () => {this.removeUser(params.row)}
                                     },
                                   },[
                                     h('Button', {
                                       props: {
                                           type: 'error',
                                           size: 'small'
                                       },
                                       style: {
                                           marginRight: '5px'
                                       },
                                    //   on: {
                                    //       click: () =>{
                                    //           console.log('click', this);
                                    //           this.removeUser(params.row)
                                    //          }
                                    //       }
                                   }, '删除'),
                                 ]),
                                    h('Button',{
                                        props:{
                                           type: 'primary',
                                           size: 'small'
                                        },
                                        on:{
                                            click: () =>{
                                            	
                                             this.edit(params.row)
                                            }
                                        }
                                   }, '编辑')
                       ]);
                         }
                     },
                 ],
            loading:true,
            items:[],
            page: 1,
            pageSize: 10, 
            rows: {},
            total:"",
            recordPage : 1,
            }
        },
        created(){
        	$page = this;
            this.getList($page.page,$page.pageSize);
//          
        	
        },
        methods: { 	
        	  getList: function(page , pageSize){
        	//	console.log(page)
        		  this.$http.post('userAction_findAllUser',
        				  {"pageInfo.pageNo":page,"pageInfo.maxResults":pageSize,"pageInfo.isPage":true},
        				  {emulateJSON:true}).then(function(res){
                       console.log(res)
                       this.loading = false;
                       var listdata = res.data.split('&')[0];
                       var totalandpage = res.data.split('&')[1];
                       var  total = totalandpage.split('@')[0];
                       var recordspage = totalandpage.split('@')[1];
                       this.total = total;
                       this.recordPage = parseInt(recordspage);
                       var items = this.parseArray(listdata);
                       this.items = items;
                       },function(){
                         console.log('请求失败处理');
                       });
        		  
        	  },
        	  changePage: function(newPage){
                   var $page = this;
                   console.log(newPage);
                  // $page.page = newPage
                   $page.getList(newPage, $page.pageSize)
              },
               changePageSize: function(newSize){
                   var $page = this;
                   $page.pageSize = newSize;
                   $page.getList($page.page, newSize)
              },
           
           
               newUser: function() {
            	   console.log(vue)
            	 window.location.href="Admin/User/create.jsp"
            	 // this.$router.push();
              },
               removeUser: function(row) {
                   $page = this;
                   ids = [row.userId];
                   console.log(ids)
                   this.$http.post('userAction_delUser',
                       	{
                       	   "user.userId" : row.userId
                       	},{emulateJSON:true}).then(function(res){
                       	   $page.getList($page.page,$page.pageSize);
                              $page.$Notice.success({
                                      title: '删除成功',
                                  }); 
                            // window.location.reload(true);
                              },function(){
                                console.log('请求失败处理');
                              });
              },
              //批量删除
               deleteUser: function() {
                   var $page = this;
                   var rows = $page.rows;
                   var ids = rows.map(function(items){ return items.userId});
                  // console.log(ids);
                   $page.rows = {};
               	$.ajax({
        			type : 'POST',
        			url : 'userAction_delUsermore',
        			dataType : 'text',
        			data : {
        				"userids" : ids
        			},
        			traditional : true,
        			async : false,
        			success : function(data) {
        			$page.getList($page.page,$page.pageSize);
                      $page.$Notice.success({
                              title: '删除成功',
                          }); 
                    
                     
        			},
        			
        	});

           
              },
               edit: function(items) {
            	//   console.log(items.userId)
            	 window.location.href="Admin/User/edit.jsp?userid="+items.userId+""
//            	   this.$router.push({
//            	          name:'parkingOrderView',
//            	          params:val
//            	      });
              },
               onSelectRows: function(rows) {
                   var $page = this;
                   $page.rows = rows;
              },
        	
        	
        	
        	
        	
        	
        	
        	//把支付串转换成数组
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
        	
        	show (index) {
                this.$Modal.info({
                    title: 'User Info',
                   
                })
            },
            remove (index) {
                this.data6.splice(index, 1);
            },
            
        }
    
    
});  
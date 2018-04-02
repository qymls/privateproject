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
                         title: '登录名',
                         key: 'userName',
                     },
                     
                  
                     {
                         title: '激活',
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
                                                 type: 'text',
                                                 size: 'small'
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
                                                 type: 'text',
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
            
            items:[],
            page: 1,
            pageSize: 10, 
            rows: {},
            records:{}
            }
        },
        created(){
        	 
        	 this.$http.post('userAction_findAllUser').then(function(res){
              console.log(res)
            var items = this.parseArray(res.data)
               this.items = items
               },function(){
                 console.log('请求失败处理');
               });

        },
        methods: { 	
        	 changePage: function(newPage){
                   var $page = this;
                   $page.getList(newPage, $page.pageSize)
              },
               changePageSize: function(newSize){
                   var $page = this;
                   $page.pageSize = newSize;
                   $page.getList($page.page, newSize)
              },
           
           
               newUser: function() {
                   var $page = this;
                  // $app.navigateTo({url: 'create'}); 
              },
               removeUser: function(row) {
                   $page = this;
                   ids = [row.id];
                   console.log(ids)
                   $page.call('weps_admin.users.delete', {ids:ids}).then(function(){
                   $page.getList($page.page, $page.pageSize);
                   $page.$Notice.success({
                       title: '删除成功',
                   });
                   });
              },
               deleteUser: function() {
                   var $page = this;
                   var rows = $page.rows;
                   var ids = rows.map(function(records){ return records.id});
                   console.log(ids);
                   $page.rows = {};
                   $page.call('weps_admin.users.delete', {ids:ids}).then(function(){
                   $page.getList($page.page, $page.pageSize);
                   $page.$Notice.success({
                           title: '删除成功',
                       }); 
                   });
           
              },
               edit: function(items) {
                   $app.navigateTo({url: 'edit', data: {id: items.id}}); 
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
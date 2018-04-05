<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>  
<html>  
<head>  
    <meta charset="utf-8">  
    <title></title>  
 <link rel="stylesheet" type="text/css" href="http://unpkg.com/iview/dist/styles/iview.css">
<script type="text/javascript" src="https://vuejs.org/js/vue.min.js"></script>
<script type="text/javascript" src="https://unpkg.com/iview/dist/iview.min.js"></script>
<script src="https://libs.baidu.com/jquery/2.0.0/jquery.js"></script>
    <style type="text/css">  
        body,html{  
            background: #f5f7f9;  
        }  
        .layout{  
              
        }  
        .layout-logo{  
           
            border-radius: 3px;  
            float: left;  
            position: relative;  
            top: 15px;  
            left: 20px;  
        } 
        .layout-logo img{
           height: 44px;
           width: auto;
           } 
        .layout-content{  
            height: 606px;
            position:absolute;  
            right:0;  
            left:0;  
            top:0;  
            bottom:90px;  
            margin: 15px;  
            overflow: hidden;  
            background: #fff;  
            border-radius: 4px;  
        }  
        .layout-content-main{  
            position: absolute;
            top: 104px;
            width:100%;
            bottom: 0;
           
            background-color: #F0F0F0;
            z-index: 1;
            transition: left .3s;
        }  
        .layout-copy{  
            text-align: center;  
            padding: 5px 0 10px;  
            color: #9ea7b4;  
            position:absolute;  
            bottom:0;  
            right:0;  
            left:0;  
            width:100%;  
          
        }  
        .layout-top{  
            background:#495060;
            width:100%;  
            height:82px;  
        }  
        .main-header-con{
         top: 0;
        box-sizing: border-box;
        position: fixed;
        display: block;
        width: 100%;
        height: 61px;
        z-index: 20;
        box-shadow: 0 2px 1px 1px rgba(100, 100, 100, 0.1);
        transition: padding .3s;
        }
        .main-header{
           height: 60px;
           background: #fff;
           box-shadow: 0 2px 1px 1px rgba(100, 100, 100, 0.1);
           position: relative;
           z-index: 11;
        }
        .tags-con{
        height: 40px;
        z-index: -1;
        overflow: hidden;
        background: #f0f0f0;
        }
        .navicon-con{
            margin: 6px;
            display: inline-block;
        }
        .header-middle-con{
        position: absolute;
        left: 96px;
        top: 2px;
        right: 592px;
        bottom: 0;
        padding: 10px;
        overflow: hidden;
        margin: 6px;
        display: inline-block;
        }
        .header-avator-con{
        position: absolute;
        right: 307px;
        top: 0;
        height: 100%;
        width: 300px;
        margin-right: -45px;
        }
       .full-screen-btn-con , .lock-screen-btn-con,.message-con{
        display: inline-block;
        width: 30px;
        padding: 18px 0;
        text-align: center;
        cursor: pointer;
        padding-left: 35px;
        }
       .user-dropdown-menu-con{
        position: absolute;
        right: 0;
        top: 14px;
        width: 150px;
        height: 100%;
       }
       .ivu-tabs-bar{
       position: fixed;
       left: 317px;
       top: 66px;
       height: 40px;
       }
       .ivu-badge{
       line-height: 2;
       }
        }
       
    </style>  
<style>
    .demo-tabs-style1 > .ivu-tabs-card > .ivu-tabs-content {
        height: 120px;
        margin-top: -16px;
    }

    .demo-tabs-style1 > .ivu-tabs-card > .ivu-tabs-content > .ivu-tabs-tabpane {
        background: #fff;
        padding: 16px;
    }

    .demo-tabs-style1 > .ivu-tabs.ivu-tabs-card > .ivu-tabs-bar .ivu-tabs-tab {
        border-color: transparent;
    }

    .demo-tabs-style1 > .ivu-tabs-card > .ivu-tabs-bar .ivu-tabs-tab-active {
        border-color: #fff;
    }
    .demo-tabs-style2 > .ivu-tabs.ivu-tabs-card > .ivu-tabs-bar .ivu-tabs-tab{
        border-radius: 0;
        background: #fff;
    }
    .demo-tabs-style2 > .ivu-tabs.ivu-tabs-card > .ivu-tabs-bar .ivu-tabs-tab-active{
        border-top: 1px solid #3399ff;
    }
    .demo-tabs-style2 > .ivu-tabs.ivu-tabs-card > .ivu-tabs-bar .ivu-tabs-tab-active:before{
        content: '';
        display: block;
        width: 100%;
        height: 1px;
        background: #3399ff;
        position: absolute;
        top: 0;
        left: 0;
    }
</style>


</head>  
<body>  
    <div id="app">  
        <div class="layout">  
           
            <div class="layout-content">              
                <Row >
                    <i-col span="5" style="position: fixed;top: 0;">  
                           <div class="layout-top">  
                             <div class="layout-logo">
                             <img  src="https://iview.github.io/iview-admin/dist/9f35d093728efc834cf6f8b15fd17eea.jpg">
                             </div>  
                          </div>  
                        <i-menu theme="dark" active-name="1-1" width="auto" accordion :open-names="[menuData[0].name]" @on-select="menuSelect" :style="{height:540+'px'}">  
                            
                            
                            <Submenu v-for="item in menuData" :name="item.name">  
                                <template slot="title"> 
                                <Icon v-bind:type="item.Icon"></Icon> {{item.label}}  
                                </template>  
                                <menu-item v-for="mi in item.menuitems" :name="mi.name">
                                  <Icon v-bind:type="mi.Icon"></Icon>{{mi.label}}
                                </menu-item>  
                            </Submenu>  
                        </i-menu>  
                    </i-col>  
                  
                    <i-col span="19"  class="demo-tabs-style1" style="background: #e3e8ee;height: 620px;  position: absolute;top: -14px;left: 21.3%">  
                        <div class="main-header-con">
                        <div class="main-header">
                           <div class="navicon-con">
                           <i-button type="text"><Icon type="navicon" style="font-size: 32px;"/></i-button>
                           </div>
                           
                           <div class="header-middle-con">
                           
                                 <Breadcrumb >
                                 <Breadcrumb-Item v-for="(item,index) in breadRum" >{{item.name}}</Breadcrumb-Item>
                                 </Breadcrumb>
                           
                           </div>
                           <div class="header-avator-con">
                        {{breadRum}}
                              <div class="full-screen-btn-con"><Tooltip content="全屏"><Icon type="arrow-expand" style="font-size: 23px;"/></Tooltip></div>
                              <div class="lock-screen-btn-con"><Tooltip content="锁屏"><Icon type="locked" style="font-size: 23px;"/></Tooltip></div>
                              <div class="message-con" ><Tooltip content="有3条未读信息"><Badge dot><Icon type="ios-bell" style="font-size: 25px;"/></Badge></Tooltip></div>
                          
                              <div class="user-dropdown-menu-con">
                              <Row justify="end">
                              <Dropdown>
                               <a href="javascript:void(0)">
                                     iview-admin
                               <Icon type="arrow-down-b"></Icon>
                                </a>
                               <DropdownMenu slot="list">
                                 <Dropdown-Item>个人中心</Dropdown-Item>
                                 <Dropdown-Item>退出登录</Dropdown-Item>
                                </DropdownMenu>
                              </Dropdown>
                              <Avatar src="https://i.loli.net/2017/08/21/599a521472424.jpg" />
                              </Row>
                              </div>
                             
                           </div>
                        </div>
                        
                        </div>
                      
                        <div class="layout-content-main" >  
                          <Tabs type="card" size="small" @on-tab-remove="removeTab"  :animated="false" :value="activeTab" @on-click="tabclick">  
                                <template v-for="(item,index) in mainTabs">  
                                    <tab-pane v-bind:icon="item.Icon" :label="item.label" closable :name="item.name" v-if="item.show" class="demo-tabs-style2">  
                                            <iframe frameborder="0" width="100%" height="520px" marginheight="0"  marginwidth="0" :src="item.url" ></iframe>  
                                    </tab-pane>  
                                </template>  
                         </Tabs>  
                           
                        </div>  
                    </i-col>  
                </Row>  
            </div>  
            <div class="layout-copy">  
                2017-2018 &copy; http://wallimn.iteye.com  
            </div>  
        </div>       
    </div>  
  
    <script type="text/javascript">  
        var vue = new Vue({  
            el:'#app',  
            data:function(){  
                return {  
                    menuData:[  
                        {   label:'信息管理',name:"信息管理",Icon:"social-chrome-outline",url:'index.jsp', 
                            menuitems:[  
                                {name:'菜谱管理',label:'菜谱管理',Icon:"ios-book-outline",url:'CookBook/list.jsp'},
                                {name:'收费管理',label:'收费管理',Icon:"ios-book-outline",url:'CookBook/list.jsp'}, 
                              
                            ]  
                        },  
                        {   label:'系统管理',name:"系统管理", Icon:"gear-a", url:'index.jsp',
                            menuitems:[  
                                {name:'用户管理',label:'用户管理',Icon:"person",url:'User/list.jsp'}, 
                                {name:'角色管理',label:'角色管理',Icon:"person",url:''},
                               
                            ]  
                        },  
                       
                    ],  
                    activeTab:null,  
                    mainHeight: 0,  
                    frameHeight: 50,  
                    mainTabs:[],
                    breadRum:[],
                };  
            },  
            mounted:function(){  
                this.setFrameHeight();  
            },  
            methods:{  
                clickTab:function(name){  
                    var vm=this;  
                    vm.frameHeight -= 1;  
                    //解决chrome浏览器中tab切换滚动条消失的问题。  
                    window.setTimeout(function(){  
                        vm.frameHeight=vm.frameHeight+1;  
                    },100);  
                },  
                //根据名称来查找对应的菜单条目  
                getMenuItem:function(name){  
                    for(var sm=0; sm<this.menuData.length; sm++){  
                        for(var mi=0; mi<this.menuData[sm].menuitems.length; mi++){  
                            if(this.menuData[sm].menuitems[mi].name==name)
                            	{
                            	data = {"name":this.menuData[sm].name}
                            	this.breadRum.push(data,this.menuData[sm].menuitems[mi]);
                            	return this.menuData[sm].menuitems[mi];  
                            	}
                            	}  
                    }  
                    return {};//这个应该不可能发生  
                },  
                
                //根据名称查找对应的Tab页。  
                getTab:function(name){  
                    for(var i=0; i<this.mainTabs.length; i++){  
                        if(this.mainTabs[i].name==name)return this.mainTabs[i];  
                    }  
                    return null;//没有找到  
                },  
                //设置Tab页不可见。  
                removeTab:function (name) {  
                    var tab = this.getTab(name);  
                    if(tab!=null)tab.show=false;  
                    console.log("mainTabRemove, name=",name,", label=",tab.label,", url=",tab.url);  
                },  
                setFrameHeight:function(){  
                    //调整掉一些补白的值  
                    this.mainHeight = (document.documentElement.scrollHeight || document.body.scrollHeight)-90-90;  
                    this.frameHeight = this.mainHeight-90;  
                }, 
                //tag点击
                tabclick:function(){
                //	alert(this.activeTab)
                },
                //菜单点击  
                menuSelect:function(name){
                	this.breadRum = [];
                    this.$Message.info(name);  
                    var tab = this.getTab(name);  
                    if(tab==null){  
                        var mi = this.getMenuItem(name);  
                        var mi = $.extend({},mi,{show:true,color:"blue"});  
                        this.mainTabs.push(mi);
                       
                    }  
                    else{  
                        tab.show=true;
                        this.getMenuItem(name);
                    }  
                    this.activeTab=name;  
                },  
                onAuthor:function(){  
                    this.$Message.info("wallimn，http://wallimn.iteyey.com");  
                }  
            }  
        });  
          
          
        window.onresize=function(){  
            vue.setFrameHeight();  
        }  
    </script>  
</body>  
</html>  
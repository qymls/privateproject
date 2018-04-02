<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>  
<html>  
<head>  
    <meta charset="utf-8">  
    <title></title>  
    <link rel="stylesheet" type="text/css" href="http://unpkg.com/iview/dist/styles/iview.css">
    <script type="text/javascript" src="adminjs/vue.min.js"></script>
    <script type="text/javascript" src="adminjs/iview.min.js"></script>
    <script src="adminjs/jquery.js"></script>
    <style type="text/css">  
        body,html{  
            background: #f5f7f9;  
        }  
        .layout{  
              
        }  
        .layout-logo{  
            width: 100px;  
            height: 40px;  
            background: #5b6270;  
            border-radius: 3px;  
            float: left;  
            position: relative;  
            top: 15px;  
            left: 20px;  
        }  
        .layout-content{  
            height: 551px;;
            position:absolute;  
            right:0;  
            left:0;  
            top:57px;  
            bottom:90px;  
            margin: 15px;  
            overflow: hidden;  
            background: #fff;  
            border-radius: 4px;  
        }  
        .layout-content-main{  
            min-height: 400px;  
            padding: 10px;  
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
            position:absolute;  
            top:0;  
            right:0;  
            left:0;  
            width:100%;  
            height:90px;  
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
            <div class="layout-top">  
                <div class="layout-logo"></div>  
            </div>  
            <div class="layout-content">  
                <Row >
                    <i-col span="5" >  
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
                    <i-col span="19"  class="demo-tabs-style1" style="background: #e3e8ee;padding:16px;height: 540px;">  
                        <div class="layout-content-main" >  
                            <Tabs type="card" size="small" @on-tab-remove="removeTab" @on-click="clickTab" :animated="false" :value="activeTab">  
                                <template v-for="(item,index) in mainTabs">  
                                    <tab-pane v-bind:icon="item.Icon" :label="item.label" closable :name="item.name" v-if="item.show" class="demo-tabs-style2">  
                                            <iframe frameborder="0" width="100%" height="485px" marginheight="0"  marginwidth="0" :src="item.url" scroll="auto"></iframe>  
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
                        {   label:'信息管理',name:"信息管理",Icon:"social-chrome-outline", 
                            menuitems:[  
                                {name:'菜谱管理',label:'菜谱管理',Icon:"ios-book-outline",url:'CookBook/list.jsp'},  
                              
                            ]  
                        },  
                        {   label:'系统管理',name:"系统管理", Icon:"gear-a", 
                            menuitems:[  
                                {name:'用户管理',label:'用户管理',Icon:"person",url:'User/list.jsp'},  
                                 
                            ]  
                        },  
                       
                    ],  
                    activeTab:null,  
                    mainHeight: 0,  
                    frameHeight: 50,  
                    mainTabs:[]  
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
                            if(this.menuData[sm].menuitems[mi].name==name)return this.menuData[sm].menuitems[mi];  
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
                //菜单点击  
                menuSelect:function(name){  
                    this.$Message.info(name);  
                    var tab = this.getTab(name);  
                    if(tab==null){  
                        var mi = this.getMenuItem(name);  
                        var mi = $.extend({},mi,{show:true});  
                        this.mainTabs.push(mi);  
                    }  
                    else{  
                        tab.show=true;  
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
<template>
    <div class="set">
        <div class="set_top">
            <ul>
                <li>
                    <router-link to="/search">
                        <i class="fa fa-angle-left fa-sm" aria-hidden="true"></i>
                    </router-link>
                </li>
                <li>设置</li>
            </ul>
        </div>
        <div class="cort"></div>
        <div class="set_content">
            <ul>
                <li>个人信息</li>
                <li>
                    <i class="fa fa-angle-right fa-1x" aria-hidden="true"></i>
                </li>    
            </ul>
            <ul>
                <li>音效与通知</li>
                <li>
                    <i class="fa fa-angle-right fa-1x" aria-hidden="true"></i>
                </li>    
            </ul>
            <ul>
                <li>省流量模式</li>
                <li>
                    <i class="fa fa-angle-right fa-1x" aria-hidden="true"></i>
                </li>    
            </ul>
            <div class="cort"></div>
            <ul>
                <li>清除缓存</li>
                <li>
                    <i class="fa fa-angle-right fa-1x" aria-hidden="true"></i>
                </li>    
            </ul>
            <div class="cort"></div>
            <ul>
                <li>饭店服务协议</li>
                <li>
                    <i class="fa fa-angle-right fa-1x" aria-hidden="true"></i>
                </li>    
            </ul>
            <ul>
                <li>交易纠纷管理办法</li>
                <li>
                    <i class="fa fa-angle-right fa-1x" aria-hidden="true"></i>
                </li>    
            </ul>
            <ul>
                <li>常见问题</li>
                <li>
                    <i class="fa fa-angle-right fa-1x" aria-hidden="true"></i>
                </li>    
            </ul>
            <div class="cort"></div>
            <ul>
                <li>产品功能改进建议</li>
                <li>
                    <i class="fa fa-angle-right fa-1x" aria-hidden="true"></i>
                </li>    
            </ul>
            <ul>
                <li>在线客服</li>
                <li>
                    <i class="fa fa-angle-right fa-1x" aria-hidden="true"></i>
                </li>    
            </ul>
            <ul>
                <li>微店官方客服</li>
                <li>
                    <i class="fa fa-angle-right fa-1x" aria-hidden="true"></i>
                </li>    
            </ul>
            <div class="cort"></div>
            <ul>
                <li>实验室</li>
                <li>
                    <i class="fa fa-angle-right fa-1x" aria-hidden="true"></i>
                </li>    
            </ul>
            <ul>
                <li>企业资质</li>
                <li>
                    <i class="fa fa-angle-right fa-1x" aria-hidden="true"></i>
                </li>    
            </ul>
            <div class="cort"></div>
            <ul>
                <li>当前版本：v 5.3.3</li>
                <li>
                    <i class="fa fa-angle-right fa-1x" aria-hidden="true"></i>
                </li>    
            </ul>
        </div>
        <mt-button type="danger" size="large" @click="unlogin" v-show="loginName">退出登陆</mt-button>
    </div>
</template>
<script>
    import {Toast} from 'mint-ui'
    export default {
        data(){
            return {
                loginName:sessionStorage.getItem("loginName")
            }
        },
        created(){

        },
        methods:{
            unlogin(){
                var loginName = sessionStorage.getItem("loginName");
                if(loginName){
                    sessionStorage.removeItem("loginName")
                    this.$router.push("/");
                }
            }
        } 
    }
</script>
<style>
    body{
        height:100px;
    }
    .set_cort{
		width:100%;
		height:12px;
		background:#e9edf0;
        margin:0;
	}
    *{
        margin:0;
        padding:0;
    }
    .set_top{
        background:white;
        height:70px;
        width:100%;
    }
    .set_top>ul{
        margin:0;
        padding:0;
        list-style:none;
    }
    .set_top>ul>li{
        line-height:70px;
    }
    .set_top>ul>li:nth-child(1) i{
        top:13px;
        position:absolute;
        left:8px;
        color:black;
    }
    .set_top>ul>li:nth-child(2){
        font-size:20px;
        text-align:center;
        
    }
    .set_content{
        width:100%;
        background:white;
    }
    .set_content>ul{
        list-style:none;
        display:flex;
        width:95%;
        margin:0 auto;
        justify-content:space-between;
    }
    .set_content>ul>li{
        width:50%;
        border-bottom:0.5px solid #ccc;
        line-height:55px;
        position:relative;
        font-size:16px;
    }
    .set_content>ul>li>i{
        position:absolute;
        right:0;
        bottom:12px;
        color:#aaa;
    }
    .set_content ul:nth-child(3)>li{
        border-bottom:0;
    }
    .set_content ul:nth-child(5)>li{
        border-bottom:0;
    }
    .set_content ul:nth-child(9)>li{
        border-bottom:0;
    }
    .set_content ul:nth-child(13)>li{
        border-bottom:0;
    }
    .set_content ul:nth-child(16)>li{
        border-bottom:0;
    }
    .set_content ul:nth-child(18)>li{
        border-bottom:0;
    }
</style>
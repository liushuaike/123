<template>
    <div class="login">
        <div class="login_top">
            <ul>
                <li>
                    <router-link to="/search">
                        <i class="fa fa-angle-left fa-sm" aria-hidden="true"></i>
                    </router-link>
                </li>
                <li>登陆</li>
            </ul>
        </div>
        <div class="login_content">
            <ul>
                <li>
                    <p>手机号</p>
                    <input type="text" placeholder="填写手机号" v-model="uname" id="uname">
                </li>
                <li>
                    <p>密码</p>
                    <input type="password" placeholder="6-16位登陆密码" class="upwd" v-model="upwd">
                    <i class="fa fa-eye fa-lg hide" aria-hidden="true" @click="eye()"></i>
                    <i class="fa fa-eye-slash fa-lg" aria-hidden="true"  @click="eye()"></i>
                </li>
            </ul>
            <mt-button type="danger" class="login-but" @click="login">登陆</mt-button>
            <button class="login-but-a">
            <i class="fa fa-weixin fa-lg" aria-hidden="true"></i>
            微信登陆</button>
            <div class="login-up">
                <ul>
                    <li><router-link to="/loginList/register">注册账号</router-link></li>
                    <li>|</li>
                    <li><a>找回密码</a></li>
                </ul>
            </div>
        </div>
    </div>

</template>

<script>
    import {Toast} from "mint-ui"
    import Vue from 'vue'
    import MintUI from 'mint-ui'
    Vue.use(MintUI)

    export default {
        data() {
            return {
                uname:"",
                upwd:""
            }
        },
        created(){
             this.eye();
             //this.session();
        },
        methods:{
            login(){
                var uname = this.uname;
                var upwd = this.upwd;
                if(uname.length<11 || upwd.length<11){
                    Toast("用户名或密码不能少于11位")
                }else{
                    console.log(uname, upwd)
                    this.$http.get(`http://127.0.0.1:3000/login/loginList?uname=${uname}&upwd=${upwd}`).then(result=>{
                        //console.log(result.body)
                        if(result.body.code == 1){
                            sessionStorage.setItem("loginName",uname); 
                            sessionStorage.setItem("loginUpwd",upwd);
                            Toast("登录成功");
                            this.$router.push("/");
                        }else {
                            Toast('用户名或密码错误')
                        }
                    })
                }

            },
            // session(){
            //     var uname = $("#uname");
            //     sessionStorage.setItem("loginName",u);
            // },
             eye(){
                if($(".upwd").has("type","password")){
                    $(".upwd").attr("type","text");
                    $(".fa-eye-slash").toggle();
                    $(".fa-eye").toggle();
                 }else{
                     $(".upwd").attr("type","password");
                 }
            
            },
        }

    }
</script>
<style>

    .login{
        background:white;
        height:810px;
    }
    .login_top{
        background:rgb(245, 65, 33);
        height:70px;
        width:100%;
    }
    .login_top>ul{
        margin:0;
        padding:0;
        list-style:none;
    }
    .login_top>ul>li{
        line-height:70px;
    }
    .login_top>ul>li:nth-child(1) i{
        top:13px;
        position:absolute;
        left:8px;
        color:white;
    }
    .login_top>ul>li:nth-child(2){
        font-size:22px;
        margin-left: 60px;
        color:white;
    }
    .login_content{
        width:100%;
    }
    .login_content>ul{
        position:relative;
    }
    .login_content>ul>li{
        width:100%;
        height:50px;
        border-bottom:0.1px solid #eee;
    }
    .login_content>ul>li>p{
        width:20%;
        font-size:20px;
        margin-top:20px;
        margin-left:4%;
    }
    .login_content>ul>li>input{
        width:78%;
        border:0;
        position:absolute;
        right:10px;
        margin-top:-40px;
    }
    .login_content>ul>li:nth-child(2)>i{
        margin-right:10px;
    }
    .login-but{
        width:92%;
        margin:40px auto;
        margin-left:4%;
        font-size:20px;
    }
    .login-but-a{
        width:92%;
        margin:-10px auto;
        margin-left:4%;
        border:1px solid green;
        height:41px;
        font-size:20px;
        color:green;
        border-radius:5px;
    }
    .fa-weixin{
        color:green;
    }
    .fa-eye{
        color:#ccc;
        position:absolute;
        right:0;
        margin-top:-25px;
    }
    .fa-eye-slash{
        color:#ccc;
        position:absolute;
        right:0;
        margin-top:-25px;
    }
    .login-up{
        margin-top:300px;
    }
    .login-up>ul{
        list-style:none;
        display:flex;
        width:60%;
        margin-left:20%;
    }
    .login-up>ul>li{
        margin:10px;
    }
    .login-up>ul>li:nth-child(2){
        color:#bbb;
    }
    ::-webkit-input-placeholder{
        color:#bbb;
        font-size:18px;
    }
</style>
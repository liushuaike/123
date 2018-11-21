<template>
    <div class="login">
        <div class="login_top">
            <ul>
                <li>
                    <router-link to="/search/loginList">
                        <i class="fa fa-angle-left fa-sm" aria-hidden="true"></i>
                    </router-link>
                </li>
                <li>注册</li>
            </ul>
        </div>
        <div class="login_content">
            <ul>
                <li>
                    <p>手机号</p>
                    <input type="text" placeholder="填写手机号" v-model="uname">
                </li>
                <li>
                    <p>密码</p>
                    <input type="text" placeholder="6-16位注册密码" class="upwd" v-model="upwd">
                </li>
            </ul>
            <mt-button type="danger" class="login-but" @click="login">注册</mt-button>
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
        },
        methods:{
            login(){
                var uname = this.uname;
                var upwd = this.upwd;
                if(uname.length<11 || upwd.length<11){
                    Toast("用户名或密码不能少于11位")
                }else{
                    this.$http.get(`http://127.0.0.1:3000/login/loginRegister?uname=${uname}&upwd=${upwd}`).then(result=>{
                        //console.log(result)
                        if(result.body){
                            Toast("注册成功");
                            this.$router.push("/");
                        }
                    })
                }
            },
        }

    }
</script>
<style>


</style>
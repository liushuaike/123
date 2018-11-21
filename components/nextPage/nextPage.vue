<template>
    <div class="nextPage">
        <div id="nextPage_header" v-bind="scroll()">
            <ul>
                <li>
                    <router-link to="/home" class="i_left">
                        <i class="fa fa-angle-left fa-sm" aria-hidden="true" id="i_a"></i>
                    </router-link>
                </li>
                <li id="p_a">
                    首页
                </li>
                <li id="p_b">
                    全部
                </li>
                <li id="p_c">上新</li>
                <li>
                    <span class="mui-icon-extra mui-icon-extra-cart" id="i_b"></span>
                </li>
            </ul>
        </div>
        <div class="nextPage_back"></div>
        <div id="nextPage_back_a"></div>
        <div class="nextpage_shop">
            <div class="nextpageLogo">
                <img src="../../img/logo/2.jpg">
            </div>
            <div class="next_name">
                <p>衣品行潮流女装</p>
                <p>#半身裙风潮</p>
                <ul>
                    <li>
                        <p>1%</p>
                        <p>回头率</p>
                    </li>
                    <li>
                        <p>1864</p>
                        <p>收藏人数</p>
                    </li>
                    <li>
                        <p>汕头</p>
                        <p>所在地</p>
                    </li>
                </ul>
                <div class="tip">
                    <p>【温馨提示】 积分不够可以私聊店主哦</p>
                    <p>【店铺介绍】 潮流微利 质优性价比高 服务热心</p>
                </div>
            </div>
            <div class="corts"></div>
        </div>
        
       
        <div class="next_list">
            <h4>连衣裙</h4>
            <ul>
                <li v-for="item in nextList" v-bind:key="item.id">
                    <router-link :to="'/nextPage/nextPageList/'+item.id" class="next_router">
                        <img :src="item.img">
                        <p>{{item.title}}<p>
                        <p>{{item.newprice}}</p>
                        <p>{{item.integral}}</p>
                        <p>{{item.oldprice}}</p>
                        <p>{{item.sale}}</p>
                    </router-link>
                </li>
            </ul>
        </div>
        <div class="corts"></div>
        <div class="next_list">
            <h4>套装</h4>
            <ul>
                <li v-for="item in nextTao" v-bind:key="item.id">
                    <router-link :to="'/nextPage/nextPageList_a/'+item.id" class="next_router">
                        <img :src="item.img">
                        <p>{{item.title}}<p>
                        <p>{{item.newprice}}</p>
                        <p>{{item.integral}}</p>
                        <p>{{item.oldprice}}</p>
                        <p>{{item.sale}}</p>
                    </router-link>
                </li>
            </ul>
        </div>
        <div class="corts"></div>
        <div class="next_list">
            <h4>上装</h4>
            <ul>
                <li v-for="item in nextShang" v-bind:key="item.id">
                    <router-link :to="'/nextPage/nextPageList_b/'+item.id" class="next_router">
                        <img :src="item.img">
                        <p>{{item.title}}<p>
                        <p>{{item.newprice}}</p>
                        <p>{{item.integral}}</p>
                        <p>{{item.oldprice}}</p>
                        <p>{{item.sale}}</p>
                    </router-link>
                </li>
            </ul>
        </div>
        <div class="corts"></div>
        <div class="next_list">
            <h4>下装</h4>
            <ul>
                <li v-for="item in nextxia" v-bind:key="item.id">
                    <router-link :to="'/nextPage/nextPageList_c/'+item.id" class="next_router">
                        <img :src="item.img">
                        <p>{{item.title}}<p>
                        <p>{{item.newprice}}</p>
                        <p>{{item.integral}}</p>
                        <p>{{item.oldprice}}</p>
                        <p>{{item.sale}}</p>
                    </router-link>
                </li>
            </ul>
        </div>
        
    </div>
</template>
<script>
    import {Toast} from 'mint-ui'
    export default {
        data(){
            return { 
                nextList:[],
                nextTao:[],
                nextShang:[],
                nextxia:[],
                nid:this.$route.params.nid
            }
        },
        created(){
           this.next();
           this.nextlist();
           this.nextlist_s();
           this.nextlist_x();
           this.scroll();
        },
        methods:{
            scroll(){
                var next = document.getElementById("nextPage_header");
                var p_a = document.getElementById("p_a");
                var p_b = document.getElementById("p_b");
                var p_c = document.getElementById("p_c");
                var i_a = document.getElementById("i_a");
                var i_b = document.getElementById("i_b");
                var nextPage_back_a = document.getElementById("nextPage_back_a");
                //console.log(i);
                //var next = document.getElementsByClassName("nextPage_header")[0];
                //console.log(next);
                window.onscroll = function(){
                    //滚轮滑动距离
                    var scrollTop = document.body.scrollTop || document.documentElement.scrollTop;
                    //console.log(scrollTop);
                        if(scrollTop >= 200){
                            //next.style.width = "100px";
                            next.style.background = "#fff";
                            p_a.style.color = "black";
                            p_b.style.color = "black";
                            p_c.style.color = "black";
                            i_a.style.color = "black";
                            i_b.style.color = "black";
                            next.style.borderBottom = "0.5px solid #ccc";
                        }else{
                            p_a.style.color = "white";
                            p_b.style.color = "white";
                            p_c.style.color = "white";
                            i_a.style.color = "white";
                            i_b.style.color = "white";
                            next.style.background = "rgba(0,0,0,0)";
                            next.style.borderBottom = "none"
                        }
                    }  
            },
            next(){
                this.$http.get("http://127.0.0.1:3000/imagelist/nextlist").then(result=>{
                    if(result.body.code == 1){
                        this.nextList = result.body.msg;
                    }else{
                        Toast("请求错误");
                    }
                })
            },
            nextlist(){
                this.$http.get("http://127.0.0.1:3000/imagelist/nextlist_a").then(result=>{
                    if(result.body.code == 1){
                        this.nextTao = result.body.msg;
                    }else{
                        Toast("请求错误");
                    }
                })
            },
            nextlist_s(){
                this.$http.get("http://127.0.0.1:3000/imagelist/nextlist_b").then(result=>{
                    if(result.body.code == 1){
                        this.nextShang = result.body.msg;
                    }else{
                        Toast("请求错误");
                    }
                })
            },
            nextlist_x(){
                this.$http.get("http://127.0.0.1:3000/imagelist/nextlist_c").then(result=>{
                    if(result.body.code == 1){
                        this.nextxia = result.body.msg;
                    }else{
                        Toast("请求错误");
                    }
                })
            }
        }
    }
</script>
<style>
body{
    height:1500px;
}
.nextPage{
    background:white;
}
#nextPage_header{
    width:100%;
    height:70px;
    position:fixed;
    z-index:10;
    transition:0.5s;
}
#nextPage_header>ul{
    width:100%;
    display:flex;
    justify-content:space-around;
    align-items:center;
    list-style:none;
    color:white;
}
#nextPage_header>ul>li{
    line-height:70px;
    font-size:16px;
}
#nextPage_header>ul>li>.i_left>i{
    color:white;
    margin-top:20px;
}
#nextPage_header>ul>li>i{
    color:white;
    margin-top:20px;
}
.nextPage_back{
    height:220px;
    background:url(../../img/nextpageImg/2.jpg) no-repeat;
    background-size:100% 100%;
}
#nextPage_back_a{
    height:220px;
    width:100%;
    background:black;
    position:absolute;
    top:0;
    opacity:0;
}
.nextPage:before{
    content:"";
    display: table;
}
.nextpage_shop{
    width:100%;
    background:white;
    position:relative;
}
.nextpageLogo{
    position:absolute;
    top:-40px;
    left:2.5%;
}
.nextpageLogo>img{
    width:100px;
}
.next_name{
    width:94%;
    margin:70px auto;
}
.next_name>p:nth-child(1){
    font-size:20px;
    font-weight: 800;
    color:black;
}
.next_name>p:nth-child(2){
    background:rgb(243, 58, 129);
    width: 100px;
    color:white;
    text-align: center;
    padding:2px 0;
    border-radius:3px;
    letter-spacing: 2px;
}
.next_name>p:nth-child(3){
    font-size:30px;
}
.next_name>ul{
    list-style:none;
    display: flex;
    justify-content: space-between;
    margin-top:20px;
}
.next_name>ul>li>p:nth-child(1){
    color:black;
    font-size: 18px;
}
.next_name>ul>li>p{
    letter-spacing: 1px;
}
.tip>p:nth-child(1){
    margin-top:10px;
}
.tip>p{
    font-size:15px;
    padding:0;
    letter-spacing: 1.5px;
}
.nextpage_shop:before{
    content:"";
    display: table;
}
.next_list{
    background:white;
    width: 94%;
    margin:0 auto;
}
.next_list>h4{
    padding:30px 0;
    color:black;
}
.next_list>ul{
    display: flex;
    list-style:none;
    flex-wrap: wrap;
    width: 100%;
    justify-content: space-between;
}
.next_list>ul>li{
    width:48.5%;
}
.next_list>ul>li>.next_router>img{
    width:100%;
}
.next_list>ul>li>.next_router>p:nth-child(2){
    color:black;
    letter-spacing:1px;
    font-size:14.5px;
   
}
.next_list>ul>li>.next_router>p:nth-child(4){
    color:rgb(230, 83, 39);
    font-size:18px;
    float: left;
    margin-top:10px;
}
.next_list>ul>li>.next_router>p:nth-child(5){
    color:white;
    background:rgb(230, 83, 39);
    width:40%;
    text-align: center;
    border-radius: 3px;
    height:22px;
    line-height:20px;
    float: right;
    margin-right:25px;
    margin-top:10px;
}
.next_list>ul>li>.next_router>p:nth-child(6){
    float: left;
    margin-top:5px;
    font-size:14px;
    text-decoration:line-through;
    color:#bbb;
}
.next_list>ul>li>.next_router>p:nth-child(7){
    float:right;
    margin-right:40px;
    margin-top:5px;
    font-size:15px;
}
.corts{
		width:100%;
		height:8px;
		background:#e9edf0;
        margin-top:30px;
	}
</style>
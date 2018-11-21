<template>
    <div class="nextPageList" v-bind="scroll()">
        <div id="nextPageList_header">
            <ul>
                <li>
                    <router-link to="/home/nextPage">
                        <i class="fa fa-angle-left fa-mg i_c" aria-hidden="true" ></i>
                    </router-link>
                </li>
                <li>
                    <i class="fa fa-user-circle-o fa-mg i_c" aria-hidden="true"></i>
                </li>
                <li>
                    <span class="mui-icon-extra mui-icon-extra-cart i_c"></span>
                </li>
                <li>
                    <span class="mui-icon mui-icon-more i_c"></span>
                </li>
            </ul>
        </div>
        <div class="nextPageList_title">
            <img :src="nextList.img">
            <ul>
                <li>微店红包<li>
                <li>{{nextList.title}}</li>
                <li>{{nextList.newprice}}</li>
                <li>{{nextList.integral}}</li>
                <li>原价:{{nextList.oldprice}}（首单88积分抵20元）</li>
                <li>{{nextList.sale}}</li>
            </ul>
        </div>
        <div class="nextPageList_baozhang">
            <ul>
                <li>
                    <i class="fa fa-check-square-o fa-x" aria-hidden="true"></i>
                    <span>7天退货</span>
                </li>
                <li>
                    <i class="fa fa-bold fa-sx" aria-hidden="true"></i>
                    <span>交易资金担保</span>
                </li>
            </ul>
        </div>
        <div class="cort"></div>
        <div class="nextPageList_gaishu">
            <div class="nextPageList_gaishu">
            <ul>
                <li>
                    <img src="../../img/logo/2.jpg">
                </li>
                <li>
                    <p>1881</p>
                    <p>收藏</p>
                </li>
                <li>
                    <hr>
                </li>
                <li>
                    <p>1%</p>
                    <p>回头率</p>
                </li>
                <li>
                    <hr>
                </li>
                <li>
                    <p>登陆时间 <span>10小时前</span></p>
                    <p>平均发货 <span>24小时内</span></p>
                </li>
            </ul>
            <h4>六一潮流女装</h4>
            <div class="nextPageList_gaishu_button">
                <button>+收藏店铺</button>
                <button>进店逛逛</button>
            </div>   
            </div>
        </div>
        <div class="cort"></div>

        <div class="nextPageList_pingjia">
            <ul>
                <router-link id="nextPageList_pingjia_talk" to="/nextPageList/nextPageTalk">
                    <li>
                        <h4>商品评价</h4>
                    </li>
                    <li>
                        <i class="fa fa-angle-right fa-lx" aria-hidden="true"></i>
                    </li>
                </router-link>
            </ul>
        </div>
        <div class="cort"></div>
        <div class="nextPageList_shop">
            <ul>
                <li class="nextPageList_shop_li">
                    <img src="../../img/logo/2.jpg">
                    <p>联系店家</p>
                </li>
                <li class="nextPageList_shop_li">
                    <i class="fa fa-heart-o fa-bx" aria-hidden="true"></i>
                    <p>收藏</p> 
                </li>
                <li class="nextPageList_shop_li">
                    <i class="fa fa-briefcase fa-bx" aria-hidden="true"></i>
                    <p>店铺</p>
                </li>
                <li class="nextPageList_shop_li_button">
                    <button @click="dell()">加入购物车</button>
                </li>
                <li class="nextPageList_shop_li_button">
                    <button id="icon_shop" @click="dell()">立即购买</button>
                </li>
            </ul>
        </div>
        <div class="nextshop">
            <div class="nextshop_top" @click="top"></div>
            <div class="nextshop_bottom">
                <div class="nextshop_img">
                    <img :src="nextList.img">
                </div>
                <p id="nextshop_p_a">{{nextList.newprice}}</p>
                <p id="nextshop_p_b">库存:800</p>
                <div class="nextshop_sort">
                    <hr/>
                    <h5>颜色分类</h5>
                    <ul>
                        <li>黑色</li>
                        <li>灰色</li>
                    </ul>
                    <h5>尺码</h5>
                    <ul>
                        <li>M</li>
                        <li>L</li>
                        <li>ML</li>
                        <li>2ML</li>
                        <li>3ML</li>
                        <li>4ML</li>
                        <li>5ML</li>
                    </ul>
                    <h5 id="nextshop_count_index">数量</h5>
                    <ul id="nextshop_count">
                        <li id="odd" @click="odd">-</li>
                        <li id="count">{{count}}</li>
                        <li id="add" @click="add">+</li>
                    </ul>
                </div>
                <!--<router-link :to="'/cart/'+nextList.id">!-->
                    <mt-button type="danger" size="large" id="mt-button" @click="addCart">确定</mt-button>
                <!--</router-link>!-->
            </div>
        </div>
    </div>
</template>
<script>
export {Toast} from "mint-ui"
export default {
    data(){
        return { 
            nextList:[],
            id:this.$route.params.id,
            count:1,
            img:[],
            title:[],
            newprice:[],
            nid:[]
        }
    },
    created(){
        this.next();
        this.scroll();
        console.log(this.$route.params.id);
    },
    methods:{
        cardAdd(){
            this.$store.commit("increment");
        },
        cardOdd(){
            this.$store.commit("subtract");
        },
        next(){
            this.$http.get("http://127.0.0.1:3000/imagelist/nextlist_details?id="+this.id).then(result=>{
                if( result.body.code == 1){
                    this.img = result.body.msg[0].img;
                    this.title = result.body.msg[0].title;
                    this.newprice = result.body.msg[0].newprice;
                    this.nextList = result.body.msg[0];
                    this.nid = result.body.msg[0].nid;
                    //console.log(this.img);
                }else{
                    Toast("请求错误");
                }
            })
        },
        addCart(){
            console.log(this.img);
            console.log(this.nid);
            this.$http.get('http://127.0.0.1:3000/addCart/cartList?id='+this.id+'&img='+this.img+'&title='+this.title+'&newprice='+this.newprice+'&count='+this.count+'&nid='+this.nid).then(result=>{
                if(result.body.code == 1){
                    var loginName = sessionStorage.getItem("loginName");
                    if(loginName){
                        this.$router.push("/cart");
                        this.$toast({
                            message:"添加购物车成功"
                        });
                    }else{
                        this.$router.push("/search/loginList");
                    } 
                }else{
                    this.$toast({
					    message:"添加购物车失败"
	                });
                }
            })
        },
        scroll(){
            window.onscroll = function(){
                var i = $(".i_c");
                var nextPageList_header = $("#nextPageList_header");
                //console.log(i);
                var scrollTop = document.body.scrollTop ||document.documentElement.scrollTop;
                //console.log(scrollTop);
                if(scrollTop > 200){
                    i.css("color","black");
                    nextPageList_header.css("background","white");

                }else{
                    i.css("color","white");
                    nextPageList_header.css("background","none");
                }
            }
        },
        dell(){
            var icon_shop = $("#icon_shop");
            console.log(icon_shop);
            var nextshop = $(".nextshop");
            nextshop.animate({bottom:"0"});
        },
        top(){
            var nextshop_top = $(".nextshop_top");
            var nextshop = $(".nextshop");
            nextshop.animate({bottom:"-100%"});
        },
        add(){
            this.count++;
        },
        odd(){
            if(this.count>1){
                this.count--;
            }
        }
    }
}
</script>
<style>
    .nextPageList{
        width:100%;
        background:white;
    }
    #nextPageList_header{
        width:100%;
        height:70px;
        position:fixed;
        z-index:10;
        transition:0.5s;
    }
    #nextPageList_header>ul{
        width:95%;
        margin-left:2.5%;
        display:flex;
        list-style:none;
        justify-content:space-between;
        height:100%;
    }
    #nextPageList_header>ul>li{
        height:100%;
        padding-top:20px;
    }
    #nextPageList_header>ul>li:nth-child(1){
        width:55%;
    }
    .fa-user-circle-o{
        color:white;
    }
    .fa-angle-left{
        color:white;
    }
    #nextPageList_header>ul>li{
        color:white;
    }
    .nextPageList_title{
        width:100%;
    }
    .nextPageList_title>img{
        width:100%;
    }
    .nextPageList_title>ul{
        width:90%;
        margin:0 auto;
        list-style:none;
        margin-top:10px;
        overflow:hidden;
    }
    .nextPageList_title>ul>li:nth-child(1){
        float:left;
        font-size:14px;
        width:75px;
        text-align:center;
        height:20px;
        color:#d99f30;
        background:white;
        border:0.5px solid #ccc;
        box-shadow:1px 2px 1px 0 #412c04;
    }
    .nextPageList_title>ul>li:nth-child(3){
        font-weight:900;
        line-height:25px;
        text-indent:3%;
    }
    .nextPageList_title>ul>li:nth-child(4){
        color:#f14705;
        font-weight:700;
        font-size:30px;
        letter-spacing:0.5px;
        float:left;
        margin-top:10px;
    }
    .nextPageList_title>ul>li:nth-child(5){
        color:white;
        background:#efa080;
        width:15%;
        text-align: center;
        border-radius:3px;
        height:18px;
        line-height:18px;
        float:left;
        font-size:4px;
        margin-left:10px;
        margin-top:16px;
    }
    .nextPageList_title>ul>li:nth-child(6){
        clear:both;
        font-size:6px;
        color:#aaa;
        letter-spacing:1px;
        margin-top:45px;
    }
    .nextPageList_title>ul>li:nth-child(7){
        font-size:6px;
        color:#aaa;
        letter-spacing:1px;
        margin-top:3px;
    }
    .nextPageList_baozhang{
        width:100%;
        height:50px;
        margin-top:20px;
    }
    .nextPageList_baozhang>ul{
        list-style:none;
        display:flex;
        justify-content:space-between;
        width:55%;
        margin-left:5%;
    }
    .nextPageList_baozhang>ul>li>i{
        padding-right:8px;
        color:#d9754d;
    }
    .nextPageList_baozhang>ul>li>span{
        font-size:10px;
        color:#aaa;
    }
    .nextPageList_gaishu{
        width:95%;
        margin-left:2.5%;
        padding-bottom:15px;
    }
    .nextPageList_gaishu>ul{
        width:100%;
        margin:35px auto;
        list-style:none;
        display:flex;
        justify-content:space-between;
    }
    .nextPageList_gaishu>ul>li>hr{
        height:50%;
        width:0.5px;
        margin-top:5px;
    }
    .nextPageList_gaishu>ul>li:nth-child(1){
        width:22%;
    }
    .nextPageList_gaishu>ul>li:nth-child(2)>p:nth-child(1){
        font-size:16px;
        font-weight:600;
        color:black;
    }
    .nextPageList_gaishu>ul>li:nth-child(2)>p:nth-child(2){
        font-size:13px;
        font-weight:300;
    }
    .nextPageList_gaishu>ul>li:nth-child(4)>p:nth-child(1){
        font-size:16px;
        font-weight:600;
        color:black;
    }
    .nextPageList_gaishu>ul>li:nth-child(4)>p:nth-child(2){
        font-size:13px;
        font-weight:300;
    }
    .nextPageList_gaishu>ul>li>img{
        width:100%;
        margin-top:-10px;
    }
    .nextPageList_gaishu>ul>li:last-child>p>span{
        color:black;
    }
    .nextPageList_gaishu>h4{
        margin-top:-15px;
    }
    .nextPageList_gaishu_button{
        display:flex;
        justify-content:space-between;
        margin-top:30px;
    }
    .nextPageList_gaishu_button>button{
        border:none;
        background:#eee;
        width:49%;
        height:40px;
        font-size:15px;
        border-radius:3px;
    }
    .nextPageList_pingjia{
        width:90%;
        margin:20px auto;
    }
    .nextPageList_pingjia>ul>#nextPageList_pingjia_talk{
        display:flex;
        list-style:none;
        justify-content:space-between;
        align-items:center;
    }
    #nextPageList_pingjia_talk>li>h4{
        color:black;
    }
    .nextPageList_shop{
        width:100%;
        background:white;
        border-top:.5px solid #aaa;
        position:fixed;
        bottom:0;
        height:60px;
    }
    .nextPageList_shop_li{
        width:12%;
    }
    .nextPageList_shop_li_button{
        width:26%;
    }
    .nextPageList_shop>ul{
        list-style:none;
        display:flex;
        justify-content:space-between;
        width:95%;
        margin-left:2.5%;
        margin-top:10px;
    }
    .nextPageList_shop>ul>li{
        text-align:center;
    }
    .nextPageList_shop>ul>li:nth-child(1){
        margin-top:-2px;
    }
    .nextPageList_shop>ul>li:nth-child(1)>img{
        border-radius:100px;
        width:55%;
        margin-left:5px;
    }
    .nextPageList_shop>ul>li>i{
        margin:0;
        padding:0;
        color:gray;
    }
    .nextPageList_shop>ul>li:nth-child(1)>p{
        background:#f14705;
        height:15px;
        color:white;
        width:50px;
        line-height:18px;
        border-radius:2px;
    }
    .nextPageList_shop>ul>li>p{
        font-size:2px;
        color:black;
    }
    .nextPageList_shop>ul>li:nth-child(4)>button{
        width:100%;
        background:black;
        color:white;
        border:3px;
        height:40px;
    }
    .nextPageList_shop>ul>li:nth-child(5)>button{
        width:100%;
        background:#f14705;
        color:white;
        border:3px;
        height:40px;
    }
    .nextPageList{
        padding-bottom:60px;
    }
    .nextshop{
        height:100%;
        position:fixed;
        bottom:-100%;
        width:100%;
    }
    .nextshop_top{
        height:35%;
        width:100%;
        background:rgba(0,0,0,.3);
    }
    .nextshop_bottom{
        width:100%;
        height:65%;
        background:white;
        position:relative;
    }
    .nextshop_img{
        width:28%;
        height:105px;
        box-shadow:2px 2px 1px #aaa;
        margin-left:3.5%;
        position:absolute;
        top:-30px;
        z-index:10;
        background:white;
    }
    .nextshop_img>img{
        width:95.5%;
        margin:2% 2.5%;
    }
    .nextshop_bottom>p{
        margin-left:35%;
    }
    #nextshop_p_a{
        font-size:20px;
        color:red;
        font-weight:600;
        padding-top:15px;
        margin-bottom:5px;
    }
    #nextshop_p_b{
        padding-left:5px;
    }
    .nextshop_sort{
        width:94%;
        margin-left:3%;
        margin-top:60px;
    }
    .nextshop_sort>hr{
        background:#aaa;
    }
    .nextshop_sort>h5{
        margin-top:20px;
    }
    .nextshop_sort>ul{
        list-style:none;
        display:flex;
        margin-top:20px;
    }
    .nextshop_sort>ul>li{
        font-size:14px;
        padding:7px 5px;
        margin-right:15px;
        border:0.5px solid #eee;
        border-radius:3px;
    }
    #nextshop_count>li{
        padding:5px 12px;
        margin:0;
        font-size:16px;
        border:1px solid #bbb;
    }
    #nextshop_count>li:nth-child(2){
        padding:0 15px;
        padding-top:10px;
        line-height:15px;
        border-left:0;
        border-right:0;
    }
    #nextshop_count_index{
        margin-top:30px;
    }
    #mt-button{
        bottom:0;
        position:absolute;
    }
</style>



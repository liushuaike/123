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
                    <button @click="dell()">立即购买</button>
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
                <mt-button type="danger" size="large" id="mt-button">确定</mt-button>
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
        next(){
            this.$http.get("http://127.0.0.1:3000/imagelist/nextlist_a_details?id="+this.id).then(result=>{
                if( result.body.code == 1){
                    this.nextList = result.body.msg[0];
                    this.nid = result.body.msg[0].nid;
                    this.newprice = result.body.msg[0].newprice;
                    this.title = result.body.msg[0].title;
                    this.img = result.body.msg[0].img;
                }else{
                    Toast("请求错误");
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

</style>



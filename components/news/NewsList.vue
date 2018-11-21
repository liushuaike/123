<template>
  <div class="newslist_app">
      <div class="mui-cart-header">
        <p>消息</p>
      </div>
      <div class="nextPageTalk_sort" v-for="item in list" v-bind:key="item.id">
        <ul>
            <li>
                <img :src="item.img">
            </li>
            <li>
                <p>{{item.title}}</p>
                <p>{{item.ret}}</p>
            </li>
            <li>
                <button @click="push_next">进店</button>
            </li>
        </ul>
      </div>
  </div>
</template>
<script>
  import {Toast} from "mint-ui"
  export default{
    data(){
      return {
				list:[]
			}
    },
		created(){
        this.newsList();
		},
    methods:{
      push_next(){
          this.$router.push("/home/nextPage");
      },
      newsList(){
          this.$http.get("http://127.0.0.1:3000/newlist/newlist").then(result=>{
            if(result.body.code == 1){
                this.list = result.body.msg;
            }else{
              Toast("请求错误");
            }
          })
      }
		}
  }
</script>
<style>
 /*修改样式 新闻标题 新闻发表时间与点击次数*/
/* .mui-table-view  h1{
	 font-size:14px;
 }*/
/* .mui-table-view  .mui-ellipsis{
   font-size:12px;
	 color:#226aff;
	 display:flex;
	 justify-content:space-between; 
 }*/
 .nextPageTalk_sort{
   border-bottom:0.5px solid #eee;
 }
 .newslist_app{
   padding-top:70px;
 }
</style>
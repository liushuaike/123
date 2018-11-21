//引入express模块
const express = require("express");
//加载路由模块
var imagelist = require("./router/imagelist");
var list = require("./router/login");
var comment = require("./router/comment");
var addCart = require("./router/addCart");
var newlist = require("./router/newlist");

//创建express对象
var app = express();
//加载跨域模块
var cors = require("cors");
//修改端口
app.use(cors({
	origin:['http://127.0.0.1:8080','http://localhost:8080'],
			credentials:true
}))
//绑定监听端口
var server = app.listen(3000);
//指定静态目录  public
app.use(express.static(__dirname+"/public"));
app.use("/imagelist",imagelist);
app.use("/login",list);
app.use("/comment",comment);
app.use("/addCart",addCart);
app.use("/newlist",newlist);

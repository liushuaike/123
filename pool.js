const mysql = require("mysql");
var pool = mysql.createPool({
    host : '127.0.0.1',   //连接mysql数据库地址
    user : 'root',         //连接数据库用户名
    database: 'web1805',    //操作哪个数据库
    port:3306,              //端口号3306
    password : '',          //连接数据库密码
    connectionLimit : 10      //活动连接数量
})
module.exports = pool;
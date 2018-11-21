const express = require("express");
const pool = require("../pool");
const router = express.Router();
router.get("/list",(req,res)=>{
	var nid = req.query.nid;
	var pno = req.query.pno;
	if(!pno){
		pno = 1
	}
	var reg = /^[0-9]{1,}$/i;
	if(!reg.test(pno)){
		res.send({code:-1,msg:"页码格式有误"})
	}
	if(!reg.test(nid)){
		res.send({code:-2,msg:"评论编号有误"})
	}
	var sql = "select id,user_name,add_time,content from comment where nid=? limit ?,?";
	var pagesize = 3;
	var offset = parseInt((pno-1)*pagesize);
	nid = parseInt(nid);
	pool.query(sql,[nid,offset,pagesize],(err,result)=>{
		if(err) throw error;
		res.send({code:1,msg:result})
	})
});
router.get("/postList",(req,res)=>{
	var user_name  = req.query.user_name;
	var add_time = req.query.add_time;
	var content = req.query.content;
	var nid = req.query.nid;
	var sql = "INSERT INTO comment (user_name,add_time,content,nid) VALUES (?,now(),?,?)";
	pool.query(sql,[user_name,content,nid],(err,result)=>{
		if(err) throw error;
		res.send({code:1,msg:result});
	});
})
module.exports = router;


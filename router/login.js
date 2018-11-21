const express = require("express");
const pool = require("../pool");
const router = express.Router();
router.get("/list",(req,res)=>{
	var sql = "SELECT id,img FROM login_banner";
	pool.query(sql,(err,result)=>{
		if(err) throw error;
		res.send({ code:1,msg:result });
	});
});
router.get("/loginList",(req,res)=>{
	var uname = req.query.uname;
	var upwd = req.query.upwd;
	//console.log(uname, upwd)
	var sql = `SELECT * FROM login_interface WHERE uname=? and upwd=?`;
	pool.query(sql,[uname,upwd],(err,result)=>{
		console.log(result);
		if(err) throw error;
		else if (result.length > 0 ){
			res.send({code:1,msg:result});
		}else {
			res.send({code:0,msg:"sf"})
		}
		
	})
});
router.get("/loginRegister",(req,res)=>{
	var uname = req.query.uname;
	var upwd = req.query.upwd;
	//console.log(uname, upwd)
	var sql = "INSERT INTO login_interface (uname,upwd) VALUES (?,?)";
	pool.query(sql,[uname,upwd],(err,result)=>{
		//console.log(result);
		if(result.length > 0 ){
			res.send({code:1,msg:result});
		}else{
			res.send({code:0,msg:"sf"})
		}
	})
})

module.exports = router;
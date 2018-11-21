const express = require("express");
const pool = require("../pool");
const router = express.Router();
router.get("/newlist",(req,res)=>{
	var sql = "SELECT * FROM newlist";
	pool.query(sql,(err,result)=>{
		if(err) throw error;
		res.send({code:1,msg:result});
	});
});
module.exports = router;
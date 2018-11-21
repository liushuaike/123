const express = require("express");
const pool = require("../pool");
const router = express.Router();

router.get("/cartList",(req,res)=>{
    var id = req.query.id;
    var img = req.query.img;
    var title = req.query.title;
    var newprice = req.query.newprice; 
    var count = req.query.count;
    var nid = req.query.nid;
    var sql = "SELECT * from cart WHERE nid=?";
    pool.query(sql,[id],(err,result)=>{
        if(result.length==0){
			var sql = `INSERT INTO cart VALUES(null,?,?,?,?,?)`;
			pool.query(sql,[img,title,newprice,count,nid],(err,result)=>{
				if(err) throw err;
				res.send({code:1,msg:result});
            }) 
        }else{
            var sql = `UPDATE cart SET count=count+? WHERE nid=?`
            pool.query(sql,[count,nid],(err,result)=>{
                if(err) throw error;
                res.send({ code:1,smg:result });
            })
        }
    });
});
router.get("");
router.get("/addCart",(req,res)=>{
    var sql = "select * from cart";
    pool.query(sql,(err,result)=>{
        if(err) throw error;
        res.send({code:1,msg:result});
    })
});
module.exports = router;
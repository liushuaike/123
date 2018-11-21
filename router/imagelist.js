const express = require("express");
const router  = express.Router();
const pool = require("../pool");
router.get("/list",(req,res)=>{ //request 请求  
    var sql = `SELECT uid,logo_img FROM logo_url`;
    pool.query(sql,(err,result)=>{
        if(err)
            //判断查询结果是否完成错误,出错抛出
            throw err;
            //将查询结果返回客户端
            //返回数据 1:正确 -1:失败 告诉客户端成功还是失败
            res.send({code:1,msg:result});  
			//console.log(result);
    })
});


router.get("/banner_list",(req,res)=>{
		var sql = `SELECT id,banner_img FROM banner_url`;
		pool.query(sql,(err,result)=>{
			if(err) throw error;
			res.send({ code:1,msg:result });
		})
});


router.get("/recommend_list",(req,res)=>{
	var sql = `SELECT id,recommend_img FROM recommend`;
	pool.query(sql,(err,result)=>{
		if(err) throw error;
		res.send({ code:1,msg:result });
	})
});


router.get("/outline_list",(req,res)=>{
	var sql = `SELECT id,outline_img FROM outline`;
	pool.query(sql,(err,result)=>{
		if(err) throw error;
		res.send({ code:1,msg:result });
	})
});


router.get("/sort_list",(req,res)=>{
	var sql = `SELECT id,sort_img,title FROM sort`;
	pool.query(sql,(err,result)=>{
		if(err) throw error;
		res.send({ code:1,msg:result });
	});
});

router.get("/sort_title",(req,res)=>{
	var sql = `SELECT id,title FROM sort_title`;
	pool.query(sql,(err,result)=>{
		if(err) throw error;
		res.send({ code:1,msg:result });
	});
});



router.get("/sort_colthing",(req,res)=>{
	var nid = req.query.nid;
	var pno = req.query.pno;
	if(!pno){
		pno = 1;
	}
	var reg = /^[0-9]{1,}$/i;
	if(!reg.test(nid)){
		res.send("查询编号错误");
	}
	if(!reg.test(pno)){
		res.send("查询页码有误");
	} 

	var sql = "SELECT id,sort_img,sort_name,num,img_a,img_b,img_c,price_a,price_b,price_c,text_a,text_b,text_c FROM sort_colthing WHERE nid=? LIMIT ?,?";
	nid = parseInt(nid);
	pagesize = 3;
	offset = parseInt((pno-1)*pagesize);
	pool.query(sql,[nid,offset,pagesize],(err,result)=>{
		if(err) throw err;
		res.send({ code:1,msg:result });
	});
});
router.get("/nextlist",(req,res)=>{
	var sql = "SELECT id,img,title,newprice,integral,oldprice,sale FROM nextPage";
	pool.query(sql,(err,result)=>{
		if(err) throw error;
		res.send({code:1,msg:result});
	})
})
router.get("/nextlist_details",(req,res)=>{
	var id = req.query.id;
	var sql = "SELECT id,img,title,newprice,integral,oldprice,sale,nid FROM nextPage where id=?";
	pool.query(sql,[id],(err,result)=>{
		if(err) throw error;
		res.send({code:1,msg:result});
	})
})
router.get("/nextlist_a",(req,res)=>{
	var sql = "SELECT id,img,title,newprice,integral,oldprice,sale FROM nextPage_taozhuang";
	pool.query(sql,(err,result)=>{
		if(err) throw error;
		res.send({code:1,msg:result});
	})
})
router.get("/nextlist_a_details",(req,res)=>{
	var id = req.query.id;
	var sql = "SELECT id,img,title,newprice,integral,oldprice,sale,nid FROM nextPage_taozhuang where id=?";
	pool.query(sql,[id],(err,result)=>{
		if(err) throw error;
		res.send({code:1,msg:result});
	})
})
router.get("/nextlist_b",(req,res)=>{
	var sql = "SELECT id,img,title,newprice,integral,oldprice,sale FROM nextPage_shangzhuang";
	pool.query(sql,(err,result)=>{
		if(err) throw error;
		res.send({code:1,msg:result});
	})
})
router.get("/nextlist_b_details",(req,res)=>{
	var id = req.query.id;
	var sql = "SELECT id,img,title,newprice,integral,oldprice,sale FROM nextPage_shangzhuang where id=?";
	pool.query(sql,[id],(err,result)=>{
		if(err) throw error;
		res.send({code:1,msg:result});
	})
})
router.get("/nextlist_c",(req,res)=>{
	var sql = "SELECT id,img,title,newprice,integral,oldprice,sale FROM nextPage_xiazhuang";
	pool.query(sql,(err,result)=>{
		if(err) throw error;
		res.send({code:1,msg:result});
	})
})
router.get("/nextlist_c_details",(req,res)=>{
	var id = req.query.id;
	var sql = "SELECT id,img,title,newprice,integral,oldprice,sale FROM nextPage_xiazhuang where id=?";
	pool.query(sql,[id],(err,result)=>{
		if(err) throw error;
		res.send({code:1,msg:result});
	})
})
// router.get("/nextPageList",(req,res)=>{
// 	var nid = req.query.nid;
// 	var sql = "SELECT * FROM (select * from nextPage union all SELECT * FROM nextPage_taozhuang union all select * from nextPage_shangzhuang union all select * from nextPage_xiazhuang) as a where nid=?";
// 	pool.query(sql,[nid],(err,result)=>{
// 		if(err) throw error
// 		res.send({code:1,msg:result});
// 	})
// })
router.get("/nextbanner",(req,res)=>{
	var sql = "SELECT id,img FROM nextbanner";
	pool.query(sql,(err,result)=>{
		if(err) throw error;
		res.send({code:1,msg:result});
	})
})

module.exports = router;


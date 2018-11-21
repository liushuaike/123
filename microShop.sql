SET NAMES UTF8;
DROP DATABASE IF EXISTS web1805;
CREATE DATABASE web1805 CHARSET=UTF8;
USE web1805;
CREATE TABLE logo_url(
    uid INT PRIMARY KEY AUTO_INCREMENT,
    logo_img VARCHAR(255)
);
INSERT INTO logo_url VALUES(null,"http://127.0.0.1:3000/img/logo/1.jpg");

CREATE TABLE banner_url(
    id INT PRIMARY KEY AUTO_INCREMENT,
    banner_img VARCHAR(255)
);
INSERT INTO banner_url VALUES(null,"http://127.0.0.1:3000/img/banner/banner1.jpg");
INSERT INTO banner_url VALUES(null,"http://127.0.0.1:3000/img/banner/banner2.png");
INSERT INTO banner_url VALUES(null,"http://127.0.0.1:3000/img/banner/banner3.jpg");
INSERT INTO banner_url VALUES(null,"http://127.0.0.1:3000/img/banner/banner4.jpg");
INSERT INTO banner_url VALUES(null,"http://127.0.0.1:3000/img/banner/banner5.jpg");
INSERT INTO banner_url VALUES(null,"http://127.0.0.1:3000/img/banner/banner6.jpg");
CREATE TABLE recommend(
	id INT PRIMARY KEY AUTO_INCREMENT,
	recommend_img VARCHAR(255)
);
INSERT INTO recommend VALUES(null,"http://127.0.0.1:3000/img/recommend/1.jpg");
INSERT INTO recommend VALUES(null,"http://127.0.0.1:3000/img/recommend/2.jpg");
INSERT INTO recommend VALUES(null,"http://127.0.0.1:3000/img/recommend/3.jpg");

CREATE TABLE outline(
	id INT PRIMARY KEY AUTO_INCREMENT,
	outline_img VARCHAR(255)
);
INSERT INTO outline VALUES(null,"http://127.0.0.1:3000/img/outline/1.jpg");
INSERT INTO outline VALUES(null,"http://127.0.0.1:3000/img/outline/2.jpg");
INSERT INTO outline VALUES(null,"http://127.0.0.1:3000/img/outline/3.jpg");

CREATE TABLE sort(
	id INT PRIMARY KEY AUTO_INCREMENT,
	sort_img VARCHAR(255),
	title VARCHAR(255)
);
INSERT INTO sort VALUES(null,"http://127.0.0.1:3000/img/sort/1.jpg","私厨");
INSERT INTO sort VALUES(null,"http://127.0.0.1:3000/img/sort/2.jpg","全球购");
INSERT INTO sort VALUES(null,"http://127.0.0.1:3000/img/sort/1.jpg","手艺人");
INSERT INTO sort VALUES(null,"http://127.0.0.1:3000/img/sort/2.jpg","助农扶贫");

CREATE TABLE sort_title(
	id INT PRIMARY KEY AUTO_INCREMENT,
	title VARCHAR(255)
);
INSERT INTO sort_title VALUES(null,"咖啡师");
INSERT INTO sort_title VALUES(null,"花器与花");
INSERT INTO sort_title VALUES(null,"手账胶带");
INSERT INTO sort_title VALUES(null,"集邮");
INSERT INTO sort_title VALUES(null,"现摘鲜果");
INSERT INTO sort_title VALUES(null,"买手私藏");
INSERT INTO sort_title VALUES(null,"手作烘焙");
INSERT INTO sort_title VALUES(null,"二次元");
INSERT INTO sort_title VALUES(null,"美妆");
INSERT INTO sort_title VALUES(null,"艺术馆藏");
INSERT INTO sort_title VALUES(null,"茶道");
INSERT INTO sort_title VALUES(null,"包包");
INSERT INTO sort_title VALUES(null,"首饰");
INSERT INTO sort_title VALUES(null,"追星剧场");
INSERT INTO sort_title VALUES(null,"母婴好物");

CREATE TABLE sort_colthing(
	id INT PRIMARY KEY AUTO_INCREMENT,
	sort_img VARCHAR(255),
	sort_name VARCHAR(25),
	num INT,
	img_a VARCHAR(255),
	img_b VARCHAR(255),
	img_c VARCHAR(255),
	price_a VARCHAR(255),
	price_b VARCHAR(255),
	price_c VARCHAR(255),
	text_a VARCHAR(255),
	text_b VARCHAR(255),
	text_c VARCHAR(255),
	nid VARCHAR(255)
);
INSERT INTO sort_colthing VALUES(null,"http://127.0.0.1:3000/img/sortLogo/1.jpg","衣品行",196,"http://127.0.0.1:3000/img/sortcolthing/1.jpg","http://127.0.0.1:3000/img/sortcolthing/2.jpg","http://127.0.0.1:3000/img/sortcolthing/3.jpg",89,116,128,"爆款服饰","女神精选","服饰配件",1);

INSERT INTO sort_colthing VALUES(null,"http://127.0.0.1:3000/img/sortLogo/2.jpg","BYSOUL",1205,"http://127.0.0.1:3000/img/sortcolthing/4.jpg","http://127.0.0.1:3000/img/sortcolthing/5.jpg","http://127.0.0.1:3000/img/sortcolthing/6.jpg",320,180,216,"推荐","极简","少女气息",1);

INSERT INTO sort_colthing VALUES(null,"http://127.0.0.1:3000/img/sortLogo/3.jpg","JH.ZANE",3625,"http://127.0.0.1:3000/img/sortcolthing/7.jpg","http://127.0.0.1:3000/img/sortcolthing/8.jpg","http://127.0.0.1:3000/img/sortcolthing/9.jpg",3600,1101,999,"衣品高","很有个性","不得不入",1);


INSERT INTO sort_colthing VALUES(null,"http://127.0.0.1:3000/img/sortLogo/4.jpg","Design",4200,"http://127.0.0.1:3000/img/jiaju/1.jpg","http://127.0.0.1:3000/img/jiaju/2.jpg","http://127.0.0.1:3000/img/jiaju/3.jpg",6800,7200,4900,"居家","很有个性","创意家居",1);

INSERT INTO sort_colthing VALUES(null,"http://127.0.0.1:3000/img/sortLogo/1.jpg","Face",2650,"http://127.0.0.1:3000/img/manface/1.jpg","http://127.0.0.1:3000/img/manface/2.jpg","http://127.0.0.1:3000/img/manface/3.jpg",99,108,69,"护肤","清爽","冬日特惠",1);

INSERT INTO sort_colthing VALUES(null,"http://127.0.0.1:3000/img/sortLogo/2.jpg","潮流密码",3050,"http://127.0.0.1:3000/img/mancolthing/1.jpg","http://127.0.0.1:3000/img/mancolthing/2.jpg","http://127.0.0.1:3000/img/mancolthing/3.jpg",399,268,756,"潮男穿搭","男装","品质男装",1);

INSERT INTO sort_colthing VALUES(null,"http://127.0.0.1:3000/img/sortLogo/1.jpg","iumi",5306,"http://127.0.0.1:3000/img/sortcolthing/10.jpg","http://127.0.0.1:3000/img/sortcolthing/11.jpg","http://127.0.0.1:3000/img/sortcolthing/12.jpg",420,798,216,"极简","个性","女装",1);

INSERT INTO sort_colthing VALUES(null,"http://127.0.0.1:3000/img/sortLogo/2.jpg","Daisy",7306,"http://127.0.0.1:3000/img/sortcolthing/13.jpg","http://127.0.0.1:3000/img/sortcolthing/14.jpg","http://127.0.0.1:3000/img/sortcolthing/15.jpg",226,855,168,"文青","个性","精致女孩",1);

INSERT INTO sort_colthing VALUES(null,"http://127.0.0.1:3000/img/sortLogo/1.jpg","IrisDong",11996,"http://127.0.0.1:3000/img/outline/1.jpg","http://127.0.0.1:3000/img/outline/2.jpg","http://127.0.0.1:3000/img/outline/3.jpg",199,99,168,"精致","简约","浪漫",1);

CREATE TABLE login_banner(
	id INT PRIMARY KEY AUTO_INCREMENT,
	img VARCHAR(255)
);
INSERT INTO login_banner VALUES(null,"http://127.0.0.1:3000/img/loginbanner/3.jpg");
INSERT INTO login_banner VALUES(null,"http://127.0.0.1:3000/img/loginbanner/4.jpg");

CREATE TABLE nextPage(
	id INT PRIMARY KEY AUTO_INCREMENT,
	img VARCHAR(255),
	title VARCHAR(255),
	newprice VARCHAR(10),
	integral VARCHAR(10),
	oldprice VARCHAR(255),
	sale VARCHAR(10),
	nid VARCHAR(255)
);
INSERT INTO nextPage VALUES(null,"http://127.0.0.1:3000/img/dress/1.jpg","印花雪纺衫秋季长袖连衣裙中长款韩版系带收腰","￥98.00","积分专享","￥126.00","销量1200",1);
INSERT INTO nextPage VALUES(null,"http://127.0.0.1:3000/img/dress/2.jpg","夏季新品女装V领纯色绣花荷叶袖a字裙","￥148.00","积分专享","￥168.00","销量3600",2);
INSERT INTO nextPage VALUES(null,"http://127.0.0.1:3000/img/dress/3.jpg","2018夏季新款女装V领五分袖a字裙","￥148.00","积分专享","￥168.00","销量2800",3);
INSERT INTO nextPage VALUES(null,"http://127.0.0.1:3000/img/dress/4.jpg","印花雪纺衫秋季长袖连衣裙中长款韩版系带收腰","￥146.00","积分专享","￥206.00","销量2100",4);
CREATE TABLE nextPage_taozhuang(
	id INT PRIMARY KEY AUTO_INCREMENT,
	img VARCHAR(255),
	title VARCHAR(255),
	newprice VARCHAR(10),
	integral VARCHAR(10),
	oldprice VARCHAR(255),
	sale VARCHAR(10),
	nid VARCHAR(255)
);
INSERT INTO nextPage_taozhuang VALUES(null,"http://127.0.0.1:3000/img/suit/1.jpg","2018秋装新款长袖卫衣女长裙韩版chic","￥116.00","积分专享","￥138.00","销量1600",5);
INSERT INTO nextPage_taozhuang VALUES(null,"http://127.0.0.1:3000/img/suit/2.jpg","{8款可选}夏季时髦套装同款女神小心机","￥88.00","积分专享","￥108.00","销量1500",6);
CREATE TABLE nextPage_shangzhuang(
	id INT PRIMARY KEY AUTO_INCREMENT,
	img VARCHAR(255),
	title VARCHAR(255),
	newprice VARCHAR(10),
	integral VARCHAR(10),
	oldprice VARCHAR(255),
	sale VARCHAR(10),
	nid VARCHAR(255)
);
INSERT INTO nextPage_shangzhuang VALUES(null,"http://127.0.0.1:3000/img/shangzhuang/1.jpg","2018款秋冬新款韩版背心毛衣马甲宽松无袖","￥78.00","积分专享","￥108.00","销量1500",7);
INSERT INTO nextPage_shangzhuang VALUES(null,"http://127.0.0.1:3000/img/shangzhuang/2.jpg","外套c位风衣外套中长款秋冬新款收腰双排","￥215.00","积分专享","￥299.00","销量1500",8);
CREATE TABLE nextPage_xiazhuang(
	id INT PRIMARY KEY AUTO_INCREMENT,
	img VARCHAR(255),
	title VARCHAR(255),
	newprice VARCHAR(10),
	integral VARCHAR(10),
	oldprice VARCHAR(255),
	sale VARCHAR(10),
	nid VARCHAR(255)
);
INSERT INTO nextPage_xiazhuang VALUES(null,"http://127.0.0.1:3000/img/xiazhuang/1.jpg","2018款秋冬新款韩版复古温柔垂感阔腿裤女高腰","￥68.00","积分专享","￥98.00","销量1500",9);
INSERT INTO nextPage_xiazhuang VALUES(null,"http://127.0.0.1:3000/img/xiazhuang/2.jpg","2018款格纹a字高腰百褶裙秋冬短裙chic半身裙","￥126.00","积分专享","￥150.00","销量1800",10);
INSERT INTO nextPage_xiazhuang VALUES(null,"http://127.0.0.1:3000/img/xiazhuang/3.jpg","2018款牛仔裤女韩版长裤宽松阔腿裤N191D","￥110.00","积分专享","￥168.00","销量3100",11);
INSERT INTO nextPage_xiazhuang VALUES(null,"http://127.0.0.1:3000/img/xiazhuang/4.jpg","2018款秋冬新款韩版复古温柔垂感阔腿裤女高腰","￥127.00","积分专享","￥149.00","销量1600",12);
CREATE TABLE nextbanner(
	id INT PRIMARY KEY AUTO_INCREMENT,
	img VARCHAR(255)
);
INSERT INTO nextbanner VALUES(NULL,"http://127.0.0.1:3000/img/nextbanner/1.jpg");
INSERT INTO nextbanner VALUES(NULL,"http://127.0.0.1:3000/img/nextbanner/2.jpg");
INSERT INTO nextbanner VALUES(NULL,"http://127.0.0.1:3000/img/nextbanner/3.jpg");
INSERT INTO nextbanner VALUES(NULL,"http://127.0.0.1:3000/img/nextbanner/4.jpg");

CREATE TABLE comment(
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_name VARCHAR(25), 
    add_time  DATETIME,
    content   VARCHAR(255),
    nid INT
);
INSERT INTO comment VALUES(null,'凯凯晨',now(),'衣服质量还不错，穿着挺好看，正式，我主要是为了面试更好通过。挺显瘦的，是我喜欢的款式设计',1);
INSERT INTO comment VALUES(null,'一路有你',now(),'布料舒服，版型设计非常好看，显瘦。很大气的感觉的。超优惠，很值得购买',1);
INSERT INTO comment VALUES(null,'寒冬',now(),'宝贝收到了，质量非常好，和店家描述的一模一样，满意',1);
INSERT INTO comment VALUES(null,'神奇女侠',now(),'衣服面料超好，尺码也准确，特喜欢，客服服务到位，下次还来光临',1);
INSERT INTO comment VALUES(null,'波塞冬',now(),'衣服收到了，质量很好，物流快，效果好看，有气质，值得购买！',1);
INSERT INTO comment VALUES(null,'阿拉丁',now(),'宝贝收到了，质量非常好，和店家描述的一模一样，满意',1);
INSERT INTO comment VALUES(null,'蜘蛛侠',now(),'宝贝收到了，质量非常好，和店家描述的一模一样，满意',1);
INSERT INTO comment VALUES(null,'寒冬',now(),'衣服面料超好，尺码也准确，特喜欢，客服服务到位，下次还来光临',1);
INSERT INTO comment VALUES(null,'神奇女侠',now(),'衣服质量好，上身效果好看，物流发货速度快，店家服务态度好，包装完好无损，值得购买！',1);
INSERT INTO comment VALUES(null,'阿拉丁',now(),'衣服质量还不错，穿着挺好看，正式，我主要是为了面试更好通过。挺显瘦的，是我喜欢的款式设计。',1);
INSERT INTO comment VALUES(null,'寒冬',now(),'衣服质量还不错，穿着挺好看，正式，我主要是为了面试更好通过。挺显瘦的，是我喜欢的款式设计。',1);
INSERT INTO comment VALUES(null,'一路有你',now(),'宝贝收到了，质量非常好，和店家描述的一模一样，满意',1);
INSERT INTO comment VALUES(null,'神奇女侠',now(),'衣服收到了，质量很好，物流快，效果好看，有气质，值得购买！',1);
CREATE TABLE login_interface(
	id INT PRIMARY KEY AUTO_INCREMENT,
	uname VARCHAR(255),
	upwd VARCHAR(255)
);
INSERT INTO login_interface VALUES(null,15100003937,00000000000); 

CREATE TABLE cart(
	id INT PRIMARY KEY AUTO_INCREMENT,
	img VARCHAR(255),
	title VARCHAR(255),
	newprice VARCHAR(10),
	count VARCHAR(5),
	nid VARCHAR(255)
);
CREATE TABLE newlist(
	id INT PRIMARY KEY AUTO_INCREMENT,
	img VARCHAR(255),
	title VARCHAR(255),
	ret VARCHAR(255)
);
INSERT INTO newlist VALUES(null,"http://127.0.0.1:3000/img/sortLogo/1.jpg","为您解忧","回头率5%");
INSERT INTO newlist VALUES(null,"http://127.0.0.1:3000/img/sortLogo/2.jpg","老板是魔术师","回头率15%");
INSERT INTO newlist VALUES(null,"http://127.0.0.1:3000/img/sortLogo/3.jpg","嘘嘘","回头率20%");
INSERT INTO newlist VALUES(null,"http://127.0.0.1:3000/img/sortLogo/4.jpg","男士鞋柜","回头率12%");
#primary key auto_increment

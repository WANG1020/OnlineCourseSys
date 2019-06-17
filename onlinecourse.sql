/*
SQLyog Ultimate v11.24 (32 bit)
MySQL - 5.6.25-log : Database - onlinecourse
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`onlinecourse` /*!40100 DEFAULT CHARACTER SET utf8 */;

/*Table structure for table `admin` */

CREATE TABLE `admin` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL DEFAULT '123456',
  `email` varchar(20) DEFAULT NULL,
  `headpor` varchar(40) DEFAULT NULL,
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `admin` */

insert  into `admin`(`id`,`name`,`password`,`email`,`headpor`) values (1,'ad1','123456','1647088054@qq.com','img/face/f1.png');
insert  into `admin`(`id`,`name`,`password`,`email`,`headpor`) values (2,'ad2','123456','1647088054@qq.com','img/face/f1.png');

/*Table structure for table `course` */

CREATE TABLE `course` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `intro` varchar(100) DEFAULT NULL,
  `Deintro` varchar(200) DEFAULT NULL,
  `teacher` varchar(30) DEFAULT NULL,
  `img` varchar(20) DEFAULT NULL,
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

/*Data for the table `course` */

insert  into `course`(`id`,`name`,`intro`,`Deintro`,`teacher`,`img`) values (1,'C语言入门','C语言入门视频教程，带你进入编程世界的必修课-C语言','简介：本C语言教程从以下几个模块来贯穿主要知识点：初始C程序、数据类型、运算符、语句结构、函数和数组。每个阶段都配有练习题同时提供在线编程任务。希望通过本教程帮助C语言入门学习者迅速掌握程序逻辑并开始C语言编程。',' milanlover','../images/c.jpg');
insert  into `course`(`id`,`name`,`intro`,`Deintro`,`teacher`,`img`) values (4,'玩转算法和数据结构','ACM获奖者亲授算法面试基础，C++讲解，配套完整Java代码，培养算法思维，修炼编程内功','任何时候学习算法都不晚，而且越早越好，这么多年，你听说过技术过时，什么时候听说过算法过时，不仅没有过时，因为机器学习、大数据的要求，算法变得越来越重要了',' liuyubobobo','../images/sf.jpg');
insert  into `course`(`id`,`name`,`intro`,`Deintro`,`teacher`,`img`) values (5,'Python数据预处理','（一）一抽取多源数据文本信息','简介：本课程由数据预处理整个流程到综合实战。包括：Anaconda、Sublime、Pywin32、数据采集、数据集成、缺失值处理、正则、jieba分词、NLTK、词袋模型、数据抽样、特征词抽取、文本向量化、gensim、数据降维、numpy、sicpy、pandas、matplotlib、seabom、Xgboost等核心技术。','伏草惟存','../images/python.jpg');
insert  into `course`(`id`,`name`,`intro`,`Deintro`,`teacher`,`img`) values (6,'C远征之起航篇','C++亮点尽在其中，本课程是在C语言基础上的一个延伸，得以升华','简介：本教程是C++的初级教程，是在C语言基础上的一个延伸，讲述了包括新增数据类型、命名空间等内容，最后通过一个通俗易懂的例子将所述知识点融会贯通，以达到知识灵活运用，最终得以升华的目的。',' james_yuan','../images/c++.jpg');
insert  into `course`(`id`,`name`,`intro`,`Deintro`,`teacher`,`img`) values (7,'自然语言处理（NLP）','入门与实践','简介：随着人工智能的快速发展，自然语言处理应用愈加广泛。本课首先对其发展历程、现状、技术体系、开发环境等概述。然后从数据准备、可视化、KNN算法模型、实际应用、sklearn算法改进等方面进行实战，旨在帮助大家轻松入门。','伏草惟存','../images/nlp.jpg');
insert  into `course`(`id`,`name`,`intro`,`Deintro`,`teacher`,`img`) values (28,'线代','线代线代','线代线代线代','tea1','../images/tx.jpg');
insert  into `course`(`id`,`name`,`intro`,`Deintro`,`teacher`,`img`) values (29,'高数','高数基础','高数入门，基础课程','tea2','../images/tx.jpg');
insert  into `course`(`id`,`name`,`intro`,`Deintro`,`teacher`,`img`) values (30,'帖食堂试图色图','帖食堂试图色图','帖食堂试图色图','tea1','../images/python.jpg');

/*Table structure for table `coursedir` */

CREATE TABLE `coursedir` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_name` varchar(30) DEFAULT NULL,
  `chapter_id` varchar(30) DEFAULT NULL,
  `chapter_name` varchar(30) DEFAULT NULL,
  `classHour_id` varchar(30) DEFAULT NULL,
  `classHour_name` varchar(30) DEFAULT NULL,
  `resources` varchar(30) DEFAULT NULL,
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;

/*Data for the table `coursedir` */

insert  into `coursedir`(`id`,`course_name`,`chapter_id`,`chapter_name`,`classHour_id`,`classHour_name`,`resources`) values (1,'C语言入门','1','初始C程序','1-1','初始C语言','../videos/v1.mp4');
insert  into `coursedir`(`id`,`course_name`,`chapter_id`,`chapter_name`,`classHour_id`,`classHour_name`,`resources`) values (2,'C语言入门','1','初始C程序','1-2','C程序结构','../videos/v2.mp4');
insert  into `coursedir`(`id`,`course_name`,`chapter_id`,`chapter_name`,`classHour_id`,`classHour_name`,`resources`) values (3,'C语言入门','1','初始C程序','1-3','练习题','../images/task/work1.jpg');
insert  into `coursedir`(`id`,`course_name`,`chapter_id`,`chapter_name`,`classHour_id`,`classHour_name`,`resources`) values (4,'C语言入门','1','初始C程序','1-4','必不可少的主函数','../videos/v1.mp4');
insert  into `coursedir`(`id`,`course_name`,`chapter_id`,`chapter_name`,`classHour_id`,`classHour_name`,`resources`) values (6,'C语言入门','2','C中数据类型','2-1','有名有姓的C','../videos/v1.mp4');
insert  into `coursedir`(`id`,`course_name`,`chapter_id`,`chapter_name`,`classHour_id`,`classHour_name`,`resources`) values (7,'C语言入门','2','C中数据类型','2-2','练习题','../images/task/work1.jpg');
insert  into `coursedir`(`id`,`course_name`,`chapter_id`,`chapter_name`,`classHour_id`,`classHour_name`,`resources`) values (8,'C语言入门','2','C中数据类型','2-3','变量及赋值','../videos/v2.mp4');
insert  into `coursedir`(`id`,`course_name`,`chapter_id`,`chapter_name`,`classHour_id`,`classHour_name`,`resources`) values (9,'C语言入门','2','C中数据类型','2-4','基本数据类型','../videos/v1.mp4');
insert  into `coursedir`(`id`,`course_name`,`chapter_id`,`chapter_name`,`classHour_id`,`classHour_name`,`resources`) values (10,'C语言入门','3','C中的运算符','3-1','运算符合是啥','../videos/v2.mp4');
insert  into `coursedir`(`id`,`course_name`,`chapter_id`,`chapter_name`,`classHour_id`,`classHour_name`,`resources`) values (11,'C语言入门','3','C中的运算符','3-2','算术运算符','../videos/v1.mp4');
insert  into `coursedir`(`id`,`course_name`,`chapter_id`,`chapter_name`,`classHour_id`,`classHour_name`,`resources`) values (12,'C语言入门','3','C中的运算符','3-3','自增与自减运算符','../videos/v2.mp4');
insert  into `coursedir`(`id`,`course_name`,`chapter_id`,`chapter_name`,`classHour_id`,`classHour_name`,`resources`) values (13,'Python数据预处理','1','课程介绍','1-1','什么是数据预处理','../videos/v2.mp4');
insert  into `coursedir`(`id`,`course_name`,`chapter_id`,`chapter_name`,`classHour_id`,`classHour_name`,`resources`) values (14,'Python数据预处理','1','课程介绍','1-2','预处理流程','../videos/v1.mp4');
insert  into `coursedir`(`id`,`course_name`,`chapter_id`,`chapter_name`,`classHour_id`,`classHour_name`,`resources`) values (15,'Python数据预处理','1','课程介绍','1-3','为什么做这门课程','../videos/v2.mp4');
insert  into `coursedir`(`id`,`course_name`,`chapter_id`,`chapter_name`,`classHour_id`,`classHour_name`,`resources`) values (16,'Python数据预处理','1','课程介绍','1-4','可以学习到什么东西','../videos/v2.mp4');
insert  into `coursedir`(`id`,`course_name`,`chapter_id`,`chapter_name`,`classHour_id`,`classHour_name`,`resources`) values (17,'Python数据预处理','2','抽取文本信息','2-1','数据类型与数据采集','../videos/v2.mp4');
insert  into `coursedir`(`id`,`course_name`,`chapter_id`,`chapter_name`,`classHour_id`,`classHour_name`,`resources`) values (18,'Python数据预处理','2','抽取文本信息','2-2','文本抽取问题','../videos/v2.mp4');
insert  into `coursedir`(`id`,`course_name`,`chapter_id`,`chapter_name`,`classHour_id`,`classHour_name`,`resources`) values (19,'C++远征之起航篇','1','C++简介','1-1','C+++简介','../videos/v2.mp4');
insert  into `coursedir`(`id`,`course_name`,`chapter_id`,`chapter_name`,`classHour_id`,`classHour_name`,`resources`) values (20,'C++远征之起航篇','1','C++简介','1-2','练习题','../images/task/work1.jpg');
insert  into `coursedir`(`id`,`course_name`,`chapter_id`,`chapter_name`,`classHour_id`,`classHour_name`,`resources`) values (45,'线代','1',' C++简介	','1-1','C+++输入，输出流','../videos/v2.mp4');
insert  into `coursedir`(`id`,`course_name`,`chapter_id`,`chapter_name`,`classHour_id`,`classHour_name`,`resources`) values (46,'线代','2','C++入门','2-1','C+++输入，输出流','../videos/v2.mp4');
insert  into `coursedir`(`id`,`course_name`,`chapter_id`,`chapter_name`,`classHour_id`,`classHour_name`,`resources`) values (47,'高数','1',' C++简介	','1-1','C+++输入，输出流','../videos/v2.mp4');

/*Table structure for table `electivecourse` */

CREATE TABLE `electivecourse` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL DEFAULT '123456',
  `email` varchar(20) DEFAULT NULL,
  `headpor` varchar(40) DEFAULT NULL,
  `class_name` varchar(20) DEFAULT NULL,
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

/*Data for the table `electivecourse` */

insert  into `electivecourse`(`id`,`name`,`password`,`email`,`headpor`,`class_name`) values (1,'stu1','123456','1647088054@qq.com','../images/faces/f1.png','C语言入门');
insert  into `electivecourse`(`id`,`name`,`password`,`email`,`headpor`,`class_name`) values (2,'stu2','123456','1647088054@qq.com','../images/faces/f2.png','玩转算法和数据结构');
insert  into `electivecourse`(`id`,`name`,`password`,`email`,`headpor`,`class_name`) values (3,'stu1','123456','1647088054@qq.com','../images/faces/f1.png','玩转算法和数据结构');
insert  into `electivecourse`(`id`,`name`,`password`,`email`,`headpor`,`class_name`) values (4,'stu1','123456','1647088054@qq.com','../images/faces/f1.png','自然语言处理（NLP）');
insert  into `electivecourse`(`id`,`name`,`password`,`email`,`headpor`,`class_name`) values (5,'tea1','123456','1647088054@qq.com','../images/faces/f1.png','C语言入门');
insert  into `electivecourse`(`id`,`name`,`password`,`email`,`headpor`,`class_name`) values (6,'tea1','123456','1647088054@qq.com','../images/faces/f1.png','Python数据预处理');
insert  into `electivecourse`(`id`,`name`,`password`,`email`,`headpor`,`class_name`) values (7,'tea1','123456','1647088054@qq.com','../images/faces/f1.png','自然语言处理（NLP）');
insert  into `electivecourse`(`id`,`name`,`password`,`email`,`headpor`,`class_name`) values (8,'tea2','123456',NULL,NULL,'C语言入门');
insert  into `electivecourse`(`id`,`name`,`password`,`email`,`headpor`,`class_name`) values (12,'tea1','123456',NULL,NULL,'玩转算法和数据结构');
insert  into `electivecourse`(`id`,`name`,`password`,`email`,`headpor`,`class_name`) values (17,'tea1','123456',NULL,NULL,'线代');
insert  into `electivecourse`(`id`,`name`,`password`,`email`,`headpor`,`class_name`) values (18,'tea1','123456',NULL,NULL,'C远征之起航篇');
insert  into `electivecourse`(`id`,`name`,`password`,`email`,`headpor`,`class_name`) values (19,'stu2','123456',NULL,NULL,'C语言入门');
insert  into `electivecourse`(`id`,`name`,`password`,`email`,`headpor`,`class_name`) values (20,'tea2','123456',NULL,NULL,'高数');
insert  into `electivecourse`(`id`,`name`,`password`,`email`,`headpor`,`class_name`) values (21,'stu1','123456',NULL,NULL,'线代');
insert  into `electivecourse`(`id`,`name`,`password`,`email`,`headpor`,`class_name`) values (22,'tea1','123456',NULL,NULL,'帖食堂试图色图');

/*Table structure for table `note` */

CREATE TABLE `note` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `course_name` varchar(30) DEFAULT NULL,
  `classHour_name` varchar(20) DEFAULT NULL,
  `title` varchar(20) DEFAULT NULL,
  `author` varchar(20) DEFAULT NULL,
  `content` varchar(60) DEFAULT NULL,
  `flag` varchar(20) DEFAULT NULL,
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

/*Data for the table `note` */

insert  into `note`(`id`,`course_name`,`classHour_name`,`title`,`author`,`content`,`flag`) values (1,'C语言入门','1-1 初始C语言','C输入流','stu1',NULL,'0');
insert  into `note`(`id`,`course_name`,`classHour_name`,`title`,`author`,`content`,`flag`) values (2,'C语言入门','1-1 初始C语言','C语言的开发软件有哪些？','stu2',NULL,'0');
insert  into `note`(`id`,`course_name`,`classHour_name`,`title`,`author`,`content`,`flag`) values (3,'C语言入门','1-1 初始C语言','C输入流','stu2','scanf','1');
insert  into `note`(`id`,`course_name`,`classHour_name`,`title`,`author`,`content`,`flag`) values (4,'C语言入门','1-1 初始C语言','C输入流','stu1','是是是，xue的对','1');
insert  into `note`(`id`,`course_name`,`classHour_name`,`title`,`author`,`content`,`flag`) values (5,'C语言入门','1-1 初始C语言','C输出流','stu2','fprintf()和printf()的区别','0');
insert  into `note`(`id`,`course_name`,`classHour_name`,`title`,`author`,`content`,`flag`) values (6,'C语言入门','1-2 C程序结构','C语言的基本结构','stu3','main(){}和函数体','0');
insert  into `note`(`id`,`course_name`,`classHour_name`,`title`,`author`,`content`,`flag`) values (8,'C语言入门','1-1 初始C语言','本课程讲了什么？','stu1','111','0');
insert  into `note`(`id`,`course_name`,`classHour_name`,`title`,`author`,`content`,`flag`) values (9,'C语言入门','C语言入门','本课程讲了什么？','stu1','123','0');
insert  into `note`(`id`,`course_name`,`classHour_name`,`title`,`author`,`content`,`flag`) values (10,'C语言入门','C语言入门','aree','stu1','12312','0');
insert  into `note`(`id`,`course_name`,`classHour_name`,`title`,`author`,`content`,`flag`) values (11,'C语言入门','C语言入门','本课程讲了什么？123','stu1','123','0');
insert  into `note`(`id`,`course_name`,`classHour_name`,`title`,`author`,`content`,`flag`) values (12,'C语言入门','C语言入门','test1','stu1','test1','0');
insert  into `note`(`id`,`course_name`,`classHour_name`,`title`,`author`,`content`,`flag`) values (13,'C语言入门','C语言入门','test1','stu1','test1','0');
insert  into `note`(`id`,`course_name`,`classHour_name`,`title`,`author`,`content`,`flag`) values (16,'C语言入门','C语言入门','本课程讲了什么？123','stu1','123','0');
insert  into `note`(`id`,`course_name`,`classHour_name`,`title`,`author`,`content`,`flag`) values (20,'C语言入门','C语言入门','test1`1123','stu1','123','0');
insert  into `note`(`id`,`course_name`,`classHour_name`,`title`,`author`,`content`,`flag`) values (21,'C语言入门','C语言入门','本课程讲了什么？123','stu1','das','0');
insert  into `note`(`id`,`course_name`,`classHour_name`,`title`,`author`,`content`,`flag`) values (22,'线代','线代','本课程讲是什么程度的人学习的？','tea1','线代入门吗？','0');
insert  into `note`(`id`,`course_name`,`classHour_name`,`title`,`author`,`content`,`flag`) values (24,'Python数据预处理','Python数据预处理','这门课适合新手吗？','stu1','','0');
insert  into `note`(`id`,`course_name`,`classHour_name`,`title`,`author`,`content`,`flag`) values (25,'C语言入门',NULL,'提醒！！!','tea2','童靴，你的进度落后了哦！','2');
insert  into `note`(`id`,`course_name`,`classHour_name`,`title`,`author`,`content`,`flag`) values (26,'C语言入门',NULL,'提醒！！','tea1','童靴，你的进度落后了哦2！','2');
insert  into `note`(`id`,`course_name`,`classHour_name`,`title`,`author`,`content`,`flag`) values (27,'玩转算法和数据结构',NULL,'注意！！！','tea3','童靴，你的进度落后了哦2！','2');

/*Table structure for table `teacher` */

CREATE TABLE `teacher` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL DEFAULT '123456',
  `email` varchar(20) DEFAULT NULL,
  `headpor` varchar(40) DEFAULT NULL,
  `class_name` varchar(20) DEFAULT NULL,
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `teacher` */

insert  into `teacher`(`id`,`name`,`password`,`email`,`headpor`,`class_name`) values (1,'tea1','123456','1647088054@qq.com','../images/faces/f2.png','jr1');
insert  into `teacher`(`id`,`name`,`password`,`email`,`headpor`,`class_name`) values (2,'tea2','123456','1647088054@qq.com','../images/faces/f7.png','jr2');
insert  into `teacher`(`id`,`name`,`password`,`email`,`headpor`,`class_name`) values (3,'tea1','123456',NULL,NULL,'线代');
insert  into `teacher`(`id`,`name`,`password`,`email`,`headpor`,`class_name`) values (4,'tea2','123456',NULL,NULL,'高数');
insert  into `teacher`(`id`,`name`,`password`,`email`,`headpor`,`class_name`) values (5,'tea1','123456',NULL,NULL,'帖食堂试图色图');

/*Table structure for table `user` */

CREATE TABLE `user` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL DEFAULT '123456',
  `email` varchar(20) DEFAULT NULL,
  `headpor` varchar(40) DEFAULT NULL,
  `flag` varchar(1) DEFAULT NULL,
  `active` varchar(20) DEFAULT NULL,
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`id`,`name`,`password`,`email`,`headpor`,`flag`,`active`) values (1,'stu1','1234','1647088054@qq.com','../images/faces/tx.jpg','0','1');
insert  into `user`(`id`,`name`,`password`,`email`,`headpor`,`flag`,`active`) values (2,'stu2','123456','1647088054@qq.com','../images/faces/f2.png','0','1');
insert  into `user`(`id`,`name`,`password`,`email`,`headpor`,`flag`,`active`) values (3,'tea1','123','1647088054@qq.com','../images/faces/tx.jpg','1','1');
insert  into `user`(`id`,`name`,`password`,`email`,`headpor`,`flag`,`active`) values (4,'tea2','123456','1647088054@qq.com','../images/faces/f7.png','1','1');
insert  into `user`(`id`,`name`,`password`,`email`,`headpor`,`flag`,`active`) values (5,'ad1','123456','1647088054@qq.com','../images/faces/f9.png','2','1');
insert  into `user`(`id`,`name`,`password`,`email`,`headpor`,`flag`,`active`) values (6,'ad2','123456','1647088054@qq.com','../images/faces/f6.png','2','1');
insert  into `user`(`id`,`name`,`password`,`email`,`headpor`,`flag`,`active`) values (7,'tea3','1234','1647088054@qq.com','../images/faces/f1.png','1','0');
insert  into `user`(`id`,`name`,`password`,`email`,`headpor`,`flag`,`active`) values (11,'stu4','1234','1647088054@qq.com','../images/faces/f4.png','0','0');
insert  into `user`(`id`,`name`,`password`,`email`,`headpor`,`flag`,`active`) values (12,'张三','1234','1647088054@qq.com','../images/faces/f6.png','0','0');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

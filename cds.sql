# Host: 127.0.0.1  (Version 5.7.11-log)
# Date: 2018-06-01 23:47:38
# Generator: MySQL-Front 6.0  (Build 2.20)


#
# Structure for table "user"
#

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `psw` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=10221174 DEFAULT CHARSET=utf8;

#
# Data for table "user"
#

INSERT INTO `user` VALUES (2,'cds','123456'),(3,'user02','123'),(4,'dcc','dcc'),(5,'laoda','laoda'),(6,'666','asdfa'),(10120006,'梁海','test'),(10210468,'徐帅','IT'),(10220715,'钟颖杰','IT'),(10221170,'陈迪生','IT'),(10221171,'丁春才','123'),(10221172,'杨康','1234'),(10221173,'郭靖','123465');

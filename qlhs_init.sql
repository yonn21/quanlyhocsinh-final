DROP SCHEMA IF EXISTS `quanlyhocsinh_6php`;
CREATE SCHEMA `quanlyhocsinh_6php`;
USE quanlyhocsinh_6php;


DROP TABLE IF EXISTS `user`;
DROP TABLE IF EXISTS `diem`;
DROP TABLE IF EXISTS `dayhoc`;
DROP TABLE IF EXISTS `thongke`;
DROP TABLE IF EXISTS `hocsinh`;
DROP TABLE IF EXISTS `lophoc`;
DROP TABLE IF EXISTS `giaovien`;
DROP TABLE IF EXISTS `monhoc`;
DROP TABLE IF EXISTS `namhoc`;
DROP TABLE IF EXISTS `hocky`;


CREATE TABLE `user` (
  `user_id` int(10) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `user_mail` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `user_pass` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `pass_forgot` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `user_level` int(2) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


CREATE TABLE `lophoc` (
  `MaLopHoc` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `Tenlophoc` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `KhoiHoc` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`MaLopHoc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


CREATE TABLE `hocsinh` (
  `MaHS` int(6) NOT NULL,
  `MaLopHoc` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `TenHS` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `GioiTinh` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `NgaySinh` date NOT NULL,
  `NoiSinh` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `DanToc` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `HoTenCha` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `HoTenMe` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`MaHS`),
  KEY `fk_hs_lh` (`MaLopHoc`),
  CONSTRAINT `fk_hs_lh` FOREIGN KEY (`MaLopHoc`) REFERENCES `lophoc` (`MaLopHoc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


CREATE TABLE `monhoc` (
  `MaMonHoc` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `TenMonHoc` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `SoTiet` int(20) NOT NULL,
  `HeSoMonHoc` int(1) NOT NULL,
  PRIMARY KEY (`MaMonHoc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


CREATE TABLE `giaovien` (
  `MaGV` int(6) NOT NULL,
  `MaMonHoc` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `TenGV` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `DiaChi` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `SDT` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `gv_mail` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `gv_pass` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`MaGV`),
  UNIQUE KEY `SDT` (`SDT`),
  KEY `fk_gv_mh` (`MaMonHoc`),
  CONSTRAINT `fk_gv_mh` FOREIGN KEY (`MaMonHoc`) REFERENCES `monhoc` (`MaMonHoc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


CREATE TABLE `hocky` (
  `MaHocKy` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `TenHocKy` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `HeSoHK` int(1) NOT NULL,
  `NamHoc` char(10) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`MaHocKy`),
  KEY `NamHoc` (`NamHoc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


CREATE TABLE `diem` (
  `MaDiem` int(6) NOT NULL AUTO_INCREMENT,
  `MaHocKy` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `MaMonHoc` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `MaHS` int(6) NOT NULL,
  `MaLopHoc` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `DiemMieng` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `Diem15Phut1` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `Diem15Phut2` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `Diem1Tiet1` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `Diem1Tiet2` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `DiemThi` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `DiemTB` float NOT NULL,
  PRIMARY KEY (`MaDiem`),
  KEY `fk_diem_mahk` (`MaHocKy`),
  KEY `fk_diem_monhoc` (`MaMonHoc`),
  KEY `fk_diem_hocsinh` (`MaHS`),
  KEY `MaLopHoc` (`MaLopHoc`),
  CONSTRAINT `diem_ibfk_1` FOREIGN KEY (`MaLopHoc`) REFERENCES `lophoc` (`MaLopHoc`),
  CONSTRAINT `fk_diem_hocsinh` FOREIGN KEY (`MaHS`) REFERENCES `hocsinh` (`MaHS`),
  CONSTRAINT `fk_diem_mahk` FOREIGN KEY (`MaHocKy`) REFERENCES `hocky` (`MaHocKy`),
  CONSTRAINT `fk_diem_monhoc` FOREIGN KEY (`MaMonHoc`) REFERENCES `monhoc` (`MaMonHoc`)
) ENGINE=InnoDB AUTO_INCREMENT=37732 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


CREATE TABLE `dayhoc` (
  `MaDayHoc` int(5) NOT NULL AUTO_INCREMENT,
  `MaMonHoc` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `MaGV` int(6) NOT NULL,
  `MaLopHoc` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `MaHocKy` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `MoTaPhanCong` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`MaDayHoc`),
  KEY `fk_day_monhoc` (`MaMonHoc`),
  KEY `fk_day_gv` (`MaGV`),
  KEY `fk_day_hocky` (`MaHocKy`),
  KEY `fk_day_lophoc` (`MaLopHoc`),
  CONSTRAINT `fk_day_gv` FOREIGN KEY (`MaGV`) REFERENCES `giaovien` (`MaGV`),
  CONSTRAINT `fk_day_hocky` FOREIGN KEY (`MaHocKy`) REFERENCES `hocky` (`MaHocKy`),
  CONSTRAINT `fk_day_lophoc` FOREIGN KEY (`MaLopHoc`) REFERENCES `lophoc` (`MaLopHoc`),
  CONSTRAINT `fk_day_monhoc` FOREIGN KEY (`MaMonHoc`) REFERENCES `monhoc` (`MaMonHoc`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


CREATE TABLE `namhoc` (
  `MaNamHoc` int(6) NOT NULL AUTO_INCREMENT,
  `NamHoc` char(10) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`MaNamHoc`),
  UNIQUE KEY `NamHoc` (`NamHoc`),
  CONSTRAINT `namhoc_ibfk_1` FOREIGN KEY (`NamHoc`) REFERENCES `hocky` (`NamHoc`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


CREATE TABLE `thongke` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `MaHS` int(6) NOT NULL,
  `MaLopHoc` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `NamHoc` char(10) COLLATE utf8_unicode_ci NOT NULL,
  `TbNamHoc` float NOT NULL,
  PRIMARY KEY (`id`),
  KEY `MaHS` (`MaHS`),
  KEY `MaLopHoc` (`MaLopHoc`),
  KEY `NamHoc` (`NamHoc`),
  CONSTRAINT `thongke_ibfk_1` FOREIGN KEY (`MaHS`) REFERENCES `hocsinh` (`MaHS`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `thongke_ibfk_2` FOREIGN KEY (`MaLopHoc`) REFERENCES `lophoc` (`MaLopHoc`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `thongke_ibfk_3` FOREIGN KEY (`NamHoc`) REFERENCES `namhoc` (`NamHoc`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2366 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- user
INSERT INTO user VALUES("1","Admin","admin@gmail.com","e10adc3949ba59abbe56e057f20f883e","123456","1");
INSERT INTO user VALUES("2","????? Vi???t Trung","trung36@gmail.com","e10adc3949ba59abbe56e057f20f883e","123456","2");
INSERT INTO user VALUES("3","D????ng Lan Ph????ng","phuongpi@gmail.com","e10adc3949ba59abbe56e057f20f883e","123456","2");


-- lophoc
INSERT INTO lophoc VALUES("221","10A1","10");
INSERT INTO lophoc VALUES("222","10A2","10");
INSERT INTO lophoc VALUES("223","10A3","10");
INSERT INTO lophoc VALUES("211","11B1","11");
INSERT INTO lophoc VALUES("212","11B2","11");
INSERT INTO lophoc VALUES("213","11B3","11");
INSERT INTO lophoc VALUES("201","12C1","12");
INSERT INTO lophoc VALUES("202","12C2","12");
INSERT INTO lophoc VALUES("203","12C3","12");


-- hocsinh
-- 10A1
INSERT INTO hocsinh VALUES("2201","221","Tr????ng Ng?????i Ch???","N???","2004-04-11","H?? N???i","Kinh","A","B");
INSERT INTO hocsinh VALUES("2202","221","Nguy???n Ng?????i ?????i","N???","2004-04-11","H?? N???i","Kinh","A","B");
INSERT INTO hocsinh VALUES("2203","221","V?? S??? Nh???n","N???","2004-04-11","H?? N???i","Kinh","A","B");
-- 10A2
INSERT INTO hocsinh VALUES("2204","222","????o Anh Mong","N???","2004-04-11","H?? N???i","Kinh","A","B");
INSERT INTO hocsinh VALUES("2205","222","Nguy???n Kh??ng N??n","N???","2004-04-11","H?? N???i","Kinh","A","B");
INSERT INTO hocsinh VALUES("2206","222","Ph???m T???ng ?????y","N???","2004-04-11","H?? N???i","Kinh","A","B");
-- 10A3
INSERT INTO hocsinh VALUES("2207","223","????? Th???t L??ng","N???","2004-04-11","H?? N???i","Kinh","A","B");
INSERT INTO hocsinh VALUES("2208","223","Nguy???n Em H??y","N???","2004-04-11","H?? N???i","Kinh","A","B");
INSERT INTO hocsinh VALUES("2209","223","Vui Th??? Bu???n","N???","2004-04-11","H?? N???i","Kinh","A","B");
-- 11B1
INSERT INTO hocsinh VALUES("2101","211","Tr????ng Ng?????i Ch???","N???","2003-04-11","H?? N???i","Kinh","A","B");
INSERT INTO hocsinh VALUES("2102","211","Nguy???n Ng?????i ?????i","N???","2003-04-11","H?? N???i","Kinh","A","B");
INSERT INTO hocsinh VALUES("2103","211","V?? S??? Nh???n","N???","2003-04-11","H?? N???i","Kinh","A","B");
-- 11B2
INSERT INTO hocsinh VALUES("2104","212","????o Anh Mong","N???","2003-04-11","H?? N???i","Kinh","A","B");
INSERT INTO hocsinh VALUES("2105","212","Nguy???n Kh??ng N??n","N???","2003-04-11","H?? N???i","Kinh","A","B");
INSERT INTO hocsinh VALUES("2106","212","Ph???m T???ng ?????y","N???","2003-04-11","H?? N???i","Kinh","A","B");
-- 11B3
INSERT INTO hocsinh VALUES("2107","213","????? Th???t L??ng","N???","2003-04-11","H?? N???i","Kinh","A","B");
INSERT INTO hocsinh VALUES("2108","213","Nguy???n Em H??y","N???","2003-04-11","H?? N???i","Kinh","A","B");
INSERT INTO hocsinh VALUES("2109","213","Vui Th??? Bu???n","N???","2003-04-11","H?? N???i","Kinh","A","B");
-- 12C1
INSERT INTO hocsinh VALUES("2001","201","Tr????ng Ng?????i Ch???","N???","2002-04-11","H?? N???i","Kinh","A","B");
INSERT INTO hocsinh VALUES("2002","201","Nguy???n Ng?????i ?????i","N???","2002-04-11","H?? N???i","Kinh","A","B");
INSERT INTO hocsinh VALUES("2003","201","V?? S??? Nh???n","N???","2002-04-11","H?? N???i","Kinh","A","B");
-- 12C2
INSERT INTO hocsinh VALUES("2004","202","????o Anh Mong","N???","2002-04-11","H?? N???i","Kinh","A","B");
INSERT INTO hocsinh VALUES("2005","202","Nguy???n Kh??ng N??n","N???","2002-04-11","H?? N???i","Kinh","A","B");
INSERT INTO hocsinh VALUES("2006","202","Ph???m T???ng ?????y","N???","2002-04-11","H?? N???i","Kinh","A","B");
-- 12C3
INSERT INTO hocsinh VALUES("2007","203","????? Th???t L??ng","N???","2002-04-11","H?? N???i","Kinh","A","B");
INSERT INTO hocsinh VALUES("2008","203","Nguy???n Em H??y","N???","2002-04-11","H?? N???i","Kinh","A","B");
INSERT INTO hocsinh VALUES("2009","203","Vui Th??? Bu???n","N???","2002-04-11","H?? N???i","Kinh","A","B");


-- monhoc
INSERT INTO monhoc VALUES("TA","Ti???ng Anh","105","1");
INSERT INTO monhoc VALUES("CN","C??ng Ngh???","52","1");
INSERT INTO monhoc VALUES("GD","Gi??o D???c C??ng D??n","35","1");
INSERT INTO monhoc VALUES("HH","H??a H???c","70","1");
INSERT INTO monhoc VALUES("LS","L???ch S???","105","1");
INSERT INTO monhoc VALUES("GT","Gi???i T??ch","140","2");
INSERT INTO monhoc VALUES("TH","Tin H???c","35","1");
INSERT INTO monhoc VALUES("NV","Ng??? V??n","140","2");


-- giaovien
INSERT INTO giaovien VALUES("1","TA","Tr???n Th??? H???o","B???c Giang","0123456789","gv.hao@gmail.com","e10adc3949ba59abbe56e057f20f883e");
INSERT INTO giaovien VALUES("2","CN","????o Th??? Thanh","H?? N???i","0123456788","gv.thanh@gmail.com","e10adc3949ba59abbe56e057f20f883e");
INSERT INTO giaovien VALUES("3","GD","C?? V??n Ngh??a","H?? N???i","0123456787","gv.nghia@gmail.com","e10adc3949ba59abbe56e057f20f883e");
INSERT INTO giaovien VALUES("4","HH","Tr???n Th??? Thanh","H?? N???i","0123456786","gv.thanh2@gmail.com","e10adc3949ba59abbe56e057f20f883e");
INSERT INTO giaovien VALUES("5","LS","Thanh Th??? H???o","H??ng Y??n","0123456785","gv.hao2@gmail.com","e10adc3949ba59abbe56e057f20f883e");
INSERT INTO giaovien VALUES("6","GT","Nguy???n Ng???c V??","Th??i B??nh","0123456784","gv.vu@gmail.com","e10adc3949ba59abbe56e057f20f883e");
INSERT INTO giaovien VALUES("7","TH","Nguy???n Th??? H????ng","H?? N???i","0123456873","gv.huong@gmail.com","e10adc3949ba59abbe56e057f20f883e");
INSERT INTO giaovien VALUES("8","NV","Phan Ngh??a B??","Ngh??? An","0123546782","gv.ba@gmail.com","e10adc3949ba59abbe56e057f20f883e");


-- hocky
INSERT INTO hocky VALUES("20201","H???c K??? I","1","20-21");
INSERT INTO hocky VALUES("20202","H???c K??? II","2","20-21");
INSERT INTO hocky VALUES("20211","H???c K??? I","1","21-22");
INSERT INTO hocky VALUES("20212","H???c K??? II","2","21-22");
INSERT INTO hocky VALUES("20221","H???c K??? I","1","22-23");
INSERT INTO hocky VALUES("20222","H???c K??? II","2","22-23");


-- diem
-- 10A1
-- HK1
INSERT INTO diem VALUES("","20221","TA","2201","221","10","10","7.5","6","8","9","8.3");
INSERT INTO diem VALUES("","20221","CN","2201","221","10","10","7.5","6","8","9","8.3");
INSERT INTO diem VALUES("","20221","GD","2201","221","10","10","7.5","6","8","9","8.3");
INSERT INTO diem VALUES("","20221","HH","2201","221","10","10","7.5","6","8","9","8.3");
INSERT INTO diem VALUES("","20221","LS","2201","221","10","10","7.5","6","8","9","8.3");
INSERT INTO diem VALUES("","20221","GT","2201","221","10","10","7.5","6","8","9","8.3");
INSERT INTO diem VALUES("","20221","TH","2201","221","10","10","7.5","6","8","9","8.3");
INSERT INTO diem VALUES("","20221","NV","2201","221","10","10","7.5","6","8","9","8.3");
INSERT INTO diem VALUES("","20221","TA","2202","221","7","8","6","8","9","10","8.5");
INSERT INTO diem VALUES("","20221","CN","2202","221","7","8","6","8","9","10","8.5");
INSERT INTO diem VALUES("","20221","GD","2202","221","7","8","6","8","9","10","8.5");
INSERT INTO diem VALUES("","20221","HH","2202","221","7","8","6","8","9","10","8.5");
INSERT INTO diem VALUES("","20221","LS","2202","221","7","8","6","8","9","10","8.5");
INSERT INTO diem VALUES("","20221","GT","2202","221","7","8","6","8","9","10","8.5");
INSERT INTO diem VALUES("","20221","TH","2202","221","7","8","6","8","9","10","8.5");
INSERT INTO diem VALUES("","20221","NV","2202","221","7","8","6","8","9","10","8.5");
INSERT INTO diem VALUES("","20221","TA","2203","221","7","8","4.5","6","8","7.5","7");
INSERT INTO diem VALUES("","20221","CN","2203","221","7","8","4.5","6","8","7.5","7");
INSERT INTO diem VALUES("","20221","GD","2203","221","7","8","4.5","6","8","7.5","7");
INSERT INTO diem VALUES("","20221","HH","2203","221","7","8","4.5","6","8","7.5","7");
INSERT INTO diem VALUES("","20221","LS","2203","221","7","8","4.5","6","8","7.5","7");
INSERT INTO diem VALUES("","20221","GT","2203","221","7","8","4.5","6","8","7.5","7");
INSERT INTO diem VALUES("","20221","TH","2203","221","7","8","4.5","6","8","7.5","7");
INSERT INTO diem VALUES("","20221","NV","2203","221","7","8","4.5","6","8","7.5","7");
-- HK2
INSERT INTO diem VALUES("","20222","TA","2201","221","10","10","7.5","6","8","9","8.3");
INSERT INTO diem VALUES("","20222","CN","2201","221","10","10","7.5","6","8","9","8.3");
INSERT INTO diem VALUES("","20222","GD","2201","221","10","10","7.5","6","8","9","8.3");
INSERT INTO diem VALUES("","20222","HH","2201","221","10","10","7.5","6","8","9","8.3");
INSERT INTO diem VALUES("","20222","LS","2201","221","10","10","7.5","6","8","9","8.3");
INSERT INTO diem VALUES("","20222","GT","2201","221","10","10","7.5","6","8","9","8.3");
INSERT INTO diem VALUES("","20222","TH","2201","221","10","10","7.5","6","8","9","8.3");
INSERT INTO diem VALUES("","20222","NV","2201","221","10","10","7.5","6","8","9","8.3");
INSERT INTO diem VALUES("","20222","TA","2202","221","7","8","6","8","9","10","8.5");
INSERT INTO diem VALUES("","20222","CN","2202","221","7","8","6","8","9","10","8.5");
INSERT INTO diem VALUES("","20222","GD","2202","221","7","8","6","8","9","10","8.5");
INSERT INTO diem VALUES("","20222","HH","2202","221","7","8","6","8","9","10","8.5");
INSERT INTO diem VALUES("","20222","LS","2202","221","7","8","6","8","9","10","8.5");
INSERT INTO diem VALUES("","20222","GT","2202","221","7","8","6","8","9","10","8.5");
INSERT INTO diem VALUES("","20222","TH","2202","221","7","8","6","8","9","10","8.5");
INSERT INTO diem VALUES("","20222","NV","2202","221","7","8","6","8","9","10","8.5");
INSERT INTO diem VALUES("","20222","TA","2203","221","7","8","4.5","6","8","7.5","7");
INSERT INTO diem VALUES("","20222","CN","2203","221","7","8","4.5","6","8","7.5","7");
INSERT INTO diem VALUES("","20222","GD","2203","221","7","8","4.5","6","8","7.5","7");
INSERT INTO diem VALUES("","20222","HH","2203","221","7","8","4.5","6","8","7.5","7");
INSERT INTO diem VALUES("","20222","LS","2203","221","7","8","4.5","6","8","7.5","7");
INSERT INTO diem VALUES("","20222","GT","2203","221","7","8","4.5","6","8","7.5","7");
INSERT INTO diem VALUES("","20222","TH","2203","221","7","8","4.5","6","8","7.5","7");
INSERT INTO diem VALUES("","20222","NV","2203","221","7","8","4.5","6","8","7.5","7");

-- 10A2
-- HK1
INSERT INTO diem VALUES("","20221","TA","2204","222","8","5","6","7","5","9","7");
INSERT INTO diem VALUES("","20221","CN","2204","222","8","5","6","7","5","9","7");
INSERT INTO diem VALUES("","20221","GD","2204","222","8","5","6","7","5","9","7");
INSERT INTO diem VALUES("","20221","HH","2204","222","8","5","6","7","5","9","7");
INSERT INTO diem VALUES("","20221","LS","2204","222","8","5","6","7","5","9","7");
INSERT INTO diem VALUES("","20221","GT","2204","222","8","5","6","7","5","9","7");
INSERT INTO diem VALUES("","20221","TH","2204","222","8","5","6","7","5","9","7");
INSERT INTO diem VALUES("","20221","NV","2204","222","8","5","6","7","5","9","7");
INSERT INTO diem VALUES("","20221","TA","2205","222","10","8","9","7","7.5","8","8");
INSERT INTO diem VALUES("","20221","CN","2205","222","10","8","9","7","7.5","8","8");
INSERT INTO diem VALUES("","20221","GD","2205","222","10","8","9","7","7.5","8","8");
INSERT INTO diem VALUES("","20221","HH","2205","222","10","8","9","7","7.5","8","8");
INSERT INTO diem VALUES("","20221","LS","2205","222","10","8","9","7","7.5","8","8");
INSERT INTO diem VALUES("","20221","GT","2205","222","10","8","9","7","7.5","8","8");
INSERT INTO diem VALUES("","20221","TH","2205","222","10","8","9","7","7.5","8","8");
INSERT INTO diem VALUES("","20221","NV","2205","222","10","8","9","7","7.5","8","8");
INSERT INTO diem VALUES("","20221","TA","2206","222","1","2","3","4","5","6","4.2");
INSERT INTO diem VALUES("","20221","CN","2206","222","1","2","3","4","5","6","4.2");
INSERT INTO diem VALUES("","20221","GD","2206","222","1","2","3","4","5","6","4.2");
INSERT INTO diem VALUES("","20221","HH","2206","222","1","2","3","4","5","6","4.2");
INSERT INTO diem VALUES("","20221","LS","2206","222","1","2","3","4","5","6","4.2");
INSERT INTO diem VALUES("","20221","GT","2206","222","1","2","3","4","5","6","4.2");
INSERT INTO diem VALUES("","20221","TH","2206","222","1","2","3","4","5","6","4.2");
INSERT INTO diem VALUES("","20221","NV","2206","222","1","2","3","4","5","6","4.2");
-- HK2
INSERT INTO diem VALUES("","20222","TA","2204","222","8","5","6","7","5","9","7");
INSERT INTO diem VALUES("","20222","CN","2204","222","8","5","6","7","5","9","7");
INSERT INTO diem VALUES("","20222","GD","2204","222","8","5","6","7","5","9","7");
INSERT INTO diem VALUES("","20222","HH","2204","222","8","5","6","7","5","9","7");
INSERT INTO diem VALUES("","20222","LS","2204","222","8","5","6","7","5","9","7");
INSERT INTO diem VALUES("","20222","GT","2204","222","8","5","6","7","5","9","7");
INSERT INTO diem VALUES("","20222","TH","2204","222","8","5","6","7","5","9","7");
INSERT INTO diem VALUES("","20222","NV","2204","222","8","5","6","7","5","9","7");
INSERT INTO diem VALUES("","20222","TA","2205","222","10","8","9","7","7.5","8","8");
INSERT INTO diem VALUES("","20222","CN","2205","222","10","8","9","7","7.5","8","8");
INSERT INTO diem VALUES("","20222","GD","2205","222","10","8","9","7","7.5","8","8");
INSERT INTO diem VALUES("","20222","HH","2205","222","10","8","9","7","7.5","8","8");
INSERT INTO diem VALUES("","20222","LS","2205","222","10","8","9","7","7.5","8","8");
INSERT INTO diem VALUES("","20222","GT","2205","222","10","8","9","7","7.5","8","8");
INSERT INTO diem VALUES("","20222","TH","2205","222","10","8","9","7","7.5","8","8");
INSERT INTO diem VALUES("","20222","NV","2205","222","10","8","9","7","7.5","8","8");
INSERT INTO diem VALUES("","20222","TA","2206","222","1","2","3","4","5","6","4.2");
INSERT INTO diem VALUES("","20222","CN","2206","222","1","2","3","4","5","6","4.2");
INSERT INTO diem VALUES("","20222","GD","2206","222","1","2","3","4","5","6","4.2");
INSERT INTO diem VALUES("","20222","HH","2206","222","1","2","3","4","5","6","4.2");
INSERT INTO diem VALUES("","20222","LS","2206","222","1","2","3","4","5","6","4.2");
INSERT INTO diem VALUES("","20222","GT","2206","222","1","2","3","4","5","6","4.2");
INSERT INTO diem VALUES("","20222","TH","2206","222","1","2","3","4","5","6","4.2");
INSERT INTO diem VALUES("","20222","NV","2206","222","1","2","3","4","5","6","4.2");

-- 10A3
-- HK1
INSERT INTO diem VALUES("","20221","TA","2207","223","8","5","6","7","5","9","7");
INSERT INTO diem VALUES("","20221","CN","2207","223","8","5","6","7","5","9","7");
INSERT INTO diem VALUES("","20221","GD","2207","223","8","5","6","7","5","9","7");
INSERT INTO diem VALUES("","20221","HH","2207","223","8","5","6","7","5","9","7");
INSERT INTO diem VALUES("","20221","LS","2207","223","8","5","6","7","5","9","7");
INSERT INTO diem VALUES("","20221","GT","2207","223","8","5","6","7","5","9","7");
INSERT INTO diem VALUES("","20221","TH","2207","223","8","5","6","7","5","9","7");
INSERT INTO diem VALUES("","20221","NV","2207","223","8","5","6","7","5","9","7");
INSERT INTO diem VALUES("","20221","TA","2208","223","8","5","6","7","5","9","7");
INSERT INTO diem VALUES("","20221","CN","2208","223","8","5","6","7","5","9","7");
INSERT INTO diem VALUES("","20221","GD","2208","223","8","5","6","7","5","9","7");
INSERT INTO diem VALUES("","20221","HH","2208","223","8","5","6","7","5","9","7");
INSERT INTO diem VALUES("","20221","LS","2208","223","8","5","6","7","5","9","7");
INSERT INTO diem VALUES("","20221","GT","2208","223","8","5","6","7","5","9","7");
INSERT INTO diem VALUES("","20221","TH","2208","223","8","5","6","7","5","9","7");
INSERT INTO diem VALUES("","20221","NV","2208","223","8","5","6","7","5","9","7");
INSERT INTO diem VALUES("","20221","TA","2209","223","7","8","4.5","6","8","7.5","7");
INSERT INTO diem VALUES("","20221","CN","2209","223","7","8","4.5","6","8","7.5","7");
INSERT INTO diem VALUES("","20221","GD","2209","223","7","8","4.5","6","8","7.5","7");
INSERT INTO diem VALUES("","20221","HH","2209","223","7","8","4.5","6","8","7.5","7");
INSERT INTO diem VALUES("","20221","LS","2209","223","7","8","4.5","6","8","7.5","7");
INSERT INTO diem VALUES("","20221","GT","2209","223","7","8","4.5","6","8","7.5","7");
INSERT INTO diem VALUES("","20221","TH","2209","223","7","8","4.5","6","8","7.5","7");
INSERT INTO diem VALUES("","20221","NV","2209","223","7","8","4.5","6","8","7.5","7");
-- HK2
INSERT INTO diem VALUES("","20222","TA","2207","223","8","5","6","7","5","9","7");
INSERT INTO diem VALUES("","20222","CN","2207","223","8","5","6","7","5","9","7");
INSERT INTO diem VALUES("","20222","GD","2207","223","8","5","6","7","5","9","7");
INSERT INTO diem VALUES("","20222","HH","2207","223","8","5","6","7","5","9","7");
INSERT INTO diem VALUES("","20222","LS","2207","223","8","5","6","7","5","9","7");
INSERT INTO diem VALUES("","20222","GT","2207","223","8","5","6","7","5","9","7");
INSERT INTO diem VALUES("","20222","TH","2207","223","8","5","6","7","5","9","7");
INSERT INTO diem VALUES("","20222","NV","2207","223","8","5","6","7","5","9","7");
INSERT INTO diem VALUES("","20222","TA","2208","223","8","5","6","7","5","9","7");
INSERT INTO diem VALUES("","20222","CN","2208","223","8","5","6","7","5","9","7");
INSERT INTO diem VALUES("","20222","GD","2208","223","8","5","6","7","5","9","7");
INSERT INTO diem VALUES("","20222","HH","2208","223","8","5","6","7","5","9","7");
INSERT INTO diem VALUES("","20222","LS","2208","223","8","5","6","7","5","9","7");
INSERT INTO diem VALUES("","20222","GT","2208","223","8","5","6","7","5","9","7");
INSERT INTO diem VALUES("","20222","TH","2208","223","8","5","6","7","5","9","7");
INSERT INTO diem VALUES("","20222","NV","2208","223","8","5","6","7","5","9","7");
INSERT INTO diem VALUES("","20222","TA","2209","223","7","8","4.5","6","8","7.5","7");
INSERT INTO diem VALUES("","20222","CN","2209","223","7","8","4.5","6","8","7.5","7");
INSERT INTO diem VALUES("","20222","GD","2209","223","7","8","4.5","6","8","7.5","7");
INSERT INTO diem VALUES("","20222","HH","2209","223","7","8","4.5","6","8","7.5","7");
INSERT INTO diem VALUES("","20222","LS","2209","223","7","8","4.5","6","8","7.5","7");
INSERT INTO diem VALUES("","20222","GT","2209","223","7","8","4.5","6","8","7.5","7");
INSERT INTO diem VALUES("","20222","TH","2209","223","7","8","4.5","6","8","7.5","7");
INSERT INTO diem VALUES("","20222","NV","2209","223","7","8","4.5","6","8","7.5","7");

-- 11B1
-- HK1
INSERT INTO diem VALUES("","20211","TA","2101","211","10","10","7.5","6","8","9","8.3");
INSERT INTO diem VALUES("","20211","CN","2101","211","10","10","7.5","6","8","9","8.3");
INSERT INTO diem VALUES("","20211","GD","2101","211","10","10","7.5","6","8","9","8.3");
INSERT INTO diem VALUES("","20211","HH","2101","211","10","10","7.5","6","8","9","8.3");
INSERT INTO diem VALUES("","20211","LS","2101","211","10","10","7.5","6","8","9","8.3");
INSERT INTO diem VALUES("","20211","GT","2101","211","10","10","7.5","6","8","9","8.3");
INSERT INTO diem VALUES("","20211","TH","2101","211","10","10","7.5","6","8","9","8.3");
INSERT INTO diem VALUES("","20211","NV","2101","211","10","10","7.5","6","8","9","8.3");
INSERT INTO diem VALUES("","20211","TA","2102","211","7","8","6","8","9","10","8.5");
INSERT INTO diem VALUES("","20211","CN","2102","211","7","8","6","8","9","10","8.5");
INSERT INTO diem VALUES("","20211","GD","2102","211","7","8","6","8","9","10","8.5");
INSERT INTO diem VALUES("","20211","HH","2102","211","7","8","6","8","9","10","8.5");
INSERT INTO diem VALUES("","20211","LS","2102","211","7","8","6","8","9","10","8.5");
INSERT INTO diem VALUES("","20211","GT","2102","211","7","8","6","8","9","10","8.5");
INSERT INTO diem VALUES("","20211","TH","2102","211","7","8","6","8","9","10","8.5");
INSERT INTO diem VALUES("","20211","NV","2102","211","7","8","6","8","9","10","8.5");
INSERT INTO diem VALUES("","20211","TA","2103","211","7","8","4.5","6","8","7.5","7");
INSERT INTO diem VALUES("","20211","CN","2103","211","7","8","4.5","6","8","7.5","7");
INSERT INTO diem VALUES("","20211","GD","2103","211","7","8","4.5","6","8","7.5","7");
INSERT INTO diem VALUES("","20211","HH","2103","211","7","8","4.5","6","8","7.5","7");
INSERT INTO diem VALUES("","20211","LS","2103","211","7","8","4.5","6","8","7.5","7");
INSERT INTO diem VALUES("","20211","GT","2103","211","7","8","4.5","6","8","7.5","7");
INSERT INTO diem VALUES("","20211","TH","2103","211","7","8","4.5","6","8","7.5","7");
INSERT INTO diem VALUES("","20211","NV","2103","211","7","8","4.5","6","8","7.5","7");
-- HK2
INSERT INTO diem VALUES("","20212","TA","2101","211","10","10","7.5","6","8","9","8.3");
INSERT INTO diem VALUES("","20212","CN","2101","211","10","10","7.5","6","8","9","8.3");
INSERT INTO diem VALUES("","20212","GD","2101","211","10","10","7.5","6","8","9","8.3");
INSERT INTO diem VALUES("","20212","HH","2101","211","10","10","7.5","6","8","9","8.3");
INSERT INTO diem VALUES("","20212","LS","2101","211","10","10","7.5","6","8","9","8.3");
INSERT INTO diem VALUES("","20212","GT","2101","211","10","10","7.5","6","8","9","8.3");
INSERT INTO diem VALUES("","20212","TH","2101","211","10","10","7.5","6","8","9","8.3");
INSERT INTO diem VALUES("","20212","NV","2101","211","10","10","7.5","6","8","9","8.3");
INSERT INTO diem VALUES("","20212","TA","2102","211","7","8","6","8","9","10","8.5");
INSERT INTO diem VALUES("","20212","CN","2102","211","7","8","6","8","9","10","8.5");
INSERT INTO diem VALUES("","20212","GD","2102","211","7","8","6","8","9","10","8.5");
INSERT INTO diem VALUES("","20212","HH","2102","211","7","8","6","8","9","10","8.5");
INSERT INTO diem VALUES("","20212","LS","2102","211","7","8","6","8","9","10","8.5");
INSERT INTO diem VALUES("","20212","GT","2102","211","7","8","6","8","9","10","8.5");
INSERT INTO diem VALUES("","20212","TH","2102","211","7","8","6","8","9","10","8.5");
INSERT INTO diem VALUES("","20212","NV","2102","211","7","8","6","8","9","10","8.5");
INSERT INTO diem VALUES("","20212","TA","2103","211","7","8","4.5","6","8","7.5","7");
INSERT INTO diem VALUES("","20212","CN","2103","211","7","8","4.5","6","8","7.5","7");
INSERT INTO diem VALUES("","20212","GD","2103","211","7","8","4.5","6","8","7.5","7");
INSERT INTO diem VALUES("","20212","HH","2103","211","7","8","4.5","6","8","7.5","7");
INSERT INTO diem VALUES("","20212","LS","2103","211","7","8","4.5","6","8","7.5","7");
INSERT INTO diem VALUES("","20212","GT","2103","211","7","8","4.5","6","8","7.5","7");
INSERT INTO diem VALUES("","20212","TH","2103","211","7","8","4.5","6","8","7.5","7");
INSERT INTO diem VALUES("","20212","NV","2103","211","7","8","4.5","6","8","7.5","7");

-- 11B2
-- HK1
INSERT INTO diem VALUES("","20211","TA","2104","212","8","5","6","7","5","9","7");
INSERT INTO diem VALUES("","20211","CN","2104","212","8","5","6","7","5","9","7");
INSERT INTO diem VALUES("","20211","GD","2104","212","8","5","6","7","5","9","7");
INSERT INTO diem VALUES("","20211","HH","2104","212","8","5","6","7","5","9","7");
INSERT INTO diem VALUES("","20211","LS","2104","212","8","5","6","7","5","9","7");
INSERT INTO diem VALUES("","20211","GT","2104","212","8","5","6","7","5","9","7");
INSERT INTO diem VALUES("","20211","TH","2104","212","8","5","6","7","5","9","7");
INSERT INTO diem VALUES("","20211","NV","2104","212","8","5","6","7","5","9","7");
INSERT INTO diem VALUES("","20211","TA","2105","212","8","5","6","7","5","9","7");
INSERT INTO diem VALUES("","20211","CN","2105","212","8","5","6","7","5","9","7");
INSERT INTO diem VALUES("","20211","GD","2105","212","8","5","6","7","5","9","7");
INSERT INTO diem VALUES("","20211","HH","2105","212","8","5","6","7","5","9","7");
INSERT INTO diem VALUES("","20211","LS","2105","212","8","5","6","7","5","9","7");
INSERT INTO diem VALUES("","20211","GT","2105","212","8","5","6","7","5","9","7");
INSERT INTO diem VALUES("","20211","TH","2105","212","8","5","6","7","5","9","7");
INSERT INTO diem VALUES("","20211","NV","2105","212","8","5","6","7","5","9","7");
INSERT INTO diem VALUES("","20211","TA","2106","212","7","8","4.5","6","8","7.5","7");
INSERT INTO diem VALUES("","20211","CN","2106","212","7","8","4.5","6","8","7.5","7");
INSERT INTO diem VALUES("","20211","GD","2106","212","7","8","4.5","6","8","7.5","7");
INSERT INTO diem VALUES("","20211","HH","2106","212","7","8","4.5","6","8","7.5","7");
INSERT INTO diem VALUES("","20211","LS","2106","212","7","8","4.5","6","8","7.5","7");
INSERT INTO diem VALUES("","20211","GT","2106","212","7","8","4.5","6","8","7.5","7");
INSERT INTO diem VALUES("","20211","TH","2106","212","7","8","4.5","6","8","7.5","7");
INSERT INTO diem VALUES("","20211","NV","2106","212","7","8","4.5","6","8","7.5","7");
-- HK2
INSERT INTO diem VALUES("","20212","TA","2104","212","8","5","6","7","5","9","7");
INSERT INTO diem VALUES("","20212","CN","2104","212","8","5","6","7","5","9","7");
INSERT INTO diem VALUES("","20212","GD","2104","212","8","5","6","7","5","9","7");
INSERT INTO diem VALUES("","20212","HH","2104","212","8","5","6","7","5","9","7");
INSERT INTO diem VALUES("","20212","LS","2104","212","8","5","6","7","5","9","7");
INSERT INTO diem VALUES("","20212","GT","2104","212","8","5","6","7","5","9","7");
INSERT INTO diem VALUES("","20212","TH","2104","212","8","5","6","7","5","9","7");
INSERT INTO diem VALUES("","20212","NV","2104","212","8","5","6","7","5","9","7");
INSERT INTO diem VALUES("","20212","TA","2105","212","8","5","6","7","5","9","7");
INSERT INTO diem VALUES("","20212","CN","2105","212","8","5","6","7","5","9","7");
INSERT INTO diem VALUES("","20212","GD","2105","212","8","5","6","7","5","9","7");
INSERT INTO diem VALUES("","20212","HH","2105","212","8","5","6","7","5","9","7");
INSERT INTO diem VALUES("","20212","LS","2105","212","8","5","6","7","5","9","7");
INSERT INTO diem VALUES("","20212","GT","2105","212","8","5","6","7","5","9","7");
INSERT INTO diem VALUES("","20212","TH","2105","212","8","5","6","7","5","9","7");
INSERT INTO diem VALUES("","20212","NV","2105","212","8","5","6","7","5","9","7");
INSERT INTO diem VALUES("","20212","TA","2106","212","7","8","4.5","6","8","7.5","7");
INSERT INTO diem VALUES("","20212","CN","2106","212","7","8","4.5","6","8","7.5","7");
INSERT INTO diem VALUES("","20212","GD","2106","212","7","8","4.5","6","8","7.5","7");
INSERT INTO diem VALUES("","20212","HH","2106","212","7","8","4.5","6","8","7.5","7");
INSERT INTO diem VALUES("","20212","LS","2106","212","7","8","4.5","6","8","7.5","7");
INSERT INTO diem VALUES("","20212","GT","2106","212","7","8","4.5","6","8","7.5","7");
INSERT INTO diem VALUES("","20212","TH","2106","212","7","8","4.5","6","8","7.5","7");
INSERT INTO diem VALUES("","20212","NV","2106","212","7","8","4.5","6","8","7.5","7");

-- 11B3
-- HK1
INSERT INTO diem VALUES("","20211","TA","2107","213","8","5","6","7","5","9","7");
INSERT INTO diem VALUES("","20211","CN","2107","213","8","5","6","7","5","9","7");
INSERT INTO diem VALUES("","20211","GD","2107","213","8","5","6","7","5","9","7");
INSERT INTO diem VALUES("","20211","HH","2107","213","8","5","6","7","5","9","7");
INSERT INTO diem VALUES("","20211","LS","2107","213","8","5","6","7","5","9","7");
INSERT INTO diem VALUES("","20211","GT","2107","213","8","5","6","7","5","9","7");
INSERT INTO diem VALUES("","20211","TH","2107","213","8","5","6","7","5","9","7");
INSERT INTO diem VALUES("","20211","NV","2107","213","8","5","6","7","5","9","7");
INSERT INTO diem VALUES("","20211","TA","2108","213","10","8","9","7","7.5","8","8");
INSERT INTO diem VALUES("","20211","CN","2108","213","10","8","9","7","7.5","8","8");
INSERT INTO diem VALUES("","20211","GD","2108","213","10","8","9","7","7.5","8","8");
INSERT INTO diem VALUES("","20211","HH","2108","213","10","8","9","7","7.5","8","8");
INSERT INTO diem VALUES("","20211","LS","2108","213","10","8","9","7","7.5","8","8");
INSERT INTO diem VALUES("","20211","GT","2108","213","10","8","9","7","7.5","8","8");
INSERT INTO diem VALUES("","20211","TH","2108","213","10","8","9","7","7.5","8","8");
INSERT INTO diem VALUES("","20211","NV","2108","213","10","8","9","7","7.5","8","8");
INSERT INTO diem VALUES("","20211","TA","2109","213","1","2","3","4","5","6","4.2");
INSERT INTO diem VALUES("","20211","CN","2109","213","1","2","3","4","5","6","4.2");
INSERT INTO diem VALUES("","20211","GD","2109","213","1","2","3","4","5","6","4.2");
INSERT INTO diem VALUES("","20211","HH","2109","213","1","2","3","4","5","6","4.2");
INSERT INTO diem VALUES("","20211","LS","2109","213","1","2","3","4","5","6","4.2");
INSERT INTO diem VALUES("","20211","GT","2109","213","1","2","3","4","5","6","4.2");
INSERT INTO diem VALUES("","20211","TH","2109","213","1","2","3","4","5","6","4.2");
INSERT INTO diem VALUES("","20211","NV","2109","213","1","2","3","4","5","6","4.2");
-- HK2
INSERT INTO diem VALUES("","20212","TA","2107","213","8","5","6","7","5","9","7");
INSERT INTO diem VALUES("","20212","CN","2107","213","8","5","6","7","5","9","7");
INSERT INTO diem VALUES("","20212","GD","2107","213","8","5","6","7","5","9","7");
INSERT INTO diem VALUES("","20212","HH","2107","213","8","5","6","7","5","9","7");
INSERT INTO diem VALUES("","20212","LS","2107","213","8","5","6","7","5","9","7");
INSERT INTO diem VALUES("","20212","GT","2107","213","8","5","6","7","5","9","7");
INSERT INTO diem VALUES("","20212","TH","2107","213","8","5","6","7","5","9","7");
INSERT INTO diem VALUES("","20212","NV","2107","213","8","5","6","7","5","9","7");
INSERT INTO diem VALUES("","20212","TA","2108","213","10","8","9","7","7.5","8","8");
INSERT INTO diem VALUES("","20212","CN","2108","213","10","8","9","7","7.5","8","8");
INSERT INTO diem VALUES("","20212","GD","2108","213","10","8","9","7","7.5","8","8");
INSERT INTO diem VALUES("","20212","HH","2108","213","10","8","9","7","7.5","8","8");
INSERT INTO diem VALUES("","20212","LS","2108","213","10","8","9","7","7.5","8","8");
INSERT INTO diem VALUES("","20212","GT","2108","213","10","8","9","7","7.5","8","8");
INSERT INTO diem VALUES("","20212","TH","2108","213","10","8","9","7","7.5","8","8");
INSERT INTO diem VALUES("","20212","NV","2108","213","10","8","9","7","7.5","8","8");
INSERT INTO diem VALUES("","20212","TA","2109","213","1","2","3","4","5","6","4.2");
INSERT INTO diem VALUES("","20212","CN","2109","213","1","2","3","4","5","6","4.2");
INSERT INTO diem VALUES("","20212","GD","2109","213","1","2","3","4","5","6","4.2");
INSERT INTO diem VALUES("","20212","HH","2109","213","1","2","3","4","5","6","4.2");
INSERT INTO diem VALUES("","20212","LS","2109","213","1","2","3","4","5","6","4.2");
INSERT INTO diem VALUES("","20212","GT","2109","213","1","2","3","4","5","6","4.2");
INSERT INTO diem VALUES("","20212","TH","2109","213","1","2","3","4","5","6","4.2");
INSERT INTO diem VALUES("","20212","NV","2109","213","1","2","3","4","5","6","4.2");

-- 12C1
-- HK1
INSERT INTO diem VALUES("","20201","TA","2001","201","10","10","7.5","6","8","9","8.3");
INSERT INTO diem VALUES("","20201","CN","2001","201","10","10","7.5","6","8","9","8.3");
INSERT INTO diem VALUES("","20201","GD","2001","201","10","10","7.5","6","8","9","8.3");
INSERT INTO diem VALUES("","20201","HH","2001","201","10","10","7.5","6","8","9","8.3");
INSERT INTO diem VALUES("","20201","LS","2001","201","10","10","7.5","6","8","9","8.3");
INSERT INTO diem VALUES("","20201","GT","2001","201","10","10","7.5","6","8","9","8.3");
INSERT INTO diem VALUES("","20201","TH","2001","201","10","10","7.5","6","8","9","8.3");
INSERT INTO diem VALUES("","20201","NV","2001","201","10","10","7.5","6","8","9","8.3");
INSERT INTO diem VALUES("","20201","TA","2002","201","7","8","6","8","9","10","8.5");
INSERT INTO diem VALUES("","20201","CN","2002","201","7","8","6","8","9","10","8.5");
INSERT INTO diem VALUES("","20201","GD","2002","201","7","8","6","8","9","10","8.5");
INSERT INTO diem VALUES("","20201","HH","2002","201","7","8","6","8","9","10","8.5");
INSERT INTO diem VALUES("","20201","LS","2002","201","7","8","6","8","9","10","8.5");
INSERT INTO diem VALUES("","20201","GT","2002","201","7","8","6","8","9","10","8.5");
INSERT INTO diem VALUES("","20201","TH","2002","201","7","8","6","8","9","10","8.5");
INSERT INTO diem VALUES("","20201","NV","2002","201","7","8","6","8","9","10","8.5");
INSERT INTO diem VALUES("","20201","TA","2003","201","7","8","4.5","6","8","7.5","7");
INSERT INTO diem VALUES("","20201","CN","2003","201","7","8","4.5","6","8","7.5","7");
INSERT INTO diem VALUES("","20201","GD","2003","201","7","8","4.5","6","8","7.5","7");
INSERT INTO diem VALUES("","20201","HH","2003","201","7","8","4.5","6","8","7.5","7");
INSERT INTO diem VALUES("","20201","LS","2003","201","7","8","4.5","6","8","7.5","7");
INSERT INTO diem VALUES("","20201","GT","2003","201","7","8","4.5","6","8","7.5","7");
INSERT INTO diem VALUES("","20201","TH","2003","201","7","8","4.5","6","8","7.5","7");
INSERT INTO diem VALUES("","20201","NV","2003","201","7","8","4.5","6","8","7.5","7");
-- HK2
INSERT INTO diem VALUES("","20202","TA","2001","201","10","10","7.5","6","8","9","8.3");
INSERT INTO diem VALUES("","20202","CN","2001","201","10","10","7.5","6","8","9","8.3");
INSERT INTO diem VALUES("","20202","GD","2001","201","10","10","7.5","6","8","9","8.3");
INSERT INTO diem VALUES("","20202","HH","2001","201","10","10","7.5","6","8","9","8.3");
INSERT INTO diem VALUES("","20202","LS","2001","201","10","10","7.5","6","8","9","8.3");
INSERT INTO diem VALUES("","20202","GT","2001","201","10","10","7.5","6","8","9","8.3");
INSERT INTO diem VALUES("","20202","TH","2001","201","10","10","7.5","6","8","9","8.3");
INSERT INTO diem VALUES("","20202","NV","2001","201","10","10","7.5","6","8","9","8.3");
INSERT INTO diem VALUES("","20202","TA","2002","201","7","8","6","8","9","10","8.5");
INSERT INTO diem VALUES("","20202","CN","2002","201","7","8","6","8","9","10","8.5");
INSERT INTO diem VALUES("","20202","GD","2002","201","7","8","6","8","9","10","8.5");
INSERT INTO diem VALUES("","20202","HH","2002","201","7","8","6","8","9","10","8.5");
INSERT INTO diem VALUES("","20202","LS","2002","201","7","8","6","8","9","10","8.5");
INSERT INTO diem VALUES("","20202","GT","2002","201","7","8","6","8","9","10","8.5");
INSERT INTO diem VALUES("","20202","TH","2002","201","7","8","6","8","9","10","8.5");
INSERT INTO diem VALUES("","20202","NV","2002","201","7","8","6","8","9","10","8.5");
INSERT INTO diem VALUES("","20202","TA","2003","201","7","8","4.5","6","8","7.5","7");
INSERT INTO diem VALUES("","20202","CN","2003","201","7","8","4.5","6","8","7.5","7");
INSERT INTO diem VALUES("","20202","GD","2003","201","7","8","4.5","6","8","7.5","7");
INSERT INTO diem VALUES("","20202","HH","2003","201","7","8","4.5","6","8","7.5","7");
INSERT INTO diem VALUES("","20202","LS","2003","201","7","8","4.5","6","8","7.5","7");
INSERT INTO diem VALUES("","20202","GT","2003","201","7","8","4.5","6","8","7.5","7");
INSERT INTO diem VALUES("","20202","TH","2003","201","7","8","4.5","6","8","7.5","7");
INSERT INTO diem VALUES("","20202","NV","2003","201","7","8","4.5","6","8","7.5","7");

-- 12C2
-- HK1
INSERT INTO diem VALUES("","20201","TA","2004","202","8","5","6","7","5","9","7");
INSERT INTO diem VALUES("","20201","CN","2004","202","8","5","6","7","5","9","7");
INSERT INTO diem VALUES("","20201","GD","2004","202","8","5","6","7","5","9","7");
INSERT INTO diem VALUES("","20201","HH","2004","202","8","5","6","7","5","9","7");
INSERT INTO diem VALUES("","20201","LS","2004","202","8","5","6","7","5","9","7");
INSERT INTO diem VALUES("","20201","GT","2004","202","8","5","6","7","5","9","7");
INSERT INTO diem VALUES("","20201","TH","2004","202","8","5","6","7","5","9","7");
INSERT INTO diem VALUES("","20201","NV","2004","202","8","5","6","7","5","9","7");
INSERT INTO diem VALUES("","20201","TA","2005","202","10","8","9","7","7.5","8","8");
INSERT INTO diem VALUES("","20201","CN","2005","202","10","8","9","7","7.5","8","8");
INSERT INTO diem VALUES("","20201","GD","2005","202","10","8","9","7","7.5","8","8");
INSERT INTO diem VALUES("","20201","HH","2005","202","10","8","9","7","7.5","8","8");
INSERT INTO diem VALUES("","20201","LS","2005","202","10","8","9","7","7.5","8","8");
INSERT INTO diem VALUES("","20201","GT","2005","202","10","8","9","7","7.5","8","8");
INSERT INTO diem VALUES("","20201","TH","2005","202","10","8","9","7","7.5","8","8");
INSERT INTO diem VALUES("","20201","NV","2005","202","10","8","9","7","7.5","8","8");
INSERT INTO diem VALUES("","20201","TA","2006","202","7","8","4.5","6","8","7.5","7");
INSERT INTO diem VALUES("","20201","CN","2006","202","7","8","4.5","6","8","7.5","7");
INSERT INTO diem VALUES("","20201","GD","2006","202","7","8","4.5","6","8","7.5","7");
INSERT INTO diem VALUES("","20201","HH","2006","202","7","8","4.5","6","8","7.5","7");
INSERT INTO diem VALUES("","20201","LS","2006","202","7","8","4.5","6","8","7.5","7");
INSERT INTO diem VALUES("","20201","GT","2006","202","7","8","4.5","6","8","7.5","7");
INSERT INTO diem VALUES("","20201","TH","2006","202","7","8","4.5","6","8","7.5","7");
INSERT INTO diem VALUES("","20201","NV","2006","202","7","8","4.5","6","8","7.5","7");
-- HK2
INSERT INTO diem VALUES("","20202","TA","2004","202","8","5","6","7","5","9","7");
INSERT INTO diem VALUES("","20202","CN","2004","202","8","5","6","7","5","9","7");
INSERT INTO diem VALUES("","20202","GD","2004","202","8","5","6","7","5","9","7");
INSERT INTO diem VALUES("","20202","HH","2004","202","8","5","6","7","5","9","7");
INSERT INTO diem VALUES("","20202","LS","2004","202","8","5","6","7","5","9","7");
INSERT INTO diem VALUES("","20202","GT","2004","202","8","5","6","7","5","9","7");
INSERT INTO diem VALUES("","20202","TH","2004","202","8","5","6","7","5","9","7");
INSERT INTO diem VALUES("","20202","NV","2004","202","8","5","6","7","5","9","7");
INSERT INTO diem VALUES("","20202","TA","2005","202","10","8","9","7","7.5","8","8");
INSERT INTO diem VALUES("","20202","CN","2005","202","10","8","9","7","7.5","8","8");
INSERT INTO diem VALUES("","20202","GD","2005","202","10","8","9","7","7.5","8","8");
INSERT INTO diem VALUES("","20202","HH","2005","202","10","8","9","7","7.5","8","8");
INSERT INTO diem VALUES("","20202","LS","2005","202","10","8","9","7","7.5","8","8");
INSERT INTO diem VALUES("","20202","GT","2005","202","10","8","9","7","7.5","8","8");
INSERT INTO diem VALUES("","20202","TH","2005","202","10","8","9","7","7.5","8","8");
INSERT INTO diem VALUES("","20202","NV","2005","202","10","8","9","7","7.5","8","8");
INSERT INTO diem VALUES("","20202","TA","2006","202","7","8","4.5","6","8","7.5","7");
INSERT INTO diem VALUES("","20202","CN","2006","202","7","8","4.5","6","8","7.5","7");
INSERT INTO diem VALUES("","20202","GD","2006","202","7","8","4.5","6","8","7.5","7");
INSERT INTO diem VALUES("","20202","HH","2006","202","7","8","4.5","6","8","7.5","7");
INSERT INTO diem VALUES("","20202","LS","2006","202","7","8","4.5","6","8","7.5","7");
INSERT INTO diem VALUES("","20202","GT","2006","202","7","8","4.5","6","8","7.5","7");
INSERT INTO diem VALUES("","20202","TH","2006","202","7","8","4.5","6","8","7.5","7");
INSERT INTO diem VALUES("","20202","NV","2006","202","7","8","4.5","6","8","7.5","7");

-- 12C3
-- HK1
INSERT INTO diem VALUES("","20201","TA","2007","203","8","5","6","7","5","9","7");
INSERT INTO diem VALUES("","20201","CN","2007","203","8","5","6","7","5","9","7");
INSERT INTO diem VALUES("","20201","GD","2007","203","8","5","6","7","5","9","7");
INSERT INTO diem VALUES("","20201","HH","2007","203","8","5","6","7","5","9","7");
INSERT INTO diem VALUES("","20201","LS","2007","203","8","5","6","7","5","9","7");
INSERT INTO diem VALUES("","20201","GT","2007","203","8","5","6","7","5","9","7");
INSERT INTO diem VALUES("","20201","TH","2007","203","8","5","6","7","5","9","7");
INSERT INTO diem VALUES("","20201","NV","2007","203","8","5","6","7","5","9","7");
INSERT INTO diem VALUES("","20201","TA","2008","203","10","8","9","7","7.5","8","8");
INSERT INTO diem VALUES("","20201","CN","2008","203","10","8","9","7","7.5","8","8");
INSERT INTO diem VALUES("","20201","GD","2008","203","10","8","9","7","7.5","8","8");
INSERT INTO diem VALUES("","20201","HH","2008","203","10","8","9","7","7.5","8","8");
INSERT INTO diem VALUES("","20201","LS","2008","203","10","8","9","7","7.5","8","8");
INSERT INTO diem VALUES("","20201","GT","2008","203","10","8","9","7","7.5","8","8");
INSERT INTO diem VALUES("","20201","TH","2008","203","10","8","9","7","7.5","8","8");
INSERT INTO diem VALUES("","20201","NV","2008","203","10","8","9","7","7.5","8","8");
INSERT INTO diem VALUES("","20201","TA","2009","203","7","8","4.5","6","8","7.5","7");
INSERT INTO diem VALUES("","20201","CN","2009","203","7","8","4.5","6","8","7.5","7");
INSERT INTO diem VALUES("","20201","GD","2009","203","7","8","4.5","6","8","7.5","7");
INSERT INTO diem VALUES("","20201","HH","2009","203","7","8","4.5","6","8","7.5","7");
INSERT INTO diem VALUES("","20201","LS","2009","203","7","8","4.5","6","8","7.5","7");
INSERT INTO diem VALUES("","20201","GT","2009","203","7","8","4.5","6","8","7.5","7");
INSERT INTO diem VALUES("","20201","TH","2009","203","7","8","4.5","6","8","7.5","7");
INSERT INTO diem VALUES("","20201","NV","2009","203","7","8","4.5","6","8","7.5","7");
-- HK2
INSERT INTO diem VALUES("","20202","TA","2007","203","8","5","6","7","5","9","7");
INSERT INTO diem VALUES("","20202","CN","2007","203","8","5","6","7","5","9","7");
INSERT INTO diem VALUES("","20202","GD","2007","203","8","5","6","7","5","9","7");
INSERT INTO diem VALUES("","20202","HH","2007","203","8","5","6","7","5","9","7");
INSERT INTO diem VALUES("","20202","LS","2007","203","8","5","6","7","5","9","7");
INSERT INTO diem VALUES("","20202","GT","2007","203","8","5","6","7","5","9","7");
INSERT INTO diem VALUES("","20202","TH","2007","203","8","5","6","7","5","9","7");
INSERT INTO diem VALUES("","20202","NV","2007","203","8","5","6","7","5","9","7");
INSERT INTO diem VALUES("","20202","TA","2008","203","10","8","9","7","7.5","8","8");
INSERT INTO diem VALUES("","20202","CN","2008","203","10","8","9","7","7.5","8","8");
INSERT INTO diem VALUES("","20202","GD","2008","203","10","8","9","7","7.5","8","8");
INSERT INTO diem VALUES("","20202","HH","2008","203","10","8","9","7","7.5","8","8");
INSERT INTO diem VALUES("","20202","LS","2008","203","10","8","9","7","7.5","8","8");
INSERT INTO diem VALUES("","20202","GT","2008","203","10","8","9","7","7.5","8","8");
INSERT INTO diem VALUES("","20202","TH","2008","203","10","8","9","7","7.5","8","8");
INSERT INTO diem VALUES("","20202","NV","2008","203","10","8","9","7","7.5","8","8");
INSERT INTO diem VALUES("","20202","TA","2009","203","7","8","4.5","6","8","7.5","7");
INSERT INTO diem VALUES("","20202","CN","2009","203","7","8","4.5","6","8","7.5","7");
INSERT INTO diem VALUES("","20202","GD","2009","203","7","8","4.5","6","8","7.5","7");
INSERT INTO diem VALUES("","20202","HH","2009","203","7","8","4.5","6","8","7.5","7");
INSERT INTO diem VALUES("","20202","LS","2009","203","7","8","4.5","6","8","7.5","7");
INSERT INTO diem VALUES("","20202","GT","2009","203","7","8","4.5","6","8","7.5","7");
INSERT INTO diem VALUES("","20202","TH","2009","203","7","8","4.5","6","8","7.5","7");
INSERT INTO diem VALUES("","20202","NV","2009","203","7","8","4.5","6","8","7.5","7");

-- dayhoc
-- 10A1
-- HK1
INSERT INTO dayhoc VALUES("","TA","1","221","20221","Ti???ng anh - 10A1 - H???c k??? I 22-23");
INSERT INTO dayhoc VALUES("","CN","2","221","20221","C??ng ngh??? - 10A1 - H???c k??? I 22-23");
INSERT INTO dayhoc VALUES("","GD","3","221","20221","Gi??o D???c C??ng D??n - 10A1 - H???c k??? I 22-23");
INSERT INTO dayhoc VALUES("","HH","4","221","20221","H??a H???c - 10A1 - H???c k??? I 22-23");
INSERT INTO dayhoc VALUES("","LS","5","221","20221","L???ch S??? - 10A1 - H???c k??? I 22-23");
INSERT INTO dayhoc VALUES("","GT","6","221","20221","Gi???i T??ch - 10A1 - H???c k??? I 22-23");
INSERT INTO dayhoc VALUES("","TH","7","221","20221","Tin H???c - 10A1 - H???c k??? I 22-23");
INSERT INTO dayhoc VALUES("","NV","8","221","20221","Ng??? V??n - 10A1 - H???c k??? I 22-23");
-- HK2
INSERT INTO dayhoc VALUES("","TA","1","221","20222","Ti???ng anh - 10A1 - H???c k??? II 22-23");
INSERT INTO dayhoc VALUES("","CN","2","221","20222","C??ng ngh??? - 10A1 - H???c k??? II 22-23");
INSERT INTO dayhoc VALUES("","GD","3","221","20222","Gi??o D???c C??ng D??n - 10A1 - H???c k??? II 22-23");
INSERT INTO dayhoc VALUES("","HH","4","221","20222","H??a H???c - 10A1 - H???c k??? II 22-23");
INSERT INTO dayhoc VALUES("","LS","5","221","20222","L???ch S??? - 10A1 - H???c k??? II 22-23");
INSERT INTO dayhoc VALUES("","GT","6","221","20222","Gi???i T??ch - 10A1 - H???c k??? II 22-23");
INSERT INTO dayhoc VALUES("","TH","7","221","20222","Tin H???c - 10A1 - H???c k??? II 22-23");
INSERT INTO dayhoc VALUES("","NV","8","221","20222","Ng??? V??n - 10A1 - H???c k??? II 22-23");

-- 10A2
-- HK1
INSERT INTO dayhoc VALUES("","TA","1","222","20221","Ti???ng anh - 10A2 - H???c k??? I 22-23");
INSERT INTO dayhoc VALUES("","CN","2","222","20221","C??ng ngh??? - 10A2 - H???c k??? I 22-23");
INSERT INTO dayhoc VALUES("","GD","3","222","20221","Gi??o D???c C??ng D??n - 10A2 - H???c k??? I 22-23");
INSERT INTO dayhoc VALUES("","HH","4","222","20221","H??a H???c - 10A2 - H???c k??? I 22-23");
INSERT INTO dayhoc VALUES("","LS","5","222","20221","L???ch S??? - 10A2 - H???c k??? I 22-23");
INSERT INTO dayhoc VALUES("","GT","6","222","20221","Gi???i T??ch - 10A2 - H???c k??? I 22-23");
INSERT INTO dayhoc VALUES("","TH","7","222","20221","Tin H???c - 10A2 - H???c k??? I 22-23");
INSERT INTO dayhoc VALUES("","NV","8","222","20221","Ng??? V??n - 10A2 - H???c k??? I 22-23");
-- HK2
INSERT INTO dayhoc VALUES("","TA","1","222","20222","Ti???ng anh - 10A2 - H???c k??? II 22-23");
INSERT INTO dayhoc VALUES("","CN","2","222","20222","C??ng ngh??? - 10A2 - H???c k??? II 22-23");
INSERT INTO dayhoc VALUES("","GD","3","222","20222","Gi??o D???c C??ng D??n - 10A2 - H???c k??? II 22-23");
INSERT INTO dayhoc VALUES("","HH","4","222","20222","H??a H???c - 10A2 - H???c k??? II 22-23");
INSERT INTO dayhoc VALUES("","LS","5","222","20222","L???ch S??? - 10A2 - H???c k??? II 22-23");
INSERT INTO dayhoc VALUES("","GT","6","222","20222","Gi???i T??ch - 10A2 - H???c k??? II 22-23");
INSERT INTO dayhoc VALUES("","TH","7","222","20222","Tin H???c - 10A2 - H???c k??? II 22-23");
INSERT INTO dayhoc VALUES("","NV","8","222","20222","Ng??? V??n - 10A2 - H???c k??? II 22-23");

-- 10A3
-- HK1
INSERT INTO dayhoc VALUES("","TA","1","223","20221","Ti???ng anh - 10A3 - H???c k??? I 22-23");
INSERT INTO dayhoc VALUES("","CN","2","223","20221","C??ng ngh??? - 10A3 - H???c k??? I 22-23");
INSERT INTO dayhoc VALUES("","GD","3","223","20221","Gi??o D???c C??ng D??n - 10A3 - H???c k??? I 22-23");
INSERT INTO dayhoc VALUES("","HH","4","223","20221","H??a H???c - 10A3 - H???c k??? I 22-23");
INSERT INTO dayhoc VALUES("","LS","5","223","20221","L???ch S??? - 10A3 - H???c k??? I 22-23");
INSERT INTO dayhoc VALUES("","GT","6","223","20221","Gi???i T??ch - 10A3 - H???c k??? I 22-23");
INSERT INTO dayhoc VALUES("","TH","7","223","20221","Tin H???c - 10A3 - H???c k??? I 22-23");
INSERT INTO dayhoc VALUES("","NV","8","223","20221","Ng??? V??n - 10A3 - H???c k??? I 22-23");
-- HK2
INSERT INTO dayhoc VALUES("","TA","1","223","20222","Ti???ng anh - 10A3 - H???c k??? II 22-23");
INSERT INTO dayhoc VALUES("","CN","2","223","20222","C??ng ngh??? - 10A3 - H???c k??? II 22-23");
INSERT INTO dayhoc VALUES("","GD","3","223","20222","Gi??o D???c C??ng D??n - 10A3 - H???c k??? II 22-23");
INSERT INTO dayhoc VALUES("","HH","4","223","20222","H??a H???c - 10A3 - H???c k??? II 22-23");
INSERT INTO dayhoc VALUES("","LS","5","223","20222","L???ch S??? - 10A3 - H???c k??? II 22-23");
INSERT INTO dayhoc VALUES("","GT","6","223","20222","Gi???i T??ch - 10A3 - H???c k??? II 22-23");
INSERT INTO dayhoc VALUES("","TH","7","223","20222","Tin H???c - 10A3 - H???c k??? II 22-23");
INSERT INTO dayhoc VALUES("","NV","8","223","20222","Ng??? V??n - 10A3 - H???c k??? II 22-23");

-- 11A1
-- HK1
INSERT INTO dayhoc VALUES("","TA","1","211","20211","Ti???ng anh - 11A1 - H???c k??? I 21-22");
INSERT INTO dayhoc VALUES("","CN","2","211","20211","C??ng ngh??? - 11A1 - H???c k??? I 21-22");
INSERT INTO dayhoc VALUES("","GD","3","211","20211","Gi??o D???c C??ng D??n - 11A1 - H???c k??? I 21-22");
INSERT INTO dayhoc VALUES("","HH","4","211","20211","H??a H???c - 11A1 - H???c k??? I 21-22");
INSERT INTO dayhoc VALUES("","LS","5","211","20211","L???ch S??? - 11A1 - H???c k??? I 21-22");
INSERT INTO dayhoc VALUES("","GT","6","211","20211","Gi???i T??ch - 11A1 - H???c k??? I 21-22");
INSERT INTO dayhoc VALUES("","TH","7","211","20211","Tin H???c - 11A1 - H???c k??? I 21-22");
INSERT INTO dayhoc VALUES("","NV","8","211","20211","Ng??? V??n - 11A1 - H???c k??? I 21-22");
-- HK2
INSERT INTO dayhoc VALUES("","TA","1","211","20212","Ti???ng anh - 11A1 - H???c k??? II 21-22");
INSERT INTO dayhoc VALUES("","CN","2","211","20212","C??ng ngh??? - 11A1 - H???c k??? II 21-22");
INSERT INTO dayhoc VALUES("","GD","3","211","20212","Gi??o D???c C??ng D??n - 11A1 - H???c k??? II 21-22");
INSERT INTO dayhoc VALUES("","HH","4","211","20212","H??a H???c - 11A1 - H???c k??? II 21-22");
INSERT INTO dayhoc VALUES("","LS","5","211","20212","L???ch S??? - 11A1 - H???c k??? II 21-22");
INSERT INTO dayhoc VALUES("","GT","6","211","20212","Gi???i T??ch - 11A1 - H???c k??? II 21-22");
INSERT INTO dayhoc VALUES("","TH","7","211","20212","Tin H???c - 11A1 - H???c k??? II 21-22");
INSERT INTO dayhoc VALUES("","NV","8","211","20212","Ng??? V??n - 11A1 - H???c k??? II 21-22");

-- 11A2
-- HK1
INSERT INTO dayhoc VALUES("","TA","1","212","20211","Ti???ng anh - 11A2 - H???c k??? I 21-22");
INSERT INTO dayhoc VALUES("","CN","2","212","20211","C??ng ngh??? - 11A2 - H???c k??? I 21-22");
INSERT INTO dayhoc VALUES("","GD","3","212","20211","Gi??o D???c C??ng D??n - 11A2 - H???c k??? I 21-22");
INSERT INTO dayhoc VALUES("","HH","4","212","20211","H??a H???c - 11A2 - H???c k??? I 21-22");
INSERT INTO dayhoc VALUES("","LS","5","212","20211","L???ch S??? - 11A2 - H???c k??? I 21-22");
INSERT INTO dayhoc VALUES("","GT","6","212","20211","Gi???i T??ch - 11A2 - H???c k??? I 21-22");
INSERT INTO dayhoc VALUES("","TH","7","212","20211","Tin H???c - 11A2 - H???c k??? I 21-22");
INSERT INTO dayhoc VALUES("","NV","8","212","20211","Ng??? V??n - 11A2 - H???c k??? I 21-22");
-- HK2
INSERT INTO dayhoc VALUES("","TA","1","212","20212","Ti???ng anh - 11A2 - H???c k??? II 21-22");
INSERT INTO dayhoc VALUES("","CN","2","212","20212","C??ng ngh??? - 11A2 - H???c k??? II 21-22");
INSERT INTO dayhoc VALUES("","GD","3","212","20212","Gi??o D???c C??ng D??n - 11A2 - H???c k??? II 21-22");
INSERT INTO dayhoc VALUES("","HH","4","212","20212","H??a H???c - 11A2 - H???c k??? II 21-22");
INSERT INTO dayhoc VALUES("","LS","5","212","20212","L???ch S??? - 11A2 - H???c k??? II 21-22");
INSERT INTO dayhoc VALUES("","GT","6","212","20212","Gi???i T??ch - 11A2 - H???c k??? II 21-22");
INSERT INTO dayhoc VALUES("","TH","7","212","20212","Tin H???c - 11A2 - H???c k??? II 21-22");
INSERT INTO dayhoc VALUES("","NV","8","212","20212","Ng??? V??n - 11A2 - H???c k??? II 21-22");

-- 11A3
-- HK1
INSERT INTO dayhoc VALUES("","TA","1","213","20211","Ti???ng anh - 11A3 - H???c k??? I 21-22");
INSERT INTO dayhoc VALUES("","CN","2","213","20211","C??ng ngh??? - 11A3 - H???c k??? I 21-22");
INSERT INTO dayhoc VALUES("","GD","3","213","20211","Gi??o D???c C??ng D??n - 11A3 - H???c k??? I 21-22");
INSERT INTO dayhoc VALUES("","HH","4","213","20211","H??a H???c - 11A3 - H???c k??? I 21-22");
INSERT INTO dayhoc VALUES("","LS","5","213","20211","L???ch S??? - 11A3 - H???c k??? I 21-22");
INSERT INTO dayhoc VALUES("","GT","6","213","20211","Gi???i T??ch - 11A3 - H???c k??? I 21-22");
INSERT INTO dayhoc VALUES("","TH","7","213","20211","Tin H???c - 11A3 - H???c k??? I 21-22");
INSERT INTO dayhoc VALUES("","NV","8","213","20211","Ng??? V??n - 11A3 - H???c k??? I 21-22");
-- HK2
INSERT INTO dayhoc VALUES("","TA","1","213","20212","Ti???ng anh - 11A3 - H???c k??? II 21-22");
INSERT INTO dayhoc VALUES("","CN","2","213","20212","C??ng ngh??? - 11A3 - H???c k??? II 21-22");
INSERT INTO dayhoc VALUES("","GD","3","213","20212","Gi??o D???c C??ng D??n - 11A3 - H???c k??? II 21-22");
INSERT INTO dayhoc VALUES("","HH","4","213","20212","H??a H???c - 11A3 - H???c k??? II 21-22");
INSERT INTO dayhoc VALUES("","LS","5","213","20212","L???ch S??? - 11A3 - H???c k??? II 21-22");
INSERT INTO dayhoc VALUES("","GT","6","213","20212","Gi???i T??ch - 11A3 - H???c k??? II 21-22");
INSERT INTO dayhoc VALUES("","TH","7","213","20212","Tin H???c - 11A3 - H???c k??? II 21-22");
INSERT INTO dayhoc VALUES("","NV","8","213","20212","Ng??? V??n - 11A3 - H???c k??? II 21-22");

-- 12C1
-- HK1
INSERT INTO dayhoc VALUES("","TA","1","201","20201","Ti???ng anh - 12C1 - H???c k??? I 20-21");
INSERT INTO dayhoc VALUES("","CN","2","201","20201","C??ng ngh??? - 12C1 - H???c k??? I 20-21");
INSERT INTO dayhoc VALUES("","GD","3","201","20201","Gi??o D???c C??ng D??n - 12C1 - H???c k??? I 20-21");
INSERT INTO dayhoc VALUES("","HH","4","201","20201","H??a H???c - 12C1 - H???c k??? I 20-21");
INSERT INTO dayhoc VALUES("","LS","5","201","20201","L???ch S??? - 12C1 - H???c k??? I 20-21");
INSERT INTO dayhoc VALUES("","GT","6","201","20201","Gi???i T??ch - 12C1 - H???c k??? I 20-21");
INSERT INTO dayhoc VALUES("","TH","7","201","20201","Tin H???c - 12C1 - H???c k??? I 20-21");
INSERT INTO dayhoc VALUES("","NV","8","201","20201","Ng??? V??n - 12C1 - H???c k??? I 20-21");
-- HK2
INSERT INTO dayhoc VALUES("","TA","1","201","20202","Ti???ng anh - 12C1 - H???c k??? II 20-21");
INSERT INTO dayhoc VALUES("","CN","2","201","20202","C??ng ngh??? - 12C1 - H???c k??? II 20-21");
INSERT INTO dayhoc VALUES("","GD","3","201","20202","Gi??o D???c C??ng D??n - 12C1 - H???c k??? II 20-21");
INSERT INTO dayhoc VALUES("","HH","4","201","20202","H??a H???c - 12C1 - H???c k??? II 20-21");
INSERT INTO dayhoc VALUES("","LS","5","201","20202","L???ch S??? - 12C1 - H???c k??? II 20-21");
INSERT INTO dayhoc VALUES("","GT","6","201","20202","Gi???i T??ch - 12C1 - H???c k??? II 20-21");
INSERT INTO dayhoc VALUES("","TH","7","201","20202","Tin H???c - 12C1 - H???c k??? II 20-21");
INSERT INTO dayhoc VALUES("","NV","8","201","20202","Ng??? V??n - 12C1 - H???c k??? II 20-21");

-- 12C2
-- HK1
INSERT INTO dayhoc VALUES("","TA","1","202","20201","Ti???ng anh - 12C2 - H???c k??? I 20-21");
INSERT INTO dayhoc VALUES("","CN","2","202","20201","C??ng ngh??? - 12C2 - H???c k??? I 20-21");
INSERT INTO dayhoc VALUES("","GD","3","202","20201","Gi??o D???c C??ng D??n - 12C2 - H???c k??? I 20-21");
INSERT INTO dayhoc VALUES("","HH","4","202","20201","H??a H???c - 12C2 - H???c k??? I 20-21");
INSERT INTO dayhoc VALUES("","LS","5","202","20201","L???ch S??? - 12C2 - H???c k??? I 20-21");
INSERT INTO dayhoc VALUES("","GT","6","202","20201","Gi???i T??ch - 12C2 - H???c k??? I 20-21");
INSERT INTO dayhoc VALUES("","TH","7","202","20201","Tin H???c - 12C2 - H???c k??? I 20-21");
INSERT INTO dayhoc VALUES("","NV","8","202","20201","Ng??? V??n - 12C2 - H???c k??? I 20-21");
-- HK2
INSERT INTO dayhoc VALUES("","TA","1","202","20202","Ti???ng anh - 12C2 - H???c k??? II 20-21");
INSERT INTO dayhoc VALUES("","CN","2","202","20202","C??ng ngh??? - 12C2 - H???c k??? II 20-21");
INSERT INTO dayhoc VALUES("","GD","3","202","20202","Gi??o D???c C??ng D??n - 12C2 - H???c k??? II 20-21");
INSERT INTO dayhoc VALUES("","HH","4","202","20202","H??a H???c - 12C2 - H???c k??? II 20-21");
INSERT INTO dayhoc VALUES("","LS","5","202","20202","L???ch S??? - 12C2 - H???c k??? II 20-21");
INSERT INTO dayhoc VALUES("","GT","6","202","20202","Gi???i T??ch - 12C2 - H???c k??? II 20-21");
INSERT INTO dayhoc VALUES("","TH","7","202","20202","Tin H???c - 12C2 - H???c k??? II 20-21");
INSERT INTO dayhoc VALUES("","NV","8","202","20202","Ng??? V??n - 12C2 - H???c k??? II 20-21");

-- 12C3
-- HK1
INSERT INTO dayhoc VALUES("","TA","1","203","20201","Ti???ng anh - 12C3 - H???c k??? I 20-21");
INSERT INTO dayhoc VALUES("","CN","2","203","20201","C??ng ngh??? - 12C3 - H???c k??? I 20-21");
INSERT INTO dayhoc VALUES("","GD","3","203","20201","Gi??o D???c C??ng D??n - 12C3 - H???c k??? I 20-21");
INSERT INTO dayhoc VALUES("","HH","4","203","20201","H??a H???c - 12C3 - H???c k??? I 20-21");
INSERT INTO dayhoc VALUES("","LS","5","203","20201","L???ch S??? - 12C3 - H???c k??? I 20-21");
INSERT INTO dayhoc VALUES("","GT","6","203","20201","Gi???i T??ch - 12C3 - H???c k??? I 20-21");
INSERT INTO dayhoc VALUES("","TH","7","203","20201","Tin H???c - 12C3 - H???c k??? I 20-21");
INSERT INTO dayhoc VALUES("","NV","8","203","20201","Ng??? V??n - 12C3 - H???c k??? I 20-21");
-- HK2
INSERT INTO dayhoc VALUES("","TA","1","203","20202","Ti???ng anh - 12C3 - H???c k??? II 20-21");
INSERT INTO dayhoc VALUES("","CN","2","203","20202","C??ng ngh??? - 12C3 - H???c k??? II 20-21");
INSERT INTO dayhoc VALUES("","GD","3","203","20202","Gi??o D???c C??ng D??n - 12C3 - H???c k??? II 20-21");
INSERT INTO dayhoc VALUES("","HH","4","203","20202","H??a H???c - 12C3 - H???c k??? II 20-21");
INSERT INTO dayhoc VALUES("","LS","5","203","20202","L???ch S??? - 12C3 - H???c k??? II 20-21");
INSERT INTO dayhoc VALUES("","GT","6","203","20202","Gi???i T??ch - 12C3 - H???c k??? II 20-21");
INSERT INTO dayhoc VALUES("","TH","7","203","20202","Tin H???c - 12C3 - H???c k??? II 20-21");
INSERT INTO dayhoc VALUES("","NV","8","203","20202","Ng??? V??n - 12C3 - H???c k??? II 20-21");


-- namhoc
INSERT INTO namhoc VALUES("1","20-21");
INSERT INTO namhoc VALUES("2","21-22");
INSERT INTO namhoc VALUES("3","22-23");


-- thongke
INSERT INTO thongke VALUES("","2201","221","22-23","8.3");
INSERT INTO thongke VALUES("","2202","221","22-23","7");
INSERT INTO thongke VALUES("","2203","221","22-23","8.5");
INSERT INTO thongke VALUES("","2204","222","22-23","7");
INSERT INTO thongke VALUES("","2205","222","22-23","8");
INSERT INTO thongke VALUES("","2206","222","22-23","4.2");
INSERT INTO thongke VALUES("","2207","223","22-23","7");
INSERT INTO thongke VALUES("","2208","223","22-23","7");
INSERT INTO thongke VALUES("","2209","223","22-23","7");
INSERT INTO thongke VALUES("","2101","211","21-22","8.3");
INSERT INTO thongke VALUES("","2102","211","21-22","7");
INSERT INTO thongke VALUES("","2103","211","21-22","8.5");
INSERT INTO thongke VALUES("","2104","212","21-22","7");
INSERT INTO thongke VALUES("","2105","212","21-22","7");
INSERT INTO thongke VALUES("","2106","212","21-22","7");
INSERT INTO thongke VALUES("","2107","213","21-22","7");
INSERT INTO thongke VALUES("","2108","213","21-22","8");
INSERT INTO thongke VALUES("","2109","213","21-22","4.2");
INSERT INTO thongke VALUES("","2001","201","20-21","8.3");
INSERT INTO thongke VALUES("","2002","201","20-21","7");
INSERT INTO thongke VALUES("","2003","201","20-21","8.5");
INSERT INTO thongke VALUES("","2004","202","20-21","7");
INSERT INTO thongke VALUES("","2005","202","20-21","8");
INSERT INTO thongke VALUES("","2006","202","20-21","7");
INSERT INTO thongke VALUES("","2007","203","20-21","7");
INSERT INTO thongke VALUES("","2008","203","20-21","8");
INSERT INTO thongke VALUES("","2009","203","20-21","7");
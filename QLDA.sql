﻿CREATE DATABASE BTQLDA

USE BTQLDA

GO
CREATE TABLE NHANVIEN
(
	MANV VARCHAR(5) NOT NULL PRIMARY KEY,
	HONV NVARCHAR(20) NOT NULL,
	TENLOT NVARCHAR(20) NOT NULL,
	TENNV NVARCHAR(10) NOT NULL,
	NGAYSINH DATE NOT NULL,
	DIACHI NVARCHAR(100) NOT NULL,
	PHAI NVARCHAR(5) NOT NULL,
	LUONG DECIMAL(10,2) NOT NULL,
	MAPB VARCHAR(5) NOT NULL
)

GO 
CREATE TABLE PHONGBAN
(
	MAPB VARCHAR(5) NOT NULL PRIMARY KEY,
	TENPB NVARCHAR(50) NOT NULL,
	TRUONGPHONG VARCHAR (5),
	NG_NHANCHUC DATE,
)

GO 
CREATE TABLE DEAN
(
	MADA VARCHAR(5) NOT NULL PRIMARY KEY,
	TENDA NVARCHAR(50) NOT NULL,
	DDIEM_DA NVARCHAR(100) NOT NULL,
	MAPB VARCHAR(5) NOT NULL
)

GO 
CREATE TABLE DDIEM_PB
(
	MAPB VARCHAR(5) NOT NULL,
	DIADIEM NVARCHAR (100) NOT NULL,
	PRIMARY KEY (MAPB,DIADIEM)
)
GO
CREATE TABLE PHANCONG
(
	MANV VARCHAR(5) NOT NULL,
	MADA VARCHAR(5) NOT NULL,
	PRIMARY KEY (MANV, MADA),
	THOIGIAN DECIMAL(5,1) NOT NULL
)

CREATE TABLE THANNHAN
(
	MANV VARCHAR(5) NOT NULL,
	TENTN NVARCHAR(30) NOT NULL,
	PRIMARY KEY (MANV , TENTN),
	PHAI NVARCHAR(5) NOT NULL,
	NGAYSINH DATE NOT NULL,
	QUANHE NVARCHAR(20) NOT NULL
)


ALTER TABLE NHANVIEN
ADD CONSTRAINT FK_NV_PB FOREIGN KEY (MAPB) REFERENCES PHONGBAN(MAPB)

ALTER TABLE PHONGBAN
ADD CONSTRAINT FK_PB2_NV FOREIGN KEY (TRUONGPHONG) REFERENCES NHANVIEN(MANV)

ALTER TABLE DDIEM_PB
ADD CONSTRAINT FK_DDPB_PB FOREIGN KEY (MAPB) REFERENCES PHONGBAN(MAPB)

ALTER TABLE DEAN
ADD CONSTRAINT FK_DE_PB FOREIGN KEY (MAPB) REFERENCES PHONGBAN(MAPB)

ALTER TABLE PHANCONG
ADD CONSTRAINT FK_PC_DE FOREIGN KEY (MADA) REFERENCES DEAN(MADA)

ALTER TABLE PHANCONG
ADD CONSTRAINT FK_PC_NV FOREIGN KEY (MANV) REFERENCES NHANVIEN(MANV)

ALTER TABLE THANNHAN
ADD CONSTRAINT FK_TN_NV FOREIGN KEY (MANV) REFERENCES NHANVIEN(MANV)

--===================================================================================================

INSERT INTO NHANVIEN
VALUES ('NV1', 'DINH', 'BA', 'TIEN', '1/9/1965', '731 Tran Hung Dao, q1, TPHCM', N'NAM', 30000, 'P3')
INSERT INTO NHANVIEN
VALUES ('NV2', 'VO', 'THANH', 'TUNG', '12/8/1955', '638 Tran Hung Dao',  N'NAM', 40000, 'P3')
INSERT INTO NHANVIEN
VALUES ('NV3', 'TRAN', 'THANH', 'TAM', '7/31/1972', '853 Mai Thi Luu, Q1, TPHCM',  N'NAM', 25000, 'P2')
INSERT INTO NHANVIEN
VALUES ('NV4', 'VO', 'MANH', 'HUNG', '9/15/1962', '975 Ba Ria, Vung Tau',  N'NAM', 38000, 'P2')
INSERT INTO NHANVIEN
VALUES ('NV5', 'LE', 'NGOC', 'QUYEN', '10/10/1977', '450 Trung Vuong, Ha Noi', N'NỮ', 55000, 'P1')
INSERT INTO NHANVIEN
VALUES ('NV6', 'TRAN', 'MINH', 'KHANG', '6/24/1962', 'Tran Binh Trong, TPHCM',  N'NAM', 58000, 'P1')
INSERT INTO NHANVIEN
VALUES ('NV7', 'LE', 'THI', 'NHAN', '6/20/1961', '291 Ho Van Huc, QPN, TPHCM', N'NỮ', 43000, 'P3')
INSERT INTO NHANVIEN
VALUES ('NV8', 'TRAN', 'HONG', 'QUANG', '3/29/1979', '980 Le Hong Phong, Q10, TPHCM', 1, 25000, 'P2')
INSERT INTO NHANVIEN
VALUES ('NV9', 'BUI', 'THUY', 'VU', '7/19/1958', '332 Nguyen Thai Hoc, Q1, TPHCM', N'NỮ', 25000, 'P1')


INSERT INTO  PHONGBAN
VALUES ('P1', 'QUANLY', 'NV5', '6/19/2001')
INSERT INTO  PHONGBAN
VALUES ('P2', 'DIEUHANH', 'NV8', '1/1/1985')
INSERT INTO  PHONGBAN
VALUES ('P3', 'NGHIENCUU', 'NV2', '5/22/1998')

INSERT INTO THANNHAN
VALUES ('NV1', N'DINH BA KIEN', N'NAM', '1995/7/15', N'CON TRAI')
INSERT INTO THANNHAN
VALUES ('NV1', N'NGUYEN THANH THAO', N'NỮ', '1968/4/8', N'VỢ')
INSERT INTO THANNHAN
VALUES ('NV2', N'VO THANH SON', N'NAM', '1930/9/23', N'CHA')
INSERT INTO THANNHAN
VALUES ('NV3', N'LE THI HUONG', N'NỮ', '1974/1/9', N'VỢ')
INSERT INTO THANNHAN
VALUES ('NV6', N'TRAN MINH AN', N'NAM', '1960/8/5', N'ANH TRAI')
INSERT INTO THANNHAN
VALUES ('NV7', N'LE THI NGAN', N'NỮ', '1965/6/7', N'EM GÁI')
INSERT INTO THANNHAN
VALUES ('NV9', N'TRAN QUOC VUONG', N'NAM', '1975/5/5', N'CHỒNG')
INSERT INTO THANNHAN
VALUES ('NV3', N'TRAN LE NGOC HOA', N'NỮ', '1997/9/12', N'CON GÁI')


INSERT INTO DEAN
VALUES ('DA1', 'San pham X', 'VUNG TAU', 'P3')
INSERT INTO  DEAN
VALUES ('DA2', 'San pham Y', 'NHA TRANG', 'P3')
INSERT INTO  DEAN
VALUES ('DA3', 'San pham Z', 'TPHCM', 'P3')
INSERT INTO  DEAN
VALUES ('DA4', 'Tin hoc hoa', 'HA NO', 'P2')
INSERT INTO  DEAN
VALUES ('DA5', 'Cap quang', 'TPHCM', 'P1')
INSERT INTO  DEAN
VALUES ('DA6', 'Dao tao', 'HA NOI', 'P2')

INSERT INTO  PHANCONG
VALUES ('NV1', 'DA1', 32.5)
INSERT INTO  PHANCONG
VALUES ('NV1', 'DA2', 7.5)
INSERT INTO  PHANCONG
VALUES ('NV1', 'DA3', 10)
INSERT INTO  PHANCONG
VALUES ('NV2', 'DA3', 40)
INSERT INTO  PHANCONG
VALUES ('NV2', 'DA4', 20)
INSERT INTO  PHANCONG
VALUES ('NV2', 'DA5', 20)
INSERT INTO  PHANCONG
VALUES ('NV3', 'DA1', 20)
INSERT INTO  PHANCONG
VALUES ('NV3', 'DA2', 20)
INSERT INTO  PHANCONG
VALUES ('NV4', 'DA3', 10)
INSERT INTO  PHANCONG
VALUES ('NV5', 'DA4', 10)
INSERT INTO  PHANCONG
VALUES ('NV5', 'DA5', 10)
INSERT INTO  PHANCONG
VALUES ('NV7', 'DA6', 30)
INSERT INTO  PHANCONG
VALUES ('NV8', 'DA4', 10)
INSERT INTO  PHANCONG
VALUES ('NV8', 'DA6', 20)
INSERT INTO  PHANCONG
VALUES ('NV9', 'DA4', 15 )


INSERT INTO DDIEM_PB
VALUES ('P1', 'TPHCM')
INSERT INTO DDIEM_PB
VALUES ('P2', 'HA NOI')
INSERT INTO DDIEM_PB
VALUES ('P3', 'NHA TRANG')
INSERT INTO DDIEM_PB
VALUES ('P3', 'TPHCM')
INSERT INTO DDIEM_PB
VALUES ('P3', 'VUNG TAU' )
--=============================================================================================================================
--CÂU 1
SELECT HONV +' '+TENLOT+' '+TENNV AS 'TÊN NHÂN VIÊN' , DATEDIFF(YEAR , NGAYSINH,GETDATE()) AS TUỔI
FROM NHANVIEN
-- CÂU 2
SELECT MANV
FROM NHANVIEN
WHERE PHAI = N'NAM' AND DIACHI like '%Tran Hung Dao%'
--CÂU 3
SELECT  MANV, HONV, TENLOT, TENNV
FROM NHANVIEN
WHERE HONV LIKE '%LE%' AND TENNV LIKE 'N%'

--Câu 4:
SELECT *
FROM NHANVIEN
WHERE MONTH(NGAYSINH) = 7 AND YEAR(NGAYSINH) =1978
SELECT * FROM NHANVIEN

--CÂU 5
SELECT *
FROM NHANVIEN
WHERE DATEPART("q", NGAYSINH) = 3
--CÂU 6

SELECT A.MANV, A.TENNV, COUNT(B.MADA) AS SLDA
FROM NHANVIEN A, PHANCONG B
WHERE A.MANV = B.MANV
GROUP BY A.MANV, A.TENNV

--CÂU 7
SELECT HONV + ' ' + TENLOT+' ' + TENNV AS [Họ tên]
FROM dbo.NHANVIEN INNER JOIN dbo.THANNHAN ON THANNHAN.MANV = NHANVIEN.MANV
GROUP BY HONV + ' ' + TENLOT+' ' + TENNV
HAVING COUNT(THANNHAN.MANV)>=2

--CÂU 8
SELECT A.TENNV, C.DDIEM_DA, DATEDIFF(YEAR , A.NGAYSINH,GETDATE()) AS TUOI
FROM NHANVIEN A , PHANCONG B, DEAN C
WHERE A.MANV = B.MANV AND B.MADA = C.MADA AND DATEDIFF(YEAR , A.NGAYSINH,GETDATE()) >= 30 AND C.DDIEM_DA = 'TPHCM'
GROUP BY A.TENNV, C.DDIEM_DA,DATEDIFF(YEAR , A.NGAYSINH,GETDATE())
--CÂU 9
SELECT COUNT(DEAN.DDIEM_DA) AS SLDA
FROM DEAN
WHERE DEAN.DDIEM_DA = 'TPHCM'
--CÂU 10:
SELECT DDIEM_DA, COUNT(MADA) AS [SO DE AN]
FROM DEAN
GROUP BY DDIEM_DA
---CÂU 11
SELECT NV.HONV+' '+NV.TENLOT+''+NV.TENNV AS TEN, DATEDIFF(YEAR, PB.NG_NHANCHUC, GETDATE()) AS SONAM
FROM PHONGBAN PB JOIN NHANVIEN NV ON PB.TRUONGPHONG = NV.MANV
--CÂU 12
SELECT PB.MAPB, TENPB, COUNT(DIADIEM) AS [SO DIA DIEM]
FROM PHONGBAN PB JOIN DDIEM_PB DDPB ON PB.MAPB = DDPB.MAPB
GROUP BY PB.MAPB, TENPB
--CÂU 13
SELECT COUNT(TENDA) AS N'TÊN ĐỀ ÁN LÀ SẢN PHẨM'
FROM DEAN
WHERE TENDA LIKE '%San pham%'

--CÂU 14
SELECT A.TENPB, B.DIADIEM ,C.DDIEM_DA,C.TENDA
FROM PHONGBAN A, DDIEM_PB B, DEAN C
WHERE A.MAPB = B.MAPB AND B.MAPB = C.MAPB  AND B.DIADIEM = C.DDIEM_DA

--CÂU 15
SELECT A.TENNV AS N'TRƯỜNG PHÒNG'
FROM NHANVIEN A, PHONGBAN B
WHERE A.MANV = B.TRUONGPHONG

--CÂU 16
SELECT A.MANV,A.TENNV , COUNT(B.TENTN) AS SL_THANNHAN
FROM NHANVIEN A, THANNHAN B
WHERE A.MANV = B.MANV
GROUP BY A.MANV,A.TENNV
--ĐÚNG
DELETE FROM NHANVIEN 
WHERE (SELECT COUNT(MANV) FROM THANNHAN WHERE NHANVIEN.MANV = THANNHAN.MANV) >=3

SELECT * FROM NHANVIEN 
WHERE (SELECT COUNT(MANV) FROM THANNHAN WHERE NHANVIEN.MANV = THANNHAN.MANV) >=2

SELECT A.TENNV
FROM NHANVIEN A
WHERE (SELECT COUNT(B.MANV)
		FROM THANNHAN B
		WHERE A.MANV = B.MANV) >=2



--CÂU 17 
SELECT CASE
	WHEN (SELECT LUONG FROM NHANVIEN WHERE MANV = 'NV5') <= (SELECT MAX(LUONG) FROM NHANVIEN) THEN 'ĐÚNG'
	ELSE 'SAI'
	END AS 'TRẢ LỜI'
--CÂU 18
SELECT A.TENNV, B.QUANHE
FROM NHANVIEN A, THANNHAN B
WHERE A.MANV =B.MANV AND B.QUANHE NOT LIKE '%CON%'
--CÂU 19
SELECT A.TENNV, B.TENDA, C.THOIGIAN
FROM NHANVIEN A , DEAN B, PHANCONG C
WHERE A.MANV = C.MANV AND B.MADA = C.MADA AND (C.THOIGIAN >= (SELECT MAX(C.THOIGIAN) FROM PHANCONG C WHERE C.MADA = B.MADA))
--CÂU 20 PHAN CONG CHIA ,DEAN TBC
SELECT A.TENNV
FROM NHANVIEN A, PHANCONG B1 
WHERE A.MANV = B1.MANV AND NOT EXISTS (
										SELECT * 
										FROM DEAN C
										WHERE NOT EXISTS (
															SELECT * 
															FROM PHANCONG B2 
															WHERE B1.MANV = B2.MANV AND B2.MADA = C.MADA AND C.DDIEM_DA='Ha Noi'))

--CÂU 21
SELECT B.TENPB, B.TRUONGPHONG
FROM NHANVIEN A, PHONGBAN B
WHERE A.MAPB = B.MAPB AND B.TRUONGPHONG = A.MANV AND A.PHAI = N'Nữ'

--CÂU 22
SELECT A.TENDA, COUNT(B.MANV) AS SLNV, SUM(B.THOIGIAN) AS TG
FROM DEAN A, PHANCONG B
WHERE A.MADA = B.MADA
GROUP BY A.TENDA
ORDER BY SUM(B.THOIGIAN) 


--CÂU 23 THEN 1 TỨC CỘNG BIẾN ĐẾM 1 GT
SELECT A.MAPB, B.TENPB, COUNT(CASE WHEN A.PHAI = N'NAM' THEN 1 END ) AS SL_NAM,
						COUNT(CASE WHEN A.PHAI = N'NỮ' THEN 1 END ) AS SL_NU
FROM NHANVIEN A, PHONGBAN B
WHERE A.MAPB = B.MAPB
GROUP BY B.TENPB, A.MAPB

--CÂU 24 HAY KHÓ
SELECT A.TENPB, COUNT(B.PHAI) SL_NUMAX
FROM PHONGBAN A, NHANVIEN B
WHERE A.MAPB = B.MAPB AND B.PHAI = N'NỮ'
GROUP BY A.TENPB
HAVING COUNT(B.PHAI) >= ALL(SELECT COUNT(B1.PHAI)
							FROM PHONGBAN A1, NHANVIEN B1
							WHERE A1.MAPB = B1.MAPB AND B1.PHAI = N'NỮ'
							GROUP BY A1.TENPB)
							


--CÂU 25

SELECT
CASE WHEN (DATEDIFF(YEAR ,A.NGAYSINH, GETDATE()) >= ALL(SELECT DATEDIFF(YEAR, A1.NGAYSINH,GETDATE())
														FROM NHANVIEN A1)) THEN 'YES' ELSE 'NO' END AS KQ
FROM NHANVIEN A
WHERE A.MANV = 'NV4'


--CÂU 26 SAI CASE WHEN
SELECT A.TENPB ,(CASE WHEN  B.PHAI=N'NAM' THEN AVG(B.LUONG) END )AS LUONGTB_NAM,
				 (CASE WHEN  B.PHAI=N'NỮ' THEN AVG(B.LUONG) END )AS LUONGTB_NU
FROM PHONGBAN A, NHANVIEN B 
WHERE A.MAPB = B.MAPB 
GROUP BY A.TENPB,B.PHAI, A.MAPB

SELECT * FROM NHANVIEN A,PHONGBAN B WHERE A.MAPB = B.MAPB AND B.TENPB  = 'DIEUHANH'
--CÂU 27
UPDATE NHANVIEN
SET LUONG = LUONG *1.1 
WHERE PHAI = N'NỮ' AND MANV IN (SELECT DISTINCT MANV FROM PHANCONG A, DEAN B WHERE A.MADA = B.MADA AND (B.DDIEM_DA IN ('NHA TRNAG', 'VUNG TAU')))

SELECT LUONG
FROM NHANVIEN
WHERE PHAI = N'NỮ'

--CÂU 28
SELECT DISTINCT NV.MANV, HONV + ' ' + TENLOT + ' ' + TENNV AS [HO TEN NV], DIACHI
FROM NHANVIEN NV JOIN DDIEM_PB DDPB ON NV.MAPB = DDPB.MAPB
				 JOIN PHANCONG PC ON NV.MANV = PC.MANV
				 JOIN DEAN DA ON PC.MADA = DA.MADA
WHERE DDIEM_DA NOT IN (SELECT DIADIEM FROM DDIEM_PB WHERE MAPB = NV.MAPB)

SELECT DISTINCT A.MANV, A.TENNV, A.DIACHI,E.DIADIEM, C.DDIEM_DA
FROM NHANVIEN A, PHANCONG B, DEAN C , PHONGBAN D, DDIEM_PB E
WHERE A.MANV = B.MANV AND A.MAPB = D.MAPB AND B.MADA = C.MADA AND D.MAPB = E.MAPB
AND C.DDIEM_DA NOT IN (SELECT E1.DIADIEM FROM DDIEM_PB E1 WHERE A.MAPB = E1.MAPB)






--CÂU 29
SELECT B.TENDA
FROM DDIEM_PB C JOIN (PHONGBAN A JOIN DEAN B ON A.MAPB = B.MAPB) ON A.MAPB = A.MAPB
WHERE C.DIADIEM = N'HA NOI'


--CÂU 30
SELECT A.TENNV
FROM NHANVIEN A JOIN PHONGBAN B ON A.MANV = B.TRUONGPHONG
WHERE A.DIACHI LIKE '%TPHCM%'

-- CÂU 31. 

SELECT A.TENNV
FROM NHANVIEN A JOIN PHONGBAN B ON A.MANV = B.TRUONGPHONG
WHERE B.NG_NHANCHUC >= ALL(SELECT (B.NG_NHANCHUC) FROM PHONGBAN B) --(MAX(NGAYNHANCHUC))

--CÂU 32

SELECT A.TENPB
FROM PHONGBAN A JOIN DEAN B ON A.MAPB = B.MAPB
WHERE B.DDIEM_DA = 'HA NOI'


--Câu 33: 
INSERT INTO PHANCONG
SELECT 'NV3', MADA, 0
FROM DEAN
WHERE MADA NOT IN (SELECT MADA 
					FROM PHANCONG 
					WHERE MANV = 'NV3')



--CÂU 34 CÔ 
SELECT PB.MAPB, TENPB, HONV + ' ' + TENLOT + ' ' + TENNV AS [HO TEN TRUONG PHONG]
FROM NHANVIEN NV JOIN PHONGBAN PB ON NV.MANV = PB.TRUONGPHONG
WHERE (SELECT COUNT(MANV) FROM NHANVIEN WHERE MAPB = PB.MAPB AND PHAI = N'NỮ') >= ALL 
(SELECT COUNT(MANV)FROM NHANVIEN WHERE PHAI = N'NỮ' GROUP BY MAPB)


SELECT B.TENPB , A.TENNV
FROM NHANVIEN A JOIN PHONGBAN B ON A.MANV =B.TRUONGPHONG
WHERE (SELECT COUNT(MANV) FROM NHANVIEN , PHONGBAN WHERE A.MAPB = B.MAPB AND A.PHAI = N'NỮ' ) >= ALL (SELECT COUNT(MANV) FROM NHANVIEN WHERE PHAI = N'NỮ')
GROUP BY B.TENPB, A.TENNV




-- CÂU 35 
SELECT NV.MANV, HONV + ' ' + TENLOT + ' ' + TENNV AS [HO TEN NV]
FROM NHANVIEN NV JOIN PHANCONG PC ON NV.MANV = PC.MANV
WHERE MADA IN (SELECT MADA FROM DEAN WHERE MAPB = 'P2')
GROUP BY NV.MANV, HONV + ' ' + TENLOT + ' ' + TENNV
HAVING COUNT(MADA) >= (SELECT COUNT(MADA) FROM DEAN WHERE MAPB = 'P2')

SELECT A.TENNV
FROM NHANVIEN A JOIN PHANCONG B ON A.MANV = B.MANV JOIN DEAN C ON B.MADA = C.MADA
WHERE B.MADA IN (SELECT MADA FROM DEAN WHERE C.MAPB = 'P2')
GROUP BY A.TENNV
HAVING COUNT(B.MADA) >= ALL (SELECT COUNT(MADA) FROM DEAN WHERE MAPB='P2')



-- CÁCH PHÉP CHIA
Select TenNV
From NhanVien nv join PhanCong pc1 on nv.MaNV=pc1.MaNV 
Where not exists (Select *
                  From Dean da
                  Where not exists (Select *
                                    From PhanCong pc2 join NhanVien nv2 on pc2.MANV=nv2.MANV
                                    Where pc2.MADA=da.MaDa and pc1.MaNV=pc2.MaNV and nv2.MAPB='P2'))



SELECT A.TENLOT + ' ' + A.TENNV AS TENNHANVIEN
FROM NHANVIEN A JOIN PHANCONG B1 ON A.MANV = B1.MANV
WHERE NOT EXISTS 
					(SELECT * 
					FROM DEAN C 
					WHERE NOT EXISTS 
								    (SELECT * 
									FROM NHANVIEN A1 JOIN PHANCONG B2 ON A1.MANV =B2.MANV
									WHERE B1.MANV=B2.MANV AND C.MADA = B2.MADA AND A1.MAPB = 'P2'))
GROUP BY A.TENLOT + ' ' + A.TENNV

--CÂU 36 KHÓ 
SELECT TENDA, HONV + ' ' + TENLOT + ' ' + TENNV AS [HO TEN NV], THOIGIAN
FROM NHANVIEN NV JOIN PHANCONG PC ON NV.MANV = PC.MANV
				 JOIN DEAN DA ON PC.MADA = DA.MADA
WHERE THOIGIAN >= ALL (SELECT MAX(THOIGIAN) FROM PHANCONG WHERE MADA = PC.MADA)
ORDER BY THOIGIAN



SELECT C.TENDA,  A.TENNV, (B.THOIGIAN) AS TGMAX
FROM NHANVIEN A JOIN PHANCONG B ON A.MANV = B.MANV JOIN DEAN C ON B.MADA = C.MADA
WHERE THOIGIAN >= ALL (SELECT THOIGIAN FROM PHANCONG B1 WHERE B.MADA = B1.MADA)
GROUP BY C.TENDA,  A.TENNV, B.THOIGIAN
ORDER BY B.THOIGIAN
-- CÂU 37
select NV.HONV + ' ' + NV.TENLOT + ' ' + NV.TENNV AS [HO TEN NV], NV.MAPB,
		CASE
			WHEN TENTN = NV.HONV + ' ' + NV.TENLOT + ' ' + NV.TENNV THEN NULL
			ELSE TENTN
		END AS [HO TEN TRUONG PHONG]
from NHANVIEN NV inner join PHONGBAN PB on NV.MAPB=PB.MAPB
				inner join THANNHAN TP on PB.TRUONGPHONG=TP.MANV


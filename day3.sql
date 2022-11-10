CREATE TABLE tedarikciler4 -- parent
(
vergi_no int PRIMARY KEY,
firma_ismi VARCHAR(50),
irtibat_ismi VARCHAR(50)
);
INSERT INTO tedarikciler4 VALUES (101, 'IBM', 'Kim Yon');
INSERT INTO tedarikciler4 VALUES (102, 'Huawei', 'Çin Li');
INSERT INTO tedarikciler4 VALUES (103, 'Erikson', 'Maki Tammen');
INSERT INTO tedarikciler4 VALUES (104, 'Apple', 'Adam Eve');
CREATE TABLE urunler4 -- child
(
ted_vergino int,
urun_id int,
urun_isim VARCHAR(50),
musteri_isim VARCHAR(50),
CONSTRAINT fk_urunler FOREIGN KEY(ted_vergino) REFERENCES tedarikciler4(vergi_no)
on delete cascade
);
INSERT INTO urunler4 VALUES(101, 1001,'Laptop', 'Ayşe Can');
INSERT INTO urunler4 VALUES(102, 1002,'Phone', 'Fatma Aka');
INSERT INTO urunler4 VALUES(102, 1003,'TV', 'Ramazan Öz');
INSERT INTO urunler4 VALUES(102, 1004,'Laptop', 'Veli Han');
INSERT INTO urunler4 VALUES(103, 1005,'Phone', 'Canan Ak');
INSERT INTO urunler4 VALUES(104, 1006,'TV', 'Ali Bak');
INSERT INTO urunler4 VALUES(104, 1007,'Phone', 'Aslan Yılmaz');
select * from tedarikciler4
select * from urunler4
--vergi_no'su 102 olan tedarikcinin firma iamini "vestel" olarak değiştir
update tedarikciler4
set firma_ismi= 'Vestel' where vergi_no=102

update tedarikciler4
set firma_ismi='casper',irtibat_ismi='ali veli' where vergi_no=101;
-- urunler tablosundaki 'Phone' değerlerini 'Telefon' olarak güncelleyiniz.
update tedarikciler4
set urun_ismi='Telefon'
where urun_isim='phone';
-- urunler tablosundaki urun_id değeri 1004'ten büyük olanların urun_id’sini 1 arttırın.
-- urunler tablosundaki tüm ürünlerin urun_id değerini ted_vergino sutun değerleri ile toplayarak güncelleyiniz.

update urunler4
set urun_id = urun_id+1 
where urun_id>1004
select * from tedarikciler4
select * from urunler4
-- urunler tablosundaki tüm ürünlerin urun_id değerini ted_vergino sutun değerleri ile toplayarak güncelleyiniz.
update urunler4
set urun_id=urun_id+ted_vergino
delete from urunler4
delete from tedarikciler4
select * from tedarikciler4
select * from urunler4
--urunler tablosundaki tüm urun isimlerini müşteri isimleri ile birleştirerek update edelim
update urunler4
set urun_isim=concat(urun_isim, '-', musteri_isim)

--urunler tablosundan Ali Bak’in aldigi urunun ismini, tedarikci tablosunda irtibat_ismi
--'Adam Eve' olan firmanın ismi (firma_ismi) ile degistiriniz.
UPDATE urunler4						
SET urun_isim= (SELECT firma_ismi from tedarikciler4 WHERE irtibat_ismi = 'Adam Eve') --> Apple						
WHERE musteri_isim = 'Ali Bak'
--Urunler tablosunda laptop satin alan musterilerin ismini, firma_ismi Apple’in irtibat_isim'i ile degistirin.

UPDATE urunler4						
SET musteri_isim = (SELECT irtibat_ismi FROM tedarikciler4 WHERE firma_ismi = 'Apple')						
WHERE urun_isim = 'Laptop'
select * from tedarikciler4
select * from urunler4
CREATE TABLE insanlar
(
ssn char(9),
isim varchar(50), adres varchar(50)
);
INSERT INTO insanlar VALUES(123456789, 'Ali Can', 'Istanbul');
INSERT INTO insanlar VALUES(234567890, 'Veli Cem', 'Ankara');
INSERT INTO insanlar VALUES(345678901, 'Mine Bulut', 'Izmir');
INSERT INTO insanlar (ssn, adres) VALUES(456789012, 'Bursa');
INSERT INTO insanlar (ssn, adres) VALUES(567890123, 'Denizli')

select * from insanlar where isim is null
select * from insanlar where isim is not null






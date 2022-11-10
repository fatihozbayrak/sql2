CREATE TABLE sirketler 
(
	sirket_id int,
	sirket_isim varchar(20)
);
INSERT INTO sirketler VALUES(100, 'Toyota');
INSERT INTO sirketler VALUES(101, 'Honda');
INSERT INTO sirketler VALUES(102, 'Ford'); 
INSERT INTO sirketler VALUES(103,'Hyundai');

CREATE TABLE siparisler 
(siparis_id int, 
 sirket_id int, 
 siparis_tarihi date
);

INSERT INTO siparisler VALUES(11,101,'17-Apr-2020');
INSERT INTO siparisler VALUES(22,102,'18-Apr-2020');
INSERT INTO siparisler VALUES(33,103,'19-Apr-2020');
INSERT INTO siparisler VALUES(44,104,'20-Apr-2020');
INSERT INTO siparisler VALUES(55,105,'21-Apr-2020');

select * from sirketler
select * from siparisler

----SORU) Iki Tabloda sirket_id’si ayni olanlarin sirket_ismi, siparis_id ve siparis_tarihleri ile yeni bir tablo olusturun

--inner join
select sirketler.sirket_isim, siparisler.siparis_id,siparisler.siparis_tarihi from sirketler inner join siparisler
on sirketler.sirket_id = siparisler.sirket_id

-- left join
select sirketler.sirket_isim, siparisler.siparis_id,siparisler.siparis_tarihi from sirketler left join siparisler
on sirketler.sirket_id = siparisler.sirket_id

--rigt join
select sirketler.sirket_isim, siparisler.siparis_id,siparisler.siparis_tarihi from sirketler right join siparisler
on sirketler.sirket_id = siparisler.sirket_id


--FULL JOINS
select sirketler.sirket_isim, siparisler.siparis_id,siparisler.siparis_tarihi from sirketler full join siparisler
on sirketler.sirket_id = siparisler.sirket_id

--SELF JOİNS
CREATE TABLE personel3
(id int,
 isim varchar(20), 
 title varchar(60),
 yonetici_id int
);
INSERT INTO personel3 VALUES(1, 'Ali Can', 'SDET',2);
INSERT INTO personel3 VALUES(2, 'Veli Cem', 'QA',3);
INSERT INTO personel3 VALUES(3, 'Ayse Gul', 'QA Lead', 4);
INSERT INTO personel3 VALUES(4, 'Fatma Can', 'CEO',5);

--Her personelin yanina yonetici ismini yazdiran bir tabloolusturun
select p1.isim as personel_ismi, p2.isim as yonetici_id from personel3 p1 inner join personel3 p2
on p1.yonetici_id =p2.id



CREATE TABLE musteriler2 (
id int UNIQUE,
isim varchar(50) NOT NULL,
gelir int
);
INSERT INTO musteriler2 (id, isim, gelir) VALUES (1001, 'Ali', 62000);
INSERT INTO musteriler2 (id, isim, gelir) VALUES (1002, 'Ayse', 57500); 
INSERT INTO musteriler2 (id, isim, gelir) VALUES (1003, 'Feride',71000);
INSERT INTO musteriler2 (id, isim, gelir) VALUES (1004, 'Fatma', 42000); 
INSERT INTO musteriler2 (id, isim, gelir) VALUES (1005, 'Kasim',44000);

--1)% => 0 veya birden fazla karakterbelirtir
--SORU: Ismi A harfi ile baslayan musterilerin tum bilgilerini yazdiran QUERYyazin

select * from musteriler2 where isim like 'A%'
--eğer bütük küçük harf farketmezsizin yazmaz istersek
select * from musteriler2 where isim ilike 'a%'
SELECT * FROM musteriler2 WHERE isim LIKE 'A%';
-- Eğer büyük küçük harf farketmeksizin sorgulama yapmak isterseniz -ilike- kullanabilirsiniz
SELECT * FROM musteriler2 WHERE isim ILIKE 'a%';
-- Like kullanımı 2 yol
-- Like kullanımı yerine ~~ bu sembolleri de kullanabilirsiniz
SELECT * FROM musteriler2 WHERE isim ~~ 'A%';
-- Like kullanımında sembol kullanıyorsak ve büyük küçük harf gözetmeksizin sorgu yapmak istersek ~~* sembollerini kullanabiliriz
SELECT * FROM musteriler2 WHERE isim ~~* 'a%';

--Ismie harfi ile biten musterilerin isimlerini ve gelir’lerini yazdiran QUERYyazin
SELECT isim, gelir from musteriler2 WHERE isim ~~* '%e';

--Isminin icinde er olan musterilerin isimlerini ve gelir’lerini yazdiran QUERYyazin

SELECT isim, gelir from musteriler2 WHERE isim ~~* '%er%';

select * from musteriler2

--=> sadece bir karakterigosterir.
--SORU: Ismi 5 harfli olup son 4 harfi atma olan musterilerin tum bilgilerini yazdiran QUERYyazin

SELECT * from musteriler2 WHERE isim ~~ '_atma'

--Ikinci harfi a olan musterilerin tum bilgilerini yazdiran QUERYyazin
SELECT * from musteriler2 WHERE isim ~~ '_a%'

--Ucuncu harfi s olan musterilerin tum bilgilerini yazdiran QUERYyazin

SELECT * from musteriler2 WHERE isim ~~ '__s%'

--Ucuncu harfi s olan ismi 4 harfli musterilerin tum bilgilerini yazdiran QUERYyazin

SELECT * from musteriler2 WHERE isim ~~ '__s_'

--Ilk harfi F olan en az 4 harfli musterilerin tum bilgilerini yazdiran QUERY yazin

SELECT * from musteriler2 WHERE isim ~~*'f___%'


--Ikinci harfia,4.harfimolan musterilerin tum bilgilerini yazdiran QUERYyazin

SELECT * from musteriler2 WHERE isim ~~*'_a_m%'

CREATE TABLE kelimeler 
(
id int UNIQUE,
kelime varchar(50) NOT NULL, 
	Harf_sayisi int
);

INSERT INTO kelimeler VALUES (1001, 'hot', 3); INSERT INTO kelimeler VALUES (1002, 'hat', 3); 
INSERT INTO kelimeler VALUES (1003, 'hit', 3); INSERT INTO kelimeler VALUES (1004, 'hbt', 3); 
INSERT INTO kelimeler VALUES (1008, 'hct', 3); INSERT INTO kelimeler VALUES (1005, 'adem', 4);
INSERT INTO kelimeler VALUES (1006, 'selim', 5); INSERT INTO kelimeler VALUES (1007, 'yusuf',5);

select * from kelimeler

/*
REGEXP_LIKE =>Daha karmaşık sorgular için herhangi
bir kod, metin icerisinde istenilen yaziveya kod parcasinin aranip bulunmasini saglayan kendine 
ait soz dizimi olan bir yapidir.(REGEXP_LIKE) PostgreSQL de ‘’ ~ ‘’ karekteri ile kullanilir
*/

--Ilk harfi h,son harfi t olup 2.harfi a veya i olan 3 harfli kelimelerin tum bilgilerini yazdiranQUERYyazin
select * from kelimeler where kelime ~ 'h[ai]t'

--Ilk harfi h,son harfi t olup 2.harfi a ile k arasinda olan 3 harfli kelimelerin tumbilgilerini yazdiran QUERYyazin

select * from kelimeler where kelime ~ 'h[a-k]t' --soruda ile geçtiği için - kllanıyoruz. yani a ile k dediğimizde bu iki harf arasındaki bütün harfler yazılıyor

--Icinde m veya i olan kelimelerin tum bilgilerini yazdiran QUERYyazin
select * from kelimeler where kelime ~ '[mi]'

--a veya s ile baslayan kelimelerin tum bilgilerini yazdiran QUERYyazin
select * from kelimeler where kelime ~'^[as]'--burada tırnak içinde ^ bu işaret cümlenin neyle başlıyacağını gösterir

--m veya f ile biten kelimelerin tum bilgilerini yazdiran QUERYyazin
select * from kelimeler where kelime ~'[mf]$' --$ işareti ise hangi harfle biteceğini gösterir


--NOT LIKECondition
--ilk harfi h olmayan kelimelerin tum bilgilerini yazdiran QUERYyazin
select * from kelimeler where kelime not like 'h%' --veya
select * from kelimeler where kelime !~~ 'h%'
--a harfi icermeyen kelimelerin tum bilgilerini yazdiran QUERYyazin
select * from kelimeler where kelime not like '%a%' --veya
select * from kelimeler where kelime !~~ '%a%'
--ikinci ve ucuncu harfi ‘de’ olmayan kelimelerin tum bilgilerini yazdiran QUERYyazin
select * from kelimeler where kelime !~~ '_de%'
--2. harfi e,i veya o olmayan kelimelerin tum bilgilerini yazdiran QUERYyazin
select * from kelimeler where kelime !~ '[_eio]'


--Upper(belirtilen verilerin büyük harfle yazar)
--lower(belirtilen verilerin küçük harfle yazar)
--initcap(belirtilen verilerin ilk harfini büyük harfle yazar)
select upper(kelime) as kelime from kelimeler
select lower(kelime) as kelime from kelimeler
select initcap(kelime) as kelime from kelimeler

--DISTINC
CREATE TABLE musteri_urun
(
urun_id int,
musteri_isim varchar(50),
urun_isim varchar(50)
);

INSERT INTO musteri_urun VALUES (10, 'Ali', 'Portakal');
INSERT INTO musteri_urun VALUES (10, 'Ali', 'Portakal');
INSERT INTO musteri_urun VALUES (20, 'Veli', 'Elma');
INSERT INTO musteri_urun VALUES (30, 'Ayse', 'Armut');
INSERT INTO musteri_urun VALUES (20, 'Ali', 'Elma');
INSERT INTO musteri_urun VALUES (10, 'Adem', 'Portakal');
INSERT INTO musteri_urun VALUES (40, 'Veli', 'Kaysi');
INSERT INTO musteri_urun VALUES (20, 'Elif', 'Elma');

SELECT * from musteri_urun
select distinct urun_isim from musteri_urun
select distinct musteri_isim from musteri_urun

--Tabloda kac farkli meyve vardir

select count(distinct urun_isim) from musteri_urun




















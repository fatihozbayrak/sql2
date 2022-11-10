--order by komutu
CREATE TABLE insanlar2
(
ssn char(9),
isim varchar(50),
soyisim varchar(50),
adres varchar(50)
);
INSERT INTO insanlar2 VALUES(123456789, 'Ali','Can', 'Istanbul');
INSERT INTO insanlar2 VALUES(234567890, 'Veli','Cem', 'Ankara');
INSERT INTO insanlar2 VALUES(345678901, 'Mine','Bulut', 'Ankara');
INSERT INTO insanlar2 VALUES(256789012, 'Mahmut','Bulut', 'Istanbul');
INSERT INTO insanlar2 VALUES (344678901, 'Mine','Yasa', 'Ankara');
INSERT INTO insanlar2 VALUES (345678901, 'Veli','Yilmaz', 'Istanbul');
select * from insanlar2
order by adres;
-- Insanlar tablosundaki ismi Mine olanlari SSN sirali olarak listeleyin
select * from insanlar2
where isim='Mine'
order by ssn;
-- Insanlar tablosundaki soyismi Bulut olanlari adres sirali olarak listeleyin
select * from insanlar2
where soyisim='Bulut'
order by 2; --sıralamada field numarasıda kullanabiliriz
--Insanlar tablosundaki tum kayitlari SSN numarasi buyukten kucuge olarak siralayin
--ASCENDİNG(ASC) doğal sıralama küçükten büyüğe
--descending(DESC) tersten sıralama büyükten küçüğe doğru sırslama
select * from insanlar2
order by ssn DESC;
select * from insanlar2
order by ssn ASC;-- ASC yazılmasada normal sıralama zaten yapılır
-- Insanlar tablosundaki tum kayitlari isimler Natural sirali, Soyisimler ters sirali olarak listeleyin
select * from insanlar2
order by isim ASC, soyisim DESC;
-- İsim ve soyisim değerlerini soyisim kelime uzunluklarına göre sıralayınız
SELECT isim,soyisim FROM insanlar2
order by length (soyisim) DESC;
-- Tüm isim ve soyisim değerlerini aynı sutunda çağırarak her bir sütun değerini uzunluğuna göre sıralayınız
select concat(isim, ' ', soyisim) as isim_soyisim from insanlar2
order by length (isim)+ length(soyisim)
select isim ||' '|| soyisim as isim_soyisim from insanlar2
order by length (isim)+ length(soyisim)

--group by


CREATE TABLE manav
(
isim varchar(50), Urun_adi varchar(50), Urun_miktar int
);
INSERT INTO manav VALUES( 'Ali', 'Elma', 5);
INSERT INTO manav VALUES( 'Ayse', 'Armut', 3);
INSERT INTO manav VALUES( 'Veli', 'Elma', 2);
INSERT INTO manav VALUES( 'Hasan', 'Uzum', 4);
INSERT INTO manav VALUES( 'Ali', 'Armut', 2);
INSERT INTO manav VALUES( 'Ayse', 'Elma', 3);
INSERT INTO manav VALUES( 'Veli', 'Uzum', 5);
INSERT INTO manav VALUES( 'Ali', 'Armut', 2);
INSERT INTO manav VALUES( 'Veli', 'Elma', 3);
INSERT INTO manav VALUES( 'Ayse', 'Uzum', 2);
--1) Isme gore alinan toplam urunleri bulun
select isim,  sum(urun_miktar) from manav
group by isim
order by isim
--2) Urun ismine gore urunu alan toplam kisi sayisi
select urun_adi, count(isim) from manav 
group by urun_adi 
--3) Alinan kilo miktarina gore musteri sayisi
SELECT urun_miktar, count(isim) as alinan_urunle_kisi_sayisi from manav 
group by urun_miktar

--başka örnek
CREATE TABLE personel
(
id int,
isim varchar(50),
sehir varchar(50),
maas int,
sirket varchar(20)
);
INSERT INTO personel VALUES(123456789, 'Ali Yilmaz', 'Istanbul', 5500, 'Honda');
INSERT INTO personel VALUES(234567890, 'Veli Sahin', 'Istanbul', 4500, 'Toyota');
INSERT INTO personel VALUES(345678901, 'Mehmet Ozturk', 'Ankara', 3500, 'Honda');
INSERT INTO personel VALUES(456789012, 'Mehmet Ozturk', 'Izmir', 6000, 'Ford');
INSERT INTO personel VALUES(567890123, 'Mehmet Ozturk', 'Ankara', 7000, 'Tofas');
INSERT INTO personel VALUES(456789012, 'Veli Sahin', 'Ankara', 4500, 'Ford');
INSERT INTO personel VALUES(123456710, 'Hatice Sahin', 'Bursa', 4500, 'Honda');
select * from personel

--isme göre toplam maaşları bulun
select isim , sum(maas) from personel
group by isim
-- 2)sehre gore toplam personel sayisini bulun
select sehir , count(isim) as calisan_kisi from personel
group by sehir

-- Sirketlere gore maasi 5000 liradan fazla olan personel sayisini bulun
select sirket, count(isim) from personel
where maas>5000
group by sirket
 --her şirket için min ve max maaşı bulun
 select sirket , min(maas) as min_maas, max(maas) as max_maas from personel
 group by sirket
 
 --HAVİNG KULLANIMI
 select sirket , min(maas) as en_az_maas from personel
 group by sirket
 having min(maas)<4000
 
 --benim denemem
 select sirket , max(maas) as en_fazla_maas from personel
 group by sirket
 having min(maas)>5000
 
 -- 2)Ayni isimdeki kisilerin aldigi toplam gelir 10000 liradan fazla ise ismi ve toplam maasi gosteren sorgu yaziniz
 select isim, sum(maas) as toplam_maas from personel
 group by isim
 having sum(maas)>8000
 
 --Eger bir sehirde calisan personel sayisi 1’den coksa sehir ismini ve personel sayisini veren sorguyaziniz
 select sehir , count(isim) as toplam_personel_sayisi from personel
 group by sehir
 having count(isim)>=1
 
 --Eger bir sehirde alinan MAX maas 5000’den dusukse sehir ismini ve MAX maasi veren sorguyaziniz
 select sehir, max(maas) from personel
 group by sehir
 having max(maas)<5000






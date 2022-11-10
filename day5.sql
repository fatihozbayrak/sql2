--union kavramı
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
select isim as isim_sehir from  personel where maas>5000
union
select sehir from personel where maas>5000


--Maasi 4000’den cok olan isci isimlerini ve 5000 liradan fazla maas alinan sehirleri gosteren sorguyu yaziniz
select isim as isim_sehir, maas from personel where isim = 'Mehmet Ozturk'
union
select sehir, maas from personel where sehir = 'Istanbul'


--2.sorgunun sonuna ORDER BY komutunu kullanirsaniz tumtabloyuistediginiz siralamaya goresiralar
select isim as isim_sehir, maas from personel where isim = 'Mehmet Ozturk'
union
select sehir, maas from personel where sehir = 'Istanbul'
order by maas

--desc yaparsak
select isim as isim_sehir, maas from personel where isim = 'Mehmet Ozturk'
union
select sehir, maas from personel where sehir = 'Istanbul'
order by maas DESC

--Sehirlerden odenen ucret 4500’den fazla olanlari ve personelden ucreti 5000’den azolanlari bir tabloda maas miktarina gore sirali olarak gosteren sorguyuyaziniz
select sehir, maas  from personel where maas>4500
union
select isim, maas from personel where maas<5000
order by maas


CREATE TABLE personel2
(
id int,
isim varchar(50),
sehir varchar(50),
maas int,
sirket varchar(20),
CONSTRAINT personel_pk PRIMARY KEY (id)
);
INSERT INTO personel2 VALUES(123456789, 'Ali Yilmaz', 'Istanbul', 5500, 'Honda');
INSERT INTO personel2 VALUES(234567890, 'Veli Sahin', 'Istanbul', 4500, 'Toyota');
INSERT INTO personel2 VALUES(345678901, 'Mehmet Ozturk', 'Ankara', 3500, 'Honda');
INSERT INTO personel2 VALUES(456789012, 'Mehmet Ozturk', 'Izmir', 6000, 'Ford');
INSERT INTO personel2 VALUES(567890123, 'Mehmet Ozturk', 'Ankara', 7000, 'Tofas');
INSERT INTO personel2 VALUES(456715012, 'Veli Sahin', 'Ankara', 4500, 'Ford');
INSERT INTO personel2 VALUES(123456710, 'Hatice Sahin', 'Bursa', 4500, 'Honda');


CREATE TABLE personel_bilgi (
id int,
tel char(10) UNIQUE ,
cocuk_sayisi int,
CONSTRAINT personel_bilgi_fk FOREIGN KEY (id) REFERENCES personel2(id)
);
INSERT INTO personel_bilgi VALUES(123456789, '5302345678', 5);
INSERT INTO personel_bilgi VALUES(234567890, '5422345678', 4);
INSERT INTO personel_bilgi VALUES(345678901, '5354561245', 3);
INSERT INTO personel_bilgi VALUES(456789012, '5411452659', 3);
INSERT INTO personel_bilgi VALUES(567890123, '5551253698', 2);
INSERT INTO personel_bilgi VALUES(456789012, '5524578574', 2);
INSERT INTO personel_bilgi VALUES(123456710, '5537488585', 1);

select * from personel2
select * from personel_bilgi

--id’si 123456789 olan personelin Personel tablosundan sehir ve maasini, personel_bilgi  tablosundan da tel ve cocuk sayisini yazdirin
select id, sehir, maas from personel where id ='123456789'
union
select id,tel, cocuk_sayisi from personel_bilgi where id ='123456789'


--Personel tablosundada maasi 5000’den az olan tum isimleri ve maaslaribulunuz
SELECT isim, maas from personel2 where maas<5000

--Ayni sorguyu UNION ile iki kere yazarakcalistirin
SELECT sehir, maas from personel2 where maas<5000
union
SELECT sehir, maas from personel2 where maas<5000

--Ayni sorguyu UNION ALL ile iki kere yazarakcalistirin
SELECT sehir, maas from personel2 where maas<5000
union all
SELECT sehir, maas from personel2 where maas<5000

--Tabloda personel maasi 4000’den cok olan tum sehirleri ve maaslariyazdirin
select sehir , maas from personel2 where maas>4000

--Tabloda personel maasi 5000’den az olan tum isimleri ve maaslariyazdirin
select isim , maas from personel2 where maas<5000

--unio ile
select sehir , maas from personel2 where maas>4000
union
select isim , maas from personel2 where maas<5000

--union all ile
select sehir , maas from personel2 where maas>4000
union all
select isim , maas from personel2 where maas<5000

--INTERSECTOPERATOR

--Personel tablosundan Istanbul veya Ankara’da calisanlarin id’lerini yazdir
select id, isim from personel2 where sehir in ('Istanbul', 'Ankara')

--Personel_bilgi tablosundan 2 veya 3 cocugu olanlarin id leriniyazdirin
select id from personel_bilgi where cocuk_sayisi in(2,3)



--Iki sorguyu INTERSECT ilebirlestirin
select id from personel2 where sehir in ('Istanbul', 'Ankara')
INTERSECT 
select id from personel_bilgi where cocuk_sayisi in(2,3)


--Honda,Ford ve Tofas’ta calisan ortak isimde personel varsalisteleyin
select isim from personel2 where sirket= 'Honda'
INTERSECT
select isim from personel2 where sirket='Ford'
INTERSECT
select isim from personel2 where sirket='Tofas'
--Maasi 4800’den az olanlar veya 5000’den cok olanlarin id’lerini listeleyin
select id  from personel2 where maas not between 4800 and 5500


--2)Personel_bilgi tablosundan 2 veya 3 cocugu olanlarin id lerini yazdirin
select id from personel_bilgi where cocuk_sayisi in (2,3)

--Iki sorguyu INTERSECT ilebirlestirin

select id  from personel2 where maas not between 4800 and 5500
INTERSECT
select id from personel_bilgi where cocuk_sayisi in (2,3)


--EXCEPTOPERATOR
--5000’den az maas alip Honda’da calismayanlariyazdirin
select isim, sirket ,maas from personel where maas<5000
except
select isim, sirket, maas from personel where sirket ='Honda'


--2)Ismi Mehmet Ozturk olup Istanbul’da calismayanlarin isimlerini ve sehirlerini listeleyin
select isim, sehir from personel where isim = 'Mehmet Ozturk'
except
select isim, sehir from personel where sehir = 'Istanbul'


--INNERJOINS

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

--SORU) Iki Tabloda sirket_id’si ayni olanlarin sirket_ismi, siparis_id ve siparis_tarihleri ile yeni bir tablo olusturun










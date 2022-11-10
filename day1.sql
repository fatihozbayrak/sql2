--create--tablo oluşturma
CREATE TABLE ogretmenler
(
id char(4),
isim_soyisim varchar(30),
not_ort real,
kayit_tarih date
);
--var olan bir tablodan yeni bir tablo oluşturmak
CREATE TABLE ogretmen_ort
as 
select isim_soyisim, not_ort
from ogretmenler;
i--select DQL--
select * from ogretmenler--bir tablodaki bütün verileri çağırmak istersek select * from karekterini kullanırız.
select *from ogretmen_ort
select isim_soyisim from ogretmenler -- bir yada birden fazla field ı çağırmak için direkt çağırmak istediğimiz fieldı yazarız.
select isim_soyisim,kayit_tarih from ogretmenler


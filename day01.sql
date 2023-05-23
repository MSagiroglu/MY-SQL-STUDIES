--YORUMLAR BU ŞEKİLDE YAZILIR
/*
UZUN YORUM LARI DA BU ŞEKİLDE YAZABİLİRİZ
*/

/*
  SQL KOMUTLARI GRUPLARA AYRILIR :

  1.(Data Definition Language - DDL) Veri Tanimlama Dili
  CREATE: Tablo oluşturur.
  ALTER: Tabloyu günceller.Tabloya ait ismi günceller ve sütunlara ait ekleme ve isimleri günceller.
  DROP: Tabloyu siler.
  
  
  2.(Data Manipulation Language - DML) Veri Kullanma Dili
  INSERT:Tabloya veri ekler
  UPDATE:Tablodaki verileri günceller
  DELETE:Tablodaki verileri siler.tablonun kendisini değil.Bu işi DROP yapar.
  

  3.(Data Query Language - DQL) Veri Sorgulama Dili
  SELECT: Tablodaki verileri listeler. 
*/


--Talebeler isminde tablo oluşturalım.
--codelar büyük harfler ilede yazılabilir.
create table talebeler(
ogrenci_tc char(11),--sütun isimleri girdik. isimler iki.kelime _ ile ayrılır. string olarak uzunluğu belli olduğundan dolayı char verdik
ogrenci_isim varchar(20), --max size'ı 20 belirledik
not_ort real, --ondalıklı nümeric sayı kullanımı için real kullandık.
kayit_tarihi date	
);

-- talebeler tablosundaki verileri listeleyelim.
select * from talebeler;  -- * tüm sütunlardaki verileri listeler


--talebeler tablosuna veri ekleyelim
insert into talebeler values ('11111111111','Esma',90.5,'2020-02-14');
insert into talebeler values ('22222222222','Mustafa',90.6,'2021-05-16');
insert into talebeler values ('33333333333','Burak',90.7,'2022-08-11');

-- şimdi tekrardan talebeler tablosundaki verileri listeleyelim.
select * from talebeler;  -- * tüm sütunlardaki verileri listeler
 
 
 
-- talebeler tablosunu silelim
drop table talebeler; 



-- SORU: Öğretmenler isminde tablo ouşturalım
create table ogretmenler(
ogretmen_ismi varchar(15),
bransı varchar(25),
mezuniyet_derecesi varchar(20),
telefon_num char(11),
maas real
);

--Öğretmenler tablosuna veri girişi yapalım
insert into ogretmenler values ('Ali','Türkçe','lisans','05305002535',30000);
insert into ogretmenler values ('Esma','Fizik','Yüksek lisans','05456255987',25000);
insert into ogretmenler values ('Yasemin','Matemeatik','lisans','05455869692',50000);

-- Öğretmenler tablosundaki verileri listeleyelim.
select * from ogretmenler;  -- * tüm sütunlardaki verileri listeler

-- Öğretmenler tanlosunu silelim.
drop table ogretmenler;

/*=====================================SELECT=======================================================


select * from tablo_adi ==> * Tüm sutunlardaki verileri listeler



DQL Grubundan ==> SELECT komutu ile 'Tablodaki İstedigimiz Sütundaki Verileri Listeleyebiliriz'


Syntax:
-------


select sutun_adi from tablo_adi; ==> Sadece belirtilen sutundaki verileri listeler


========================================================================================================*/

create table ogrenciler
(
id int,
isim varchar(40),
adres varchar(100),
sinav_notu int
);

insert into ogrenciler values(120, 'Ali Can', 'Ankara', 75);
insert into ogrenciler values(121, 'Veli Mert', 'Trabzon', 85);
insert into ogrenciler values(122, 'Ayşe Tan', 'Bursa', 65);
insert into ogrenciler values(123, 'Derya Soylu', 'Istanbul', 95);
insert into ogrenciler values(124, 'Yavuz Bal', 'Ankara', 85);
insert into ogrenciler values(125, 'Emre Gül', 'Hatay', 90);
insert into ogrenciler values(126, 'Harun Reşit', 'Isparta', 100);

--SORU1: ogrenciler tablosunun tum sutunlarındaki verileri listeleyiniz 
select * from ogrenciler;

--SORU2: ogrenciler tablosundaki 'isim' sutunundaki verileri listeleyiniz
select isim from ogrenciler; 

--SORU3: ogrenciler tablosundaki 'adres' sutunundaki verileri listeleyiniz
select adres from ogrenciler;

--SORU4: ogrenciler tablosundaki 'sinav_notu' sutunundaki verileri listeleyiniz
select sinav_notu from ogrenciler;

--SORU5: ogrenciler tablosundaki 'isim' ve 'sinav_notu' sutunundaki verileri listeleyiniz
select isim,sinav_notu from ogrenciler;


/*

where==> ŞART belirtmemiz gerktiginde kullanılır.

*/

--SORU6: ogrenciler tablosundaki sinav_notu 80'den büyük olan öğrencilerin tüm bilgilerini listele
select * from ogrenciler where sinav_notu>80;

--SORU7: ogrenciler tablosundaki adres'i 'Ankara' olan ögrencilerin tüm bilgilerini listele
select * from ogrenciler where adres='Ankara';

--SORU8: ogrenciler tablosundaki sinav_notu 85 ve adres'i 'Ankara' olan öğrenci isim'ini listele
select isim from ogrenciler where sinav_notu=85 and adres='Ankara';

--SORU9: ogrenciler tablosundaki sinav_notu 65 veya 85 olan ogrencilerin tüm bilgilerini listele
select * from ogrenciler where sinav_notu=85 or sinav_notu=65;

--in ==> Birden fazla ifade ile tanimlayabilecegimiz durumlari in komutu ile yazabiliriz.

--9. soru için 2. yol
select * from ogrenciler where sinav_notu in(65,85);





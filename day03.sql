/*========================CONSTRAINT -- KISITLAMALAR=======================================================

1) UNIQUE -->  Bir sütundaki verilerin BENZERSİZ olmasıdır.(2 veya daha fazla null deger kabul eder)

2) NOT NULL --> Bir sütunun NULL İÇERMEMESİNİ sağlar
   (NOT NULL kısıtlaması, data türünden hemen sonra yazılır. CONSTRAINT ismi tanımlanmaz.)   

3) PRIMARY KEY --> UNIQUE(BENZERSİZ) - NOT NULL 
   Bir tabloda en fazla bir adet Primary Key olur. 
   iki sutunun birlesiminden bir Primary Key oluşturulmasına ise Composite Primary Key denir.

4) CHECK --> Bir sütunun değer aralığını sınırlamak için kullanılır.

5) FOREIGN KEY --> Başka bir tablodaki PRİMARY KEY'i referans göstermek için kullanılır.
   Böylelikle, tablolar arasında Parent- Child ilişkisi oluşur.
============================================================================================================*/




/*
SORU1: memurlar isminde bir tablo oluşturunuz. 
id, isim, maas, mezuniyet sutunları olsun.
id sutununun data turu int olsun. PRİMARY KEY kısıtlaması olsun.
isim sutununun data turu varchar(30) olsun. UNIQUE kısıtlaması olsun.
maas sutununun data turu int olsun. maas 5000 buyuk olsun.
mezuniyet sutununun data turu varchar(25) olsun. NOT NULL kısıtlaması olsun.    
*/
create table memurlar(
id int PRIMARY KEY,
isim varchar(30) UNIQUE,
maas int check(maas>5000),
mezuniyet varchar(25) NOT NULL	
);
/*
memurlar tablomuzu olusturduktan ve Tables kismindan control ettikten sonra
memurlar tablomuzun ismini gorduk ve memurlar tablomuz uzerine gelip asagi 
dogru aciyoruz, alt kisminda Constraints kismina gelip onu acip alt kismina 
baktigimizda verdigimiz kisitlamalarin listelenmis oldugunu gorduk. Orada 
sadece Not Null kisitlamasini goremedik. pgAdmin4 kisitlamalara isimler
vermis ornegin memurlar_isim_key, memurlar_maas_check, memurlar_pkey olarak
yazmis. Not Null’i constraint olarak tanimlamiyor.
*/
insert into memurlar values(1,'Ali',10000,'Lisans');
insert into memurlar values(2,'Ahmet',15000,'Yüksek Lisans');
insert into memurlar values(3,'Altuğ',20000,'Lisans');
insert into memurlar values(4,'Elif',18000,'Lisans');
select * from memurlar;

insert into memurlar values(1,'Zülal',20000,'Lise');--id PRIMARY KEY SEBEBİYLE ERROR VERİR.
insert into memurlar values(5,'Altuğ',25000,'Yüksek Lisans');--isim UNIQUE SEBEBİYLE ERROR VERİR.
insert into memurlar values(6,'Hayri',4000,'Lisans');--maas CHECK SEBEBİYLE ERROR VERİR.
insert into memurlar values(7,'Burak',30000,null);--mezuniyet NOT NULL  SEBEBİYLE ERROR VERİR.

/* 
Tablomuza insert komutu ile veri girisleri yaptik.
insert into memurlar values( Id sutunu icin 1, isim sutunu icin Ali, 
maas sutunu icin 10000, mezuniyet sutunu icin Lisans verilerini girdik.)
insert into memurlar values(1,'Ali',10000,'Lisans');
sirasiyla insert komutu ile values icine ilgili sutunlar icin verilen
kisitlamalari da dikkate alarak veriler girdik. Ornegin isim sutununda 
Unique kisitlamasi var ve biz hep farkli isimleri veri olarak girdik. 
maas sutunu icin Check kisitlamasi vardi, biz maas sutununa hep 5000 
uzeri rakamlari girdik. Kisitlamalara uygun veri girisleri yaptigimiz 
icin pgAdmin4 bu girisleri kabul etti.
insert into memurlar values(1,'Ali',10000,'Lisans');
insert into memurlar values(2,'Ahmet',15000,'Yuksek Lisans');
insert into memurlar values(3,'Altug',20000,'Lisans');
insert into memurlar values(4,'Elif',18000,'Lisans');
Bu kodumuzu run edince console’da Insert 1’I gorduk ve control etmek 
icin select * from memurlar;
Yazdik ve run edince verilerin liste halinde yazildigini gorduk.
Buraya kadar sutunlardaki kisitlamalara uygun olan verileri girdik. 
Bir de kisitlamalara uygun olmayan veriler girelim insert komutu ile.
insert into memurlar values(1,'Zuhal',20000,'Lise'); bu sekilde veri 
girilmesi Primary Key kisitlamasina uyulmadigi icin kabul edilmeyecek, 
pgAdmin bunun icin Error verir.
insert into memurlar values(1,'Zuhal',20000,'Lise');--Primary Key sebebiyle
error verdi.
insert into memurlar values(5,'Altug',25000,'Yuksek Lisans');--Unique 
kisitlamasi sebebiyle error verdi. Isim sutununda Unique kisitlamasi 
vardi, Altug ismini daha once girmistik.
insert into memurlar values(6,'Hayri',4000,'Lisans');--Check kisitlamasi 
sebebiyle error verdi. Maas sutununda Check kisitlamasi vardi ve 5000’den 
yuksek rakam girmemiz gerekirken verinin 4000 olarak girilmesi ile pgAdmin error verdi.
insert into memurlar values(7,'Burak',30000,null);--Not Null kisitlamasi
sebeiyle su sekilde error verdi: ERROR: null value in column "mezuniyet" of
relation "memurlar" violates not-null constraint
*/



/*
SORU2: insanlar isminde bir tablo oluşturunuz. 
isim, soyisim sutunları olsun.
isim sutununun data turu varchar(20) olsun.
soyisim sutununun data turu varchar(30) olsun. 


isim sutununda PRİMARY KEY kısıtlaması olsun. Kısıtlamanın isimi pr_ks olsun.
soyisim sutununda UNIQUE kısıtlaması olsun. Kısıtlamanın ismi uni_ks olsun.


*/
create table insanlar(
isim varchar(20),
soyisim varchar(30),
constraint pr_ks primary key(isim),
constraint uni_ks unique (soyisim)	
);

insert into insanlar values('Harun','Tan');
insert into insanlar values('Azra','Can');
select * from insanlar;
insert into insanlar values ('Harun','Kan');--'Harun' ismi PRIMARY KEY sebebiyle error verir
insert into insanlar values (null,'Kan');--null PRIMARY KEY sebebiyle error verir
insert into insanlar values ('Kudret','Can');--'Can' sebebiyle UNIQUE sebebiyle error verir.


/*
SORU3: hayvanlar isminde bir tablo oluşturunuz. 
isim, cins sutunları olsun.
isim sutununun data turu varchar(20) olsun.
cins sutununun data turu varchar(25) olsun.

isim ve cins sutunları birlesiminden bir PRIMARY KEY kısıtlaması olsun.
(Composite Primary Key=kısıtlama ismini kendin yaz demek). 
Kısıtlamanın ismini comp_pr yapınız

*/
CREATE TABLE hayvanlar(
isim varchar(20),
cins varchar(25),
	
CONSTRAINT comp_pr Primary key (isim,cins)--iki sütunun birleşiminden bir primary key kısıtlaması elde ettik.
);

insert into hayvanlar values('fındık','Süs Köpeği');
insert into hayvanlar values('fındık','çoban köpeği');--2 sütünun birleşiminden oluşturduğumuz için önceki valueler
													  --için Primay Key(unique ve not null)'dır.'
insert into hayvanlar values ('duman','süs köpeği');

insert into hayvanlar values('fındık','Süs Köpeği'); --Primary Key kısıtlaması sebebiyle error verir.

/*
NOT: CONSTRAINT'leri sütun simleri altında belirtmenin bize sağladığı kolaylık:
	1-) CONSTRAINT ismini belirleyebiliyoruz
	2_) Composite Primary Key yapmamıza imkan veriyor.(iki sütunun birleşmesinden bir primary key oluşturulmasına denir.)
*/

create table emekciler
(
id char(5) PRIMARY KEY,   ---> UNIQUE + NOT NULL
isim varchar(50) UNIQUE,
maas int NOT NULL
);


insert into emekciler values(10002, 'Mehmet Yılmaz', 12000);
insert into emekciler values(10008, null, 5000);
insert into emekciler values(10010, null,5000);
insert into emekciler values(10020, null, 5000);
insert into emekciler values(10004, 'Veli Han', 5000);
insert into emekciler values(10005, 'Mustafa Ali', 5000);
insert into emekciler values(10006, 'Canan Yaş', null); --NOT NULL 
insert into emekciler values(10003, 'CAN', 5000);
insert into emekciler values(10007, 'CAN', 5000);  --UNIQUE
insert into emekciler values(10009, 'Cem', '');  --NOT NULL 
insert into emekciler values('', 'osman', 2000);
insert into emekciler values('', 'osman can', 2000);--PRIMARY KEY  
insert into emekciler values('', 'veli can', 6000);   --PRIMARY KEY  
insert into emekciler values(10002, 'ayse Yılmaz', 12000);  --PRIMARY KEY 
insert into emekciler values(null, 'filiz', 12000);  --PRIMARY KEY  

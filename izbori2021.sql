drop database if exists izbori2021;
create database izbori2021;
use izbori2021;

create table zupanija(
	sifra int not null primary key auto_increment,
	naziv varchar(50),
	zupan int
);

create table zupan(
	sifra int not null primary key auto_increment,
	ime varchar(50),
	prezime varchar(50)
);

create table opcina(
	sifra int not null primary key auto_increment,
	zupanija int,
	naziv varchar(50)
);

create table mjesto(
	sifra int not null primary key auto_increment,
	opcina int,
	naziv varchar(50)
);

alter table zupanija add foreign key (zupan) references zupan(sifra);
alter table opcina add foreign key (zupanija) references zupanija(sifra);
alter table mjesto add foreign key (opcina) references opcina(sifra);

insert into opcina (sifra) values
(1),(2),(3),(4),(5),(6),(7),(8),(9),(10),(11),(12);

insert into mjesto (opcina,naziv) values
(1,'Osijek'),
(2,'Sabljiæi'),
(3,'Sali'),
(4,'Salnik'),
(5,'Salajci'),
(6,'Samobor'),
(7,'Samoborec'),
(8,'Samarica'),
(9,'Samatovci'),
(10,'Salež'),
(11,'Salajci'),
(12,'Saborsko');

insert into zupan (ime,prezime) values
('Davor','Gobac'),
('Siniša','Vuco'),
('Jasna','Zlokiæ');


update mjesto set naziv='Sisak'
where sifra=1
;
update mjesto set naziv='Zadar'
where sifra=2
;
update mjesto set naziv='Split'
where sifra=3
;
delete from mjesto where sifra=10
;
delete from opcina where sifra=10
;
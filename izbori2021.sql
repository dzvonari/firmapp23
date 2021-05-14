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
	naziv varchar(50),
	naziv2 varchar(50)
);

create table mjesto(
	sifra int not null primary key auto_increment,
	opcina int,
	naziv varchar(50)
);

alter table zupanija add foreign key (zupan) references zupan(sifra);
alter table opcina add foreign key (zupanija) references zupanija(sifra);
alter table mjesto add foreign key (opcina) references opcina(sifra);

insert into zupanija (naziv) values
('Istarska'),
('Karlova�ka'),
('Zagreba�ka');

insert into opcina (naziv) values
('�aglin'),
('�avle'),
('�a�inci'),
('�eminac'),
('�a�avica'),
('�epin');

insert into mjesto (naziv) values
('Osijek'),
('Sablji�i'),
('Sali'),
('Salnik'),
('Salajci'),
('Samobor'),
('Samoborec'),
('Samarica'),
('Samatovci'),
('Sale�'),
('Salajci'),
('Saborsko');

insert into zupan (ime,prezime) values
('Davor','Gobac'),
('Sini�a','Vuco'),
('Jasna','Zloki�');

update mjesto set naziv='Sisak'
;
update mjesto set naziv='Zadar'
;
update mjesto set naziv='Split';

delete from opcina where naziv>'�epin'
;
delete from opcina where naziv>'�a�avica'
;
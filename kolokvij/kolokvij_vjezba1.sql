drop database if exists kolokvij_vjezba1;

create database kolokvij_vjezba1;

use kolokvij_vjezba1;

create table sestra(
	sifra int not null primary key auto_increment,
	introvertno bit,
	haljina varchar(31) not null,
	marka decimal(16,6),
	hlace varchar(46) not null,
	narukvica int  not null
);

create table zena(
	sifra int not null primary key auto_increment,
	treciput datetime,
	hlace varchar(46),
	kratkamajica varchar(31) not null,
	jmbag char(11) not null,
	bojaociju varchar(39) not null,
	haljina varchar(44),
	sestra int not null
);

create table muskarac(
	sifra int not null primary key auto_increment,
	bojaociju varchar(50) not null,
	hlace varchar(30),
	modelnaocala varchar(43),
	maraka decimal(14,5) not null,
	zena int not null
);

create table sestra_svekar(
	sifra int not null primary key auto_increment,
	sestra int not null,
	svekar int not null
);

create table svekar(
	sifra int not null primary key auto_increment,
	bojaociju varchar(40) not null,
	prstena int,
	dukserica varchar(41),
	lipa decimal(13,8),
	euro decimal (12,7),
	majica varchar(35)

);

create table mladic(
	sifra int not null primary key auto_increment,
	suknja varchar(50) not null,
	kuna decimal(16,8) not null,
	drugiput datetime,
	asocijalno bit,
	ekstroventno bit not null,
	dukserica varchar(48) not null,
	muskarac int 
);

create table punac(
	sifra int not null primary key auto_increment,
	ogrlica int,
	gustoca decimal(14,9),
	hlace varchar(41) not null
);

create table cura(
	sifra int not null primary key auto_increment,
	novcica decimal(16,5) not null,
	gustoca decimal(18,6) not null,
	lipa decimal(13,10),
	ogrlica int not null,
	bojakose varchar(38),
	suknja varchar(36),
	punac int
);

alter table zena add foreign key (sestra) references sestra(sifra);
alter table sestra_svekar add foreign key (sestra) references sestra(sifra);
alter table muskarac add foreign key (zena) references zena(sifra);
alter table mladic add foreign key (muskarac) references muskarac(sifra);
alter table sestra_svekar add foreign key (svekar) references svekar(sifra);
alter table cura add foreign key (punac) references punac(sifra);


insert into sestra (haljina,hlace,narukvica) values ('plava','crne',1),('crna','plava',2),('zelena','roza',3);
insert into zena (kratkamajica,jmbag,bojaociju,sestra) values ('roza','11223344556','plava',1),('plava','22447744114','žuta',2),('roza','98765432111','crvena',3);
insert into muskarac (bojaociju,maraka,zena) values ('crna','505.00',1);
insert into svekar (bojaociju) values ('zelena'),('oker'),('tirkiznozelene');
insert into sestra_svekar (sestra,svekar) values (1,1),(2,2),(3,3);

select * from cura;
insert into punac (hlace) values('kratke'),('duge'),('uske');
insert into cura (novcica,gustoca,ogrlica,punac) values (100,100,2,1),(100,100,2,1),(100,100,2,1);
select * from mladic;

update cura set gustoca = 15.77 where novcica =100;

delete  from mladic where kuna>15.78;

select  kratkamajica from zena where hlace='%ana%';

select s.dukserica ,m.asocijalno ,mu.hlace from mladic m

inner join muskarac mu on m.muskarac =mu.sifra
inner join zena z on mu.zena =z.sifra 
inner join sestra s2 on z.sestra =s2.sifra
inner join sestra_svekar ss on s2.sifra =ss.sestra 
inner join svekar s on ss.svekar =s.sifra 
where z.hlace like 'a%' and s2.hlace like '%ba%'
order by mu.hlace desc 
;
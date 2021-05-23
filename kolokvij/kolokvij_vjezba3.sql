drop database if exists kolokvi_vjezba3;

create database kolokvi_vjezba3;

use kolokvi_vjezba3;

create table svekar(
	sifra int not null primary key auto_increment,
	novcica decimal(16.8) not null,
	suknja varchar(40) not null,
	bojakose varchar(36),
	prstena int,
	narukvica int not null,
	cura int not null
);

create table cura(
	sifra int not null primary key auto_increment,
	dukserica varchar(48),
	maraka decimal(13.7),
	drugiput datetime,
	majica varchar(49),
	novcica decimal(15.8),
	ogrlica int not null
);

create table snasa(
	sifra int not null primary key auto_increment,
	introvertno bit,
	kuna decimal(15.6) not null,
	eura decimal(12.9) not null,
	treciput datetime,
	ostavljena int not null
);

create table punica(
	sifra int not null primary key auto_increment,
	asocijalno bit,
	kratkamajica varchar(44),
	kuna decimal(13.8) not null,
	vesta varchar(32) not null,
	snasa int
	
);

create table ostavljena(
	sifra int not null primary key auto_increment,
	kuna decimal(17.5),
	lipa decimal(15.6),
	majica varchar(36),
	modelnaocala varchar(31) not null,
	prijatelj int
);

create table prijatelj(
	sifra int not null primary key auto_increment,
	kuna decimal(16.10),
	haljina varchar(37),
	lipa decimal(13.10),
	dukserica varchar(31),
	indiferentno bit not null
);

create table prijatelj_brat(
	sifra int not null primary key auto_increment,
	prijatelj int not null,
	brat int not null
);

create table brat(
	sifra int not null primary key auto_increment,
	jmbag char(11),
	ogrlica int not null,
	ekstrovertno bit not null
);

alter table svekar add foreign key (cura) references cura(sifra);
alter table snasa add foreign key (ostavljena) references ostavljena(sifra);
alter table punica add foreign key (snasa) references snasa(sifra);
alter table prijatelj_brat add foreign key (prijatelj) references prijatelj(sifra);
alter table prijatelj_brat add foreign key (brat) references brat(sifra);
alter table ostavljena add foreign key (prijatelj) references prijatelj(sifra);

#1. U tablice snasa, ostavljena i prijatelj_brat unesite po 3 retka.

insert into ostavljena (modelnaocala) values ('ray'),('bann'),('black');
insert into snasa (kuna,eura,ostavljena) values ('5.5','4.5','1'),('5.6','4.6','2'),('5.7','5.8','3');
insert into prijatelj (indiferentno) values (0),(1),(1);
insert into brat (ogrlica,ekstrovertno) values ('1',0),('2',1),('3',1);
insert into prijatelj_brat (prijatelj,brat) values (1,1),(2,2),(3,3);

#U tablici svekar postavite svim zapisima kolonu suknja na vrijednost Osijek. (4)


update svekar set suknja = 'Osijek';
delete from punica where kratkamajica like 'AB';

select majica from ostavljena where not (lipa=9 or lipa=10 or lipa=20 or lipa=25 or lipa=35);



#
#
#inner NE RADI pogledaj
#
#



select b.ekstroventno,p.vesta,s.kuna from punica p
inner join snasa s on p.snasa =s.sifra
inner join  ostavljena o on s.ostavljena =o.sifra
inner join prijatelj p1 on o.prijatelj =p1.sifra
inner join prijatelj_brat pb on pb.prijatelj =p1.sifra
inner join brat b on pb.brat=b.sifra
where o.lipa <> '91.00' and
p1.haljina like '%ba%'
order by s.kuna desc;


select p.haljina,p.lipa from prijatelj p
left join prijatelj_brat pb on pb.prijatelj =p.sifra 
where prijatelj is null;


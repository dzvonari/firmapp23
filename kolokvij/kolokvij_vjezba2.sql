drop database if exists kolokvij_vjezba2;

create database kolokvij_vjezba2;

use kolokvij_vjezba2;

create table cura(
sifra int not null primary key auto_increment,
haljina varchar(33) not null,
drugiputa datetime not null,
suknja varchar(38),
narukvica int,
introvertno bit,
majica varchar(43) not null,
decko int
);

create table decko(
sifra int not null primary key auto_increment,
indiferentno bit,
vesta varchar(34) not null,
asocijalno bit
);

create table decko_zarucnica(
sifta int not null primary key auto_increment,
decko int not null,
zarucnica int not null
);

create table zarucnica(
sifra int not null primary key auto_increment,
narukvica int,
bojakose varchar(37) not null,
novcica decimal(15.9),
lipa decimal(15.8) not null,
indiferentno bit not null
);

create table brat(
sifra int not null primary key auto_increment,
sutkinja varchar(47),
ogrlica int not null,
asocijalno bit not null,
neprijatelj int not null
);

create table neprijatelj(
sifra int not null primary key auto_increment,
majica varchar(32),
haljina varchar(43) not null,
lipa decimal(16.8),
modelnaocala varchar(49) not null,
kuna decimal(12.6) not null,
jmbag char(11),
cura int
);

create table prijatelj(
sifra int not null primary key auto_increment,
modelnaocala varchar(37),
treciput datetime not null,
ekstroventno bit not null,
prviput datetime,
svekar int not null
);

create table svekar(
sifra int not null primary key auto_increment,
stilfrizura varchar(40),
ogrlica int not null,
asocijalno bit not null
);alter table cura add foreign key (decko) references decko(sifra);
alter table neprijatelj add foreign key (cura) references cura(sifra);
alter table brat add foreign key (neprijatelj) references neprijatelj(sifra);
alter table decko_zarucnica add foreign key (zarucnica) references zarucnica(sifra);
alter table decko_zarucnica add foreign key (decko) references decko(sifra);
alter table prijatelj add foreign key (svekar) references svekar(sifra);

insert into neprijatelj (haljina,modelnaocala,kuna) values ('crna','guess','200.02'),('plava','gucchi','198.55'),('bijela','koridor','50.05');
insert into cura (haljina,drugiputa,majica) values ('duga','1980-04-04','plava'),('kratka','1981-04-04','crna'),('bezramena','1982-04-04','siva');
insert into decko (vesta) values ('plava'),('crna'),('zelena');
insert into zarucnica (bojakose,lipa,indiferentno) values ('crna','5.05',1),('plava','5.06',0),('roza','5.08',0);
insert into decko_zarucnica (decko,zarucnica) values (1,1),(2,2),(3,3);

update prijatelj set treciput = 2020-04-30;
delete from brat where ogrlica <>14;

select suknja from cura where drugiputa = null;

select z.novcica, b.neprijatelj, n.haljina from zarucnica z 
inner join decko_zarucnica dz on dz.zarucnica  =z.sifra 
inner join decko d on dz.decko  =d.sifra
inner join cura c on c.decko =d.sifra
inner join neprijatelj n on n.cura =c.sifra 
inner join brat b on b.neprijatelj =n.sifra 
where c.drugiputa  is not null and d.vesta like '%ba%'
order by n.haljina desc;

select d.vesta,d.asocijalno from decko d 
left join decko_zarucnica dz on dz.decko =d.sifra 
where dz.decko = null 

;

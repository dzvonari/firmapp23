drop database if exists firma3pp23;

create database firma3pp23;

use firma3pp23;

create table projekt(
	sifra int not null primary key auto_increment,
	naziv varchar(50) not null,
	cijena decimal
);

create table programer(
	sifra int not null primary key auto_increment,
	ime varchar(50) not null,
	prezime varchar(50) not null,
	datumrodjenja datetime,
	placa decimal
);

create table sudjeluje(
	projekt int not null,
	programer int,
	datumpocetka datetime,
	datumkraja datetime
);

alter table sudjeluje add foreign key (projekt) references projekt(sifra);
alter table sudjeluje add foreign key (programer) references programer(sifra);
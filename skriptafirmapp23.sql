drop database if exists firmapp23;)

create database firmapp23;

use firmapp23;

create table projekt(
	sifra int not null primary key auto_increment,
	naziv varchar(50) not null,
	cijena decimal(18,2)
);

create table programer(
	sifra int not null primary key auto_increment,
	ime varchar(50) not null,
	prezime varchar(50) not null,
	datumrodjenja datetime
	placa decimal(18,2)
);

create table sudjeluje(
	projekt int,
	programer varchar(50),
	datumpocetka datetime,
	datum kraja datetime
);

drop database if exists firmapp23;)
create database firmapp23;

use firmapp23;

create database projekt(
	sifra int not null primary key auto_increment,
	naziv varchar(50) not null,
	cijena decimal(18,2)
);

create database programer(
	sifra int not null primary key auto_increment,
	ime varchar(50) not null,
	prezime varchar(50) not null,
	datumrodjenja datetime
	placa decimal(18,2)
);

create d
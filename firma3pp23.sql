drop database if exists firma3pp23;)

create database firma3pp23;

use firma3pp23;

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

create database sudjeluje(
	projekt int,
	programer varchar(50),
	datumpocetka datetime,
	datum kraja datetime
);

select * from smjer;

update smjer set trajanje=130
where sifra=1;

update smjer set trajanje=130, certifikat =true
where sifra=2;

update smjer set cijena=1000
where sifra=1;

update smjer set cijena=cijena*0.9;

update smjer set cijena=cijena*1.1;

insert into osoba(ime,prezime) values
('Pero','Periæ'),
('Franko','Matic'),
('Slavko','Pihler');

delete from osoba where sifra>19;


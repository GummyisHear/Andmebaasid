create database toodePoldsaar;
use toodePoldsaar;

create table toodekategooria(
toodekategooriaId int primary key identity(1,1),
nimetus varchar(100) unique,
kirjeldus text
);

create table toode(
toodeId int primary key identity(1,1),
toodenimetus varchar(100) unique,
hind decimal(5,2),
toodekategooriaId int,
foreign key (toodekategooriaId) references toodekategooria(toodekategooriaId)
);

insert into toodekategooria(nimetus) values
('joogid'), ('meelelahutus'), ('tühi kategooria');

insert into toode(toodenimetus, hind, toodekategooriaId) values
('cola', 2.50, 1);

insert into toode(toodenimetus, hind, toodekategooriaId) values
('kino', 10.00, 2),
('teater', 100.0, 2);

insert into toodekategooria(nimetus) values
('elektroonika');

insert into toodekategooria(nimetus) values
('riided');

--1. vaade mis näitab kõik tooded ja nende hinnad
create view toode_nimi_ja_hind as
select toodenimetus, hind from toode;

--kuuvame vaade
select * from toode_nimi_ja_hind;

-- 3. loo vaade, mis kuvab ainult aktiivseid (nt saadaval olevaid) tooteid

--tabeli sktruktuuri muutmine, uue veergu lisamine
alter table toode add aktiivne bit; 
update toode set aktiivne = 1;
update toode set aktiivne = 0 where toodeId = 2;
select * from toode;

create view saadav_toode as 
select * from toode where aktiivne = 1;

select * from saadav_toode;

--4. loo vaade mis koondab info: kategooria nimi, toodete arv, minimaalne ja maksimaalne hind.
create view kategooriaInfo as
select tk.nimetus, count(*) as 'toodete arv', min(t.hind) as 'min hind', max(t.hind) as 'max hind' 
from toodekategooria tk
inner join toode t on t.toodekategooriaId = tk.toodekategooriaId 
group by tk.nimetus;

select * from kategooriaInfo;

--loo vaade mis 

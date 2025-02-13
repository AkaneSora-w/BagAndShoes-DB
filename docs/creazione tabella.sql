drop database if exists accessori;
create database accessori;
use accessori;

create table Cliente (
CF char(10) primary key,
nome char (16) not null,
cognome char (16) not null,
spesaTotale float not null
);

create table Telefono (
numero char(9) primary key,
Cliente char (10) not null,
foreign key (Cliente) references Cliente (CF)
);

create table Borse (
codice char (10) primary key,
prezzo float not null,
sconto float,
materiale char (16) not null,
dimensione int not null,
tipo char (16) not null,
numeroScomparti int not null,
lunghezzaTracolla char (16) not null
);

create table AcquistaB (
Cliente char (10),
Borse char (10),
numeroPezzi int not null,
dataAcquisto date not null,
foreign key (Cliente) references Cliente (CF),
foreign key (Borse) references Borse (codice),
primary key (Cliente, Borse)
);

create table Scarpe (
codice char (10) primary key,
prezzo float not null,
sconto float,
materiale char (16) not null,
taglia char (16) not null, 
categoria char (16) not null,
collezione char (16) not null
);

create table AcquistaS (
Cliente char (10),
Scarpe char (10),
numeroPezzi int not null,
dataAcquisto date not null,
foreign key (Cliente) references Cliente (CF),
foreign key (Scarpe) references Scarpe (codice),
primary key (Cliente, Scarpe)
);

create table Negozio (
PIVA char (10) primary key,
nome char (16),
via char (16),
numeroCivico char (16),
citta char (16)
);

create table EsponeB (
Negozio char (10),
Borse char (10),
foreign key (Negozio) references Negozio (PIVA),
foreign key (Borse) references Borse (codice),
primary key (Negozio, Borse) 
);

create table EsponeS (
Negozio char (10),
Scarpe char (10),
foreign key (Negozio) references Negozio (PIVA),
foreign key (Scarpe) references Scarpe (codice),
primary key (Negozio, Scarpe) 
);

create table Dipendente (
CF char (10) primary key,
nome char (16),
cognome char (16),
stipendio int not null,
posizione char (16),
Negozio char (10),
foreign key (Negozio) references Negozio (PIVA)
);
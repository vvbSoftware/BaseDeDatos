create table Persona(
ci char(8) not null primary key,
Tel_cel char(8) not null unique key,
Edad int(3) not null,
Domicilio text,
Sexo varchar(10) not null,
pNom varchar(30) not null,
sNom varchar(30) ,
pApe varchar(30) not null,
sApe varchar(30) not null,
fotoPerfil blob
);

create table Paciente(
ciP char(8) not null,
mail varchar(50) not null,
constraint fk_pac foreign key(ciP) references persona(ci)
);

create table Gerente(
ciG char(8) not null,
constraint fk_ciG foreign key (ciG) references Persona(ci)
);

create table Especialidad(
id int(4) not null auto_increment primary key,
nombre varchar(30) not null unique key
);

create table Medico(
ciM char(8) not null,
numMed int(4),
idEspecialidad int(4) not null,
constraint fk_ciM foreign key (ciM) references Persona(ci),
constraint fk_Esp foreign key (idEspecialidad) references Especialidad(id)
);

create table horario(
ciMed char(8) not null,
horaEntrada time not null,
horaSalida time not null,
diaTrabajo varchar(10) not null,
lugarTrabajo varchar (15) not null,
constraint fk_ciMe foreign key (ciMed) references Medico(ciM),
primary key (ciMed, horaSalida,lugarTrabajo)
);

create table Sintoma(
id int(4) not null auto_increment unique key,
nombre varchar(20) not null primary key
);

create table Enfermedad(
nombre varchar(30) not null primary key,
idEnf int(4) not null auto_increment unique key,
riesgo varchar(10) not null unique key,
descripcion text 
);

create table diagnostico(
idDiag int(4) not null auto_increment primary key, 
nomS varchar(20) not null,
idP char(8) not null,
nomE varchar(20) not null,
Fecha date not null,
constraint fk_idP foreign key (idP) references Paciente(ciP),
constraint fk_nomE foreign key (nomE) references Enfermedad(nombre),
constraint fk_nomS foreign key (nomS) references Sintoma(nombre)
);

create table FichaMédica(
Fecha date not null,
Procedencia varchar(30) not null,
idDiag int(4) unique key,
id int(4) not null auto_increment primary key,
cedP char(8) unique key,
Ocup varchar(30),
Medicación varchar(30),
Motiv_Cons text,
Síntomas int(4) unique key,
constraint fk_cedP foreign key (cedP) references Paciente(ciP)
);

create table Selec (
dia date not null,
hora time not null,
idSint int(4) not null unique key,
idPac char(8) not null,
constraint fk_idPac foreign key (idPac) references Paciente(ciP),
constraint fk_idSint foreign key (idSint) references Sintoma(id)
);

create table Gestiona(
tipo varchar(10) not null unique key,
ciGerente char(8) not null,
nomEnf varchar(30) not null,
nomSint varchar(30) not null,
fecha date not null,
constraint fk_nEn foreign key (nomEnf) references Enfermedad(nombre),
constraint fk_cG foreign key (ciGerente) references Gerente(ciG),
constraint fk_Sintom foreign key (nomSint) references Sintoma(nombre)
);

create table Define(
nomEnf varchar(30) not null,
nomSint varchar(30) not null,
constraint fk_nomEnf foreign key (nomEnf) references Enfermedad(nombre),
constraint fk_sint foreign key (nomSint) references Sintoma(nombre)
);

create table chat(
fecha date not null,
ciPac char(8) not null, foreign key (ciPac) references Paciente(ciP),
idDiag int(4) not null unique key,
idChat int(4) not null auto_increment primary key,
estado varchar(10) not null,
constraint fk_idDiag foreign key (idDiag) references Diagnostico(idDiag)
);

create table Chatea (
ciMed char(8) not null,
hora time not null,
ciPac char(8) not null, foreign key (ciPac) references Paciente(ciP),
idChat int(4) not null unique key,
txt text not null,
constraint fk_ciMed foreign key (ciMed) references Medico(ciM),
constraint fk_idChat foreign key (idChat) references Chat(idChat)
);

create table Acepta(
nroMed char(8) not null,
idChat int(4) not null,
constraint fk_Chat foreign key (idChat) references Chat(idChat),
constraint fk_nroM foreign key (nroMed) references Medico(ciM)
)
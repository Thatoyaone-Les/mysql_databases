DROP DATABASE IF EXISTS reservationDb;
CREATE DATABASE reservationDb;
use reservationDb;
CREATE TABLE clientInfo(
clientID smallint unsigned NOT NULL auto_increment,
clientName varchar(25) null,
clientSurname varchar(25) null,
email varchar(50) null,
cell varchar(25) null,
alterContact varchar(25) null,
dateCreated datetime null,
primary key (clientID)
);
CREATE TABLE roomInfo(
roomID smallint unsigned NOT NULL auto_increment,
roomNo smallint unsigned null,
roomDescription varchar(50),
primary key(roomID)
);

CREATE TABLE staffInfo(
staffID smallint unsigned NOT NULL auto_increment,
staffName varchar(25) not null,
staffSurname varchar(25) not null,
email varchar(50) null,
cell varchar(25) null,
alterCell varchar(25) null,
primary key(staffID)
);

CREATE TABLE reservations(
reservationID smallint NOT NULL auto_increment,
reservationDescription varchar(50) null,
checkInDate date NOT NULL,
CheckOutDate date NOT NULL,
dateCreated datetime NOT NULL,
price smallint unsigned NULL,
clientID smallint unsigned null,
roomID smallint unsigned null,
staffID smallint unsigned null,
primary key(reservationID),
foreign key(roomID) references roomInfo(roomID) ON UPDATE CASCADE ON DELETE CASCADE,
foreign key(staffID) references staffInfo(staffID) ON UPDATE CASCADE ON DELETE CASCADE,
foreign key(clientID) references clientInfo(clientID) ON UPDATE CASCADE ON DELETE CASCADE
);

insert into clientInfo (clientName, clientSurname, email, cell) values (upper('thatoyaone'), upper('lesetedi'), 'tlesetedi@gmail.com','0619162321');
select * from clientInfo;

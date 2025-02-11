/** This is a databases for professional based businesses like consulting based businesses eg doctors, lawyers, physiotherapists, dentists, graphic designers, architects etc **/

DROP DATABASE IF exists professionalDb;
create database professionalDb;
use professionalDb;
 -- Create a table for <BUSINESS> clients
 -- column for clients_points can be omitted or left as a way to reward recurring clients and referrals
create table clientInfo(
clientID smallint unsigned not null auto_increment,
clientName varchar(25) null,
clientSurname varchar(25) null,
cell varchar(15) null,
cell2 varchar(15) null,
email varchar(25) null,
client_points smallint unsigned null default 0,
primary key(clientID)
);

-- Create table for <Business> staff, also usefull to record who made what appointments on a particular day 
create table staffInfo(
staffID smallint unsigned not null auto_increment,
staffName varchar(25) null,
staffSurname varchar(25) null,
cell varchar(15) null,
cell2 varchar(15) null,
email varchar(25) null,
primary key(staffID)
);

-- Create table for appointments, record which staff made the appointmemnt to which client and a description as additional information
create table appointments(
clientID smallint unsigned null,
staffID  smallint unsigned null,
appointmentDate datetime null,
apDescription varchar(80) null,
dateCreated datetime null,
foreign key(clientID) references clientInfo(clientID) on update cascade on delete cascade,
foreign key(staffID) references staffInfo(staffID) on update cascade on delete cascade
);

-- Inserting information into tables
insert into clientInfo (clientName, clientSurname, cell, email) VALUES('Thatoyaone', 'Lesetedi', '0797475545', 'thato@lesetedi.co.za'), ('Mark', 'Samlik', '0684505546', 'marks@gmail.com'), ('John', 'Doe', '015848055', 'jdoe@peanut.com');
insert into staffInfo (staffName, staffSurname, cell, cell2, email) VALUES('Kernan', 'Levis', '0715454512', '07815452155', 'klevis@gmail.com'), ('Jansen', 'Gallery',  '071851551', '087154525', 'jansengal@lesetedi.com');
-- use of a foreign key to populate appointments table
-- insert into appointments(clientID, staffID) select cl.clientID, st.staffID from clientInfo as cl, staffInfo as st ;

-- most likely scenario to populate appointments tables without having null columns, helpful to avoid updating table and encountering errors
DELIMITER //
create procedure appointment(IN clientId smallint, IN staffId smallint, IN appointDate date, IN description varchar(80))
begin
	-- LOCK tables appointments write;
	insert into appointments(clientID, staffID, appointmentDate, apDescription, dateCreated) VALUEs(clientId, staffId, appointDate, description, sysdate());
	select * from appointments;
end //
DELIMITER ;
-- update appointments SET appointmentDate = curdate(),  apDescription = 'This appointment is for high vlaue client' WHERE staffID = 1;
select * from clientInfo;
select * from staffInfo;

call appointment(1, 1, curdate(), '4 weeks post op checkup');

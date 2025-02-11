DROP DATABASE IF exists logisticDb;
CREATE DATABASE logisticDb;
use logisticDb;

create table fleetVehicleInfo(
vehicleID smallint unsigned not null auto_increment,
vehicleType varchar(50) null,
boughtDate date not null,
capacity smallint unsigned null,
primary key(vehicleID)
);

create table routeInfo(
routeID smallint unsigned not null auto_increment,
routePath varchar(50) null,
primary key (routeID)
);

create table driverInfo(
driverID smallint unsigned not null auto_increment,
driverName varchar(25) null,
driverSurname varchar(25) null,
cell varchar(15) null,
tell varchar(15) null,
email varchar(25) null,
dateCreated date null,
licenceType varchar(10) null,
primary key(driverID)
);

create table shiftInfo(
shiftID varchar(15) not null,
shift_description varchar(50) not null, 
shift_workers smallint unsigned not null,
unique(shiftID)
);

create table workday(
vehicleID smallint unsigned not null,
routeID smallint unsigned not null,
shiftID varchar(15) not null,
driverID smallint unsigned not null,
workDAY date NOT NULL ,
foreign key(vehicleID) references fleetVehicleInfo(vehicleID) on update cascade on delete cascade,
foreign key(routeID) references routeInfo(routeID) on update cascade on delete cascade,
foreign key(shiftID) references shiftInfo(shiftID) on update cascade on delete cascade,
foreign key(driverID) references driverInfo(driverID) on update cascade on delete cascade
);

create table leaveDay(
startDay date not null,
endDay date not null,
driverID smallint unsigned not null,
dateCaptured date not null,
foreign key(driverID) references driverInfo(driverID) on update cascade on delete cascade 
);

create table VehicleMaintenance(
vehicleID smallint unsigned not null,
dateDue date not null,
dateIn date not null,
foreign key(vehicleID) references fleetVehicleInfo(vehicleID) on update cascade on delete cascade
);

create table clientInfo(
clientID smallint not null auto_increment,
clientName varchar(25) null,
clientSurname varchar(25) null,
email varchar(25) null,
cell varchar(15) null,
cell2 varchar(15) null,
dateCreate date null,
primary key(clientID)
);

insert into driverInfo (driverName, driverSurname, cell, tell, dateCreated, licenceType, email) values('thatoyaone', 'Lesetedi', '0619140221', '0711472665', curdate(), 'code 10', 'thato@lesetedi.co.za'), ('Peter', 'Griffins', '0797512565', '0711472665', curdate(), 'code 14', 'pgriffins@samples.com');


select * from driverInfo;

DROP DATABASE IF EXISTS invoiceDb;
CREATE DATABASE invoiceDb;
use invoiceDb;

-- Create table for <YOUR business's> users
CREATE TABLE userinfo(
    userId int not null auto_increment ,
    firstName varchar(50) null,
    lastName varchar(50) null,
    email varchar(50) null,
    tel varchar(15) null,
    cell varchar(15) null,
    upassword varchar(50) null,
    dateCreated datetime null,
    primary key(userId)
);
-- user count starts at 100 and not 1
Alter table userinfo auto_increment = 100;

CREATE TABLE businessInfo(
	businessId int not null auto_increment,
    businessName varchar(80) null,
    ownerId int null,
    email varchar(50) null,
    tell varchar(15) null,
    website varchar(50) null,
    address varchar(100) null,
    vatNo int null,
    logoImg varchar(150) null,
    primary key(businessId),
    FOREIGN key(ownerId) references userInfo(userId) on update cascade on delete cascade
);
CREATE TABLE businessClients(
	businessId int not null,
    clientName varchar(50) null,
    email varchar(50) null,
    tell varchar(150) null,
    logoImg varchar(150) null,
    foreign key(businessId)
    references businessInfo(businessId) 
    ON UPDATE CASCADE
	ON DELETE CASCADE
);

CREATE TABLE clientInvoice(
	clientInvoice int not null,
    businessId int not  null,
    dateCreated datetime null,
    dateDue date null,
    clientName varchar(50) null,
    foreign key(businessId) references businessInfo(businessId)
    ON UPDATE CASCADE
	ON DELETE CASCADE
);

CREATE TABLE businessQuotations(
	quoteId int not null auto_increment,
    businessId int not null,
    descriptions varchar(150) null,
    total int null,
    clientInvoice int not null,
    primary key(quoteId),
    foreign key(businessId) references businessInfo(businessId)
    ON UPDATE CASCADE
	ON DELETE CASCADE

);


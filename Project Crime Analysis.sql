Project Name :Crime Analysis and Prediction         

create database Police
use Police
   CREATE TABLE Crime (
    crime_id INT PRIMARY KEY,
    crime_type VARCHAR(255),
    crime_date DATE,
    location_id INT,  -- Foreign key to Location table
    suspect_id INT,   -- Foreign key to Suspect table
    victim_id INT      -- Foreign key to Victim table
	Foreign key (location_id)
	references Location(location_id),
	Foreign key (suspect_id )
	references Suspect(suspect_id ),
	Foreign key (victim_id)
	references Victim( victim_id)
);         
insert into Crime values
(1,'Bailabel OFfenses','2020-09-23',101,501,1001),
(2,'Non Baliable Offenses','2022-05-21',102,502,1002),
(3,'Offence against Human Body','2023-01-12',103,503,1003),
(4,'CyberCrimes','2021-09-08',104,504,1004),
(5,'Offense against Women','2023-02-13',105,505,1005),
(6,'Attempt to Murder','2021-09-22',106,506,1006),
(7,'Offenses Against Property','2021-03-19',107,507,1007),
(8,'Cognizable Offence','2021-04-01',108,508,1008),
(9, 'Non-Cognizable Offenses','2012-05-09',109,509,1009),
(10,'Compoundable Offenses','2023-04-17',110,510,1010);
 
 Alter table Crime 
 add Total_NO_Crime int;
  update  Crime
  set Total_NO_Crime=3
  where crime_id=1

  update  Crime
  set Total_NO_Crime=4
  where crime_id=2         
  update  Crime
  set Total_NO_Crime=8
  where crime_id=4 
  update  Crime
  set Total_NO_Crime=3
  where crime_id=5
  update  Crime
  set Total_NO_Crime=2
  where crime_id=6
  update  Crime
  set Total_NO_Crime=6
  where crime_id=7
  update  Crime
  set Total_NO_Crime=2
  where crime_id=8
  update  Crime
  set Total_NO_Crime=3
  where crime_id=9
  update  Crime
  set Total_NO_Crime=1
  where crime_id=10
  create Trigger for_Update
on  Crime      
After Update
As Print ('You have made one update opration') 
select*from Crime
-- Table to store information about crime locations
CREATE TABLE Location (
    location_id INT PRIMARY KEY,
	city VARCHAR(255),
    street_address VARCHAR(255),
    state VARCHAR(50),
    zip_code VARCHAR(20)
);
insert into Location values

(101,'Mumbai','Colaba causeway','Maharashtra', 400005),
(102,'Delhi','Rajiv chouk','Delhi',110001),
(103,'Pune','Katraj Road','Maharashtra',411046),
(104,'Jalna','Ambad Pachod Road','Aurangabad',431121),
(105,'Bakshiguda','Tank Bund road', 'Telangana',50080),
(106,'Ludhiana','Sangrur road','Punjab',1441001),
(107,'Pune','Pirangut','Maharashtra',412115),
(108,'Pune','Sus Road','Maharashtra',411045),
(109,'Pune','Mulshi road','Maharashtra',412115),
(110,'Vaijapur','Bhagur Road','Nashik',422001);
select*from Location          
-- Table to store information about suspects
CREATE TABLE Suspect (
    suspect_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    date_of_birth DATE,
    gender CHAR(1),
    address VARCHAR(255)
);
insert into Suspect(suspect_id,first_name,last_name,date_of_birth,gender,address)
values
(501,'Suresh','Rane','1987-09-23','M','Mumbai'),
(502,'Komal','Thomare','1985-05-21','F','Delhi'),
(503,'Vimal','Lokare','1990-01-12','F','Pune'),
(504,'Vaibhav','Mane','1991-09-08','M','Jalna'),
(505,'Vaishali','Pokale','1992-02-13','F','Telangana'),
(506,'Nilima','Shekh','1993-09-22','F','Punjab'),
(507,'Niharika','Arora','1984-03-19','F','Pune'),
(508,'Ved','Mokate','1970-04-01','M','Pune'),
(509,'Harhada','Rokade','1997-05-09','F','Pune'),
(510,'Dixit','Roy','1986-04-17','M','Nashik');
select*from Suspect        
-- Table to store information about victims
CREATE TABLE Victim (
    victim_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    date_of_birth DATE,
    gender CHAR(1),
    address VARCHAR(255)
);
insert into Victim(victim_id,first_name,last_name,date_of_birth,gender,address)
values
(1001,'Niki','Roy','1985-03-01','F','Pune'),
(1002,'Archana','Shinde','1990-08-09','F','Mumbai'),
(1003,'sushma','Shelar','1995-01-03','F','Nashik'),
(1004,'Nikhil','Mone','1987-03-22','M','Hydrabad'),
(1005,'Anshika','Parakhi','1990-04-21','F','Pune'),
(1006,'Harshad','Shinde','1992-09-14','M','Pune'),
(1007,'Lokesh','Shevale','1988-08-12','M','Aurangabad'),
(1008,'Sarika','Bharekar','1991-02-11','F','Punjab'),
(1009,'Kavya','Haragane','1997-09-29','F','New Delhi'),
(1010,'Riya','Randive','1987-03-22','F','Nashik');
select*from Victim
-- Table to store information about police officers
CREATE TABLE PoliceOfficer (
    officer_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    badge_number VARCHAR(20)
);
insert into PoliceOfficer values
(1,'Prakash','Londhe','DCP'),
(2,'Mahesh','Aadhav','IGP'),
(3,'Rakesh','Shinde','ASP'),
(4,'Sanjivani','Nagne','DIGP'),
(5,'Kavita','Lokare','DGP'),
(6,'Nayan','Pokale','SSP'),
(7,'Ram','Rane','DSP'),
(8,'vikas','Tonde','SP'),
(9,'Sayali','Karale','ASP'),
(10,'Viraj','Dhumal','ASP');
select*from PoliceOfficer
-- Table to store information about investigations
; CREATE TABLE Investigation_I (
    investigation_id INT PRIMARY KEY,
    crime_id INT,            -- Foreign key to Crime table
    officer_id INT,          -- Foreign key to PoliceOfficer table
    investigation_date DATE,
    description TEXT,
    status VARCHAR(50) );      -- Status of the investigation (e.g., open, closed)

 insert into Investigation_I values
(501,1,2,'2020-09-23','Being a member of an unlawful Assembly','Open'),
(502,2,1,'2022-05-21','Rape','Open'),
(503,3,3,'2023-01-12','Culpable homicide and murder','Close'),
(504,4,4,'2021-09-08','Email Fraud','Open'),
(505,5,5,'2023-02-13','Sexual Harrasment','Open'),
(506,6,6,'2021-09-22','Murder','Open'),
(507,7,7,'2021-03-19','Robbery and dacoity','Close'),
(508,8,8,'2021-04-01','Waging or attempting to wage war','Open'),
(509,9,9,'2012-05-09','Cheating According to Section 420','Close'),
(510,10,10,'2023-04-17','Criminal breach of contract of service','Open');
select*from Investigation_I

-- Table to store information about criminal records
CREATE TABLE CriminalRecord (
    record_id INT PRIMARY KEY,
    suspect_id INT,          -- Foreign key to Suspect table
    crime_id INT,            -- Foreign key to Crime table
    conviction_date DATE,
    sentence VARCHAR(255),
    status VARCHAR(50)       -- Status of the record (e.g., convicted, acquitted)
	FOREIGN KEY (suspect_id) REFERENCES Suspect(suspect_id),
    FOREIGN KEY (crime_id) REFERENCES Crime(crime_id)
);
insert into CriminalRecord values
(401,501,1,'2022-09-08','Being a member of an unlawful Assembly','Convicted'),
(402,502,2,'2023-01-03','punishable with imprisonment for three years','Acquitted'),
(403,503,3,'2022-01-12',' wide range of criminal offences that typically entail bodily violence','Convicted'),
(404,504,4,'2023-02-10','Fines for a conviction of various computer and internet','Convicted'),
(405,505,5,'2021-09-29','Cruelty by Husband or his Relatives','Acquited'),
(406,506,6,'2022-01-31','Attempted first-degree murder is punishable by life in prison','Convicted'),
(407,507,7,'2023-03-20','that affect another persons rights of ownership','Acquited'),
(408,508,8,'2022-04-07','crime that is considered serious enough to warrant immediate arrest without a warrant by the police','Convicted'),
(409,509,9,'2023-07-15',' which is punishable in nature and against which a complaint is registered','Convicted'),
(410,510,10,'2021-06-12','which are discussed in Section 320 of the Code of Criminal Procedure','Convicted');

select*from CriminalRecord


--Data Retrieval:
--1. Retrieve the details of all crimes
select*from Crime;

--2. List the distinct crime types in the database.
select Distinct(crime_type)
from Crime;


--3. Find the number of crimes that occurred in a specific city.
select C.Total_NO_Crime,L.city
from Crime C join Location L
on C.location_id=L.location_id
where city='Pune';

select 
count(*)as Crimes_In_Pune

from Crime C join Location L
on C.location_id=L.location_id
where city ='Pune';


--4. Display the first and last names of all suspects.
select first_name,last_name
from Suspect;

--5. Retrieve the location details for a given crime.
select C.crime_type,L.street_address,L.city,L.state
from Crime C join Location L
on C.location_id=L.location_id

--6. Get the list of victims along with their addresses.
select first_name,last_name,address
from Victim
  
--7. Find the total number of investigations conducted by each police officer?

select officer_id,count(investigation_id) as total_number_investgations
from Investigation_I
group by officer_id


--8. List the crimes with their corresponding suspect names.
select C.crime_type,S.first_name,S.last_name
from Crime C join Suspect S
on C.suspect_id=S.suspect_id;


--9. Retrieve the names of police officers involved in ongoing investigations.
select P.first_name,P.last_name,I.investigation_id,I.description
from PoliceOfficer P right join Investigation_I I
on P.officer_id=I.officer_id;
select S.first_name,S.last_name,CR.status,CR.sentence,CR.conviction_date
from CriminalRecord CR join Suspect S
on S.suspect_id=CR.suspect_id
--10. Display the criminal records, including suspect names and associated crimes.
select C.sentence,C.status,C.conviction_date,S.first_name,S.last_name
 from CriminalRecord C inner join Suspect S
 on C.suspect_id=S.suspect_id

--Data Modification:
--11. Insert a new crime record into the database.
select*from Crime
create trigger for_insert
on Crime
after insert
As Print('You have made new insert value');

insert into Crime values
(11,'Baliabel Offenses','2022-01-18',110,510,1011,2),
(12,'Attempt to Murder','2023-07-09',111,511,1012,3);
--Becoz of foreign we need to insert into tables victim,Suspect,Location,PoliceOfficer also

insert into Victim values
(1011,'Raju','Tiwari','1981-02-11','M','Mumbai'),
(1012,'Danashri','Sathe','1990-05-10','F','Pune');

insert into Suspect values
(511,'Shital','Kumbhar','1994-07-12','F','Pune'),
(512,'Akshada','Awale','1996-01-13','F','Pune');

insert into Location(location_id,city,street_address,state,zip_code)
values(111,'Pune','Karve Road','Maharashtra',400058),
(112,'Pune','JM Road','Maharashtra',400078);

insert into PoliceOfficer Values
(11,'Tanvi','Killedar','SP'),
(12,'Rani','Gupta','DSP');

--12. Add a new location to the system.
insert into Location values
(113,'Pune','Tulshi Bag','Maharashtra',400078);

--13. Update the status of a specific investigation.
update Investigation 
set status='Close'
where investigation_id=302;

--14. Mark a suspects criminal record as acquitted
select S.first_name,S.last_name,Cr.status
from Suspect S join CriminalRecord Cr
on S.suspect_id=Cr.suspect_id
where  status='Acquited';

--15. Insert a new police officer into the database.
insert into PoliceOfficer values
(13,'Divya','Sanas','SP');

--16. Update the address of a victim.
update Victim
set address='Pune'
where victim_id=1003
select*from Crime

--17. Delete a crime record along with its associated details
Alter table Crime DROP CONSTRAINT  FK__Crime__suspect_i__44FF419A
ALTER TABLE Crime DROP CONSTRAINT FK__Crime__victim_id__440B1D61
ALTER TABLE Crime DROP CONSTRAINT FK__Crime__victim_id__45F365D3;

ALTER TABLE CriminalRecord DROP CONSTRAINT  FK__CriminalR__statu__48CFD27E           

Delete from CriminalRecord
where record_id='404';
select*from CriminalRecord

Delete from Crime 
where crime_type='Cognizable Offence';
sp_help Crime

--18. Remove a suspect from the database.
Alter table Crime DROP CONSTRAINT  FK__Crime__suspect_i__44FF419A
ALTER TABLE Crime DROP CONSTRAINT FK__Crime__victim_id__440B1D61
ALTER TABLE Crime DROP CONSTRAINT FK__Crime__victim_id__45F365D3;

ALTER TABLE CriminalRecord DROP CONSTRAINT  FK__CriminalR__statu__48CFD27E           

delete from Suspect
where first_name='Suresh';
select *from Suspect

--19. Add a new investigation with a specified description.
insert into Investigation values
(311,11,12,'2022-01-08','Robbery and decocity','Close');

--20. Delete a location and update associated crime records.

Delete from Location
where location_id= 107

update CriminalRecord
set status='Acquited'
where record_id=402

Advanced Queries:
--21. Find the suspect with the most criminal records.
select S.first_name,S.last_name,C.Crime_type,C.Total_No_Crime
from Suspect S join Crime C
on S.suspect_id=C.suspect_id
where Total_No_Crime>5

--22. Retrieve the average age of all victims.
SELECT CAST(AVG(CAST(date_of_birth AS INT)) AS DATETIME) FROM Victim;

--23. Identify the crime type with the highest occurrence.
select crime_type,Total_No_Crime
from Crime
where Total_NO_Crime>6;

--24. List the top 5 cities with the most crimes.
select L.City,C.crime_type
from Location L join Crime C
on L.location_id=C.location_id
where Total_No_Crime>5

--25. Find the suspects who   have not been involved in any crimes
select S.first_name,S.last_name
from Suspect S join Crime C
on S.suspect_id=C.suspect_id
where first_name not in(crime_type);

--26. Display the crime types and the number of occurrences for each.
select crime_type,Total_No_Crime
from Crime;

--27. Identify the police officer with the highest number of closed investigations.
select P.first_name,P.last_name,I.status
from PoliceOfficer P join Investigation_I I
on P.officer_id=I.officer_id
where status='close'
select*from Investigation_I
select*from Suspect


--28. Find the suspects involved in more than one ongoing investigation.
select S.first_name,S.last_name,I.investigation_date
from Suspect S join Investigation_I I
on S.suspect_id=I.investigation_id

--29. Display the crimes that are still open and their corresponding details.
select C.crime_type,I.Description,I.status
from Crime C left join Investigation_I I
on C.crime_id=I.crime_id
where status='Open';

--30. List the locations with the highest and lowest crime occurrences.
select L.city,C.Total_No_Crime
from Location L join Crime C
on L.location_id=C.location_id
where Total_No_Crime>5;

select L.city,C.Total_No_Crime
from Location L join Crime C
on L.location_id=C.location_id
where Total_No_Crime=1;

Data Aggregation:
--31. Calculate the total number of crimes in the database.
select sum(Total_No_Crime) as total_crime
from Crime

--32. Find the average sentence length for all criminal records.

SELECT AVG(CAST(sentence AS float)) FROM CriminalRecord;

select avg(sentence) as avg_length
from CriminalRecord

--33. Identify the city with the highest crime rate.
select max(city) as highest_crime_rate
from Location
select*from Investigation

--34. Retrieve the earliest and latest crime dates in the database.
Select Crime_type,crime_date
from Crime 
where crime_date between '2023-01-01'and'2023-12-01';


--35. Calculate the total number of investigations for each crime type.
SELECT crime_id, SUM(investigation_id) as Total_investigations
   FROM Investigation_I
 GROUP BY crime_id;

--36. Find the average age of suspects at the time of their first criminal record.

SELECT first_name,last_name, 
DATEDIFF(YEAR, date_of_birth, GETDATE()) AS 'Age' FROM Suspect;

--37. Identify the crime types with the most and least severe sentences.
select C.Crime_type,Cr.sentence
from Crime C join CriminalRecord Cr
on C.crime_id=Cr.crime_id  
select*from Investigation_I  
select*from Crime
38. Calculate the percentage of crimes that are still Open
WITH Tot(Total) 
    SELECT COUNT(*) FROM Investigation_I

SELECT status, 
       CAST(COUNT(*) / Total * 100 AS VARCHAR(5)) + '%'
FROM Investigattion_I
GROUP BY status;
--39. Find the average number of investigations conducted by each police officer.    
select officer_id,avg(investigation_id)as avg_investigation
from Investigation
group by officer_id


--40. Calculate the total number of victims involved in ongoing investigations.
sselect sum(victim_id) as total_victims
from victim

find the number of crime that occured in specific city?
select count( crime_type)
from Crime join Location
where city='Pune'

select count (crime_type)
from crime join location 
on 
Use SupportManagmentSystem ; 

create table Trainee
(
Trainee_Id int Primary Key , 
Fname varchar(20) not null, 
Lname varchar(20) not null , 
Age int  , 
Gender nvarchar(1) 
);

create table Trainee_Address 
(
primary key (Trainee_id ,Address),
Trainee_id int ,
Address varchar(50)
Foreign Key (Trainee_id) references Trainee(Trainee_Id) 
);

create table Instructor
(
Ins_Id int Primary Key , 
Ins_Name varchar(20) ,
Salary numeric(8,2)
); 


create table Track 
(
Track_Id int Primary Key , 
Track_Name varchar(50) , 
Ins_id int ,
Foreign Key (Ins_id) references Instructor(Ins_Id)
);


create table Course
(
Crs_Id int Primary Key , 
Crs_Name varchar(20) , 
Duration varchar(20),
Track_id int , 
foreign key (Track_id) references Track(Track_Id)
);


create table Project
(
Project_Id int Primary Key , 
Pname varchar(50) , 
Evaluation varchar(50) , 
Trainee_id int , 
Ins_id int ,
Crs_id int , 
Foreign Key (Ins_id) references Instructor(Ins_Id),
Foreign Key (Crs_id) references Course(Crs_Id),
Foreign Key (Trainee_id) references Trainee(Trainee_Id)
);

create table Mentor 
(
Mentor_Id int Primary Key , 
Mentor_Name varchar(20) , 
Gender nvarchar(1) , 
Ins_id int , 
Foreign Key (Ins_id) references Instructor(Ins_Id)
);

create table Session
(
Session_Id int Primary Key , 
Session_Name varchar(50) , 
Mentor_id int , 
Crs_id int ,
foreign key (Crs_id)references Course (Crs_Id),
Foreign key (Mentor_id) references Mentor(Mentor_Id)
);

create table Enroll 
(
Primary key(Trainee_id,Crs_id),
Trainee_id int ,
Crs_id int ,
Attendence varchar(20),
foreign key (Crs_id)references Course (Crs_Id),
Foreign Key (Trainee_id) references Trainee(Trainee_Id)
);

create table Teach 
(
primary key (Mentor_id,Crs_id),
Mentor_id int ,
Crs_id int  ,
Foreign key (Mentor_id) references Mentor(Mentor_Id) ,
Foreign key (Crs_id) references Course (Crs_Id)
);
-----------------------------------------
insert into Trainee 
       (Trainee_Id , Fname,Lname,Age,Gender)
values
 (1 , 'Yara' ,'Hamza' ,20,'F'),
 (2 , 'Ali' ,'Akram' ,33,'M'),
 (3 , 'Mahmoud' ,'fathy' ,23,'M'),
 (4 , 'Tala' ,'Khaled' ,22,'F'),
 (5 , 'Reem' ,'Eslam' ,19,'F'),
 (6 , 'Abdelrahman' ,'Osama' ,24,'M'),
 (7 , 'Moaz' ,'Nour' ,25,'M'),
 (8 , 'Alaa' ,'Ahmed' ,20,'F'),
 (9 , 'Fatma' ,'nasser' ,27,'F'),
 (10 , 'Omar' ,'Yassin' ,30,'M')

 
 Insert into Instructor 
       (Ins_Id , Ins_Name,Salary)
values
(1 , 'Ahmed' ,2000.00 ),
(2 , 'Naser' ,7000.00 ),
(3 , 'Tarek' ,5500.00 ),
(4 , 'Noha' ,4000.00 ),
(5 , 'Mostafa' ,3000.00 ),
(6 , 'Toqa' ,8000.50 ),
(7 , 'Ghadeer' ,10000.00 ),
(8 , 'Essa' ,4000.00 ),
(9 , 'Ibrahim' ,9000.00 ),
(10 , 'Maher' ,6400.00 )

Insert into Mentor 
       (Mentor_Id,Mentor_Name,Gender,Ins_id)
Values 
(1,'Khaled Ahmed' , 'M' , 1),
(2,'Maha Ali' , 'F' , 2),
(3,'Ahmed Nasser' , 'M' , 3),
(4,'Mohammed Saleh' , 'M' , 4),
(5,'Roaa Hesham' , 'F' , 5),
(6,'Ali Osama' , 'M' , 6),
(7,'Shaker Ahmed' , 'M' , 7),
(8,'Nada Ali' , 'F' , 8),
(9,'Adel' , 'M' , 9),
(10,'Hamdy' , 'M' , 10)


Insert into Course 
        (Crs_Id ,Crs_Name ,Duration)
values
(10,'Programming Basics', Null),
(11,'OOP','semster'),
(12,'Static','3 weeks'),
(13,'English' , Null),
(14,'Parallel' , Null),
(15,'Technical Writting' , 'semster'),
(16,'Business','2 months'),
(17,'C#' , '2 years'),
(18,'Elctronics', Null),
(19,'Mechanics','semster'),
(20,'Logic','semster'),
(21,'DataBase',Null) 

Insert into Project 
       (Project_Id ,Pname , Evaluation ,Ins_id ,Crs_id,Trainee_id)
Values
(1,'DataBase' ,'2 Weeks' , 3,12,4),
(2,'Web Design' ,'One Week' , 3,11,5),
(3,'Maths' ,'2 Weeks' , 4,15,6),
(4,'Physics' ,Null , 5,10,7),
(5,'Data Structure' ,'2 Weeks',10,13,8),
(6,'Modeling' ,'2 Months' , 7,14,9),
(7,'UI/UX' ,'one month' , 6,20,10),
(8,'DataBase' ,'2 Weeks' , 9,21,1),
(9,'Graghics' ,Null , 9,17,2),
(10,'Programming Basics' ,Null , 8,18,3)


Insert into Session 
       (Session_Id ,Session_Name ,Crs_id,Mentor_Id)
Values 
(1,Null,12,1),
(2,Null,13,3),
(4,Null,19,2),
(5,Null,15,6),
(6,Null,10,8),
(7,Null,21,9),
(8,Null,20,4),
(9,Null,18,7),
(10,Null,17,9)

Insert into Track 
       (Track_Id ,Track_Name,Ins_id)
values 
(10,'AI',3),
(9,'Front-End',4),
(8,Null,5),
(7,'UI/UX',6),
(6,Null,7),
(5,'Back-End',8),
(4,'Programmming Basics',9),
(3,'Full-Stack',10),
(2,'Devops',6),
(1,'BI',7)

Insert into Trainee_Address 
         (Trainee_id,Address)
values 
(1 ,'Aswan Nafaq Street'),
(2,'Atlas Street'),
(3,'Maadi 301 St') , 
(4,'Elsadate') ,
(5,'kema street'), 
(6,'Giza'),
(7,'daar Elsalam'), 
(8,'saida Zeinb'), 
(9,'Haram 23 Street'),
(10,'26 jule Street')

Insert into teach 
       (Mentor_id ,Crs_id)
values
(1,12),
(2,13),
(3,19),
(4,21),
(5,20),
(6,17)

insert into Enroll
        (Crs_id , Trainee_id)
values
(12,1),
(14,3),
(15,2),
(16,4),
(17,5),
(20,7),
(10,8),
(13,9)


----------------------------
--------------1
Select *
from Mentor ; 
--------------2
select Fname + ' '+Lname as [Full Name] 
from Trainee t join Project p 
on t.Trainee_Id = p.Trainee_id 
where Pname = 'DataBase';
--------------3
select count(Crs_Id) ,t.Track_Id , t.Track_Name
from Course c join Track t 
on c.Track_id = t.Track_Id 
group by t.Track_Id , t.Track_Name ;

--------------4
select c.Crs_Name, t.Track_Name
from Course c join Track t 
on c.Track_id = t.Track_Id
where c.Crs_Id in
    (select s.Crs_ID
    from Session s
    group by s.Crs_ID
    having count(Session_ID) <= 2
    )

----------------5
select count(t.Trainee_Id) ,I.Ins_Name, c.Crs_Name 
from Trainee t join Project p  
on t.Trainee_Id = p.Trainee_id 
join Instructor i on i.Ins_Id = p.Ins_id 
join Course c on c.Crs_Id = p.Crs_id 
group by I.Ins_Name,c.Crs_Name

----------------6
select *
from Mentor 

select Mentor_Id
from Mentor 
where Mentor_Name = 'Ahmed Nasser' ; 

select Mentor_Id
from Mentor 
where Mentor_Name = 'Maha ALi' ; 

update Teach
set Mentor_id = 2
where Mentor_id = (select Mentor_ID from Mentor where Mentor_Name = 'Ahmed Nasser');

update Session
set Mentor_ID = 2
where Mentor_id = (select Mentor_ID from Mentor where Mentor_Name = 'Ahmed Nasser');

update Mentor
set Mentor_Name = 'Maha ALi'
where Mentor_Name = 'Ahmed Nasser' ; 

delete from Mentor
where Mentor_Name = 'Ahmed Nasser' ; 
---------------7
update Trainee 
set age = 21 
where Trainee_Id in (select Trainee_id from Project 
                     where Pname ='DataBase')

----------------8
select  Fname + ' '+Lname as [Full Name]  , gender 
from Trainee t  join Project p 
on t.Trainee_Id = p.Trainee_id 
join Instructor i 
on i.Ins_Id = p.Ins_id 
where Gender = 'F' and i.Ins_Name in (select Gender from Mentor 
                                    where Gender = 'F')
union all 
select  Fname + ' '+Lname as [Full Name]  , gender 
from Trainee t  join Project p 
on t.Trainee_Id = p.Trainee_id 
join Instructor i 
on i.Ins_Id = p.Ins_id 
where Gender = 'M' and i.Ins_Name in (select Gender from Mentor 
                                    where Gender = 'M')

-------------9
select t.Trainee_Id ,
ROW_NUMBER()over(partition by c.Crs_Id order by newid()) as RN
from Trainee t join Project p 
on t.Trainee_Id = p.Trainee_id 
join Course c 
on c.Crs_Id = p.Crs_id



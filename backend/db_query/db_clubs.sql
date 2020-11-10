-- \\\\\\\\\\\\\\\\\ Presetup database  ////////////////// --
-- \\\\\\\\\\\\\\\\\\\\\\\\\\\//////////////////////////////// --
drop database if exists clubs;
create database clubs;
use clubs;
SET foreign_key_checks = 0;
-- SET GLOBAL time_zone = 'SYSTEM';
-- SET @@global.time_zone= 'SYSTEM';
-- select * from club;

-- \\\\\\\\\\\\\\\\\ Drop previous database ////////////////// --
-- \\\\\\\\\\\\\\\\\\\\\\\\\\\//////////////////////////////// --

DROP TABLE IF EXISTS club_activities;
DROP TABLE IF EXISTS activities;
DROP TABLE IF EXISTS club_types;
DROP TABLE IF EXISTS student;
DROP TABLE IF EXISTS club;
DROP TABLE IF EXISTS student_club;
DROP TABLE IF EXISTS all_type;

-- \\\\\\\\\\\\\\\\\ Create table for clubs  ////////////////// --
-- \\\\\\\\\\\\\\\\\\\\\\\\\\\//////////////////////////////// --

CREATE TABLE student (
	student_id integer auto_increment,
    student_name varchar(200) not null,
    email varchar(200) not null unique,	
    e_password varchar(200) ,
    primary key (student_id)
);
-- INSERT student VALUES
-- ('test3','newemail3@gmail.com','123456');
CREATE TABLE club(	
	club_id integer auto_increment,
	club_name varchar(200) not null unique,
	club_email varchar(200),
	club_about varchar(5000),
    club_avatar varchar(5000),
    club_background varchar(5000),
    club_award varchar(200),
    club_location varchar(200),
    primary key(club_id)
);
-- INSERT club VALUES
-- (2,'dspsjsu',NULL,'To foster the study of business, encourage scholarship, social activity, and the association of students; to promote closer affiliation between the commercial world and students of commerce, and to raise the standards of commercial ethics, culture, civic, and the welfare of the community.', NULL,'1 Washington Sq
-- San Jose, California, California, USA');
CREATE TABLE student_club(
	student_club_id integer auto_increment,
    student_id integer,
    club_id integer,
    primary key(student_club_id),
    foreign key (student_id) references student(student_id) ON DELETE CASCADE,
    foreign key (club_id) references club(club_id) ON DELETE CASCADE
);

CREATE TABLE activities(
	activities_id integer auto_increment,
    activities_name varchar(200) not null,
    activities_date datetime ,
    activities_links varchar(1000),
    primary key(activities_id)
);



CREATE TABLE club_activities(
	club_activites_id integer auto_increment,
    activities_id integer,
    club_id integer,
    -- student_club_id integer, --
    primary key(club_activites_id),
    foreign key (activities_id) references activities(activities_id) ON DELETE CASCADE,
    foreign key (club_id) references club(club_id) ON DELETE CASCADE
    -- foreign key (student_club_id) references student_club(student_club_id) ON DELETE CASCADE --
);

CREATE TABLE club_types(
	club_type_id integer auto_increment,
    club_id integer,
    type_id integer,
    primary key (club_type_id),
    foreign key (club_id) references club(club_id) ON DELETE CASCADE,
    foreign key (type_id) references all_type(type_id) ON DELETE CASCADE
);

CREATE TABLE all_type(
	type_id integer auto_increment,
    alltypes varchar(200) not null,
    primary key(type_id)
);
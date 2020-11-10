-- \\\\\\\\\\\\\\\\ Verification///////////////// --
-- \\\\\\\\\\\\\\\\\\\\\\\/////////////////////// --
use clubs;
SELECT activities_date FROM activities;
SELECT * FROM activities;
SELECT * FROM club;
SELECT * FROM club_activities;
SELECT * FROM all_type;
SELECT * FROM club_types;
SELECT * FROM student;
SELECT * FROM student_club;
SELECT club_activities.activities_id FROM club_activities WHERE club_activities.club_id in (SELECT club.club_id FROM club WHERE club.club_name= 'ACI');
SELECT * FROM activities WHERE activities.activities_id IN (SELECT club_activities.activities_id FROM club_activities WHERE club_activities.club_id in (SELECT club.club_id FROM club WHERE club.club_name= 'ACI'));
SELECT * FROM activities WHERE activities.activities_id IN (SELECT club_activities.activities_id FROM club_activities,club WHERE club_activities.club_id = club.club_id);


SELECT * FROM club_types where club_types.club_id in (SELECT club.club_id FROM club WHERE club.club_name= 'ALASC');
SELECT club.club_name, club.club_email, club.club_about, club.club_avatar, club.club_background, club.club_award, club.club_location, all_type.alltypes FROM club, all_type WHERE club.club_id in (SELECT club_types.club_id FROM club_types where club_types.club_id in (SELECT club.club_id FROM club WHERE club.club_name= 'ALASC')) and all_type.type_id in (SELECT club_types.type_id FROM club_types where club_types.club_id in (SELECT club.club_id FROM club WHERE club.club_name= 'ALASC')) ;
SELECT club.club_id, club.club_name , club.club_email, club.club_about, club.club_avatar, club.club_background, club.club_award, club.club_location, all_type.alltypes  FROM club LEFT JOIN club_types ON club.club_id =club_types.club_id LEFT JOIN all_type ON club_types.type_id = all_type.type_id;


-- SELECT * FROM club WHERE club.club_id IN (SELECT club_types.club_id FROM club_types RIGHT JOIN club ON club_types.club_id = (SELECT club.club_id FROM club WHERE club.club_name= 'ALSC'));
-- \\\\\\\\\\\\\\\ Types of Clubs/////////////// --
-- \\\\\\\\\\\\\\\\\\\\\\/////////////////////// --

INSERT all_type(alltypes) VALUES(
	'Academic and Honorary Organizations'
);
INSERT all_type(alltypes) VALUES(
	'Club Sports'
);
INSERT all_type(alltypes) VALUES(
	'Cultural and Religious Organizations'
);
INSERT all_type(alltypes) VALUES(
	'Fraternities and Sororities'
);
INSERT all_type(alltypes) VALUES(
	'Special Interest Organizations'
);
-- \\\\\\\\\\\\\\\ACI CLUB/////////////// --
-- \\\\\\\\\\\\\\\\\\\/////////////////// --
INSERT club VALUES
(1,
'ACI',
NULL,
'ACI SJSU Chapter\'s mission is to promote Civil Engineering as a profession and to motivate student members through events with faculty and professionals.',
'https://scontent-sjc3-1.xx.fbcdn.net/v/t1.0-1/28379782_161814911205971_7720924843034231219_n.jpg?_nc_cat=102&ccb=2&_nc_sid=dbb9e7&_nc_ohc=NFQQFS-kUd0AX-Wtg5x&_nc_ht=scontent-sjc3-1.xx&oh=a6075c8c40fe6e8a307eb36213f15df3&oe=5FCA1AB6',
'https://scontent-sjc3-1.xx.fbcdn.net/v/t1.0-9/28279742_161815871205875_6636713195090173525_n.jpg?_nc_cat=109&ccb=2&_nc_sid=6e5ad9&_nc_ohc=yqc8WhJPoQIAX-QIbNj&_nc_ht=scontent-sjc3-1.xx&oh=0b09c4cd06f76f696c5db0e6749111d8&oe=5FC96B9A',
NULL,
'1 Washington Sq, San Jose, California, USA');

INSERT club_types(club_id, type_id) VALUES(
1,
1
);
INSERT activities VALUES
(
1,
'Granite Construction Lunch & Learn',
'2020-03-21 11:00:00',
'www.facebook.com/events/193075097956927/?acontext=%7B%22source%22%3A5%2C%22action_history%22%3A[%7B%22surface%22%3A%22page%22%2C%22mechanism%22%3A%22main_list%22%2C%22extra_data%22%3A%22%5C%22[]%5C%22%22%7D]%2C%22has_source%22%3Atrue%7D'
);
INSERT activities VALUES
(
2,
'Utelite Corporation Lunch & Learn',
'2020-03-07 12:00:00',
'www.facebook.com/events/538389859880907/?acontext=%7B%22source%22%3A5%2C%22action_history%22%3A[%7B%22surface%22%3A%22page%22%2C%22mechanism%22%3A%22main_list%22%2C%22extra_data%22%3A%22%5C%22[]%5C%22%22%7D]%2C%22has_source%22%3Atrue%7D');

INSERT club_activities(activities_id, club_id) VALUES
(
1,
1
);

INSERT club_activities(activities_id, club_id) VALUES
(
2,
1
);

-- \\\\\\\\\\\\\\\ALASC CLUB/////////////// --
-- \\\\\\\\\\\\\\\\\\\\\\\/////////////////////// --
INSERT club VALUES
(2,
'ALASC',
'sjsualasc@gmail.com',
'The ALA Student Chapter at San Jose State University is intended to foster student participation in the American Library Association, to sponsor professional and social events for the students of the i-School, and to provide a supportive environment in which students can work and learn together.',
'https://scontent-sjc3-1.xx.fbcdn.net/v/t1.0-1/522808_10151181274988077_882876348_n.png?_nc_cat=100&ccb=2&_nc_sid=dbb9e7&_nc_ohc=AH_FeZ_76OkAX_7boFQ&_nc_ht=scontent-sjc3-1.xx&oh=8c535efa1c07488da55d94237c6fea79&oe=5FCAEFD6',
'https://scontent-sjc3-1.xx.fbcdn.net/v/t1.0-9/10672272_10152649151543077_9045628362422310552_n.jpg?_nc_cat=111&ccb=2&_nc_sid=6e5ad9&_nc_ohc=_vnH91k4JokAX-oXqCv&_nc_ht=scontent-sjc3-1.xx&oh=03e2ab01378661719c3bbac95f6d04f8&oe=5FCA7D29',
'SJSU\'s ALASC was named the 2009 and 2010 ALA Student Chapter of the Year!',
'1 Washington Sq, San Jose, California, USA');
INSERT club_types(club_id, type_id) VALUES(
2,
1
);
INSERT activities VALUES
(
3,
'ALASC Fundraiser for Paradise Library',
'2020-12-04 14:30:00',
'www.facebook.com/events/301187100726861/?acontext=%7B%22source%22%3A5%2C%22action_history%22%3A[%7B%22surface%22%3A%22page%22%2C%22mechanism%22%3A%22main_list%22%2C%22extra_data%22%3A%22%5C%22[]%5C%22%22%7D]%2C%22has_source%22%3Atrue%7D'
);

INSERT activities VALUES
(
4,
'ALA Annual Conference – Tips & Tricks',
'2020-02-25 18:30:00',
'www.facebook.com/events/358220255020943/?acontext=%7B%22source%22%3A5%2C%22action_history%22%3A[%7B%22surface%22%3A%22page%22%2C%22mechanism%22%3A%22main_list%22%2C%22extra_data%22%3A%22%5C%22[]%5C%22%22%7D]%2C%22has_source%22%3Atrue%7D'
);

INSERT activities VALUES
(
5,
'Developing an Online, Professional Personal',
'2020-02-27 18:30:00',
'www.facebook.com/events/241692620169698/?acontext=%7B%22source%22%3A5%2C%22action_history%22%3A[%7B%22surface%22%3A%22page%22%2C%22mechanism%22%3A%22main_list%22%2C%22extra_data%22%3A%22%5C%22[]%5C%22%22%7D]%2C%22has_source%22%3Atrue%7D'
);

INSERT club_activities(activities_id, club_id) VALUES
(
3,
2
);

INSERT club_activities(activities_id, club_id) VALUES
(
4,
2
);

INSERT club_activities(activities_id, club_id) VALUES
(
5,
2
);

-- \\\\\\\\\\\\\\\ BMES CLUB/////////////// --
-- \\\\\\\\\\\\\\\\\\\\\\\\//////////////////////// --

INSERT club VALUES
(3,
'BMES',
'sjsubmes@sjsubmes.org',
'The BMES student Chapter was established during the Spring of 2008 and is composed of graduate and undergraduate students from various engineering and science disciplines, alumni, faculty and industry professionals.',
'https://scontent-sjc3-1.xx.fbcdn.net/v/t1.0-1/41948285_1074940772670668_3790547086714339328_n.png?_nc_cat=104&ccb=2&_nc_sid=dbb9e7&_nc_ohc=kqoDtpKRa4kAX9xWLKI&_nc_ht=scontent-sjc3-1.xx&oh=776b081219c6d4df5f42e51f5ceb6e3e&oe=5FCCCD38',
'https://scontent-sjc3-1.xx.fbcdn.net/v/t31.0-8/621026_205549322943155_1187605067_o.png?_nc_cat=108&ccb=2&_nc_sid=6e5ad9&_nc_ohc=tLGd-_Z-IOcAX-0nJyl&_nc_ht=scontent-sjc3-1.xx&oh=b5c8a86de7cf3e2772ef84ba60b7645d&oe=5FCB3985',
'2012 Meritorious Achievement Award from National BMES',
'1 Washington Sq, San Jose, California, USA');
INSERT club_types(club_id, type_id) VALUES(
3,
1
);
INSERT activities VALUES
(
6,
'BMEidea First Meeting',
'2020-09-11 13:30:00',
'www.facebook.com/events/1205725289559858/?acontext=%7B%22source%22%3A5%2C%22action_history%22%3A[%7B%22surface%22%3A%22page%22%2C%22mechanism%22%3A%22main_list%22%2C%22extra_data%22%3A%22%5C%22[]%5C%22%22%7D]%2C%22has_source%22%3Atrue%7D'
);

INSERT activities VALUES
(
7,
'End of the semester dinner',
'2020-05-25 18:30:00',
'www.facebook.com/events/1011231472386517/?acontext=%7B%22source%22%3A5%2C%22action_history%22%3A[%7B%22surface%22%3A%22page%22%2C%22mechanism%22%3A%22main_list%22%2C%22extra_data%22%3A%22%5C%22[]%5C%22%22%7D]%2C%22has_source%22%3Atrue%7D');

INSERT activities VALUES
(
8,
'BMES Bowling',
'2020-09-26 17:45:00',
'www.facebook.com/events/234797960550332/?acontext=%7B%22source%22%3A5%2C%22action_history%22%3A[%7B%22surface%22%3A%22page%22%2C%22mechanism%22%3A%22main_list%22%2C%22extra_data%22%3A%22%5C%22[]%5C%22%22%7D]%2C%22has_source%22%3Atrue%7D');

INSERT club_activities(activities_id, club_id) VALUES
(
6,
3
);
INSERT club_activities(activities_id, club_id) VALUES
(
7,
3
);

INSERT club_activities(activities_id, club_id) VALUES
(
8,
3
);

-- \\\\\\\\\\\\\\\ DSP CLUB/////////////// --
-- \\\\\\\\\\\\\\\\\\\\\\\\//////////////////////// --
INSERT club VALUES
(4,
'DSP',
'dspsjsu.vppr@gmail.com',
'Molding business, economics, and hospitality students into young professionals for over 40 years at SJSU.',
'https://scontent-sjc3-1.xx.fbcdn.net/v/t31.0-1/c578.379.709.709a/885793_869477229765719_8432691622653598836_o.jpg?_nc_cat=104&ccb=2&_nc_sid=dbb9e7&_nc_ohc=aBlosz-SUuUAX_OUQNW&_nc_ht=scontent-sjc3-1.xx&oh=d3596c16928bb4e66ed7cd53ac47999f&oe=5FC9F761',
'https://scontent-sjc3-1.xx.fbcdn.net/v/t31.0-1/c578.379.709.709a/885793_869477229765719_8432691622653598836_o.jpg?_nc_cat=104&ccb=2&_nc_sid=dbb9e7&_nc_ohc=aBlosz-SUuUAX_OUQNW&_nc_ht=scontent-sjc3-1.xx&oh=d3596c16928bb4e66ed7cd53ac47999f&oe=5FC9F761',
NULL,
'1 Washington Sq, San Jose, California, USA');

INSERT club_types(club_id, type_id) VALUES(
4,
1
);

INSERT activities VALUES
(
9,
'I\'dspeak - Hosted by Delta Sigma Pi',
'2020-11-21 18:00:00',
'www.facebook.com/events/654807978381253/?acontext=%7B%22source%22%3A5%2C%22action_history%22%3A[%7B%22surface%22%3A%22page%22%2C%22mechanism%22%3A%22main_list%22%2C%22extra_data%22%3A%22%5C%22[]%5C%22%22%7D]%2C%22has_source%22%3Atrue%7D'
);

INSERT activities VALUES
(
10,
'Delta Sigma Pi SJSU - Spring 2020 Recruitment',
'2020-02-26 09:00:00',
'www.facebook.com/events/654807978381253/?acontext=%7B%22source%22%3A5%2C%22action_history%22%3A[%7B%22surface%22%3A%22page%22%2C%22mechanism%22%3A%22main_list%22%2C%22extra_data%22%3A%22%5C%22[]%5C%22%22%7D]%2C%22has_source%22%3Atrue%7D'
);

INSERT activities VALUES
(
11,
'Delta Sigma Pi SJSU - Fall 2020 Recruitment',
'2020-09-09 09:00:00',
'www.facebook.com/events/666622750644954/?acontext=%7B%22source%22%3A5%2C%22action_history%22%3A[%7B%22surface%22%3A%22page%22%2C%22mechanism%22%3A%22main_list%22%2C%22extra_data%22%3A%22%5C%22[]%5C%22%22%7D]%2C%22has_source%22%3Atrue%7D');

INSERT club_activities(activities_id, club_id) VALUES
(
9,
4
);

INSERT club_activities(activities_id, club_id) VALUES
(
10,
4
);

INSERT club_activities(activities_id, club_id) VALUES
(
11,
4
);

-- \\\\\\\\\\\\\\\ FMA CLUB/////////////// --
-- \\\\\\\\\\\\\\\\\\\\\\\\/////////////// --
INSERT club VALUES
(5,
'FMA',
'membership.fma@gmail.com',
'The Financial Management Association of San Jose State University is proud to educate our members in understanding the principles of finance and business.',
'https://scontent-sjc3-1.xx.fbcdn.net/v/t31.0-1/p720x720/14352428_536171653239486_143640730940843655_o.jpg?_nc_cat=100&ccb=2&_nc_sid=dbb9e7&_nc_ohc=ZQo4EEoxhVAAX8a0v1m&_nc_ht=scontent-sjc3-1.xx&tp=6&oh=2840c5dae64328b86ac247b3692ffeb9&oe=5FCA6A8A',
'https://scontent-sjc3-1.xx.fbcdn.net/v/t1.0-9/57484672_1020086138181366_8952203276552503296_o.png?_nc_cat=101&ccb=2&_nc_sid=6e5ad9&_nc_ohc=Avq_bcjKyqQAX-rD2BL&_nc_ht=scontent-sjc3-1.xx&oh=84b893903acce14b88367adcad3f1572&oe=5FCCE174',
'2014 SJSU Organization of The Year',
'1 Washington Sq, San Jose, California, USA');
INSERT club_types(club_id, type_id) VALUES(
5,
1
);
INSERT activities VALUES
(
12,
'Ice Skating Social with Akpsi!',
'2020-04-13 19:30:00',
'www.facebook.com/events/935529073275973/?acontext=%7B%22source%22%3A5%2C%22action_history%22%3A[%7B%22surface%22%3A%22page%22%2C%22mechanism%22%3A%22main_list%22%2C%22extra_data%22%3A%22%5C%22[]%5C%22%22%7D]%2C%22has_source%22%3Atrue%7D'
);

INSERT activities VALUES
(
13,
'FMA Stussy Sale!',
'2020-09-14 10:00:00',
'www.facebook.com/events/929545937240026/?acontext=%7B%22source%22%3A5%2C%22action_history%22%3A[%7B%22surface%22%3A%22page%22%2C%22mechanism%22%3A%22main_list%22%2C%22extra_data%22%3A%22%5C%22[]%5C%22%22%7D]%2C%22has_source%22%3Atrue%7D');

INSERT activities VALUES
(
14,
'FMA Spring 2019 Orientation',
'2020-07-02 16:30:00',
'www.facebook.com/events/2411828395497213/?acontext=%7B%22source%22%3A5%2C%22action_history%22%3A[%7B%22surface%22%3A%22page%22%2C%22mechanism%22%3A%22main_list%22%2C%22extra_data%22%3A%22%5C%22[]%5C%22%22%7D]%2C%22has_source%22%3Atrue%7D');

INSERT club_activities(activities_id, club_id) VALUES
(
12,
5
);

INSERT club_activities(activities_id, club_id) VALUES
(
13,
5
);

INSERT club_activities(activities_id, club_id) VALUES
(
14,
5
);

-- \\\\\\\\\\\\ ARCHERY CLUB//////////// --
-- \\\\\\\\\\\\\\\\\\/////////////////// --

INSERT club VALUES
(6,
'ARCHERY',
'archery@sjsustudents.com',
'We are the SJSU Archery Club Sports team. Our club is run by SJSU students who fill our various leadership positions. We spend the fall semester practicing in hopes that our members will compete in tournaments in the spring. Throughout the year we also attend multiple competitions at local archery organizations. To raise money for these tournaments and competitions we will be fundraising throughout the year. We currently have 15 recurve bows for new archers to use throughout their membership. However, we encourage our members to buy their own equipment. Once you become a member you will be on the club for one year, from the beginning of fall semester to the end of spring semester. We may also be accepting students who have their own equipment in the beginning of spring semester, or if we have equipment available we will be accepting more members. Our club is very safe and has rules that our members must abide by.',
'https://scontent-sjc3-1.xx.fbcdn.net/v/t1.0-1/c30.0.200.200a/p200x200/13138939_883390918453777_1166289218315148135_n.jpg?_nc_cat=102&ccb=2&_nc_sid=dbb9e7&_nc_ohc=7MMjVKCS2RwAX9D14dH&_nc_ht=scontent-sjc3-1.xx&tp=27&oh=009eda1e77f305ac3b6342c6ce90cdc6&oe=5FCE2E53',
'https://scontent-sjc3-1.xx.fbcdn.net/v/t1.0-9/51126580_1877535529039306_2695999191297032192_o.jpg?_nc_cat=110&ccb=2&_nc_sid=6e5ad9&_nc_ohc=ShxfFjPyY00AX8seyUy&_nc_oc=AQlQ0obYZUw3LK9Ssa6_DMtTkjhW3RnPT9PDbqLK5geTFPaU4ahz15ZAcJlYLpqrWbd3xGFKHUGyN4zxsXgUj50p&_nc_ht=scontent-sjc3-1.xx&oh=405e2e2add94b0dccddddd340f964625&oe=5FCBB0F5',
null,
'1 Washington Sq, San Jose, California, USA');
INSERT club_types(club_id, type_id) VALUES(
6,
2
);


INSERT activities VALUES
(
16,
'First Meeting',
'2020-10-03 12:00:00',
'www.facebook.com/events/929545937240026/?acontext=%7B%22source%22%3A5%2C%22action_history%22%3A[%7B%22surface%22%3A%22page%22%2C%22mechanism%22%3A%22main_list%22%2C%22extra_data%22%3A%22%5C%22[]%5C%22%22%7D]%2C%22has_source%22%3Atrue%7D');

INSERT activities VALUES
(
17,
'Spartan Archery Inaugural Fall Field Classic',
'2020-10-21 07:00:00',
'www.facebook.com/events/760890120634600/?acontext=%7B%22source%22%3A5%2C%22action_history%22%3A[%7B%22surface%22%3A%22page%22%2C%22mechanism%22%3A%22main_list%22%2C%22extra_data%22%3A%22%5C%22[]%5C%22%22%7D]%2C%22has_source%22%3Atrue%7D'
);

INSERT club_activities(activities_id, club_id) VALUES
(
16,
6
);

INSERT club_activities(activities_id, club_id) VALUES
(
17,
6
);



-- \\\\\\\\\\\\\\\ DANCESPORT CLUB/////////////// --
-- \\\\\\\\\\\\\\\\\\\\\\\/////////////////////// --

INSERT club VALUES
(7,
'DANCESPORT',
'dancesport@sjsustudents.com',
'We teach American Smooth and Standard Ballroom dancing, and International Latin, as well as Nightclub dances during our competitive practices and various other styles during our social classes.',
'https://scontent-sjc3-1.xx.fbcdn.net/v/t1.0-1/c5.0.480.480a/p480x480/87538095_3026051434073048_7184640439713005568_n.jpg?_nc_cat=109&ccb=2&_nc_sid=dbb9e7&_nc_ohc=suLHJShBQG8AX9CJTk7&_nc_ht=scontent-sjc3-1.xx&tp=27&oh=730122b8cee166a5d8f4a0205baba9c9&oe=5FCCC425',
'https://scontent-sjc3-1.xx.fbcdn.net/v/t1.0-9/39753289_2060353997309468_8497227134505320448_o.jpg?_nc_cat=111&ccb=2&_nc_sid=6e5ad9&_nc_ohc=09ojBAGVOz8AX_ZpyXU&_nc_ht=scontent-sjc3-1.xx&oh=21baa774bd2a4b6fcefc0cc18450d3d9&oe=5FCCAAD1',
null,
'1 Washington Sq, San Jose, California, USA');
INSERT club_types(club_id, type_id) VALUES(
7,
2
);


INSERT activities VALUES
(
18,
'Sammy G\'s Pizza Fundraiser',
'2020-02-27 19:00:00',
'www.facebook.com/events/615306792626893/?acontext=%7B%22source%22%3A5%2C%22action_history%22%3A[%7B%22surface%22%3A%22page%22%2C%22mechanism%22%3A%22main_list%22%2C%22extra_data%22%3A%22%5C%22[]%5C%22%22%7D]%2C%22has_source%22%3Atrue%7D'
);

INSERT activities VALUES
(
19,
'6th Annual Spartan Invitational Ball',
'2020-04-25 09:00:00',
'www.facebook.com/events/866901603749406/?acontext=%7B%22source%22%3A5%2C%22action_history%22%3A[%7B%22surface%22%3A%22page%22%2C%22mechanism%22%3A%22main_list%22%2C%22extra_data%22%3A%22%5C%22[]%5C%22%22%7D]%2C%22has_source%22%3Atrue%7D'
);

INSERT activities VALUES
(
20,
'Dancing with the Spartans',
'2020-09-04 17:30:00',
'www.facebook.com/events/769430070558773/?acontext=%7B%22source%22%3A5%2C%22action_history%22%3A[%7B%22surface%22%3A%22page%22%2C%22mechanism%22%3A%22main_list%22%2C%22extra_data%22%3A%22%5C%22[]%5C%22%22%7D]%2C%22has_source%22%3Atrue%7D'
);
INSERT club_activities(activities_id, club_id) VALUES
(
18,
7
);

INSERT club_activities(activities_id, club_id) VALUES
(
19,
7
);

INSERT club_activities(activities_id, club_id) VALUES
(
20,
7
);

-- \\\\\\\\\\\\\\\ QUIDDITCH CLUB/////////////// --
-- \\\\\\\\\\\\\\\\\\\\\\\////////////////////// --

INSERT club VALUES
(8,
'QUIDDITCH',
'quidditch@sjsustudents.com',
'Join a team of unique athletes competing in an even more unique sport. San Jose State University\'s Spartan Quidditch thrives off of a competitive environment while partaking in social activities. As a part of US Quidditch, Spartan Quidditch competes against teams from all around, as well as teams close by such as Stanford Quidditch and Cal Quidditch.',
'https://scontent-sjc3-1.xx.fbcdn.net/v/t1.0-1/p480x480/14055072_1752627581644188_2380346173343298467_n.jpg?_nc_cat=100&ccb=2&_nc_sid=dbb9e7&_nc_ohc=0iuI0TJP35oAX-SBN2m&_nc_ht=scontent-sjc3-1.xx&tp=6&oh=c477659ac9984e9f54babdc7f4130b97&oe=5FCC47D7',
'https://scontent-sjc3-1.xx.fbcdn.net/v/t31.0-8/13996154_1752626654977614_8347650928441888026_o.jpg?_nc_cat=103&ccb=2&_nc_sid=6e5ad9&_nc_ohc=1f5CW_o0sVMAX8ZyTVc&_nc_ht=scontent-sjc3-1.xx&oh=b248d92ac055f944f21fe3472e544576&oe=5FCBEC3A',
null,
'1 Washington Sq, San Jose, California, USA');
INSERT club_types(club_id, type_id) VALUES(
8,
2
);

INSERT activities VALUES
(
21,
'Aqua Jet to Saturday Quidditch!',
'2020-03-02 13:00:00',
'www.facebook.com/events/2744801362198512/?acontext=%7B%22source%22%3A5%2C%22action_history%22%3A[%7B%22surface%22%3A%22page%22%2C%22mechanism%22%3A%22main_list%22%2C%22extra_data%22%3A%22%5C%22[]%5C%22%22%7D]%2C%22has_source%22%3Atrue%7D'
);

INSERT activities VALUES
(
22,
'Best Coast Classic 4',
'2020-04-27 12:00:00',
'www.facebook.com/events/1064268283781666/?acontext=%7B%22source%22%3A5%2C%22action_history%22%3A[%7B%22surface%22%3A%22page%22%2C%22mechanism%22%3A%22main_list%22%2C%22extra_data%22%3A%22%5C%22[]%5C%22%22%7D]%2C%22has_source%22%3Atrue%7D'
);

INSERT activities VALUES
(
23,
'Quidditch: Meet the Org; SJSU Student Involvement',
'2020-04-25 11:30:00',
'www.facebook.com/events/654410731876965/?acontext=%7B%22source%22%3A5%2C%22action_history%22%3A[%7B%22surface%22%3A%22page%22%2C%22mechanism%22%3A%22main_list%22%2C%22extra_data%22%3A%22%5C%22[]%5C%22%22%7D]%2C%22has_source%22%3Atrue%7D'
);

INSERT club_activities(activities_id, club_id) VALUES
(
21,
8
);

INSERT club_activities(activities_id, club_id) VALUES
(
22,
8
);

INSERT club_activities(activities_id, club_id) VALUES
(
23,
8
);

-- \\\\\\\\\\\\\\\ ALABASTER HOUSE OF PRAYER CLUB/////////////// --
-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\/////////////////////////////// --

INSERT club VALUES
(9,
'AHOPSJ',
'alabasterhouseofprayer@gmail.com',
'AHOPSJ is a nonprofit organization that seeks to build family style community and unity within the Body of Christ through prayer and intercession.',
'https://scontent-sjc3-1.xx.fbcdn.net/v/t31.0-1/p480x480/14125473_1106372782743208_1042357878013496473_o.jpg?_nc_cat=102&ccb=2&_nc_sid=dbb9e7&_nc_ohc=FBtpUwTwb-0AX_mJ-kn&_nc_ht=scontent-sjc3-1.xx&tp=6&oh=01ce4c54a8e83ec5f14a02aa496ec823&oe=5FCC6283',
'https://scontent-sjc3-1.xx.fbcdn.net/v/t31.0-8/22829846_1490322254348257_4267137407287503900_o.jpg?_nc_cat=103&ccb=2&_nc_sid=6e5ad9&_nc_ohc=kJVp10V8wnMAX8tWIPj&_nc_ht=scontent-sjc3-1.xx&oh=7315080e1dc73c096dbf555868a3cf1e&oe=5FCB3B0B',
null,
'1 Washington Sq, San Jose, California, USA');
INSERT club_types(club_id, type_id) VALUES(
9,
3
);

INSERT activities VALUES
(
24,
'Missions Night w/ InterCP hosted by AHOP',
'2020-04-11 19:00:00',
'www.facebook.com/events/180556932461505/?acontext=%7B%22source%22%3A5%2C%22action_history%22%3A[%7B%22surface%22%3A%22page%22%2C%22mechanism%22%3A%22main_list%22%2C%22extra_data%22%3A%22%5C%22[]%5C%22%22%7D]%2C%22has_source%22%3Atrue%7D'
);

INSERT activities VALUES
(
25,
'Let Us Pray - SJSU Night of Worship and Prayer',
'2020-11-03 19:30:00',
'www.facebook.com/events/802988476572057/?acontext=%7B%22source%22%3A5%2C%22action_history%22%3A[%7B%22surface%22%3A%22page%22%2C%22mechanism%22%3A%22main_list%22%2C%22extra_data%22%3A%22%5C%22[]%5C%22%22%7D]%2C%22has_source%22%3Atrue%7D'
'www.facebook.com/events/1064268283781666/?acontext=%7B%22source%22%3A5%2C%22action_history%22%3A[%7B%22surface%22%3A%22page%22%2C%22mechanism%22%3A%22main_list%22%2C%22extra_data%22%3A%22%5C%22[]%5C%22%22%7D]%2C%22has_source%22%3Atrue%7D'
);

INSERT activities VALUES
(
26,
'ACTS Campus Tour - SJSU',
'2020-02-21 19:00:00',
'www.facebook.com/events/2005250269722880/?acontext=%7B%22source%22%3A5%2C%22action_history%22%3A[%7B%22surface%22%3A%22page%22%2C%22mechanism%22%3A%22main_list%22%2C%22extra_data%22%3A%22%5C%22[]%5C%22%22%7D]%2C%22has_source%22%3Atrue%7D'
);

INSERT club_activities(activities_id, club_id) VALUES
(
24,
9
);

INSERT club_activities(activities_id, club_id) VALUES
(
25,
9
);

INSERT club_activities(activities_id, club_id) VALUES
(
26,
9
);

-- \\\\\\\\\\\\\\\\\ CHRISTIANS ON CAMPUS CLUB ///////////////// --
-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\/////////////////////////////// --

INSERT INTO club VALUES
(10,
'SJSUCHRIRTIANS',
'sjsuchristians@gmail.com',
'A Christian student group where members can learn more about God through reading the Bible and grow in their faith.',
'https://scontent-sjc3-1.xx.fbcdn.net/v/t1.0-1/p480x480/104874356_1680953708736008_4314944608898945635_n.png?_nc_cat=110&ccb=2&_nc_sid=dbb9e7&_nc_ohc=9mnJMFQyUcAAX8sUTC1&_nc_oc=AQmIUvJCwKFDHjVEA5LnLhLEVxn9-Fdrd4loCeTnv4edkrl9AoeDH7OaKAQDps4EYwbqs7h0CEzlwGu827k-ID35&_nc_ht=scontent-sjc3-1.xx&oh=9986851e72dc33270295f0f7ae772c26&oe=5FCB9062',
'https://scontent-sjc3-1.xx.fbcdn.net/v/t1.0-9/104705603_1681965008634878_7563149936375925963_n.png?_nc_cat=100&ccb=2&_nc_sid=6e5ad9&_nc_ohc=ZPr6py6V7a4AX8R6qeY&_nc_ht=scontent-sjc3-1.xx&oh=d35de0ac5df29baa3eec4334f7ca2c85&oe=5FCDD07E',
'The Bible Salvation A Relationship with the Lord Eternal Life',
'1 Washington Sq, San Jose, California, USA');

INSERT club_types(club_id, type_id) VALUES(
10,
3
);

INSERT activities VALUES
(
27,
'Game Night',
'2020-08-31 18:30:00',
'www.facebook.com/events/347677129018211/?acontext=%7B%22source%22%3A5%2C%22action_history%22%3A[%7B%22surface%22%3A%22page%22%2C%22mechanism%22%3A%22main_list%22%2C%22extra_data%22%3A%22%5C%22[]%5C%22%22%7D]%2C%22has_source%22%3Atrue%7D'
);

INSERT club_activities(activities_id, club_id) VALUES
(
27,
10
);

-- \\\\\\\\\\\\\\\\\\\\\\\\ CRU CLUB //////////////////////////// --
-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\/////////////////////////////// --

INSERT INTO club VALUES
(11,
'CRU',
'sjsucru@gmail.com',
'A caring community passionate about connecting people to Jesus.Real Life, our weekly gathering, happens every Tuesday at 7pm at San Jose First Methodist Church. This is our main weekly event, and the best place to get connected to Cru. We\'d love for you to join us there!',
'https://scontent-sjc3-1.xx.fbcdn.net/v/t31.0-1/p200x200/11393415_846427538744367_5525572628041484996_o.jpg?_nc_cat=109&ccb=2&_nc_sid=dbb9e7&_nc_ohc=5ilnZXOYX-IAX9NKgQx&_nc_ht=scontent-sjc3-1.xx&tp=6&oh=fdb96c4e70aa329e21af44f8ff7bc9db&oe=5FCFAD07',
'https://scontent-sjc3-1.xx.fbcdn.net/v/t31.0-8/11888521_876592745727846_9147043436669239575_o.jpg?_nc_cat=103&ccb=2&_nc_sid=6e5ad9&_nc_ohc=PbyW8av3FzIAX-_ifgX&_nc_ht=scontent-sjc3-1.xx&oh=4b6b763f778cc4fbc6e0a5ac0f98f0ce&oe=5FCE3418',
null,
'1 Washington Sq, San Jose, California, USA');

INSERT club_types(club_id, type_id) VALUES(
11,
3
);

INSERT activities VALUES
(
28,
'Back To School Real Life',
'2020-08-19 17:00:00',
'www.facebook.com/events/641857605965675/?acontext=%7B%22source%22%3A5%2C%22action_history%22%3A[%7B%22surface%22%3A%22page%22%2C%22mechanism%22%3A%22main_list%22%2C%22extra_data%22%3A%22%5C%22[]%5C%22%22%7D]%2C%22has_source%22%3Atrue%7D'
);

INSERT activities VALUES
(
29,
'Freshman Welcome Bag Stuffing!',
'2020-08-20 12:00:00',
'www.facebook/events/1062741940440754/?acontext=%7B%22source%22%3A5%2C%22action_history%22%3A[%7B%22surface%22%3A%22page%22%2C%22mechanism%22%3A%22main_list%22%2C%22extra_data%22%3A%22%5C%22[]%5C%22%22%7D]%2C%22has_source%22%3Atrue%7D'
);
INSERT activities VALUES
(
30,
'Freshman Welcome Bag Stuffing',
'2020-08-18 14:30:00',
'www.facebook.com/events/261521347695604/?acontext=%7B%22source%22%3A5%2C%22action_history%22%3A[%7B%22surface%22%3A%22page%22%2C%22mechanism%22%3A%22main_list%22%2C%22extra_data%22%3A%22%5C%22[]%5C%22%22%7D]%2C%22has_source%22%3Atrue%7D'
);
INSERT club_activities(activities_id, club_id) VALUES
(
28,
11
);
INSERT club_activities(activities_id, club_id) VALUES
(
29,
11
);
INSERT club_activities(activities_id, club_id) VALUES
(
30,
11
);

-- \\\\\\\\\\\\\\\\\\\\\\\\ LSG CLUB //////////////////////////// --
-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\/////////////////////////////// --

INSERT INTO club VALUES
(12,
'LSG',
'http://lambdasigmagamma.org',
'♥ Λ Σ Γ "Unity through Sisterhood, Beauty through Diversity" Gamma Chapter was founded at San Jose State in',
'https://scontent-sjc3-1.xx.fbcdn.net/v/t1.0-1/s480x480/44771208_10156512033710638_4706624947655540736_n.jpg?_nc_cat=110&ccb=2&_nc_sid=dbb9e7&_nc_ohc=54KucfluHXUAX9cNdFA&_nc_ht=scontent-sjc3-1.xx&tp=7&oh=862a89ddc58f458c509f908d1fc23fad&oe=5FCD9353',
'https://scontent-sjc3-1.xx.fbcdn.net/v/t31.0-8/1412459_10151963210130638_1345737053_o.jpg?_nc_cat=109&ccb=2&_nc_sid=6e5ad9&_nc_ohc=lid6mMhVu6kAX-ySaLV&_nc_ht=scontent-sjc3-1.xx&oh=cca271af07aede973a639262ca8550ea&oe=5FCE8E20',
'Best in Council 2010-2013',
'1 Washington Sq, San Jose, California, USA');

INSERT club_types(club_id, type_id) VALUES(
12,
4
);

INSERT activities VALUES
(
31,
'Pink Day',
'2020-10-22 09:00:00',
'www.facebook.com/events/426298687420077/?acontext=%7B%22source%22%3A5%2C%22action_history%22%3A[%7B%22surface%22%3A%22page%22%2C%22mechanism%22%3A%22main_list%22%2C%22extra_data%22%3A%22%5C%22[]%5C%22%22%7D]%2C%22has_source%22%3Atrue%7D'
);

INSERT activities VALUES
(
32,
'HYPNOTIC XIII',
'2020-11-02 22:00:00',
'www.facebook.com/events/2178821722405181/?acontext=%7B%22source%22%3A5%2C%22action_history%22%3A[%7B%22surface%22%3A%22page%22%2C%22mechanism%22%3A%22main_list%22%2C%22extra_data%22%3A%22%5C%22[]%5C%22%22%7D]%2C%22has_source%22%3Atrue%7D'
);
INSERT activities VALUES
(
33,
'SF Giants Game w/ LSGs',
'2020-09-15 13:05:00',
'www.facebook.com/events/2362453533995767/?acontext=%7B%22source%22%3A5%2C%22action_history%22%3A[%7B%22surface%22%3A%22page%22%2C%22mechanism%22%3A%22main_list%22%2C%22extra_data%22%3A%22%5C%22[]%5C%22%22%7D]%2C%22has_source%22%3Atrue%7D'
);
INSERT club_activities(activities_id, club_id) VALUES
(
31,
12
);
INSERT club_activities(activities_id, club_id) VALUES
(
32,
12
);
INSERT club_activities(activities_id, club_id) VALUES
(
33,
12
);

-- \\\\\\\\\\\\\\\\\\\\\\\\ AM CLUB //////////////////////////// --
-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\/////////////////////////////// --

INSERT INTO club VALUES
(13,
'AM',
'activemindssjsu@gmail.com',
'Active Minds aims to empower students and surrounding community in San Jose to change the perception of mental health.',
'https://scontent-sjc3-1.xx.fbcdn.net/v/t1.0-1/p480x480/40291110_1135073366650201_9039903974706118656_n.jpg?_nc_cat=108&ccb=2&_nc_sid=dbb9e7&_nc_ohc=fu083TsvIUYAX86rNwC&_nc_ht=scontent-sjc3-1.xx&tp=6&oh=96616a1da6a2e8ec55e149cc59dd36de&oe=5FCFA239',
'https://scontent-sjc3-1.xx.fbcdn.net/v/t1.0-9/40238914_1135073786650159_3732039014983663616_n.jpg?_nc_cat=102&ccb=2&_nc_sid=6e5ad9&_nc_ohc=qL3yI-I2njQAX_tW-RL&_nc_ht=scontent-sjc3-1.xx&oh=d96b8547f4c74062f9c9b4ee9cf78abb&oe=5FCE8141',
null,
'1 Washington Sq, San Jose, California, USA');

INSERT club_types(club_id, type_id) VALUES(
13,
5
);

INSERT activities VALUES
(
34,
'Mental Health Awareness Day',
'2020-11-28 10:00:00',
'www.facebook.com/events/560583744146332/?acontext=%7B%22source%22%3A5%2C%22action_history%22%3A[%7B%22surface%22%3A%22page%22%2C%22mechanism%22%3A%22main_list%22%2C%22extra_data%22%3A%22%5C%22[]%5C%22%22%7D]%2C%22has_source%22%3Atrue%7D'
);


INSERT club_activities(activities_id, club_id) VALUES
(
34,
13
);

-- \\\\\\\\\\\\\\\\\\\\\\\\ ARVR CLUB //////////////////////////// --
-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\/////////////////////////////// --

INSERT INTO club VALUES
(14,
'ARVR',
'https://sjsuarvr.weebly.com',
'Come explore the future of AR & VR with us at AR / VR Club!',
'https://scontent-sjc3-1.xx.fbcdn.net/v/t1.0-1/p480x480/42889873_1380348392101171_6665692305980129280_o.png?_nc_cat=104&ccb=2&_nc_sid=dbb9e7&_nc_ohc=EW5ltKqpE-cAX-Nxy5t&_nc_ht=scontent-sjc3-1.xx&oh=27c9a51788ec0d87a3d308189256de65&oe=5FCD6127',
'https://scontent-sjc3-1.xx.fbcdn.net/v/t1.0-9/42474154_1375085389294138_9016291958204661760_o.jpg?_nc_cat=105&ccb=2&_nc_sid=6e5ad9&_nc_ohc=GmMQeA_MP-AAX9zQ_K0&_nc_ht=scontent-sjc3-1.xx&oh=cd2322af1dcde04c89341d7d4e2c92d9&oe=5FCD5AA3',
null,
'1 Washington Sq, San Jose, California, USA');

INSERT club_types(club_id, type_id) VALUES(
14,
5
);

-- \\\\\\\\\\\\\\\\\\\\\\\\ CADRE CLUB //////////////////////////// --
-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\/////////////////////////////// --

INSERT INTO club VALUES
(15,
'CADRE',
'cadrestudentorganization@gmail.com',
'CADRE Student Media Lab is a student run organization exploring the intersection of art, design, and technology. CADRE Student Media Lab is affiliated with the CADRE Media Lab / Digital Media Arts Program in San Jose State University\'s Art and Art History Department. CADRE Student Media Lab shares similar interests in creating a multidisciplinary platform, and showcasing new ideas with the matriculated student body.',
'https://scontent-sjc3-1.xx.fbcdn.net/v/t1.0-1/18221901_408730116169346_634193581423780435_n.png?_nc_cat=108&ccb=2&_nc_sid=dbb9e7&_nc_ohc=Tdmww41RbCwAX_9gWhh&_nc_ht=scontent-sjc3-1.xx&oh=c3907477007f91611a3794863fb435a8&oe=5FCED0DE',
'https://scontent-sjc3-1.xx.fbcdn.net/v/t31.0-8/20452044_450010358707988_1946202566873627375_o.jpg?_nc_cat=100&ccb=2&_nc_sid=6e5ad9&_nc_ohc=_IPK3Zn1814AX9W73Ea&_nc_ht=scontent-sjc3-1.xx&oh=b87170f1ee276f7aa3b99b2b423cdb08&oe=5FCF8E15',
'Campus Movie Festival 2015 Production Design Award',
'1 Washington Sq, San Jose, California, USA');

INSERT club_types(club_id, type_id) VALUES(
15,
5
);
 
INSERT activities VALUES
(
35,
'American Arts Incubator 2018: Meet the Artists Happy Hour',
'2020-11-08 18:00:00',
'www.facebook.com/events/483205015398916/?acontext=%7B%22source%22%3A5%2C%22action_history%22%3A[%7B%22surface%22%3A%22page%22%2C%22mechanism%22%3A%22main_list%22%2C%22extra_data%22%3A%22%5C%22[]%5C%22%22%7D]%2C%22has_source%22%3Atrue%7D'
);

INSERT activities VALUES
(
36,
'CADRE Halloween Showcase',
'2020-10-30 18:50:00',
'www.facebook.com/events/958760357652191/?acontext=%7B%22source%22%3A5%2C%22action_history%22%3A[%7B%22surface%22%3A%22page%22%2C%22mechanism%22%3A%22main_list%22%2C%22extra_data%22%3A%22%5C%22[]%5C%22%22%7D]%2C%22has_source%22%3Atrue%7D'
);
INSERT activities VALUES
(
37,
'DMA::iRl Exhibition',
'2020-04-27 19:00:00',
'www.facebook.com/events/2361156413904971/?acontext=%7B%22source%22%3A5%2C%22action_history%22%3A[%7B%22surface%22%3A%22page%22%2C%22mechanism%22%3A%22main_list%22%2C%22extra_data%22%3A%22%5C%22[]%5C%22%22%7D]%2C%22has_source%22%3Atrue%7D'
);
INSERT club_activities(activities_id, club_id) VALUES
(
35,
15
);
INSERT club_activities(activities_id, club_id) VALUES
(
36,
15
);
INSERT club_activities(activities_id, club_id) VALUES
(
37,
15
);

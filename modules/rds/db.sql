
drop table user_player;
drop table user_team;
drop table contest;
drop table matches;
drop table player;
drop table category;
drop table team;
drop table users;

CREATE TABLE users(                                                 
	user_id INT PRIMARY KEY,
	username VARCHAR(30) NOT NULL,
	email VARCHAR(30) NOT NULL,
    dob VARCHAR(30) NOT NULL,
    mob INT,
    balance INT DEFAULT 0,
    deposite_amt INT DEFAULT 0,
    winning_amt INT DEFAULT 0,
    bonus INT DEFAULT 100
);

CREATE TABLE team(
	team_id INT PRIMARY KEY,
	team_name VARCHAR(30) NOT NULL
);

CREATE TABLE category(
	category_id INT PRIMARY KEY,
	category_name VARCHAR(30) NOT NULL
);

CREATE TABLE player(
	player_id INT PRIMARY KEY,
	player_name VARCHAR(30) NOT NULL,
	team_id INT NOT NULL,
    category_id INT NOT NULL,
	credit INT,
	FOREIGN KEY (team_id) REFERENCES team(team_id),
    FOREIGN KEY (category_id) REFERENCES category(category_id)
);

CREATE TABLE matches(
	match_id INT PRIMARY KEY,
	team1_id INT,
	team2_id INT,
	dates DATE,
	FOREIGN KEY (team1_id) REFERENCES team(team_id),
	FOREIGN KEY (team2_id) REFERENCES team(team_id)
);

CREATE TABLE contest(
	contest_id INT PRIMARY KEY,
	contest_name VARCHAR(30),
    prize_amt INT NOT NULL,
    entry_free INT NOT NULL,
    max_count INT,
    real_count INT,
    match_id INT NOT NULL,
    contest_type VARCHAR(30),
    joining_code VARCHAR(30),
	FOREIGN KEY (match_id) REFERENCES matches(match_id)
);

CREATE TABLE user_team(
	user_team_id INT PRIMARY KEY,
	user_team_name VARCHAR(30),
    user_id INT NOT NULL,
    match_id INT NOT NULL,
    contest_id INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (match_id) REFERENCES matches(match_id),
    FOREIGN KEY (contest_id) REFERENCES contest(contest_id)
);

CREATE TABLE user_player(
    user_player_id INT,
    user_team_id INT,
    FOREIGN KEY (user_team_id) REFERENCES user_team(user_team_id)
);

insert into users values(1,"sanket","sanket.wadekar@quantiphi.com","22-02-1999",9168884400,0,0,0,100);
insert into users values(2,"akshay","akshay.gupta@quantiphi.com","21-03-1998",8552934241,0,0,0,100);

insert into team values(1,"CSK");
insert into team values(2,"MI");

insert into category values(1,"Batsman");
insert into category values(2,"Bowler");
insert into category values(3,"Wicket-Keeper");
insert into category values(4,"ALL-Rounder");

insert into player values(1,"MS Dhoni",1,3,11);
insert into player values(2,"Suresh Raina",1,1,10);
insert into player values(3,"Ravindra Jadeja",1,4,10);
insert into player values(4,"Shane Watson",1,1,9);
insert into player values(5,"Faf du Plessis",1,1,8);
insert into player values(6,"Ambati Rayudu",1,1,8);
insert into player values(7,"DJ Bravo",1,4,9);
insert into player values(8,"Deepak Chahar",1,2,8);
insert into player values(9,"Shardul Thakur",1,2,8);
insert into player values(10,"Harbhajan Singh",1,2,8);
insert into player values(11,"Imran Tahir",1,2,8);
insert into player values(12,"Murli Vijay",1,1,8);
insert into player values(13,"Kedar Jadhav",1,1,8);
insert into player values(14,"Mitchell Santner",1,4,8);
insert into player values(15,"Lungi Ngidi",1,2,8);

insert into player values(16,"Rohit Sharma",2,1,11);
insert into player values(17,"Hardik Pandya",2,4,10);
insert into player values(18,"Jasprit Bumrah",2,2,10);
insert into player values(19,"Quinton De Kock",2,1,9);
insert into player values(20,"Suryakumar Yadav",2,1,8);
insert into player values(21,"Ishan Kishan",2,3,8);
insert into player values(22,"Krunal Pandya",2,4,8);
insert into player values(23,"Kieron Pollard",2,4,9);
insert into player values(24,"Rahul Chahar",2,2,8);
insert into player values(25,"Mitch McClenaghan",2,2,8);
insert into player values(26,"Lasith Malinga",2,2,9);
insert into player values(27,"Chris Lynn",2,1,9);
insert into player values(28,"Trent Boult",2,2,9);
insert into player values(29,"Aditya Tare",2,3,7);
insert into player values(30,"Jayant Yadav",2,2,7);

insert into matches values(1,1,2,"2020-08-24");

insert into contest values(1,"Contest-1",100,20,7,7,1,"public",NULL);

insert into user_team values(1,"team-sanket",1,1,1);
insert into user_team values(2,"team-quantiphi",2,1,1);

insert into user_player values(1,1);
insert into user_player values(2,1);
insert into user_player values(3,1);
insert into user_player values(4,1);
insert into user_player values(7,1);
insert into user_player values(8,1);
insert into user_player values(16,1);
insert into user_player values(17,1);
insert into user_player values(18,1);
insert into user_player values(23,1);
insert into user_player values(26,1);

insert into user_player values(1,2);
insert into user_player values(5,2);
insert into user_player values(16,2);
insert into user_player values(27,2);
insert into user_player values(7,2);
insert into user_player values(10,2);
insert into user_player values(9,2);
insert into user_player values(17,2);
insert into user_player values(18,2);
insert into user_player values(20,2);
insert into user_player values(28,2);
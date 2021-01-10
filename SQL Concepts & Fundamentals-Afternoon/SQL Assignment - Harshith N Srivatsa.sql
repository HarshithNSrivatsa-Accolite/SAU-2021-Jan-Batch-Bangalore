/* 
Harshith N Srivatsa
SQL Assignment
*/


/*create database WorldCup_HNS_Assignment;*/
create table TEAM(
	    team_id varchar(30) ,
	    country_name varchar(50),
	    no_of_wins int,
	    no_of_loses int,
	    no_of_draws int,
	    no_of_matches int,
        primary key (team_id)
	);
    
create table PLAYER(
	    player_id varchar(30) ,
	    team_id varchar(30) ,
        player_name varchar(30),
	    runs int,
	    wickets int,
	    p_role varchar(30),
	    matches_played int,
        primary key (player_id),
        foreign key (team_id) references team(team_id) 
	);
create table MATCHES(
	    match_no varchar(30) ,
	    m_date date,
        team_id varchar(30) ,
	    score int,
	    m_status varchar(30),
        primary key(match_no, team_id),
        foreign key (team_id) references team(team_id)
	);
    
insert into team values(
	    'IND1','INDIA', 5, 1, 0, 6
	);
insert into team values(
	    'ENG1','ENGLAND', 3, 2, 0, 5
	);
insert into team values(
	    'AUS1','AUSTRALIA', 2, 2, 0, 4
	);
    insert into team values(
	    'PAK1','PAKISTAN', 0, 4, 0, 4
	);
insert into team values(
	    'BAN1','BANGALADESH', 1, 4, 0, 5
	);
 insert into team values(
	    'KIWI1','NEW ZEALAND', 3, 3, 0, 6
	);   
    insert into team values(
	    'WI1','WEST INDIES', 2, 3, 0, 5
	);
    
    
    
    
    
insert into PLAYER values (
	    'P07418', 'IND1', 'Virat Kholi', 25913, 18, 'batsman', 125
	);

insert into PLAYER values (
	    'P17820', 'IND1', 'M S Dhoni', 18723, 51, 'wk batsman', 295
	);
    
    insert into PLAYER values (
	    'P19248', 'AUS1', 'Steve Smith', 14586, 9, 'batsman', 85
	);
    
    insert into PLAYER values (
	    'P3651', 'WI1', 'Cris Gayle', 22036, 96, 'All rounder', 186
	);
    insert into PLAYER values (
	    'P8423', 'KIWI1', 'Kane Williamson', 10239, 0, 'batsman', 91
	);
  insert into PLAYER values (
	    'P78610', 'PAK1', 'Afridi', 4865, 65, 'All rounder', 241
	);
    insert into PLAYER values (
	    'P7569', 'IND1', 'Bumrah', 395, 186, 'bolwer', 105
	);
    insert into PLAYER values (
	    'P45960', 'IND1', 'Jadeja', 15913, 118, 'All rounder', 252
	);
    insert into PLAYER values (
	    'P1702', 'ENG1', 'Ben Stokes', 11548, 71, 'All rounder', 67
	);
    insert into PLAYER values (
	    'P8510', 'AUS1', 'Stark', 6953, 98, 'bowler', 160
	);




insert into matches values ( '1', '2020-1-8', 'IND1', 325, 'win' );
insert into matches values ( '1', '2020-1-8', 'PAK1', 288, 'loss' );
insert into matches values ( '2', '2020-1-9', 'ENG1', 254, 'loss' );
insert into matches values ( '2', '2020-1-9', 'AUS1', 260, 'win' );
insert into matches values ( '3', '2020-1-10', 'WI1', 379, 'win' );
insert into matches values ( '3', '2020-1-10', 'KIWI1', 301, 'loss' );
insert into matches values ( '4', '2020-1-11', 'IND1', 291, 'win' );
insert into matches values ( '4', '2020-1-11', 'BAN1', 290, 'loss' );
insert into matches values ( '5', '2020-1-12', 'AUS1', 271, 'loss' );
insert into matches values ( '5', '2020-1-12', 'WI1', 272, 'win' );


select *from player order by runs desc limit 5;

select *from player order by wickets desc limit 5;

select team_id,(sum(score)/count(team_id)) as team_avg from matches group by team_id order by team_avg;

select * from player ; /*Harshith: Runs of each player before updation of +10 runs*/

update player set runs = runs+10 
	where team_id = (select team_id 
		from (select team_id,(sum(score)/count(team_id)) as team_avg from matches group by team_id order by team_avg limit 1 )min_avg);

select * from player ; /*Harshith: Runs of each player after updation of +10 runs; Based on the data I have inserted england has the min average thus only england players runs will get +10*/

DELIMITER $$

DROP PROCEDURE IF EXISTS max_score$$
CREATE PROCEDURE max_score(country VARCHAR(50), OUT mscore INT)
BEGIN
SELECT max(score) into mscore from matches where team_id = ( select team_id from team where country = country_name);
END$$

DELIMITER ;

CALL max_score('India',@mscore);
SELECT @mscore;


CALL max_score('Australia',@mscore);
SELECT @mscore;

CALL max_score('West indies',@mscore);
SELECT @mscore;



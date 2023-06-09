{\rtf1\ansi\ansicpg1251\cocoartf2639
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 Helvetica;\f1\fnil\fcharset0 .AppleSystemUIFontMonospaced-Regular;\f2\fnil\fcharset0 HelveticaNeue;
}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\paperw11900\paperh16840\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\pard\tx566\tx1133\tx1700\tx2267\tx2834\tx3401\tx3968\tx4535\tx5102\tx5669\tx6236\tx6803\pardirnatural\partightenfactor0

\f0\fs24 \cf0 \'97 creating data base, tables, relationships\
\pard\tx560\tx1120\tx1680\tx2240\tx2800\tx3360\tx3920\tx4480\tx5040\tx5600\tx6160\tx6720\pardirnatural\partightenfactor0

\f1 \cf0 CREATE DATABASE 
\f2\fs26 Sport_web_portal
\f1\fs24 ;\
USE 
\f2\fs26 Sport_web_portal
\f1\fs24 ;
\f2\fs26 \
\
CREATE TABLE Leagues (\
 id BIGSERIAL NOT NULL PRIMARY KEY,\
 title TEXT NOT NULL\
);\
CREATE TABLE Teams (\
 id BIGSERIAL NOT NULL PRIMARY KEY,\
 number_of_players INTEGER NOT NULL CHECK (number_of_players > 0),\
 title TEXT NOT NULL,\
 type_of_sport TEXT NOT NULL,\
 league_id BIGINT,\
   CONSTRAINT league_fk FOREIGN KEY (league_id) REFERENCES Leagues (id)\
);\
CREATE TABLE Players (\
 id BIGSERIAL NOT NULL PRIMARY KEY,\
 player_name TEXT NOT NULL,\
 age INTEGER NOT NULL CHECK (age > 0),\
 team_id BIGINT NOT NULL ,\
 CONSTRAINT team_fk FOREIGN KEY (team_id) REFERENCES Teams (id)\
);\
CREATE TABLE Events (\
 id BIGSERIAL NOT NULL PRIMARY KEY,\
 title TEXT NOT NULL\
);\
CREATE TABLE Games (\
 id BIGSERIAL NOT NULL PRIMARY KEY,\
 game_date DATE NOT NULL,\
    game_time TIME NOT NULL,\
 team1_id BIGINT NOT NULL,\
    team2_id BIGINT NOT NULL,\
    CONSTRAINT team1_fk FOREIGN KEY (team1_id) REFERENCES Teams (id),\
    CONSTRAINT team2_fk FOREIGN KEY (team2_id) REFERENCES Teams (id)\
);\
CREATE TABLE Articles (\
 id BIGSERIAL NOT NULL PRIMARY KEY,\
 title TEXT NOT NULL,\
    author TEXT NOT NULL\
);\
CREATE TABLE Users (\
 id BIGSERIAL NOT NULL PRIMARY KEY,\
 username TEXT NOT NULL,\
    email TEXT NOT NULL,\
    user_password TEXT NOT NULL,\
    gender TEXT NOT NULL\
);\
CREATE TABLE ArticleViews (\
 id BIGSERIAL NOT NULL PRIMARY KEY,\
 number_of_views BIGINT NOT NULL,\
    user_id BIGINT NOT NULL,\
 article_id BIGINT NOT NULL,\
 CONSTRAINT user_fk FOREIGN KEY (user_id) REFERENCES Users (id),\
    CONSTRAINT article_fk FOREIGN KEY (article_id) REFERENCES Articles (id)\
);\
CREATE TABLE Advertisement (\
 id BIGSERIAL NOT NULL PRIMARY KEY,\
 advertisement_content TEXT NOT NULL\
);\
CREATE TABLE Media (\
 id BIGSERIAL NOT NULL PRIMARY KEY,\
 file_name TEXT NOT NULL,\
 file_type TEXT NOT NULL,\
 article_id BIGINT,\
    team_id BIGINT,\
 league_id BIGINT,\
 game_id BIGINT,\
 advertisement_id BIGINT,\
    CONSTRAINT article_fk FOREIGN KEY (article_id) REFERENCES Articles (id),\
    CONSTRAINT team_fk FOREIGN KEY (team_id) REFERENCES Teams (id),\
    CONSTRAINT league_fk FOREIGN KEY (league_id) REFERENCES Leagues (id),\
    CONSTRAINT game_fk FOREIGN KEY (game_id) REFERENCES Games (id),\
    CONSTRAINT advertisement_fk FOREIGN KEY (advertisement_id) REFERENCES Advertisement (id)\
);\
CREATE TABLE User_comments (\
 id BIGSERIAL NOT NULL PRIMARY KEY,\
 comment_content TEXT NOT NULL,\
 user_id BIGINT NOT NULL,\
 CONSTRAINT user_fk FOREIGN KEY (user_id) REFERENCES Users (id)\
);\
CREATE TABLE Advertisement_views (\
    id BIGSERIAL NOT NULL PRIMARY KEY,\
    user_id BIGINT NOT NULL,\
    advertisement_id BIGINT NOT NULL,\
    CONSTRAINT user_fk FOREIGN KEY (user_id) REFERENCES Users (id),\
    CONSTRAINT advertisement_fk FOREIGN KEY (advertisement_id) REFERENCES Advertisement (id)\
);\
CREATE TABLE Teams_advertisement (\
 id BIGSERIAL NOT NULL PRIMARY KEY,\
 team_id BIGINT NOT NULL,\
 advertisement_id BIGINT NOT NULL,\
 CONSTRAINT team_fk FOREIGN KEY (team_id) REFERENCES Teams (id),\
 CONSTRAINT advertisement_fk FOREIGN KEY (advertisement_id) REFERENCES Advertisement (id)\
);\
CREATE TABLE Leagues_advertisement (\
 id BIGSERIAL NOT NULL PRIMARY KEY,\
 league_id BIGINT NOT NULL,\
 advertisement_id BIGINT NOT NULL,\
 CONSTRAINT league_fk FOREIGN KEY (league_id) REFERENCES Leagues (id),\
 CONSTRAINT advertisement_fk FOREIGN KEY (advertisement_id) REFERENCES Advertisement (id)\
);\
CREATE TABLE Article_about_command (\
 id BIGSERIAL NOT NULL PRIMARY KEY,\
 team_id BIGINT NOT NULL,\
 article_id BIGINT NOT NULL,\
 CONSTRAINT team_fk FOREIGN KEY (team_id) REFERENCES Teams (id),\
    CONSTRAINT article_fk FOREIGN KEY (article_id) REFERENCES Articles (id)\
);\
CREATE TABLE Article_about_league (\
 id BIGSERIAL NOT NULL PRIMARY KEY,\
 league_id BIGINT NOT NULL,\
 article_id BIGINT NOT NULL,\
 CONSTRAINT league_fk FOREIGN KEY (league_id) REFERENCES Leagues (id),\
    CONSTRAINT article_fk FOREIGN KEY (article_id) REFERENCES Articles (id)\
);\
CREATE TABLE Article_comments (\
    id BIGSERIAL NOT NULL PRIMARY KEY,\
    article_id BIGINT,\
    comment_id BIGINT,\
    CONSTRAINT article_fk FOREIGN KEY (article_id) REFERENCES Articles (id),\
    CONSTRAINT comment_fk FOREIGN KEY (comment_id) REFERENCES User_comments (id)\
);\
CREATE TABLE League_games (\
    id BIGSERIAL NOT NULL PRIMARY KEY,\
    league_id BIGINT,\
    game_id BIGINT,\
    CONSTRAINT league_fk FOREIGN KEY (league_id) REFERENCES Leagues (id),\
    CONSTRAINT game_fk FOREIGN KEY (game_id) REFERENCES Games (id)\
);\
CREATE TABLE Games_events (\
    id BIGSERIAL NOT NULL PRIMARY KEY,\
    game_id BIGINT,\
    event_id BIGINT,\
    CONSTRAINT game_fk FOREIGN KEY (game_id) REFERENCES Games (id),\
    CONSTRAINT event_fk FOREIGN KEY (event_id) REFERENCES Events (id)\
);\
CREATE TABLE Players_events (\
    id BIGSERIAL NOT NULL PRIMARY KEY,\
    player_id BIGINT,\
    event_id BIGINT,\
    CONSTRAINT player_fk FOREIGN KEY (player_id) REFERENCES Players (id),\
    CONSTRAINT event_fk FOREIGN KEY (event_id) REFERENCES Events (id)\
);\
CREATE TABLE Authors (\
 id BIGSERIAL NOT NULL PRIMARY KEY,\
 author_first_name TEXT NOT NULL,\
 author_second_name TEXT NOT NULL,\
 author_age INTEGER NOT NULL CHECK (author_age > 16)\
);\
ALTER TABLE Articles DROP COLUMN author;\
\
CREATE TABLE Articles_authors (\
 id BIGSERIAL NOT NULL PRIMARY KEY,\
 author_id BIGINT NOT NULL,\
 article_id BIGINT NOT NULL,\
 CONSTRAINT author_fk FOREIGN KEY (author_id) REFERENCES Authors (id),\
    CONSTRAINT article_fk FOREIGN KEY (article_id) REFERENCES Articles (id)\
);}
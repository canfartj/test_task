{\rtf1\ansi\ansicpg1251\cocoartf2639
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 Helvetica;\f1\fnil\fcharset0 HelveticaNeue;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\paperw11900\paperh16840\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\pard\tx566\tx1133\tx1700\tx2267\tx2834\tx3401\tx3968\tx4535\tx5102\tx5669\tx6236\tx6803\pardirnatural\partightenfactor0

\f0\fs24 \cf0 \'97 script calculate any 10 KPIs\
\
\'97  count of articles \
\pard\pardeftab720\partightenfactor0
\cf0 SELECT COUNT(*) AS TotalArticles\
FROM Articles;\
\
\'97 maximum age of author\
SELECT MAX(author_age) AS AverageAuthorAge\
FROM Authors;\
\
\pard\tx566\tx1133\tx1700\tx2267\tx2834\tx3401\tx3968\tx4535\tx5102\tx5669\tx6236\tx6803\pardirnatural\partightenfactor0
\cf0 \'97 count of teams for each league\
SELECT league_id, COUNT(*) AS TeamCount\
FROM Teams\
GROUP BY league_id;\
\
\'97 average age of player for each group\
SELECT team_id, AVG(age) AS AverageAge\
FROM Players\
GROUP BY team_id;\
\
\'97 count of article views where title has \'abTop\'bb\
SELECT article_id, COUNT(*) AS ViewCount\
FROM ArticleViews\
JOIN Articles ON ArticleViews.article_id = Articles.id\
WHERE Articles.title LIKE '%Top%'\
GROUP BY article_id;\
\
\'97 count of articles for each author\
SELECT author_id, COUNT(*) OVER (PARTITION BY author_id) AS ArticleCount\
FROM Articles_authors;\
\
\'97 count of comments for articles\
\pard\tx560\tx1120\tx1680\tx2240\tx2800\tx3360\tx3920\tx4480\tx5040\tx5600\tx6160\tx6720\pardirnatural\partightenfactor0

\f1\fs26 \cf0 SELECT COUNT(*) AS TotalArticleComments\
FROM Article_comments;\
\
\'97 player and his team\
SELECT Players.player_name AS PlayerName, Teams.title AS TeamTitle\
FROM Players\
JOIN Teams ON Players.team_id = Teams.id;\
\
\'97 count of games related to teams\
SELECT COUNT(*) AS TotalTeamGames\
FROM Games\
WHERE team1_id IN (SELECT id FROM Teams)\
   OR team2_id IN (SELECT id FROM Teams);\
\
\'97 count of media for team with id = 1\
SELECT COUNT(*) AS MediaCount\
FROM Media\
JOIN Teams ON Media.team_id = Teams.id\
WHERE Teams.id = 1;}
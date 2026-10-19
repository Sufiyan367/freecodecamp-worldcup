-- PostgreSQL database dump for worldcup
SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE IF EXISTS worldcup;
CREATE DATABASE worldcup;
\c worldcup

CREATE TABLE public.teams (
    team_id serial NOT NULL,
    name character varying(255) NOT NULL UNIQUE
);

ALTER TABLE public.teams OWNER TO freecodecamp;
ALTER TABLE ONLY public.teams ADD CONSTRAINT teams_pkey PRIMARY KEY (team_id);

CREATE TABLE public.games (
    game_id serial NOT NULL,
    year integer NOT NULL,
    round character varying(255) NOT NULL,
    winner_id integer NOT NULL,
    opponent_id integer NOT NULL,
    winner_goals integer NOT NULL,
    opponent_goals integer NOT NULL
);

ALTER TABLE public.games OWNER TO freecodecamp;
ALTER TABLE ONLY public.games ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);
ALTER TABLE ONLY public.games ADD CONSTRAINT games_winner_id_fkey FOREIGN KEY (winner_id) REFERENCES public.teams(team_id);
ALTER TABLE ONLY public.games ADD CONSTRAINT games_opponent_id_fkey FOREIGN KEY (opponent_id) REFERENCES public.teams(team_id);

COPY public.teams (team_id, name) FROM stdin;
1	Algeria
2	Argentina
3	Belgium
4	Brazil
5	Chile
6	Colombia
7	Costa Rica
8	Croatia
9	Denmark
10	England
11	France
12	Germany
13	Greece
14	Japan
15	Mexico
16	Netherlands
17	Nigeria
18	Portugal
19	Russia
20	Spain
21	Sweden
22	Switzerland
23	United States
24	Uruguay
\.

COPY public.games (game_id, year, round, winner_id, opponent_id, winner_goals, opponent_goals) FROM stdin;
1	2018	Final	11	8	4	2
2	2018	Third Place	3	10	2	0
3	2018	Semi-Final	8	10	2	1
4	2018	Semi-Final	11	3	1	0
5	2018	Quarter-Final	8	19	3	2
6	2018	Quarter-Final	10	21	2	0
7	2018	Quarter-Final	3	4	2	1
8	2018	Quarter-Final	11	24	2	0
9	2018	Eighth-Final	10	6	2	1
10	2018	Eighth-Final	21	22	1	0
11	2018	Eighth-Final	3	14	3	2
12	2018	Eighth-Final	4	15	2	0
13	2018	Eighth-Final	8	9	2	1
14	2018	Eighth-Final	19	20	2	1
15	2018	Eighth-Final	24	18	2	1
16	2018	Eighth-Final	11	2	4	3
17	2014	Final	12	2	1	0
18	2014	Third Place	16	4	3	0
19	2014	Semi-Final	2	16	1	0
20	2014	Semi-Final	12	4	7	1
21	2014	Quarter-Final	16	7	1	0
22	2014	Quarter-Final	2	3	1	0
23	2014	Quarter-Final	4	6	2	1
24	2014	Quarter-Final	12	11	1	0
25	2014	Eighth-Final	4	5	2	1
26	2014	Eighth-Final	6	24	2	0
27	2014	Eighth-Final	11	17	2	0
28	2014	Eighth-Final	12	1	2	1
29	2014	Eighth-Final	16	15	2	1
30	2014	Eighth-Final	7	13	2	1
31	2014	Eighth-Final	2	22	1	0
32	2014	Eighth-Final	3	23	2	1
\.

SELECT pg_catalog.setval('public.teams_team_id_seq', 24, true);
SELECT pg_catalog.setval('public.games_game_id_seq', 32, true);

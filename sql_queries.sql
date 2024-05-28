CREATE TABLE player_stats (id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
						   build_date text, 
						   build_time time,
						   biomes_visited_with_wands smallint, -- the amount of biomes visited
						   damage_taken decimal(10,5), -- the total amount of damage taken
						   dead smallint,
						   death_count smallint, -- the total amount of deaths 
						   death_pos_x decimal(10,5), -- the x-coordinates of the death position
						   death_pos_y decimal(10,5), -- the y-coordinates of the death position
						   enemies_killed int, -- the total number of enemies killed
						   gold int, 
						   gold_all int,
						   gold_infinite int,
						   healed real, -- the amount of health healed
						   heart_containers smallint,
						   hp int, -- the amount of health
						   items smallint, 
						   kicks smallint, -- the total amount of kicks
						   killed_by text, -- the entity that had killed the player
						   places_visited smallint, 
						   playtime decimal(10,5),-- the total amount of playtime in seconds
						   playtime_str time, -- the total amount of playtime
						   projectiles_shot bigint, -- the total amount of projectiles shot
						   streaks int,
						   teleports int,
						   wands_edited smallint, -- the total amount of wands edited
						   world_seed bigint
						  );


COPY player_stats (build_date,
				   build_time,
				   biomes_visited_with_wands,
				   damage_taken,
				   dead,
				   death_count,
				   death_pos_x,
				   death_pos_y,
				   enemies_killed,
				   gold,
				   gold_all,
				   gold_infinite,
				   healed,
				   heart_containers,
				   hp,
				   items,
				   kicks,
				   killed_by,
				   places_visited,
				   playtime,
				   playtime_str,
				   projectiles_shot,
				   streaks,
				   teleports,
				   wands_edited,
				   world_seed
				   )
FROM 'C:\Users\gaeta\Desktop\noita-data-compilation-project\squeaky_clean.csv'
WITH (FORMAT CSV, HEADER)


-- list the top fifteen sessions that have the greatest playtime
SELECT id, playtime, playtime_str 
FROM player_stats
ORDER BY playtime DESC
LIMIT 15;

-- list the average playtime of all sessions
SELECT avg(playtime) as average_playtime_v1, avg(playtime_str) as average_playtime_v2
FROM player_stats;

-- list all sessions that have a playtime greater than or equal to thirty seconds
SELECT id, playtime, playtime_str, killed_by
FROM player_stats
WHERE playtime >= 30
ORDER BY playtime;

-- list the top fifteen sessions that have the greatest playtime,
-- but where the player has "logged out"; hence, ending the session.
SELECT id, playtime, playtime_str, killed_by
FROM player_stats
WHERE killed_by IS NULL
ORDER BY playtime DESC
LIMIT 15;

-- list all sessions, and what had killed the player.
SELECT id, killed_by
FROM player_stats
ORDER BY killed_by;

-- list the top fifteen sessions that have the greatest number of entities killed.
SELECT id, enemies_killed, playtime, playtime_str
FROM player_stats
ORDER BY enemies_killed DESC
LIMIT 15;


--this is to essentially pull the length of each individual game sessions in minutes
--cutting out any decimals in an effort to keep the overall sturcture simple and understandable, then
--it is categroized by what ended the session
SELECT CAST(playtime / 60 AS integer) AS minutes_played_rounded, count(CAST(playtime / 60 AS integer )) AS total_sessions, killed_by
FROM player_stats
WHERE player_ended_session = FALSE
GROUP BY killed_by, CAST(playtime / 60 AS integer)
ORDER BY CAST(playtime / 60 AS integer);


-- displays what had killed the player
SELECT count(killed_by) AS total, killed_by
FROM player_stats
GROUP BY killed_by
ORDER BY count(killed_by) DESC
LIMIT 10;


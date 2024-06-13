# Data Compilation In Noita

The overarching goal of this project is to extract and format data from the game Noita for analysis. I embarked on converting Extensible Markup Language (XML) data files into a PostgreSQL-compatible format. Leveraging Python libraries like ElementTree, CSV, and Glob, I streamlined the process by locating files, parsing XML data, and writing it into CSV format. This method facilitated efficient extraction and conversion, ensuring readiness for analysis.

## Description

In this project, the overarching goal was to pull and process data into a readable, analyzable format. I had my goal in hand, and to my surprise, I stumbled across a game that I had frequented, Noita. I possessed 30 hours of game time, with an average game session of around 7 minutes. To provide some background, the game Noita is a dungeon-crawler game "in which [players] navigate a labyrinth environment (i.e., a "dungeon"), battling various monsters, avoiding traps, solving puzzles, and looting any treasure they may find".

<div align="center">
  <kbd>
    <img src="https://imgur.com/aMArCBP.png" /> 
  </kbd>
</div>

<br>

```
SELECT
  avg(playtime) AS average_playtime_v1,
  avg(playtime_str) AS average_playtime_v2
FROM player_stats;
```

I dived into the game's folders and files to begin the project! I stumbled across the data files; however, said files were in an extensible markup language format. I needed to read and write the data from said files in a format suitable for import into PostgreSQL. 

I employed several libraries in Python to do this; I used the following libraries...

- ElementTree; for parsing XML files.
- CSV;  for writing data into CSV format.
- Glob; for locating relevant files.

In essence, the process is straightforward. The Glob library is responsible for locating the files, which are then passed to the ElementTree library for reading. The data is temporarily stored, and then the CSV library takes over, writing the data into a CSV file. This simple yet effective process ensures a smooth and efficient data extraction and conversion!

<div align="center">
  <kbd>
    <img src="https://imgur.com/h2YaRhV.png" width="66%" height="66%" /> 
  </kbd>
</div>


<br>

```
SELECT
  count(killed_by) AS total,
  killed_by
FROM player_stats
GROUP BY killed_by
ORDER BY total DESC
LIMIT 10;
```


<div align="center">
  <kbd>
    <img src="https://imgur.com/3QkUtfZ.png" width="66%" height="66%" /> 
  </kbd>
</div>

<br>

```
SELECT
  CAST(playtime / 60 AS integer) AS minutes_played_rounded,
  count(CAST(playtime / 60 AS integer )) AS total_sessions,
  killed_by
FROM player_stats
WHERE player_ended_session = FALSE
GROUP BY killed_by, minutes_played_rounded
ORDER BY minutes_played_rounded;
```






# Data Compilation In Noita

In this project the goal had been to take a piece of data that was not in an already usable format, and process it into something that is usable. Thus, I have taken data from a game called Noita, and turned the data into a useable format (i.e., CSV) that I could import into PostgreSQL and begin data analyzation upon.

<div align="center">
  <kbd>
    <img src="https://imgur.com/M4qqaVu.png" width="75%" height="75%" /> 
    <img src="https://imgur.com/Nusdi1h.png" width="75%" height="75%" /> 
  </kbd>
</div>

## Description

I began this project with the goal of locating a data that was not readily available for analysis; thus, I had come across Noita. To my suprise, I had possessed around 30-hours of gameplay in Noita, a dunegeon crawler type game. waht is that you might ask, in this case to put it simply, it is a game that has no end-goal, you simply progress deeper into the dungeons that you are presented with battling monsters along the way until you eventually die; thus, in most cases these game sessions can be quite quick, or quite long. In my case with an avergae game time of around 7-minutes, my games felt long, but were not. I had then began to search the game files for data that I could scrape together when I had come across several "xml" files of data from each of my play sessions; however, I was in a bind. I did not understand "xml" nor how to pull the data I wanted from it; thus, I began my search for a python library, and stumbled upon ElementTree, a Python library curated for reading data from "xml" files. I then learned it enough just for it to be usebale for what I needed, and then read the data from each "xml" file in a folder that possessed the ending similar to "-stats.xml". In this process of parsing through the each folder, I had the data written to a "csv" file using the Python library "CSV". To put it simply, utilizing the library ElementTree, and Glob; I open the folder of data files, open up each file one at a time, then read and write that data to a CSV file utilizing the library CSV.

Longer description explaining the rationale/intent behind the project, what it's good for, and how it works. If the next two subsections are short enough, they can be merged up into this block—perhaps as bulleted lists.

### Features

- It's TINY. A short README is a good README.
- List other standout qualities that'll make a potential user want to try out your project.

### Built with

- Markdown
- Love

## Getting started

### Prerequisites

Dependencies not explicitly covered in the installation process; e.g., OS restrictions.


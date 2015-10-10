# panjerd3
Code van panjerd versie 3

This is the sourcecode of a custom radiostation, named Panjerd.
It is used in the Dutch post-apocalypse LARP named FASE-3. This project is 
probably no use to you, however, use what you must.

## Installing
Retrieve the image from me, or install debian jesse and pull the project. In the
latter case lot's of stuff wont work, I assume. 

## Updating
Just run the isntall.sh script.

## The layout of the datasource.
### Basics
There are two imporant things on the datasource, called the PANTENNA (Panjerd 
Antenna, because this seems logic).
- adverts   -- This contains the text adverts on the screen
- stations  -- The music commercials and news goes here.

The USB drive needs to have a LABEL that is exactly PANTENNA

#### adverts
Place text files here, which are shown in the 'advertisemens' sections on the 
screen. The files are cut of after 8 lines and 29 collumns. (!)
Just place a file here ending with .txt in the filename.
**Be sure the line endings are UNIX**

#### stations
In the /stations folder uis the place the stations go. The name on the screen is 
the name of the station with the first three characters chopped off. Those are 
used for sorting. Example:
- 01_Technomancer radio
- 02_Orde Humanitas Unitas Radio
- 03_Omega Deus Radio
- 04_Liberty radio

The '01_' part of the name MUST BE Unique! This is used for sorting and other
nifty things. The rest of the filename is used as channel name.

Inside the station folder are to be put three folders:
- music
- commercial
- news

Music goes in music, (audio)commercials go in commercials, news in news.

Supported file formats are:
- ogg
- mp3
- wav  (discouraged)
- flac
- wma  (UNTESTED discouraged)
- m4a  (UNTESTED)







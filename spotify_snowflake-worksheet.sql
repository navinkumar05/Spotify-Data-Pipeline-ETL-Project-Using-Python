-------------------------
-- Database
-------------------------
CREATE DATABASE spotify_db;
CREATE SCHEMA sp_etl;


-------------------------------------
-- Create tables 
-------------------------------------

CREATE OR REPLACE TABLE SPOTIFY_DB.SP_ETL.songs (
    song_id VARCHAR,
    song_name VARCHAR,
    duration_ms INT,
    url VARCHAR,
    popularity INT,
    song_added TIMESTAMP_NTZ,
    album_id VARCHAR,
    artist_id VARCHAR
);

CREATE OR REPLACE TABLE SPOTIFY_DB.SP_ETL.artist (
    artist_id VARCHAR,
    artist_name VARCHAR,
    external_url VARCHAR
);

CREATE OR REPLACE TABLE SPOTIFY_DB.SP_ETL.album (
    album_id VARCHAR,
    name VARCHAR,      
    release_date DATE,
    total_tracks INT,
    url VARCHAR
);

-------------------------------------
--  FILE FORMAT
-------------------------------------

CREATE OR REPLACE FILE FORMAT SPOTIFY_DB.SP_ETL.csv_file_format
TYPE = 'csv'
FIELD_DELIMITER = ','
SKIP_HEADER = 1
FIELD_OPTIONALLY_ENCLOSED_BY='"'
NULL_IF=('NULL','null')
EMPTY_FIELD_AS_NULL=TRUE;


-------------------------------------
-- CREATE STAGE (3 Stages)
-------------------------------------

CREATE OR REPLACE STAGE SPOTIFY_DB.SP_ETL.album_csv_folder
    URL='s3://snowflake-db-practice/spotify-etl-project/transformed_data/album_data/'
    STORAGE_INTEGRATION=s3_integrtion
    file_format=SPOTIFY_DB.SP_ETL.csv_file_format;

CREATE OR REPLACE STAGE SPOTIFY_DB.SP_ETL.artist_csv_folder
    URL='s3://snowflake-db-practice/spotify-etl-project/transformed_data/artist_data/'
    STORAGE_INTEGRATION=s3_integrtion
    file_format=SPOTIFY_DB.SP_ETL.csv_file_format;

CREATE OR REPLACE STAGE SPOTIFY_DB.SP_ETL.songs_csv_folder
    URL='s3://snowflake-db-practice/spotify-etl-project/transformed_data/songs_data/'
    STORAGE_INTEGRATION=s3_integrtion
    file_format=SPOTIFY_DB.SP_ETL.csv_file_format;
    
-----------------------------------------
-- CREATE PIPE  (3 PIPES FOR THREE TABLES)
-----------------------------------------
-- album, artist, songs

create or replace pipe SPOTIFY_DB.SP_ETL.album
  auto_ingest = true
  as
  copy into SPOTIFY_DB.SP_ETL.album
  from @SPOTIFY_DB.SP_ETL.album_csv_folder;

DESC pipe SPOTIFY_DB.SP_ETL.album;

create or replace pipe SPOTIFY_DB.SP_ETL.artist
  auto_ingest = true
  as
  copy into SPOTIFY_DB.SP_ETL.artist
  from @SPOTIFY_DB.SP_ETL.artist_csv_folder;

DESC pipe SPOTIFY_DB.SP_ETL.artist;

create or replace pipe SPOTIFY_DB.SP_ETL.songs
  auto_ingest = true
  as
  copy into SPOTIFY_DB.SP_ETL.songs
  from @SPOTIFY_DB.SP_ETL.songs_csv_folder;

DESC pipe SPOTIFY_DB.SP_ETL.songs;
  

SELECT * FROM SPOTIFY_DB.SP_ETL.album;
SELECT * FROM SPOTIFY_DB.SP_ETL.artist;
SELECT * FROM SPOTIFY_DB.SP_ETL.songs;

SELECT * FROM SPOTIFY_DB.SP_ETL.album;
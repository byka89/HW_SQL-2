CREATE TABLE IF NOT EXISTS Genre (
	id serial PRIMARY KEY,
	name varchar(30) NOT NULL unique,
	title integer
);

CREATE TABLE IF NOT EXISTS Singer (
	id serial PRIMARY KEY,
	name varchar(50) NOT NULL unique
);

CREATE TABLE IF NOT EXISTS albom (
	id serial PRIMARY KEY,
	name varchar(50) NOT NULL UNIQUE,
	title integer,
	year integer
);

CREATE TABLE IF NOT EXISTS Song (
	id serial PRIMARY KEY,
	name varchar(100) NOT NULL UNIQUE,
	duration integer,
	albom_id integer REFERENCES albom(id)
);

CREATE TABLE IF NOT EXISTS Genre_singer (
	singer_id integer REFERENCES Singer(id),
	genre_id integer REFERENCES Genre(id),
	CONSTRAINT Genre_Sin PRIMARY KEY (singer_id, genre_id)
);

CREATE TABLE IF NOT EXISTS Singer_albom (
	singer_id integer REFERENCES Singer(id),
	albom_id integer REFERENCES Albom(id),
	CONSTRAINT Singer_Alb PRIMARY KEY (singer_id, albom_id)
);

CREATE TABLE IF NOT EXISTS Collection (
	id serial PRIMARY KEY,
	name varchar(50) NOT NULL UNIQUE,
	year date
);

CREATE TABLE IF NOT EXISTS Song_collection (
	song_id integer REFERENCES Song(id),
	collection_id integer REFERENCES Collection(id),
	CONSTRAINT Song_coll PRIMARY KEY (song_id, collection_id)
);
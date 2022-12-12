-- # Create Statements
-- ## Cast
CREATE TABLE "Cast" (
    "Id" INTEGER NOT NULL UNIQUE,
    "Name" TEXT NOT NULL,
    PRIMARY KEY("Id" AUTOINCREMENT)
);
-- ## Crew
CREATE TABLE "Crew" (
    "Id" INTEGER NOT NULL UNIQUE,
    "Name" TEXT NOT NULL,
    PRIMARY KEY("Id" AUTOINCREMENT)
);
-- ## Genres
CREATE TABLE "Genres" (
    "Id" INTEGER NOT NULL UNIQUE,
    "Name" TEXT NOT NULL,
    PRIMARY KEY("Id" AUTOINCREMENT)
);
-- ## Directors
CREATE TABLE "Directors" (
    "Id" INTEGER NOT NULL UNIQUE,
    "Name" TEXT NOT NULL,
    PRIMARY KEY("Id" AUTOINCREMENT)
);
-- ## Films
CREATE TABLE "Films" (
    "Id" INTEGER NOT NULL UNIQUE,
    "Title" TEXT NOT NULL,
    "DirectorId" INTEGER NOT NULL,
    "RunTime" INTEGER NOT NULL,
    "ReleaseYear" INTEGER NOT NULL,
    "Image" TEXT,
    PRIMARY KEY("Id" AUTOINCREMENT) 
    FOREIGN KEY ("DirectorId") REFERENCES "Directors"("Id")
);

-- ## FilmsCast

CREATE TABLE "FilmsCast" (
    "CastId" INTEGER NOT NULL,
    "FilmsId" INTEGER NOT NULL,
    FOREIGN KEY ("CastId") REFERENCES "Cast"("Id")
    FOREIGN KEY ("FilmsId") REFERENCES "Films"("Id")  
);

-- ## FilmsCrew

CREATE TABLE "FilmsCrew" (
    "CrewId" INTEGER NOT NULL,
    "FilmsId" INTEGER NOT NULL,
    FOREIGN KEY ("CrewId") REFERENCES "Crew"("Id")
    FOREIGN KEY ("FilmsId") REFERENCES "Films"("Id")  
);

-- ## FilmsGenres

CREATE TABLE "FilmsGenres" (
    "GenresId" INTEGER NOT NULL,
    "FilmsId" INTEGER NOT NULL,
    FOREIGN KEY ("GenresId") REFERENCES "Genres"("Id")
    FOREIGN KEY ("FilmsId") REFERENCES "Films"("Id")  
);

-- ## Authors

CREATE TABLE "Authors" (
	"Id"	INTEGER NOT NULL UNIQUE,
	"Name"	TEXT NOT NULL,
	PRIMARY KEY("Id" AUTOINCREMENT)
);

-- ## Books

CREATE TABLE "Books" (
	"Id"	INTEGER NOT NULL UNIQUE,
	"AuthorId"	INTEGER NOT NULL,
    "Title"	TEXT NOT NULL,
    "Isbn"	TEXT NOT NULL UNIQUE,
    "Pages" INTEGER NOT NULL,
    "ReleaseYear" INTEGER NOT NULL,
    "Image" TEXT,
	PRIMARY KEY("Id" AUTOINCREMENT)
    FOREIGN KEY ("AuthorId") REFERENCES "Authors"("Id")  
);

-- ## BooksGenres

CREATE TABLE "BooksGenres" (
    "GenresId" INTEGER NOT NULL,
    "BookId" INTEGER NOT NULL,
    FOREIGN KEY ("GenresId") REFERENCES "Genres"("Id")
    FOREIGN KEY ("BookId") REFERENCES "Books"("Id")  
);

-- ## Shows

CREATE TABLE "Shows" (
    "Id" INTEGER NOT NULL UNIQUE,
    "Title" TEXT NOT NULL,
    "Image" TEXT,
    "ReleaseYear" INTEGER NOT NULL,
    PRIMARY KEY("Id" AUTOINCREMENT)
);

-- ## ShowsGenres

CREATE TABLE "ShowsGenres" (
    "GenresId" INTEGER NOT NULL,
    "ShowId" INTEGER NOT NULL,
    FOREIGN KEY ("GenresId") REFERENCES "Genres"("Id")
    FOREIGN KEY ("ShowId") REFERENCES "Shows"("Id")  
);

-- ## Seasons

CREATE TABLE "Seasons" (
    "Id" INTEGER NOT NULL UNIQUE,
    "Title" TEXT NOT NULL,
    "ReleaseYear" INTEGER NOT NULL,
    "Image" TEXT,
    "ShowId" INTEGER NOT NULL,
    PRIMARY KEY("Id" AUTOINCREMENT)
    FOREIGN KEY ("ShowId") REFERENCES "Shows"("Id")
);

-- ## Episodes

CREATE TABLE "Episodes" (
    "Id" INTEGER NOT NULL UNIQUE,
    "Title" INTEGER NOT NULL,
    "Image" TEXT,
    "ReleaseYear" INTEGER NOT NULL,
    "SeasonId" INTEGER NOT NULL,
    PRIMARY KEY ("Id" AUTOINCREMENT)
    FOREIGN KEY ("SeasonId") REFERENCES "Seasons"("Id")
);

-- ## EpisodesCast

CREATE TABLE "EpisodesCast" (
    "CastId" INTEGER NOT NULL,
    "EpisodeId" INTEGER NOT NULL,
    FOREIGN KEY ("CastId") REFERENCES "Cast"("Id")
    FOREIGN KEY ("EpisodeId") REFERENCES "Episodes"("Id")  
);

-- ## EpisodesCrew

CREATE TABLE "EpisodesCrew" (
    "CrewId" INTEGER NOT NULL,
    "EpisodeId" INTEGER NOT NULL,
    FOREIGN KEY ("CrewId") REFERENCES "Crew"("Id")
    FOREIGN KEY ("EpisodeId") REFERENCES "Episodes"("Id")  
);
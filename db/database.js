const sqlite3 = require('sqlite3').verbose();

const SOURCE = "./db/media.db";

const db = new sqlite3.Database(SOURCE, (err) => {
    if (err) {
        console.error(err.message);
        throw err;
    } else {
        db.run(`CREATE TABLE "Books" (
            "id"	INTEGER NOT NULL UNIQUE,
            "title"	TEXT NOT NULL,
            "isbn"	TEXT NOT NULL UNIQUE,
            "genre"	TEXT NOT NULL,
            "releaseYear"	INTEGER NOT NULL,
            "pages"	INTEGER NOT NULL,
            PRIMARY KEY("id" AUTOINCREMENT)
        );`, (err) => {
            if (err) {
                console.info("Table already exists");
            }
        });
    }
});

module.exports = db;
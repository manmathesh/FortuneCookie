PRAGMA foreign_keys = ON;

CREATE TABLE fc (

        id      INTEGER PRIMARY KEY,

        title   TEXT,

        created TIMESTAMP,

        updated TIMESTAMP

);


CREATE TABLE fc_category (

        fc_id        INTEGER 

        REFERENCES fc(id) ON DELETE CASCADE ON UPDATE CASCADE,

        category_id   INTEGER 

        REFERENCES category(id) ON DELETE CASCADE ON UPDATE CASCADE,

        PRIMARY KEY (fc_id, category_id)

);

CREATE TABLE category (

        id          INTEGER PRIMARY KEY,

        title       TEXT,

        description TEXT,

        created     TIMESTAMP,

        updated     TIMESTAMP

);

---
---

INSERT INTO fc VALUES(1,'Conquer your fears or they will conquer you.',DATETIME('NOW'),DATETIME('NOW'));

INSERT INTO fc VALUES(2,'A single conversation with a wise man is better than ten years of study.',DATETIME('NOW'),DATETIME('NOW'));

INSERT INTO fc VALUES(3,'A big fortune will descend upon you this year.',DATETIME('NOW'),DATETIME('NOW'));

INSERT INTO category VALUES(1,'Funny','Funny Quotes',DATETIME('NOW'),DATETIME('NOW'));

INSERT INTO category VALUES(2,'Insipration','Insipartion Quotes',DATETIME('NOW'),DATETIME('NOW'));

INSERT INTO fc_category VALUES (1, 1);

INSERT INTO fc_category VALUES (2, 1);

INSERT INTO fc_category VALUES (3, 2);


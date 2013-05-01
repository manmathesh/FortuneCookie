PRAGMA foreign_keys = ON;

CREATE TABLE fc (

        id      INTEGER PRIMARY KEY,

        title   TEXT,

        created TIMESTAMP,

        updated TIMESTAMP

);

-- 'fc_category' is a many-to-many join table between fc & category

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

--- Load some sample data

---

INSERT INTO fc VALUES(1,'Perl Developer',DATETIME('NOW'),DATETIME('NOW'));

INSERT INTO fc VALUES(2,'Software Engineer',DATETIME('NOW'),DATETIME('NOW'));

INSERT INTO fc VALUES(3,'Bank Manager',DATETIME('NOW'),DATETIME('NOW'));

INSERT INTO category VALUES(1,'IT','Information Technology',DATETIME('NOW'),DATETIME('NOW'));

INSERT INTO category VALUES(2,'Banking','Banking',DATETIME('NOW'),DATETIME('NOW'));

INSERT INTO fc_category VALUES (1, 1);

INSERT INTO fc_category VALUES (2, 1);

INSERT INTO fc_category VALUES (3, 2);


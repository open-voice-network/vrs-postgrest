-- destroy and recreate schema and some data

DROP TABLE IF EXISTS application;

CREATE TABLE application (
  name        VARCHAR(100),
  url         VARCHAR(100),
  registered  date NOT NULL DEFAULT CURRENT_DATE,
  expires     date NOT NULL DEFAULT (CURRENT_DATE + interval '1 year'),
  CONSTRAINT name_pk PRIMARY KEY(name)
);

INSERT INTO application (name, url, registered, expires)
VALUES
  ('target', 'https://voice.target.com/', '2020-01-01', '2030-12-31'),
  ('delta', 'https://v.delta.com/', DEFAULT, DEFAULT), -- uses default dates
  ('cisco', 'https://cisco.com/', DEFAULT, DEFAULT) -- same
;

SELECT * FROM application;





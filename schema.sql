-- destroy and recreate schema and some data

DROP TABLE IF EXISTS application;

CREATE TABLE application (
  name        VARCHAR(100),
  country     VARCHAR(3),
  destination VARCHAR(100) NOT NULL,
  registered  date NOT NULL DEFAULT CURRENT_DATE,
  expires     date NOT NULL DEFAULT (CURRENT_DATE + interval '1 year'),
  CONSTRAINT name_country_pk PRIMARY KEY(name, country)
);
COMMENT ON COLUMN application.name is 'Application invocation name';
COMMENT ON COLUMN application.country is 'ISO 3166-1 A3 country code'; -- see https://en.wikipedia.org/wiki/ISO_3166-1_alpha-3

INSERT INTO application (name, url, registered, expires)
VALUES
  ('target', 'https://voice.target.com/', '2020-01-01', '2030-12-31'),
  ('delta', 'https://v.delta.com/', DEFAULT, DEFAULT), -- uses default dates
  ('cisco', 'https://cisco.com/', DEFAULT, DEFAULT) -- same
;

SELECT * FROM application;





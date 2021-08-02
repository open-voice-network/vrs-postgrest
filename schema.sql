/*
 * destroy and recreate the VRS schema, then add some data
 */

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

/*
 * insert some unaffiliated applications
 */
INSERT INTO application (name, country, destination, registered, expires)
VALUES
  ('target', 'USA', 'https://voice.target.com/', '2020-01-01', '2030-12-31'),
  ('target', 'AUS', 'ftp://talk.target.com.au/', '2020-01-01', '2025-01-01'),
  ('microsoft', 'USA', 'https://clippy.microsoft.com/', DEFAULT, DEFAULT),
  ('mike rowe soft', 'CAN', 'https://microsoft.com/fr-ca/', DEFAULT, DEFAULT), -- https://en.wikipedia.org/wiki/Microsoft_v._MikeRoweSoft
  ('delta', 'MEX', 'https://v.delta.com/es', DEFAULT, DEFAULT), -- uses default dates
  ('cisco', 'GBR', 'https://cisco.com/', DEFAULT, DEFAULT) -- same
;

/* insert some affiliated skills */
INSERT INTO application (name, country, destination)
VALUES
  ('jeopardy', 'USA', 'skill://alexa/jeopardy'), -- an Alexa skill
  /* ('target', 'usa', 'skill://google/target'), -- a forbidden Google Assistant skill due to PK */
  ('wings', 'USA', 'skill://bixby/wings-cu')     -- a Bixby capsule
;
SELECT * FROM application;

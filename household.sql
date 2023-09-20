DROP TABLE IF EXISTS public.phone_nr;
DROP TABLE IF EXISTS public.person;
DROP TABLE IF EXISTS public.address;
DROP TABLE IF EXISTS public.city;
DROP TABLE IF EXISTS public.country;

CREATE TABLE IF NOT EXISTS public.country
(
    country_id serial NOT NULL,
    country character varying(60) NOT NULL,
    PRIMARY KEY (country_id)
);

CREATE TABLE IF NOT EXISTS public.city
(
    city_id serial NOT NULL,
    city character varying(60) NOT NULL,
    PRIMARY KEY (city_id),
	country_id INTEGER REFERENCES country(country_id)
);

CREATE TABLE IF NOT EXISTS public.address
(
    address_id serial NOT NULL,
    address character varying(255) NOT NULL,
    postal_code character varying(6),
    PRIMARY KEY (address_id),
	city_id INTEGER REFERENCES city(city_id)
);

CREATE TABLE IF NOT EXISTS public.person (
  person_id serial PRIMARY KEY,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  address_id INTEGER REFERENCES address(address_id)
);

CREATE TABLE IF NOT EXISTS public.phone_nr
(
    phone_nr_id serial NOT NULL,
    phone_nr character varying(25) NOT NULL,
	person_id INTEGER REFERENCES person(person_id),
    PRIMARY KEY (phone_nr_id)
);





































































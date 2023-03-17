--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    distance_from_earth_in_mly numeric,
    is_visible boolean,
    constellation text
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    planet_id integer,
    discovered_by text,
    temp_in_k integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    star_id integer,
    star text,
    composition text,
    number_of_moons integer,
    is_exoplanet boolean
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: planets_with_moons; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planets_with_moons (
    name character varying(30) NOT NULL,
    composition text,
    number_of_moons integer NOT NULL,
    is_exoplanet boolean,
    planets_with_moons_id integer NOT NULL
);


ALTER TABLE public.planets_with_moons OWNER TO freecodecamp;

--
-- Name: planets_with_moons_planets_with_moons_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planets_with_moons_planets_with_moons_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planets_with_moons_planets_with_moons_id_seq OWNER TO freecodecamp;

--
-- Name: planets_with_moons_planets_with_moons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planets_with_moons_planets_with_moons_id_seq OWNED BY public.planets_with_moons.planets_with_moons_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_id integer,
    mass_in_kg text,
    galaxy text,
    spectral_type character varying(10)
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: planets_with_moons planets_with_moons_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planets_with_moons ALTER COLUMN planets_with_moons_id SET DEFAULT nextval('public.planets_with_moons_planets_with_moons_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 0.0, true, 'Sagittarius');
INSERT INTO public.galaxy VALUES (2, 'Andromeda Galaxy', 2.5, true, 'Andromeda');
INSERT INTO public.galaxy VALUES (3, 'Backward Galaxy', 111.1, false, 'Centaurus');
INSERT INTO public.galaxy VALUES (4, 'Circinus Galaxy', 13, false, 'Circinus');
INSERT INTO public.galaxy VALUES (5, 'Sculptor Galaxy', 12, true, 'Sculptor');
INSERT INTO public.galaxy VALUES (6, 'Triangulum Galaxy', 2.9, true, 'Triangulum');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Triton', 11, 'William Lassell', 38);
INSERT INTO public.moon VALUES (2, 'Phobos', 7, 'Asaph Hall', 233);
INSERT INTO public.moon VALUES (3, 'Miranda', 4, 'Gerard P. Kuiper', 60);
INSERT INTO public.moon VALUES (4, 'Umbriel', 4, 'William Lassell', 75);
INSERT INTO public.moon VALUES (5, 'Dione', 10, 'Giovanni Cassini', 87);
INSERT INTO public.moon VALUES (6, 'Titan', 10, 'Christiaan Huygens', 94);
INSERT INTO public.moon VALUES (7, 'Nereid', 11, 'Gerard P. Kuiper', 50);
INSERT INTO public.moon VALUES (8, 'Proteus', 11, 'Voyager 2, Stephen P. Synnott', 51);
INSERT INTO public.moon VALUES (9, 'Luna', 1, 'Thomas Harriot', 250);
INSERT INTO public.moon VALUES (10, 'Mimas', 10, 'William Herschel', 64);
INSERT INTO public.moon VALUES (11, 'Enceladus', 10, 'William Herschel', 75);
INSERT INTO public.moon VALUES (12, 'Tethys', 10, 'Giovanni Cassini', 86);
INSERT INTO public.moon VALUES (13, 'Larissa', 11, 'Harold J. Reitsema et al.', 51);
INSERT INTO public.moon VALUES (14, 'Deimos', 7, 'Asaph Hall', 233);
INSERT INTO public.moon VALUES (15, 'Oberon', 4, 'William Herschel', 70);
INSERT INTO public.moon VALUES (16, 'Rhea', 10, 'Giovanni Cassini', 53);
INSERT INTO public.moon VALUES (17, 'Iapetus', 10, 'Giovanni Cassini', 90);
INSERT INTO public.moon VALUES (18, 'Naiad', 11, 'Voyager Imaging Team', 51);
INSERT INTO public.moon VALUES (19, 'Ariel', 4, 'William Lassell', 60);
INSERT INTO public.moon VALUES (20, 'Galatea', 11, 'Stephen P. Synnott, Voyager Imaging Team', 51);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, 'Sun', 'terrestrial', 1, false);
INSERT INTO public.planet VALUES (2, 'HD 102117 b', 6, 'Uklun', 'gas', 0, true);
INSERT INTO public.planet VALUES (3, 'Spe', 3, 'Veritate', 'gas', 0, true);
INSERT INTO public.planet VALUES (4, 'Uranus', 1, 'Sun', 'ice', 27, false);
INSERT INTO public.planet VALUES (5, 'HD 13189 b', 2, 'HD 13189', 'gas', 0, true);
INSERT INTO public.planet VALUES (6, 'Xolotlan', 5, 'HD 4208', 'gas', 0, true);
INSERT INTO public.planet VALUES (7, 'Mars', 1, 'Sun', 'terrestrial', 2, false);
INSERT INTO public.planet VALUES (8, 'HD 134060 b', 4, 'HD 134060', 'ice', 0, true);
INSERT INTO public.planet VALUES (9, 'HD 134060 c', 4, 'HD 134060', 'ice', 0, true);
INSERT INTO public.planet VALUES (10, 'Saturn', 1, 'Sun', 'gas', 83, false);
INSERT INTO public.planet VALUES (11, 'Neptune', 1, 'Sun', 'ice', 14, false);
INSERT INTO public.planet VALUES (12, 'Venus', 1, 'Sun', 'terrestrial', 0, false);


--
-- Data for Name: planets_with_moons; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planets_with_moons VALUES ('Uranus', 'ice', 27, false, 1);
INSERT INTO public.planets_with_moons VALUES ('Earth', 'terrestrial', 1, false, 2);
INSERT INTO public.planets_with_moons VALUES ('Neptune', 'ice', 14, false, 3);
INSERT INTO public.planets_with_moons VALUES ('Saturn', 'gas', 83, false, 4);
INSERT INTO public.planets_with_moons VALUES ('Mars', 'terrestrial', 2, false, 5);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, '1.989 * 10^30', 'Milky Way', 'G2V');
INSERT INTO public.star VALUES (2, 'HD 13189', 6, '2.387 * 10^30', 'Triangulum Galaxy', 'K1II-III');
INSERT INTO public.star VALUES (3, 'Veritate', 2, '4.376 * 10^30', 'Andromeda Galaxy', 'K0 III');
INSERT INTO public.star VALUES (4, 'HD 134060', 4, '2.128 * 10^30', 'Circinus Galaxy', 'G0 V/G3 IV');
INSERT INTO public.star VALUES (5, 'HD 4208', 5, '1.756 * 10^30', 'Sculptor Galaxy', 'G7V');
INSERT INTO public.star VALUES (6, 'Uklun', 3, '2.725 * 10^30', 'Backward Galaxy', 'G6V');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 1, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: planets_with_moons_planets_with_moons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planets_with_moons_planets_with_moons_id_seq', 5, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy constraint_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT constraint_name UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planets_with_moons planets_with_moons_id_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planets_with_moons
    ADD CONSTRAINT planets_with_moons_id_unique UNIQUE (planets_with_moons_id);


--
-- Name: planets_with_moons planets_with_moons_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planets_with_moons
    ADD CONSTRAINT planets_with_moons_pkey PRIMARY KEY (planets_with_moons_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--


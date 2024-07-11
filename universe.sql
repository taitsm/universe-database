--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying(100) NOT NULL,
    belt_id integer,
    size_km numeric(10,2) NOT NULL,
    composition text NOT NULL,
    is_potentially_hazardous boolean NOT NULL
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: belt; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.belt (
    belt_id integer NOT NULL,
    name character varying(100) NOT NULL,
    star_id integer
);


ALTER TABLE public.belt OWNER TO freecodecamp;

--
-- Name: belt_belt_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.belt_belt_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.belt_belt_id_seq OWNER TO freecodecamp;

--
-- Name: belt_belt_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.belt_belt_id_seq OWNED BY public.belt.belt_id;


--
-- Name: comet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comet (
    comet_id integer NOT NULL,
    name character varying(100) NOT NULL,
    star_id integer,
    tail_length_km numeric(10,2) NOT NULL,
    period_years integer NOT NULL,
    is_active boolean NOT NULL
);


ALTER TABLE public.comet OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.comet_comet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comet_comet_id_seq OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.comet_comet_id_seq OWNED BY public.comet.comet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    galaxy_type character varying(50),
    age_in_millions_of_years integer NOT NULL,
    has_life boolean NOT NULL
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
    name character varying(100) NOT NULL,
    planet_id integer,
    description text,
    age_in_millions_of_years integer NOT NULL,
    is_spherical boolean NOT NULL
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
    name character varying(100) NOT NULL,
    star_id integer,
    planet_type character varying(50),
    distance_from_earth numeric(10,2) NOT NULL,
    has_life boolean NOT NULL
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
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(100) NOT NULL,
    galaxy_id integer,
    star_type character varying(50),
    age_in_millions_of_years integer NOT NULL,
    is_spherical boolean NOT NULL
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
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass);


--
-- Name: belt belt_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.belt ALTER COLUMN belt_id SET DEFAULT nextval('public.belt_belt_id_seq'::regclass);


--
-- Name: comet comet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet ALTER COLUMN comet_id SET DEFAULT nextval('public.comet_comet_id_seq'::regclass);


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
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, 'Ceres', 1, 945.00, 'Rock and Ice', false);
INSERT INTO public.asteroid VALUES (2, 'Pallas', 1, 512.00, 'Rock and Metal', false);
INSERT INTO public.asteroid VALUES (3, 'Haumea', 2, 1240.00, 'Rock and Ice', false);
INSERT INTO public.asteroid VALUES (4, 'Makemake', 2, 1430.00, 'Ice', false);
INSERT INTO public.asteroid VALUES (5, 'Sedna', 3, 1000.00, 'Ice', false);
INSERT INTO public.asteroid VALUES (6, 'Eris', 2, 2326.00, 'Ice and Rock', true);


--
-- Data for Name: belt; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.belt VALUES (1, 'Main Asteroid Belt', 1);
INSERT INTO public.belt VALUES (2, 'Kuiper Belt', 1);
INSERT INTO public.belt VALUES (3, 'Oort Cloud', 1);


--
-- Data for Name: comet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.comet VALUES (1, 'Halley', 1, 24.00, 76, true);
INSERT INTO public.comet VALUES (2, 'Hale-Bopp', 1, 40.00, 2533, true);
INSERT INTO public.comet VALUES (3, 'Swift-Tuttle', 2, 26.00, 133, false);
INSERT INTO public.comet VALUES (4, 'Hyakutake', 3, 4.00, 70000, true);
INSERT INTO public.comet VALUES (5, 'Encke', 1, 5.00, 3, false);
INSERT INTO public.comet VALUES (6, 'Tempel-Tuttle', 2, 2.00, 33, true);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 13600, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 10100, false);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 8900, false);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'Spiral', 14200, true);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Elliptical', 10500, false);
INSERT INTO public.galaxy VALUES (6, 'Cartwheel', 'Lenticular', 8000, true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, 'Earth''s natural satellite', 4500, true);
INSERT INTO public.moon VALUES (2, 'Phobos', 2, 'Mars'' moon', 4500, false);
INSERT INTO public.moon VALUES (3, 'Deimos', 2, 'Mars'' moon', 4500, false);
INSERT INTO public.moon VALUES (4, 'Io', 3, 'Jupiter''s moon', 4500, true);
INSERT INTO public.moon VALUES (5, 'Europa', 3, 'Jupiter''s moon', 4500, true);
INSERT INTO public.moon VALUES (6, 'Ganymede', 3, 'Jupiter''s moon', 4500, true);
INSERT INTO public.moon VALUES (7, 'Callisto', 3, 'Jupiter''s moon', 4500, true);
INSERT INTO public.moon VALUES (8, 'Titan', 4, 'Saturn''s moon', 4500, true);
INSERT INTO public.moon VALUES (9, 'Rhea', 4, 'Saturn''s moon', 4500, true);
INSERT INTO public.moon VALUES (10, 'Iapetus', 4, 'Saturn''s moon', 4500, true);
INSERT INTO public.moon VALUES (11, 'Dione', 4, 'Saturn''s moon', 4500, true);
INSERT INTO public.moon VALUES (12, 'Tethys', 4, 'Saturn''s moon', 4500, true);
INSERT INTO public.moon VALUES (13, 'Enceladus', 4, 'Saturn''s moon', 4500, true);
INSERT INTO public.moon VALUES (14, 'Mimas', 4, 'Saturn''s moon', 4500, true);
INSERT INTO public.moon VALUES (15, 'Oberon', 5, 'Uranus'' moon', 4500, true);
INSERT INTO public.moon VALUES (16, 'Titania', 5, 'Uranus'' moon', 4500, true);
INSERT INTO public.moon VALUES (17, 'Umbriel', 5, 'Uranus'' moon', 4500, true);
INSERT INTO public.moon VALUES (18, 'Ariel', 5, 'Uranus'' moon', 4500, true);
INSERT INTO public.moon VALUES (19, 'Miranda', 5, 'Uranus'' moon', 4500, true);
INSERT INTO public.moon VALUES (20, 'Triton', 6, 'Neptune''s moon', 4500, true);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, 'Terrestrial', 0.00, true);
INSERT INTO public.planet VALUES (2, 'Mars', 1, 'Terrestrial', 225.30, false);
INSERT INTO public.planet VALUES (3, 'Jupiter', 1, 'Gas Giant', 588.00, false);
INSERT INTO public.planet VALUES (4, 'Saturn', 1, 'Gas Giant', 1200.00, false);
INSERT INTO public.planet VALUES (5, 'Alpha Centauri Bb', 4, 'Exoplanet', 4.30, false);
INSERT INTO public.planet VALUES (6, 'HD 209458 b', 4, 'Exoplanet', 153.00, false);
INSERT INTO public.planet VALUES (7, 'Kepler-22b', 5, 'Exoplanet', 600.00, false);
INSERT INTO public.planet VALUES (8, 'Gliese 581d', 6, 'Exoplanet', 20.30, false);
INSERT INTO public.planet VALUES (9, 'HD 189733 b', 2, 'Exoplanet', 63.00, false);
INSERT INTO public.planet VALUES (10, 'Kepler-11f', 3, 'Exoplanet', 2000.00, false);
INSERT INTO public.planet VALUES (11, 'Kepler-452b', 5, 'Exoplanet', 1400.00, true);
INSERT INTO public.planet VALUES (12, 'Wolf 1061c', 6, 'Exoplanet', 13.80, false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 'G-Type', 4600, true);
INSERT INTO public.star VALUES (2, 'Sirius', 1, 'A-Type', 242, true);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 2, 'M-Type', 10000, true);
INSERT INTO public.star VALUES (4, 'Proxima Centauri', 1, 'M-Type', 4600, true);
INSERT INTO public.star VALUES (5, 'Rigel', 2, 'B-Type', 860, true);
INSERT INTO public.star VALUES (6, 'Vega', 3, 'A-Type', 455, true);


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 6, true);


--
-- Name: belt_belt_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.belt_belt_id_seq', 3, true);


--
-- Name: comet_comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comet_comet_id_seq', 6, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: asteroid asteroid_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_name_key UNIQUE (name);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


--
-- Name: belt belt_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.belt
    ADD CONSTRAINT belt_name_key UNIQUE (name);


--
-- Name: belt belt_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.belt
    ADD CONSTRAINT belt_pkey PRIMARY KEY (belt_id);


--
-- Name: comet comet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_name_key UNIQUE (name);


--
-- Name: comet comet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_pkey PRIMARY KEY (comet_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


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
-- Name: asteroid asteroid_belt_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_belt_id_fkey FOREIGN KEY (belt_id) REFERENCES public.belt(belt_id);


--
-- Name: belt belt_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.belt
    ADD CONSTRAINT belt_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: comet comet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


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


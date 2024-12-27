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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    distance_from_earth numeric,
    is_spherical boolean,
    galaxy_type_id integer
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
-- Name: galaxy_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_type (
    galaxy_type_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text
);


ALTER TABLE public.galaxy_type OWNER TO freecodecamp;

--
-- Name: galaxy_types_galaxy_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_types_galaxy_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_types_galaxy_type_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_types_galaxy_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_types_galaxy_type_id_seq OWNED BY public.galaxy_type.galaxy_type_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    distance_from_earth numeric,
    age_in_millions_of_years integer,
    description text,
    has_life boolean,
    is_spherical boolean,
    planet_id integer
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
    description text,
    distance_from_earth numeric,
    age_in_millions_of_years integer,
    has_life boolean,
    is_spherical boolean,
    star_id integer,
    planet_type_id integer
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
-- Name: planet_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_type (
    planet_type_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text
);


ALTER TABLE public.planet_type OWNER TO freecodecamp;

--
-- Name: planet_types_planet_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_types_planet_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_types_planet_type_id_seq OWNER TO freecodecamp;

--
-- Name: planet_types_planet_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_types_planet_type_id_seq OWNED BY public.planet_type.planet_type_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    distance_from_earth numeric,
    is_spherical boolean,
    age_in_millions_of_years integer,
    galaxy_id integer
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
-- Name: galaxy_type galaxy_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type ALTER COLUMN galaxy_type_id SET DEFAULT nextval('public.galaxy_types_galaxy_type_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: planet_type planet_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type ALTER COLUMN planet_type_id SET DEFAULT nextval('public.planet_types_planet_type_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Our home galaxy, a large spiral galaxy', 0, false, 1);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Nearest large galaxy to the Milky Way', 2537000, false, 1);
INSERT INTO public.galaxy VALUES (3, 'Messier 87', 'Giant elliptical galaxy in Virgo cluster', 53490000, true, 2);
INSERT INTO public.galaxy VALUES (4, 'Large Magellanic Cloud', 'Satellite galaxy of the Milky Way', 163000, false, 3);
INSERT INTO public.galaxy VALUES (5, 'Sombrero Galaxy', 'Notable for its bright nucleus and dust lane', 29350000, false, 4);
INSERT INTO public.galaxy VALUES (6, 'Triangulum Galaxy', 'Third-largest galaxy in the Local Group', 2723000, false, 1);
INSERT INTO public.galaxy VALUES (7, 'Centaurus A', 'Peculiar elliptical galaxy with dust band', 13050000, true, 2);


--
-- Data for Name: galaxy_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_type VALUES (1, 'Spiral', 'Distinctive spiral arm structure with a central bulge. Contains older stars in the bulge and younger stars in the arms.');
INSERT INTO public.galaxy_type VALUES (2, 'Elliptical', 'Ellipsoidal shape without distinct features. Generally contains older stars and little gas or dust.');
INSERT INTO public.galaxy_type VALUES (3, 'Irregular', 'No definite shape or structure. Often smaller and contain many young stars and abundant gas and dust.');
INSERT INTO public.galaxy_type VALUES (4, 'Lenticular', 'Hybrid between spiral and elliptical. Has a disk and bulge like spiral galaxies but no spiral arms.');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 0.384, 4500, 'Earth''s only natural satellite', false, true, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 0.000094, 4500, 'Larger of Mars'' two moons', false, true, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 0.000235, 4500, 'Smaller of Mars'' two moons', false, true, 4);
INSERT INTO public.moon VALUES (4, 'Io', 628, 4500, 'Volcanically active moon of Jupiter', false, true, 5);
INSERT INTO public.moon VALUES (5, 'Europa', 628, 4500, 'Icy moon with potential subsurface ocean', NULL, true, 5);
INSERT INTO public.moon VALUES (6, 'Ganymede', 628, 4500, 'Largest moon in the Solar System', false, true, 5);
INSERT INTO public.moon VALUES (7, 'Callisto', 628, 4500, 'Heavily cratered moon of Jupiter', false, true, 5);
INSERT INTO public.moon VALUES (8, 'Titan', 1275, 4500, 'Saturn''s largest moon with thick atmosphere', NULL, true, 6);
INSERT INTO public.moon VALUES (9, 'Enceladus', 1275, 4500, 'Icy moon with geysers of water', NULL, true, 6);
INSERT INTO public.moon VALUES (10, 'Tethys', 1275, 4500, 'Heavily cratered moon of Saturn', false, true, 6);
INSERT INTO public.moon VALUES (11, 'Rhea', 1275, 4500, 'Second largest moon of Saturn', false, true, 6);
INSERT INTO public.moon VALUES (12, 'Dione', 1275, 4500, 'Moon with ice cliffs', false, true, 6);
INSERT INTO public.moon VALUES (13, 'Triton', 4350, 4500, 'Neptune''s largest moon, retrograde orbit', false, true, 8);
INSERT INTO public.moon VALUES (14, 'Nereid', 4350, 4500, 'Irregular moon of Neptune', false, true, 8);
INSERT INTO public.moon VALUES (16, 'Proxima Centauri c', 40200, 4500, 'Exomoon orbiting Proxima Centauri b', NULL, true, 9);
INSERT INTO public.moon VALUES (17, 'Kepler-22b-I', 210000, 4500, 'Moon orbiting Kepler-22b', NULL, true, 10);
INSERT INTO public.moon VALUES (18, 'Kepler-22b-II', 210000, 4500, 'Another moon orbiting Kepler-22b', NULL, true, 10);
INSERT INTO public.moon VALUES (19, 'Gliese 581g-I', 20000, 4500, 'Moon of Gliese 581g', NULL, true, 11);
INSERT INTO public.moon VALUES (20, 'K2-18b-I', 110000, 4600, 'Moon orbiting K2-18b', NULL, true, 12);
INSERT INTO public.moon VALUES (21, 'HD 209458b-I', 150000, 4600, 'Moon orbiting HD 209458b', false, true, 13);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 'Closest planet to the Sun', 77, 4600, false, true, 1, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 'Hottest planet in the Solar System', 261, 4600, false, true, 1, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 'Our home planet', 0, 4600, true, true, 1, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 'Known as the Red Planet', 78, 4600, false, true, 1, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'Largest planet in the Solar System', 628, 4600, false, true, 1, 2);
INSERT INTO public.planet VALUES (6, 'Saturn', 'Famous for its rings', 1275, 4600, false, true, 1, 2);
INSERT INTO public.planet VALUES (7, 'Uranus', 'An ice giant with a tilted axis', 2724, 4600, false, true, 1, 3);
INSERT INTO public.planet VALUES (8, 'Neptune', 'Farthest planet from the Sun', 4350, 4600, false, true, 1, 3);
INSERT INTO public.planet VALUES (9, 'Proxima Centauri b', 'Exoplanet orbiting Proxima Centauri', 40200, 4500, NULL, true, 2, 4);
INSERT INTO public.planet VALUES (10, 'Kepler-22b', 'A super-Earth exoplanet', 210000, 4500, NULL, true, 3, 4);
INSERT INTO public.planet VALUES (11, 'Gliese 581g', 'Potentially habitable exoplanet', 20000, 7000, NULL, true, 4, 4);
INSERT INTO public.planet VALUES (12, 'K2-18b', 'A super-Earth with water vapor', 110000, 4600, NULL, true, 5, 4);
INSERT INTO public.planet VALUES (13, 'HD 209458b', 'Gas giant exoplanet with escaping atmosphere', 150000, 4600, false, true, 6, 2);


--
-- Data for Name: planet_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_type VALUES (1, 'Terrestrial', 'Rocky planets with solid surfaces, similar to Earth. Generally smaller and closer to their star.');
INSERT INTO public.planet_type VALUES (2, 'Gas Giant', 'Large planets primarily composed of hydrogen and helium, like Jupiter. No solid surface.');
INSERT INTO public.planet_type VALUES (3, 'Ice Giant', 'Planets composed mainly of ices, rocks, and some gas, like Uranus. Found in outer solar systems.');
INSERT INTO public.planet_type VALUES (4, 'Super Earth', 'Rocky planets larger than Earth but smaller than gas giants. May or may not have atmospheres.');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'Our solar system''s star', 0.0000158, true, 4600, 1);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 'Closest star to our solar system', 4.2465, true, 4850, 1);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 'Red supergiant in Orion', 642.5, true, 8, 1);
INSERT INTO public.star VALUES (4, 'Sirius', 'Brightest star in Earth''s night sky', 8.611, true, 242, 1);
INSERT INTO public.star VALUES (5, 'Alpha Andromedae', 'Brightest star in Andromeda', 97, true, 60, 2);
INSERT INTO public.star VALUES (6, 'Vega', 'Fifth-brightest star in the night sky', 25.04, true, 455, 1);
INSERT INTO public.star VALUES (7, 'Antares', 'Supergiant star in Scorpius', 554.5, true, 11, 1);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 1, false);


--
-- Name: galaxy_types_galaxy_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_types_galaxy_type_id_seq', 1, false);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: planet_types_planet_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_types_planet_type_id_seq', 1, false);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 1, false);


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
-- Name: galaxy_type galaxy_types_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT galaxy_types_name_key UNIQUE (name);


--
-- Name: galaxy_type galaxy_types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT galaxy_types_pkey PRIMARY KEY (galaxy_type_id);


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
-- Name: planet_type planet_types_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT planet_types_name_key UNIQUE (name);


--
-- Name: planet_type planet_types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT planet_types_pkey PRIMARY KEY (planet_type_id);


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
-- Name: galaxy galaxy_galaxy_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_type_id_fkey FOREIGN KEY (galaxy_type_id) REFERENCES public.galaxy_type(galaxy_type_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_planet_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_type_id_fkey FOREIGN KEY (planet_type_id) REFERENCES public.planet_type(planet_type_id);


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


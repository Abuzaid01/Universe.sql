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
    name character varying(50) NOT NULL,
    galaxy_type_id integer NOT NULL,
    distance_from_earth_in_km numeric,
    description text,
    age_in_millions_of_years numeric,
    number_of_stars numeric
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
    name character varying(50) NOT NULL,
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
    name character varying(50) NOT NULL,
    radius_in_km double precision,
    distance_from_planet_in_km double precision,
    planet_id integer NOT NULL,
    is_spherical boolean
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
    name character varying(50) NOT NULL,
    planet_type_id integer NOT NULL,
    mass double precision,
    distance_from_star_in_km numeric,
    orbital_period double precision,
    has_life boolean,
    star_id integer NOT NULL
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
    name character varying(50) NOT NULL,
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
    name character varying(50) NOT NULL,
    star_type_id integer NOT NULL,
    galaxy_id integer NOT NULL,
    mass_in_kg double precision,
    luminosity integer,
    distance_from_earth_in_km integer,
    is_spherical boolean
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
-- Name: star_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star_type (
    star_type_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text
);


ALTER TABLE public.star_type OWNER TO freecodecamp;

--
-- Name: star_types_star_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_types_star_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_types_star_type_id_seq OWNER TO freecodecamp;

--
-- Name: star_types_star_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_types_star_type_id_seq OWNED BY public.star_type.star_type_id;


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
-- Name: star_type star_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_type ALTER COLUMN star_type_id SET DEFAULT nextval('public.star_types_star_type_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 2, 27000, 'Our home galaxy with spiral arms.', 13500, 100000000000);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 2, 2537000, 'Nearest spiral galaxy to the Milky Way.', 10000, 1000000000000);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 2, 3000000, 'A small spiral galaxy.', 9000, 40000000000);
INSERT INTO public.galaxy VALUES (4, 'Large Magellanic Cloud', 3, 163000, 'Satellite galaxy of the Milky Way.', 7000, 10000000000);
INSERT INTO public.galaxy VALUES (5, 'Small Magellanic Cloud', 3, 200000, 'Another satellite galaxy of the Milky Way.', 6000, 7000000000);
INSERT INTO public.galaxy VALUES (6, 'Messier 87', 1, 53000000, 'Giant elliptical galaxy in Virgo.', 14000, 1200000000000);
INSERT INTO public.galaxy VALUES (7, 'Sombrero Galaxy', 4, 29000000, 'Edge-on lenticular galaxy.', 11000, 800000000000);
INSERT INTO public.galaxy VALUES (8, 'Sculptor Dwarf', 5, 290000, 'A small galaxy near the Milky Way.', 6000, 200000000);
INSERT INTO public.galaxy VALUES (9, 'IC 1101', 1, 320000000, 'Largest known galaxy.', 16000, 10000000000000);
INSERT INTO public.galaxy VALUES (10, 'Whirlpool Galaxy', 2, 23000000, 'Famous spiral galaxy.', 12000, 150000000000);
INSERT INTO public.galaxy VALUES (11, 'Cartwheel Galaxy', 3, 500000000, 'Galaxy resembling a cartwheel.', 9000, 100000000000);
INSERT INTO public.galaxy VALUES (12, 'NGC 1300', 2, 61000000, 'Barred spiral galaxy.', 10000, 75000000000);


--
-- Data for Name: galaxy_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_type VALUES (1, 'Elliptical', 'Round or elliptical galaxies with minimal structure.');
INSERT INTO public.galaxy_type VALUES (2, 'Spiral', 'Galaxies with prominent spiral arms.');
INSERT INTO public.galaxy_type VALUES (3, 'Irregular', 'Galaxies with no defined shape.');
INSERT INTO public.galaxy_type VALUES (4, 'Lenticular', 'Disk-shaped galaxies without spiral arms.');
INSERT INTO public.galaxy_type VALUES (5, 'Dwarf', 'Small galaxies with few stars.');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1737, 384400, 1, true);
INSERT INTO public.moon VALUES (2, 'Phobos', 11.3, 9376, 2, true);
INSERT INTO public.moon VALUES (3, 'Deimos', 6.2, 23459, 2, true);
INSERT INTO public.moon VALUES (4, 'Europa', 1560, 670900, 3, true);
INSERT INTO public.moon VALUES (5, 'Ganymede', 2634, 1070400, 3, true);
INSERT INTO public.moon VALUES (6, 'Callisto', 2410, 1883000, 3, true);
INSERT INTO public.moon VALUES (7, 'Io', 1821, 421700, 3, true);
INSERT INTO public.moon VALUES (8, 'Titan', 2576, 1221870, 4, true);
INSERT INTO public.moon VALUES (9, 'Rhea', 763.8, 527040, 4, true);
INSERT INTO public.moon VALUES (10, 'Iapetus', 734.5, 3561000, 4, true);
INSERT INTO public.moon VALUES (11, 'Tethys', 531, 294670, 4, true);
INSERT INTO public.moon VALUES (12, 'Dione', 561.5, 377400, 4, true);
INSERT INTO public.moon VALUES (13, 'Enceladus', 252.1, 237948, 4, true);
INSERT INTO public.moon VALUES (14, 'Miranda', 235.8, 129900, 5, true);
INSERT INTO public.moon VALUES (15, 'Ariel', 578.9, 191020, 5, true);
INSERT INTO public.moon VALUES (16, 'Umbriel', 584.7, 265970, 5, true);
INSERT INTO public.moon VALUES (17, 'Titania', 788.9, 435910, 5, true);
INSERT INTO public.moon VALUES (18, 'Oberon', 761.4, 583520, 5, true);
INSERT INTO public.moon VALUES (19, 'Charon', 606, 19591, 6, true);
INSERT INTO public.moon VALUES (20, 'Nix', 23, 48694, 6, false);
INSERT INTO public.moon VALUES (21, 'Hydra', 30, 64678, 6, false);
INSERT INTO public.moon VALUES (22, 'Kerberos', 12, 58200, 6, false);
INSERT INTO public.moon VALUES (23, 'Styx', 8, 42656, 6, false);
INSERT INTO public.moon VALUES (24, 'Triton', 1353, 354800, 5, true);
INSERT INTO public.moon VALUES (25, 'Nereid', 170, 5513816, 5, false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, 5.972e+24, 149600000, 365.25, true, 1);
INSERT INTO public.planet VALUES (2, 'Mars', 1, 6.39e+23, 227940000, 687, false, 1);
INSERT INTO public.planet VALUES (3, 'Jupiter', 2, 1.898e+27, 778340000, 4333, false, 1);
INSERT INTO public.planet VALUES (4, 'Saturn', 2, 5.683e+26, 1427000000, 10759, false, 1);
INSERT INTO public.planet VALUES (5, 'Neptune', 3, 1.0239999999999999e+26, 4495100000, 60190, false, 1);
INSERT INTO public.planet VALUES (6, 'Pluto', 4, 1.309e+22, 5906400000, 90560, false, 1);
INSERT INTO public.planet VALUES (7, 'Kepler-452b', 5, 2.2e+24, 1400000000000, 385, false, 2);
INSERT INTO public.planet VALUES (8, 'Proxima b', 5, 1.27e+25, 75000000000, 11.2, false, 4);
INSERT INTO public.planet VALUES (9, 'GJ 1214 b', 3, 2e+25, 49000000000, 1.5, false, 8);
INSERT INTO public.planet VALUES (10, 'Kepler-22b', 5, 2.4e+25, 760000000000, 289, false, 7);
INSERT INTO public.planet VALUES (11, 'HD 209458 b', 3, 3.1e+25, 70000000000, 3.5, false, 9);
INSERT INTO public.planet VALUES (12, '55 Cancri e', 1, 8.6e+24, 35000000, 0.7, false, 5);
INSERT INTO public.planet VALUES (13, 'LHS 1140 b', 1, 6.6e+24, 65000000000, 24.7, false, 3);
INSERT INTO public.planet VALUES (14, 'Trappist-1d', 1, 1.5e+24, 4000000000, 4.7, false, 6);
INSERT INTO public.planet VALUES (15, 'Wolf 1061c', 1, 2.3e+25, 72000000000, 18.2, false, 2);


--
-- Data for Name: planet_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_type VALUES (1, 'Terrestrial', 'Rocky planets.');
INSERT INTO public.planet_type VALUES (2, 'Gas Giant', 'Massive planets with thick atmospheres.');
INSERT INTO public.planet_type VALUES (3, 'Ice Giant', 'Planets with icy compositions.');
INSERT INTO public.planet_type VALUES (4, 'Dwarf Planet', 'Small, non-dominant planets.');
INSERT INTO public.planet_type VALUES (5, 'Exoplanet', 'Planets outside our solar system.');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 1, 1.989e+30, 1, 0, true);
INSERT INTO public.star VALUES (2, 'Betelgeuse', 5, 1, 1.35e+31, 120000, 642, true);
INSERT INTO public.star VALUES (3, 'Sirius', 1, 2, 4.02e+30, 25, 9, true);
INSERT INTO public.star VALUES (4, 'Proxima Centauri', 1, 1, 2.44e+29, 0, 4, true);
INSERT INTO public.star VALUES (5, 'Rigel', 5, 1, 2.5e+31, 120000, 860, true);
INSERT INTO public.star VALUES (6, 'Vega', 1, 2, 2.1e+30, 40, 25, true);
INSERT INTO public.star VALUES (7, 'Alpha Centauri A', 1, 1, 2.18e+30, 2, 4, true);
INSERT INTO public.star VALUES (8, 'Altair', 1, 3, 1.79e+30, 11, 17, true);
INSERT INTO public.star VALUES (9, 'Antares', 5, 6, 1.2e+31, 100000, 550, true);
INSERT INTO public.star VALUES (10, 'Polaris', 5, 7, 4.5e+30, 2000, 433, true);
INSERT INTO public.star VALUES (11, 'Arcturus', 2, 2, 2.18e+30, 170, 37, true);
INSERT INTO public.star VALUES (12, 'Barnard''s Star', 1, 8, 1.35e+29, 0, 6, true);


--
-- Data for Name: star_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star_type VALUES (1, 'Main Sequence', 'Stars undergoing hydrogen fusion.');
INSERT INTO public.star_type VALUES (2, 'Red Giant', 'Evolved stars with expanded outer layers.');
INSERT INTO public.star_type VALUES (3, 'White Dwarf', 'Small remnants of low-mass stars.');
INSERT INTO public.star_type VALUES (4, 'Neutron Star', 'Collapsed cores of massive stars.');
INSERT INTO public.star_type VALUES (5, 'Supergiant', 'Large, luminous stars nearing the end of their lives.');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 21, true);


--
-- Name: galaxy_types_galaxy_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_types_galaxy_type_id_seq', 3, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 1, false);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 1, false);


--
-- Name: planet_types_planet_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_types_planet_type_id_seq', 4, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 12, true);


--
-- Name: star_types_star_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_types_star_type_id_seq', 5, true);


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
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet_type planet_types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT planet_types_pkey PRIMARY KEY (planet_type_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star_type star_types_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_type
    ADD CONSTRAINT star_types_name_key UNIQUE (name);


--
-- Name: star_type star_types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_type
    ADD CONSTRAINT star_types_pkey PRIMARY KEY (star_type_id);


--
-- Name: galaxy_type unique_id_per_galaxy_type; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT unique_id_per_galaxy_type UNIQUE (galaxy_type_id, name);


--
-- Name: moon unique_name_and_planet; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_name_and_planet UNIQUE (name, planet_id);


--
-- Name: planet unique_name_planet_type_and_star; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_name_planet_type_and_star UNIQUE (name, planet_type_id, star_id);


--
-- Name: star unique_name_star_type_galaxy; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_name_star_type_galaxy UNIQUE (name, star_type_id, galaxy_id);


--
-- Name: galaxy unique_planet_name_per_galaxy; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_planet_name_per_galaxy UNIQUE (name, galaxy_type_id);


--
-- Name: planet_type unique_planet_type_id_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT unique_planet_type_id_name UNIQUE (planet_type_id, name);


--
-- Name: star_type unique_star_type_id_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_type
    ADD CONSTRAINT unique_star_type_id_name UNIQUE (star_type_id, name);


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
-- Name: star star_star_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_type_id_fkey FOREIGN KEY (star_type_id) REFERENCES public.star_type(star_type_id);


--
-- PostgreSQL database dump complete
--


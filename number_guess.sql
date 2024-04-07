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

DROP DATABASE guess;
--
-- Name: guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE guess OWNER TO freecodecamp;

\connect guess

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
-- Name: guesses; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.guesses (
    username character varying(22),
    games_played integer,
    best_game integer
);


ALTER TABLE public.guesses OWNER TO freecodecamp;

--
-- Data for Name: guesses; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.guesses VALUES ('Elmiko', 2, 8);
INSERT INTO public.guesses VALUES ('user_1712484310606', 2, 9);
INSERT INTO public.guesses VALUES ('user_1712484310607', 5, 33);
INSERT INTO public.guesses VALUES ('user_1712484406690', 2, 67);
INSERT INTO public.guesses VALUES ('user_1712484406691', 5, 3);
INSERT INTO public.guesses VALUES ('user_1712484412022', 2, 85);
INSERT INTO public.guesses VALUES ('user_1712484412023', 5, 5);


--
-- PostgreSQL database dump complete
--


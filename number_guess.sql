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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: game_history; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.game_history (
    username character varying(22) NOT NULL,
    games_played integer NOT NULL,
    best_game integer
);


ALTER TABLE public.game_history OWNER TO freecodecamp;

--
-- Data for Name: game_history; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.game_history VALUES ('user_1741949260727', 1, 436);
INSERT INTO public.game_history VALUES ('user_1741949260726', 1, 1000);
INSERT INTO public.game_history VALUES ('user_1741949290773', 1, 725);
INSERT INTO public.game_history VALUES ('user_1741949290772', 1, 548);
INSERT INTO public.game_history VALUES ('user_1741949334082', 1, 76);
INSERT INTO public.game_history VALUES ('user_1741949334081', 1, 138);
INSERT INTO public.game_history VALUES ('user_1741949381431', 1, 51);
INSERT INTO public.game_history VALUES ('user_1741949381430', 1, 808);
INSERT INTO public.game_history VALUES ('Grisha', 1, 8);
INSERT INTO public.game_history VALUES ('user_1741949428941', 1, 456);
INSERT INTO public.game_history VALUES ('user_1741949428940', 1, 109);
INSERT INTO public.game_history VALUES ('user_1741949464926', 1, 224);
INSERT INTO public.game_history VALUES ('user_1741949464925', 1, 126);
INSERT INTO public.game_history VALUES ('user_1741949508329', 1, 728);
INSERT INTO public.game_history VALUES ('user_1741949508328', 1, 475);
INSERT INTO public.game_history VALUES ('user_1741949583927', 1, 942);
INSERT INTO public.game_history VALUES ('user_1741949583926', 1, 330);


--
-- Name: game_history game_history_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.game_history
    ADD CONSTRAINT game_history_pkey PRIMARY KEY (username);


--
-- Name: game_history game_history_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.game_history
    ADD CONSTRAINT game_history_username_key UNIQUE (username);


--
-- PostgreSQL database dump complete
--


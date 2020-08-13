--
-- PostgreSQL database dump
--

-- Dumped from database version 10.13 (Ubuntu 10.13-1.pgdg18.04+1)
-- Dumped by pg_dump version 10.13 (Ubuntu 10.13-1.pgdg18.04+1)

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

SET default_with_oids = false;

--
-- Name: weather; Type: TABLE; Schema: public; Owner: amarantha
--

CREATE TABLE public.weather (
    date date NOT NULL,
    low numeric(5,2) NOT NULL,
    high numeric(5,2) NOT NULL,
    rainfall numeric(6,3) DEFAULT 0 NOT NULL
);


ALTER TABLE public.weather OWNER TO amarantha;

--
-- Data for Name: weather; Type: TABLE DATA; Schema: public; Owner: amarantha
--

INSERT INTO public.weather VALUES ('2016-03-07', 29.00, 32.00, 0.000);
INSERT INTO public.weather VALUES ('2016-03-08', 23.00, 31.00, 0.000);
INSERT INTO public.weather VALUES ('2016-03-09', 17.00, 28.00, 0.000);
INSERT INTO public.weather VALUES ('2016-03-05', 39.00, 46.00, 0.312);
INSERT INTO public.weather VALUES ('2016-03-01', 34.00, 43.00, 0.156);
INSERT INTO public.weather VALUES ('2016-03-02', 32.00, 44.00, 0.117);
INSERT INTO public.weather VALUES ('2016-03-03', 31.00, 47.00, 0.156);
INSERT INTO public.weather VALUES ('2016-03-04', 33.00, 42.00, 0.117);
INSERT INTO public.weather VALUES ('2016-03-06', 32.00, 43.00, 0.117);


--
-- PostgreSQL database dump complete
--


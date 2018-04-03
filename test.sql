--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: node; Type: TABLE; Schema: public; Owner: symfony; Tablespace: 
--

CREATE TABLE node (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    parent_id integer
);


ALTER TABLE node OWNER TO symfony;

--
-- Name: node_id_seq; Type: SEQUENCE; Schema: public; Owner: symfony
--

CREATE SEQUENCE node_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE node_id_seq OWNER TO symfony;

--
-- Name: point; Type: TABLE; Schema: public; Owner: symfony; Tablespace: 
--

CREATE TABLE point (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    discr character varying(255) NOT NULL,
    parent_id integer
);


ALTER TABLE point OWNER TO symfony;

--
-- Name: point_id_seq; Type: SEQUENCE; Schema: public; Owner: symfony
--

CREATE SEQUENCE point_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE point_id_seq OWNER TO symfony;

--
-- Data for Name: node; Type: TABLE DATA; Schema: public; Owner: symfony
--

COPY node (id, name, parent_id) FROM stdin;
4	lolek	\N
1	jacek	2
2	placek	3
3	bolek	4
\.


--
-- Name: node_id_seq; Type: SEQUENCE SET; Schema: public; Owner: symfony
--

SELECT pg_catalog.setval('node_id_seq', 4, true);


--
-- Data for Name: point; Type: TABLE DATA; Schema: public; Owner: symfony
--

COPY point (id, name, discr, parent_id) FROM stdin;
5	kraków	city	\N
3	wawel	poi	5
2	katedra	poi	3
1	smok	poi	3
4	gołębie	poi	5
6	warszawa	city	\N
7	wrocław	city	\N
8	pręgierz	poi	7
\.


--
-- Name: point_id_seq; Type: SEQUENCE SET; Schema: public; Owner: symfony
--

SELECT pg_catalog.setval('point_id_seq', 8, true);


--
-- Name: node_pkey; Type: CONSTRAINT; Schema: public; Owner: symfony; Tablespace: 
--

ALTER TABLE ONLY node
    ADD CONSTRAINT node_pkey PRIMARY KEY (id);


--
-- Name: point_pkey; Type: CONSTRAINT; Schema: public; Owner: symfony; Tablespace: 
--

ALTER TABLE ONLY point
    ADD CONSTRAINT point_pkey PRIMARY KEY (id);


--
-- Name: idx_857fe845727aca70; Type: INDEX; Schema: public; Owner: symfony; Tablespace: 
--

CREATE INDEX idx_857fe845727aca70 ON node USING btree (parent_id);


--
-- Name: idx_b7a5f324727aca70; Type: INDEX; Schema: public; Owner: symfony; Tablespace: 
--

CREATE INDEX idx_b7a5f324727aca70 ON point USING btree (parent_id);


--
-- Name: fk_857fe845727aca70; Type: FK CONSTRAINT; Schema: public; Owner: symfony
--

ALTER TABLE ONLY node
    ADD CONSTRAINT fk_857fe845727aca70 FOREIGN KEY (parent_id) REFERENCES node(id);


--
-- Name: fk_b7a5f324727aca70; Type: FK CONSTRAINT; Schema: public; Owner: symfony
--

ALTER TABLE ONLY point
    ADD CONSTRAINT fk_b7a5f324727aca70 FOREIGN KEY (parent_id) REFERENCES point(id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--


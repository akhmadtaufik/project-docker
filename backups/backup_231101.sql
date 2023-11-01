--
-- PostgreSQL database cluster dump
--

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Roles
--

CREATE ROLE postgres;
ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:a4hyaqVrjFxp3Qy0zt2apA==$MA8PI5A3tRVlhNypwfxA+JuaK7FT18RvRSxvlsofq8M=:N3dX2kXSvDz5Pcp8Z2Rk3JNHS3/zH5J/KqlxbrVOCZg=';

--
-- User Configurations
--








--
-- Databases
--

--
-- Database "template1" dump
--

\connect template1

--
-- PostgreSQL database dump
--

-- Dumped from database version 15.4 (Debian 15.4-2.pgdg120+1)
-- Dumped by pg_dump version 15.4 (Debian 15.4-2.pgdg120+1)

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

--
-- PostgreSQL database dump complete
--

--
-- Database "postgres" dump
--

\connect postgres

--
-- PostgreSQL database dump
--

-- Dumped from database version 15.4 (Debian 15.4-2.pgdg120+1)
-- Dumped by pg_dump version 15.4 (Debian 15.4-2.pgdg120+1)

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

--
-- PostgreSQL database dump complete
--

--
-- Database "todo-db" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 15.4 (Debian 15.4-2.pgdg120+1)
-- Dumped by pg_dump version 15.4 (Debian 15.4-2.pgdg120+1)

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

--
-- Name: todo-db; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE "todo-db" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE "todo-db" OWNER TO postgres;

\connect -reuse-previous=on "dbname='todo-db'"

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
-- Name: kanban; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kanban (
    kanban_id integer NOT NULL,
    public_id character varying(50),
    title character varying(50),
    content character varying(255),
    is_done boolean DEFAULT false
);


ALTER TABLE public.kanban OWNER TO postgres;

--
-- Name: kanban_kanban_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kanban_kanban_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kanban_kanban_id_seq OWNER TO postgres;

--
-- Name: kanban_kanban_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kanban_kanban_id_seq OWNED BY public.kanban.kanban_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    public_id character varying(50),
    name character varying(100),
    email character varying(75) NOT NULL,
    password character varying(255)
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: kanban kanban_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kanban ALTER COLUMN kanban_id SET DEFAULT nextval('public.kanban_kanban_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: kanban; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kanban (kanban_id, public_id, title, content, is_done) FROM stdin;
2	f5353387-ff1c-4c1b-a092-4c8d5e814af0	Project Docker 	Membuat Image Postgres	t
3	f5353387-ff1c-4c1b-a092-4c8d5e814af0	Project Docker	Membuat image Flask	t
4	f5353387-ff1c-4c1b-a092-4c8d5e814af0	Project Docker	Membuat docker compose	t
5	f5353387-ff1c-4c1b-a092-4c8d5e814af0	Project Docker	Membuat dokumentasi	f
6	f5353387-ff1c-4c1b-a092-4c8d5e814af0	Project Docker	Membuat backup	f
7	bcaf9a61-cab2-4d4f-8af0-b7b9422e5da3	Mobile Legend	Beli skin	f
8	bcaf9a61-cab2-4d4f-8af0-b7b9422e5da3	Valorant	Gold Tier	f
9	af3e1632-fcff-4533-996f-c6dd3b3e99f8	Belajar	Mempelajari materi baru	t
10	af3e1632-fcff-4533-996f-c6dd3b3e99f8	Membaca	Membaca buku tentang sejarah 	f
11	fadacacf-1565-42b5-8963-111b86f53740	Olahraga	Berolahraga di pagi hari 	f
12	fadacacf-1565-42b5-8963-111b86f53740	Menulis	Menulis artikel untuk blog	t
13	7bc82f9e-6acc-4521-b3a9-c825744c9598	Memasak	Mencoba resep baru	t
14	7bc82f9e-6acc-4521-b3a9-c825744c9598	Belanja	Membeli kebutuhan bulanan	f
15	39bb7913-c99b-460e-a9bf-e02d532f9cf8	Bersih-bersih	Membersihkan rumah	f
16	39bb7913-c99b-460e-a9bf-e02d532f9cf8	Menyiram	Menyiram tanaman di halaman	t
17	d0dd73fa-4a6a-4e93-a342-e6423aa9e783	Menggambar	Menggambar sketsa 	t
18	d0dd73fa-4a6a-4e93-a342-e6423aa9e783	Meditasi	Melakukan meditasi di sore hari 	f
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, public_id, name, email, password) FROM stdin;
1	f5353387-ff1c-4c1b-a092-4c8d5e814af0	Akhmad Taufik	akhmad@gmail.com	pbkdf2:sha1:600000$4IMd$6580daeb3ce7d8bd1b7719d878e0e135f96e8200
2	bcaf9a61-cab2-4d4f-8af0-b7b9422e5da3	Ega	ega@rocketmail.com	pbkdf2:sha1:600000$qcDK$c417825813b8e89c7dfba9e7eaee62a67bb00210
3	af3e1632-fcff-4533-996f-c6dd3b3e99f8	Budi Santoso	budi.santoso@mail.com	pbkdf2:sha1:600000$ql8K$7fe7a708baf1a5fde02b5e385c58f36ba1dcf52d
4	fadacacf-1565-42b5-8963-111b86f53740	Siti Rahmawati	siti.rahma@mail.com	pbkdf2:sha1:600000$OIzg$f033e3e748a444088de7bb7986cc32e60db3f74e
5	7bc82f9e-6acc-4521-b3a9-c825744c9598	Agus Pranoto	agus.pranoto@mail.com	pbkdf2:sha1:600000$8nUm$98728ba359ed69c64b560b1dcc587f3940e74fa7
6	39bb7913-c99b-460e-a9bf-e02d532f9cf8	Dewi Lestari 	dewi.lestari@mail.com	pbkdf2:sha1:600000$NtDF$2d03d41105cea8d1229abacb86d7c49ad847f85d
7	d0dd73fa-4a6a-4e93-a342-e6423aa9e783	Eko Wibowo	eko.wibowo@mail.com	pbkdf2:sha1:600000$Wo34$3efc7643a9a686126feebe174d7a961fdb170c6b
\.


--
-- Name: kanban_kanban_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kanban_kanban_id_seq', 8, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 2, true);


--
-- Name: kanban kanban_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kanban
    ADD CONSTRAINT kanban_pkey PRIMARY KEY (kanban_id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database cluster dump complete
--


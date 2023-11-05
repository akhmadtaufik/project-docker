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
ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:sidrwJmwYY75vlCKXIudEw==$Ri6LAGfch/jrZt2Vdc/bvdjmix97QF11VEEtJZSms8I=:tb1Y/iGLhJh9D5IdgV6GYFgWMKLDfeAvCq8lDoihAwg=';

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
    is_done boolean
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
    email character varying(70),
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
1	a034d87d-fcf5-4c76-b3d9-9fea6f8b26c4	Belanja Bahan Makanan	Beli sayuran, daging, dan susu di supermarket.	t
5	5a25cbff-c090-46cf-b264-fab9b801deff	Registrasi Pengguna	Bantu pengguna mendaftar ke aplikasi dan mengatur akun mereka.	t
6	3d3e46b1-3563-493b-b6f1-d3220e14b886	Perbaikan Bug	Identifikasi dan perbaikan bug perangkat lunak untuk meningkatkan stabilitas aplikasi.	t
7	3d3e46b1-3563-493b-b6f1-d3220e14b886	Peluncuran Produk	Peluncuran produk baru dengan presentasi dan demonstrasi langsung.	f
8	41832ea1-7f60-4475-a336-b7aed43e9660	Kampanye Pemasaran	Perencanaan dan pelaksanaan kampanye pemasaran untuk mempromosikan aplikasi.	t
9	41832ea1-7f60-4475-a336-b7aed43e9660	Dukungan Pengguna	Memberikan bantuan kepada pengguna yang memiliki pertanyaan atau menghadapi masalah.	t
2	7fb80c20-6dcf-42e5-aba0-03f7afa687c5	Rapat Tim Proyek	Rapat tim proyek pukul 10 pagi di ruang konferensi.	t
10	7fb80c20-6dcf-42e5-aba0-03f7afa687c5	Tinjauan Kode	Meninjau kode untuk memastikan memenuhi standar kualitas dan keamanan.	t
11	7fb80c20-6dcf-42e5-aba0-03f7afa687c5	Migrasi Data	Transfer data dari sistem lama ke sistem baru secara lancar.	f
12	5378789f-406a-4ad2-ac7f-3c9a06c1ef61	Sprint Desain	Sesi desain kolaboratif untuk brainstorm fitur dan perbaikan baru.	f
13	5378789f-406a-4ad2-ac7f-3c9a06c1ef61	Pemeliharaan Server	Melakukan tugas pemeliharaan server untuk memastikan ketersediaan sistem.	t
14	dfd6dbbd-3fdc-4b79-8b32-102284e76493	Uji Pengguna	Melakukan uji pengguna untuk mengumpulkan umpan balik mengenai pengalaman pengguna aplikasi.	f
15	dfd6dbbd-3fdc-4b79-8b32-102284e76493	Pembuatan Konten	Membuat dan memperbarui konten untuk situs web aplikasi dan materi pemasaran.	t
16	3d3e46b1-3563-493b-b6f1-d3220e14b886	Audit Keamanan Aplikasi	Tinjau keamanan aplikasi untuk mengidentifikasi dan memperbaiki kerentanannya.	t
17	5378789f-406a-4ad2-ac7f-3c9a06c1ef61	Optimasi Kinerja	Identifikasi dan penanganan bottleneck kinerja dalam aplikasi.	f
4	5a25cbff-c090-46cf-b264-fab9b801deff	Rapat dengan Tim	Diskusi mengenai perkembangan proyek dan tugas yang akan datang	t
18	5a25cbff-c090-46cf-b264-fab9b801deff	Pelatihan Pengguna	Memberikan sesi pelatihan bagi anggota tim baru atau pengguna.	f
19	7fb80c20-6dcf-42e5-aba0-03f7afa687c5	Analisis Data	Menganalisis data pengguna untuk mendapatkan wawasan dan pengambilan keputusan berdasarkan data.	f
20	0aa89222-eab1-473e-9e74-b664bf1b6f95	Pengumpulan Umpan Balik	Mengumpulkan umpan balik pengguna melalui survei dan formulir umpan balik.	f
21	dfd6dbbd-3fdc-4b79-8b32-102284e76493	Perencanaan Anggaran	Merencanakan dan mengalokasikan anggaran untuk proyek-proyek yang sedang berjalan dan yang akan datang.	t
22	0aa89222-eab1-473e-9e74-b664bf1b6f95	Pembaruan Aplikasi	Merilis pembaruan berkala dengan fitur baru dan perbaikan bug.	f
23	41832ea1-7f60-4475-a336-b7aed43e9660	Onboarding Pengguna	Memandu pengguna baru melalui fitur dan fungsionalitas aplikasi.	f
3	a034d87d-fcf5-4c76-b3d9-9fea6f8b26c4	Cuci Mobil	Cuci mobil dan beri perawatan pada mesin.	t
24	a034d87d-fcf5-4c76-b3d9-9fea6f8b26c4	Belajar JavaScript	Belajar dasar-dasar JavaScript	f
25	a034d87d-fcf5-4c76-b3d9-9fea6f8b26c4	Membaca buku	Membaca buku “Belajar Pemrograman dalam 7 Hari"	f
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, public_id, name, email, password) FROM stdin;
1	a034d87d-fcf5-4c76-b3d9-9fea6f8b26c4	Velicia	veli@rocketmail.com	pbkdf2:sha1:600000$pK4f$a01ddfa0534b9a8e2bde6163ea8a2a671384c523
2	7fb80c20-6dcf-42e5-aba0-03f7afa687c5	Veronica	vero@yahoo.com	pbkdf2:sha1:600000$wtKr$c4258e0f3bd21b54797e96417195d262943577b1
3	5a25cbff-c090-46cf-b264-fab9b801deff	Wulan	wulan@gmail.com	pbkdf2:sha1:600000$UDkz$d06d379116a87dc106c87d520626dd617ccfc0be
4	3d3e46b1-3563-493b-b6f1-d3220e14b886	Rama	rama@yahoo.com	pbkdf2:sha1:600000$VQ4h$f25a96be2689f6690b8421199d9bbe7ca7858e15
5	41832ea1-7f60-4475-a336-b7aed43e9660	Rina	rina@hotmail.com	pbkdf2:sha1:600000$NRk3$3b1ff05faf7bddc28857c61e937f0a07a23340b0
6	5378789f-406a-4ad2-ac7f-3c9a06c1ef61	Mia	mia@outlook.com	pbkdf2:sha1:600000$zFHb$6dae95f8813f0c53fc9078f4828cc901533cdc07
7	dfd6dbbd-3fdc-4b79-8b32-102284e76493	Lina	lina@hotmail.com	pbkdf2:sha1:600000$E3pf$72f292684e4b389004905a7c2aeb2ffa5d0345b8
8	0aa89222-eab1-473e-9e74-b664bf1b6f95	Dedy	dedy@gmail.com	pbkdf2:sha1:600000$pBCF$94f4a84dd34562b0e40d72348eccbf8aef072d0e
\.


--
-- Name: kanban_kanban_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kanban_kanban_id_seq', 25, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 8, true);


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
-- Name: users users_public_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_public_id_key UNIQUE (public_id);


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database cluster dump complete
--


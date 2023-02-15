--
-- PostgreSQL database dump
--

-- Dumped from database version 12.12 (Ubuntu 12.12-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.12 (Ubuntu 12.12-0ubuntu0.20.04.1)

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
-- Name: tasks; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tasks (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    description character varying(255),
    deleted boolean,
    content text NOT NULL,
    priority character varying NOT NULL,
    start_time timestamp without time zone NOT NULL,
    progress integer DEFAULT 0 NOT NULL,
    status character varying DEFAULT 'TO DO'::character varying NOT NULL,
    user_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: tasks_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tasks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tasks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tasks_id_seq OWNED BY public.tasks.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: tasks id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tasks ALTER COLUMN id SET DEFAULT nextval('public.tasks_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: tasks; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.tasks (id, title, description, deleted, content, priority, start_time, progress, status, user_id, created_at, updated_at) FROM stdin;
17	basdfset	dcaafg	f	najsl	medium	2023-02-21 10:47:00	50	Đang thực hiện	3	2023-02-15 14:14:26.477	2023-02-15 22:31:15.779
3	すごい	サッカーゲーム	\N	何何	high	2022-12-09 10:24:53	0	Đang thực hiện	2	2022-12-09 10:24:53	2022-12-09 10:24:53
18	fasfd	ZSxc	f	bvdsfg	high	2023-02-17 00:00:00	100	Đang thực hiện	3	2023-02-16 00:27:48.489	2023-02-16 00:27:48.489
16	fasdfewtg	asdcs	f	fed	medium	2023-02-15 22:47:00	80	Tạm dừng	3	2023-02-14 16:37:17.853	2023-02-15 22:31:43.339
19	fasdfa	czdg	f	efgadad	medium	2023-02-20 00:00:00	100	Hoàn thành	3	2023-02-16 00:29:34.732	2023-02-16 00:29:34.732
1	サッカーをする	友達と一緒にサッカーをする	\N	友達と一緒にサッカーをする	medium	2023-12-09 10:24:53	0	Bắt đầu	1	2022-12-09 10:24:53	2022-12-09 10:24:53
4	宿題をする	宿題を完了する	\N	数学宿題	medium	2022-12-09 10:24:53	0	Bắt đầu	1	2022-12-09 10:24:53	2022-12-09 10:24:53
5	英語	英語を勉強する	\N	音楽を聴く	medium	2022-12-09 10:24:53	0	Bắt đầu	1	2022-12-09 10:24:53	2022-12-09 10:24:53
6	日本語	日本語を練習する	\N	友達と一緒にサッカーをする	medium	2022-12-09 10:24:53	0	Bắt đầu	1	2022-12-09 10:24:53	2022-12-09 10:24:53
7	チェスをする	友達とチェスをする	\N	友達と一緒にサッカーをする	medium	2022-12-09 10:24:53	20	Bắt đầu	2	2022-12-09 10:24:53	2022-12-09 10:24:53
15	rtfcvf	xdxg	t	hbjhv	low	2023-02-20 17:00:00	20	Bắt đầu	3	2023-02-14 15:57:28.357	2023-02-14 16:36:26.041
8	データベースを作成する	データベースを作成する	\N	友達と一緒にサッカーをする	medium	2022-12-09 10:24:53	0	Bắt đầu	2	2022-12-09 10:24:53	2022-12-09 10:24:53
9	テスト	安易	\N	友達と一緒にサッカーをする	medium	2022-12-09 10:24:53	0	Bắt đầu	1	2022-12-09 10:24:53	2022-12-09 10:24:53
10	ゲームをする	何か	\N	何	medium	2022-12-09 10:24:53	50	Bắt đầu	1	2022-12-09 10:24:53	2022-12-09 10:24:53
2	バドミントンをする	バドミントン	\N	何	low	2022-12-09 10:24:53	80	Bắt đầu	1	2022-12-09 10:24:53	2022-12-09 10:24:53
12	寝る	寝る	\N	友達と一緒にサッカーをする	low	2022-12-09 10:24:53	100	Bắt đầu	1	2022-12-09 10:24:53	2022-12-09 10:24:53
14	hello	hellofdeffd	f	hellosfsf	low	2023-02-15 22:31:00	50	Bắt đầu	3	2023-02-13 17:10:37.771	2023-02-15 22:30:42.731
11	食べる	リンゴを食べる	\N	友達と一緒にサッカーをする	high	2022-12-09 10:24:53	0	Bắt đầu	1	2022-12-09 10:24:53	2022-12-09 10:24:53
20	vbbvb	hgiygxtdecfcfhgvgv	f	bhbh	medium	2023-02-23 00:00:00	100	進行中	3	2023-02-16 00:48:08.009	2023-02-16 00:48:08.009
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.users (id, name, email, password, created_at, updated_at) FROM stdin;
1	Nguyen Minh Quy	quy@gmail.com	$2a$10$/DRCCsC19RF7NgGr9dqvCeEmzlhjUtq/JpFhgdowHRcjum2M54GBW	2022-12-09 10:24:53	2022-12-09 10:24:53
2	Le Bao Hieu	hieu@gmail.com	$2a$10$c8Jh2OJR2XuPUu1GHndjA.3rZrJ1AwMzkV/1Qy9sPpF4H09EIzYyK	2022-12-09 10:24:53	2022-12-09 10:24:53
3	bac	nguyendangbac77@gmail.com	$2b$10$pnD88/axBJbm85mmgtDtnOSJzTRbuih5sMPj2h4ayKLAWXCjJmrZi	2023-02-13 17:09:50.496	2023-02-13 17:09:50.496
\.


--
-- Name: tasks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.tasks_id_seq', 20, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 3, true);


--
-- Name: tasks tasks_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tasks
    ADD CONSTRAINT tasks_pkey PRIMARY KEY (id);


--
-- Name: tasks tasks_title_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tasks
    ADD CONSTRAINT tasks_title_key UNIQUE (title);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: tasks tasks_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tasks
    ADD CONSTRAINT tasks_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--


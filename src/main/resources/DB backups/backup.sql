--
-- PostgreSQL database dump
--


--

INSERT INTO public.post_status VALUES (1, 'NEW', '2020-02-04 20:01:21.066875+02', '2020-02-04 20:01:21.066875+02');
INSERT INTO public.post_status VALUES (2, 'APPROVED', '2020-02-04 20:01:21.066875+02', '2020-02-04 20:01:21.066875+02');
INSERT INTO public.post_status VALUES (3, 'DECLINED', '2020-02-04 20:01:21.066875+02', '2020-02-04 20:01:21.066875+02');


--
-- TOC entry 3212 (class 0 OID 24877)
-- Dependencies: 209
-- Data for Name: post_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.post_type VALUES (1, 'TYPE1', '2020-02-04 19:56:26.891766+02', '2020-02-04 19:59:15.206721+02');
INSERT INTO public.post_type VALUES (2, 'TYPE2', '2020-02-04 19:56:26.891766+02', '2020-02-04 19:59:15.206721+02');
INSERT INTO public.post_type VALUES (3, 'TYPE3', '2020-02-04 19:56:26.891766+02', '2020-02-04 19:59:15.206721+02');


--
-- TOC entry 3208 (class 0 OID 24854)
-- Dependencies: 205
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.role VALUES (2, 'MANAGER', '2020-02-04 19:19:04.01177+02', '2020-02-04 19:19:04.01177+02');
INSERT INTO public.role VALUES (3, 'USER', '2020-02-04 19:19:04.01177+02', '2020-02-04 19:19:04.01177+02');
INSERT INTO public.role VALUES (1, 'ADMIN', '2020-02-04 19:18:45.157334+02', '2020-02-04 19:22:44.514715+02');


--
-- TOC entry 3206 (class 0 OID 24840)
-- Dependencies: 203
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.users VALUES (1, 'user1', 'user1@mail.com', '12345678', false, 3, '2020-02-04 19:35:45.942488+02', '2020-02-04 19:35:45.942488+02');
INSERT INTO public.users VALUES (2, 'user2', 'user2@mail.com', '12345678', false, 3, '2020-02-04 19:35:45.942488+02', '2020-02-04 19:35:45.942488+02');
INSERT INTO public.users VALUES (3, 'user3', 'user3@mail.com', '12345678', false, 3, '2020-02-04 19:35:45.942488+02', '2020-02-04 19:35:45.942488+02');
INSERT INTO public.users VALUES (4, 'user4', 'user4@mail.com', '12345678', false, 3, '2020-02-04 19:35:45.942488+02', '2020-02-04 19:35:45.942488+02');
INSERT INTO public.users VALUES (5, 'user5', 'user5@mail.com', '12345678', false, 3, '2020-02-04 19:35:45.942488+02', '2020-02-04 19:35:45.942488+02');
INSERT INTO public.users VALUES (6, 'user6', 'user6@mail.com', '12345678', false, 3, '2020-02-04 19:35:45.942488+02', '2020-02-04 19:35:45.942488+02');
INSERT INTO public.users VALUES (7, 'user7', 'user7@mail.com', '12345678', false, 3, '2020-02-04 19:35:45.942488+02', '2020-02-04 19:35:45.942488+02');
INSERT INTO public.users VALUES (8, 'user8', 'user8@mail.com', '12345678', false, 3, '2020-02-04 19:35:45.942488+02', '2020-02-04 19:35:45.942488+02');
INSERT INTO public.users VALUES (9, 'user9', 'user9@mail.com', '12345678', false, 3, '2020-02-04 19:35:45.942488+02', '2020-02-04 19:35:45.942488+02');
INSERT INTO public.users VALUES (10, 'user10@mail.com', 'user10@mail.com', '12345678', false, 3, '2020-02-04 19:35:45.942488+02', '2020-02-04 19:35:45.942488+02');
INSERT INTO public.users VALUES (11, 'manager1', 'manager1@mail.com', '12345678', false, 2, '2020-02-04 19:35:45.942488+02', '2020-02-04 19:35:45.942488+02');
INSERT INTO public.users VALUES (12, 'manager2', 'manager2@mail.com', '12345678', false, 2, '2020-02-04 19:35:45.942488+02', '2020-02-04 19:35:45.942488+02');
INSERT INTO public.users VALUES (13, 'manager3', 'manager3@mail.com', '12345678', false, 2, '2020-02-04 19:35:45.942488+02', '2020-02-04 19:35:45.942488+02');
INSERT INTO public.users VALUES (14, 'manager4', 'manager4@mail.com', '12345678', false, 2, '2020-02-04 19:35:45.942488+02', '2020-02-04 19:35:45.942488+02');
INSERT INTO public.users VALUES (15, 'manager5', 'manager5@mail.com', '12345678', false, 2, '2020-02-04 19:35:45.942488+02', '2020-02-04 19:35:45.942488+02');
INSERT INTO public.users VALUES (16, 'admin1', 'admin1@mail.com', '12345678', false, 1, '2020-02-04 19:35:45.942488+02', '2020-02-04 19:35:45.942488+02');
INSERT INTO public.users VALUES (17, 'admin2', 'admin2@mail.com', '12345678', false, 1, '2020-02-04 19:35:45.942488+02', '2020-02-04 19:35:45.942488+02');
INSERT INTO public.users VALUES (18, 'admin3', 'admin3@mail.com', '12345678', false, 1, '2020-02-04 19:35:45.942488+02', '2020-02-04 19:35:45.942488+02');

--
--
-- TOC entry 3210 (class 0 OID 24864)
-- Dependencies: 207
-- Data for Name: post; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.post VALUES (1, 'First post', 'Description to the first post', 1, 1, 1, '2020-02-04 20:07:06.355298+02', '2020-02-04 20:07:06.355298+02');
INSERT INTO public.post VALUES (2, 'Second post by the 1st user', 'Some desc', 2, 1, 1, '2020-02-04 20:07:06.355298+02', '2020-02-04 20:07:06.355298+02');
INSERT INTO public.post VALUES (3, '3rd by 1st user', 'Desc', 3, 1, 1, '2020-02-04 20:07:06.355298+02', '2020-02-04 20:07:06.355298+02');
INSERT INTO public.post VALUES (4, '1st by 2nd user', 'Desc', 1, 2, 1, '2020-02-04 20:07:06.355298+02', '2020-02-04 20:07:06.355298+02');
INSERT INTO public.post VALUES (5, 'Approved by 2nd user', 'Desc', 2, 2, 2, '2020-02-04 20:07:06.355298+02', '2020-02-04 20:07:06.355298+02');


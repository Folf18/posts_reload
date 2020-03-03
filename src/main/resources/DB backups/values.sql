--
-- PostgreSQL database dump
--

-- Dumped from database version 11.4
-- Dumped by pg_dump version 11.4

-- Started on 2020-03-03 09:25:37 EET

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
-- TOC entry 3226 (class 0 OID 90330)
-- Dependencies: 209
-- Data for Name: account_activation; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.account_activation VALUES (1, 35, 'ae7c7131d7b64ec79e68ea3a8ab470d5', true, '2020-02-16 13:21:25.376472+02', '2020-02-16 13:21:25.376472+02');
INSERT INTO public.account_activation VALUES (2, 36, '6c851bb8d3fd45f79ae2539b5d00d51e', true, '2020-02-16 13:31:45.537052+02', '2020-02-16 13:31:45.537052+02');
INSERT INTO public.account_activation VALUES (3, 37, '1e57b28b98d94dd28d8b4672d3e90bd0', true, '2020-02-16 13:35:33.353168+02', '2020-02-16 13:35:33.353168+02');
INSERT INTO public.account_activation VALUES (4, 38, 'c3a4c960fde94e26890ed242c540c8a4', true, '2020-02-16 13:39:46.099467+02', '2020-02-16 13:39:46.099467+02');
INSERT INTO public.account_activation VALUES (5, 39, '1856c4c2ca1a4d38adcb23198ad41f03', true, '2020-02-16 19:49:12.310576+02', '2020-02-16 19:49:12.310576+02');
INSERT INTO public.account_activation VALUES (7, 41, '80b474e28be443ff84fb94f331b44692', false, '2020-02-18 14:43:01.299182+02', '2020-02-18 14:43:01.299182+02');
INSERT INTO public.account_activation VALUES (8, 42, 'bd13a0f51dd8436faaeedd4670796cca', false, '2020-02-18 14:46:12.480142+02', '2020-02-18 14:46:12.480142+02');
INSERT INTO public.account_activation VALUES (9, 43, 'cba76616504f4b99b40d906d5953bebe', false, '2020-02-18 14:47:03.362416+02', '2020-02-18 14:47:03.362416+02');
INSERT INTO public.account_activation VALUES (10, 44, '26146e4205cd4c3cac3e4839a395f0ee', false, '2020-02-18 14:51:18.956822+02', '2020-02-18 14:51:18.956822+02');
INSERT INTO public.account_activation VALUES (11, 45, '32a992447d6f45789537c5d286274b1e', false, '2020-02-18 14:52:15.660374+02', '2020-02-18 14:52:15.660374+02');
INSERT INTO public.account_activation VALUES (12, 46, 'e832736f4839476ba1a7ad852f3605a5', false, '2020-02-18 14:53:25.436158+02', '2020-02-18 14:53:25.436158+02');
INSERT INTO public.account_activation VALUES (13, 47, '490f2f5dc2f94f259d46c9236b4c6da8', false, '2020-02-18 14:55:46.952305+02', '2020-02-18 14:55:46.952305+02');
INSERT INTO public.account_activation VALUES (14, 48, '3d12ea6a95124270b6975c9068c92d4b', false, '2020-02-18 15:15:04.745316+02', '2020-02-18 15:15:04.745316+02');
INSERT INTO public.account_activation VALUES (15, 49, 'fc00741e94cf4418ba7f47647770656e', true, '2020-02-18 15:17:03.116342+02', '2020-02-18 15:17:03.116342+02');
INSERT INTO public.account_activation VALUES (16, 50, 'e70e6efb244d4ca5a8787e696ca50c45', true, '2020-02-18 15:36:06.028016+02', '2020-02-18 15:36:06.028016+02');
INSERT INTO public.account_activation VALUES (17, 51, '40ee93cff26f43b7b4ced6c9d0c63b41', false, '2020-02-19 18:11:02.177101+02', '2020-02-19 18:11:02.177101+02');
INSERT INTO public.account_activation VALUES (18, 52, '60867db32abf4fc7991e92aef0e5ade5', true, '2020-02-19 18:12:45.803145+02', '2020-02-19 18:12:45.803145+02');
INSERT INTO public.account_activation VALUES (19, 53, 'a21a19d78eb547c6b36cad3661c808b4', false, '2020-02-24 19:18:57.64485+02', '2020-02-24 19:18:57.64485+02');
INSERT INTO public.account_activation VALUES (20, 55, '6519c28b931745d4828a62ab84fbb91f', false, '2020-02-24 19:26:25.455858+02', '2020-02-24 19:26:25.455858+02');
INSERT INTO public.account_activation VALUES (21, 56, 'c23cc346a26845279c3fca39ff6e5709', false, '2020-02-27 18:03:51.83639+02', '2020-02-27 18:03:51.83639+02');
INSERT INTO public.account_activation VALUES (22, 57, '9294cc9bf87a4cd7870e6372eeb25c2f', true, '2020-02-29 16:41:21.197478+02', '2020-02-29 16:41:21.197478+02');
INSERT INTO public.account_activation VALUES (23, 58, '3e4989247ca943118e0beff0765670f2', true, '2020-02-29 17:27:46.54914+02', '2020-02-29 17:27:46.54914+02');
INSERT INTO public.account_activation VALUES (24, 59, '52332ea8f2eb421fa7d54be5faaee9f3', false, '2020-02-29 20:58:12.300556+02', '2020-02-29 20:58:12.300556+02');
INSERT INTO public.account_activation VALUES (25, 60, 'bb2543cad9de481dbdd52121498d5ba4', true, '2020-03-01 13:25:03.963815+02', '2020-03-01 13:25:03.963815+02');
INSERT INTO public.account_activation VALUES (26, 61, '621630cf5fbb41768d030292ead88d35', false, '2020-03-02 18:30:03.794984+02', '2020-03-02 18:30:03.794984+02');
INSERT INTO public.account_activation VALUES (27, 62, 'bdbac2c05f4f48e8abe23107827309ee', false, '2020-03-02 18:40:46.980485+02', '2020-03-02 18:40:46.980485+02');
INSERT INTO public.account_activation VALUES (28, 63, '56393a797abf4afa910e1d2e1fa45bae', false, '2020-03-02 18:43:14.438771+02', '2020-03-02 18:43:14.438771+02');
INSERT INTO public.account_activation VALUES (29, 64, 'b7f0f74ec9724833aeda181578ac8a6d', false, '2020-03-02 18:49:09.588026+02', '2020-03-02 18:49:09.588026+02');
INSERT INTO public.account_activation VALUES (30, 65, 'dff4e18eff6a4840b352d89543a41229', false, '2020-03-02 18:50:45.504168+02', '2020-03-02 18:50:45.504168+02');
INSERT INTO public.account_activation VALUES (31, 66, '53dcbfe8277340e18b350297bc29a88e', false, '2020-03-02 19:24:06.033515+02', '2020-03-02 19:24:06.033515+02');
INSERT INTO public.account_activation VALUES (32, 67, 'a77999f0c5bd4cafbb201af5f7b23b42', true, '2020-03-02 19:26:26.777951+02', '2020-03-02 19:26:26.777951+02');
INSERT INTO public.account_activation VALUES (33, 68, '37ce652594bf47fc80d11c6370f4bb2a', true, '2020-03-02 19:30:17.516121+02', '2020-03-02 19:30:17.516121+02');


--
-- TOC entry 3218 (class 0 OID 90237)
-- Dependencies: 201
-- Data for Name: post; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.post VALUES (3, '3rd by 1st user', 'Desc', 3, 1, 2, '2020-02-04 20:07:06.355298+02', '2020-02-15 12:08:16.922851+02');
INSERT INTO public.post VALUES (5, 'Approved by 2nd user', 'Desc', 2, 2, 2, '2020-02-04 20:07:06.355298+02', '2020-02-28 22:01:29.016256+02');
INSERT INTO public.post VALUES (23, 'Kate', 'Desc', 3, 3, 2, '2020-02-15 14:39:45.538368+02', '2020-02-15 14:40:29.504263+02');
INSERT INTO public.post VALUES (6, 'Freehand. "Copy link" option doesn''t work when using Edge or Firefox', 'Desc', 1, 4, 2, '2020-02-11 19:27:07.034682+02', '2020-02-11 19:27:07.034682+02');
INSERT INTO public.post VALUES (7, '(Flat) The share button is different from the standard when User views a Screen', 'Desc', 2, 5, 2, '2020-02-11 19:29:06.694875+02', '2020-02-11 19:29:06.694875+02');
INSERT INTO public.post VALUES (8, 'Freehand. "Copy link" option doesn''t work when using Edge or Firefox', 'Desc', 3, 6, 2, '2020-02-11 19:30:30.391054+02', '2020-02-11 19:30:30.391054+02');
INSERT INTO public.post VALUES (9, 'User can createÂ Freehand in SpaceÂ using only spaces as a name.', 'Desc', 2, 4, 2, '2020-02-11 19:59:20.412402+02', '2020-02-11 19:59:20.412402+02');
INSERT INTO public.post VALUES (10, 'Is it works?', 'Yezzzz', 3, 7, 2, '2020-02-11 20:49:36.669662+02', '2020-02-11 20:49:36.669662+02');
INSERT INTO public.post VALUES (11, 'Works?', 'Desc', 3, 4, 2, '2020-02-11 20:53:46.462519+02', '2020-02-11 20:53:46.462519+02');
INSERT INTO public.post VALUES (12, 'still work', 'right?', 2, 9, 2, '2020-02-11 21:25:28.868777+02', '2020-02-11 21:25:28.868777+02');
INSERT INTO public.post VALUES (19, 'Freehand. "Copy link" option doesn''t work when using Edge or Firefox', 'A card is a flexible and extensible content container. It includes options for headers and footers, a wide variety of content, contextual background colors, and powerful display options. If youâre familiar with Bootstrap 3, cards replace our old panels, wells, and thumbnails. Similar functionality to those components is available as modifier classes for cards.', 3, 2, 2, '2020-02-12 22:46:42.271785+02', '2020-02-12 22:46:42.271785+02');
INSERT INTO public.post VALUES (25, 'Refactored', 'Refactored', 3, 2, 2, '2020-02-16 21:59:40.426598+02', '2020-02-16 22:00:25.496302+02');
INSERT INTO public.post VALUES (13, 'Safari. Team', 'Desc dddd', 1, 5, 2, '2020-02-11 21:45:07.456717+02', '2020-02-11 21:45:07.456717+02');
INSERT INTO public.post VALUES (17, 'Can''t close Share settings when using Firefox ', 'Lorem ipsum', 3, 3, 2, '2020-02-12 21:53:40.581008+02', '2020-02-12 21:53:40.581008+02');
INSERT INTO public.post VALUES (14, 'Safari. Team', 'Desc', 2, 5, 2, '2020-02-11 22:48:17.614441+02', '2020-02-13 15:10:36.791754+02');
INSERT INTO public.post VALUES (18, 'Guests list display always display Users avatars as text avatars ', 'Lorem ipsum', 2, 6, 2, '2020-02-12 22:04:17.331228+02', '2020-02-13 15:11:23.844641+02');
INSERT INTO public.post VALUES (38, '1234567890123456789', '12345678901234', 1, 4, 3, '2020-02-26 10:45:43.809118+02', '2020-02-28 22:01:38.797392+02');
INSERT INTO public.post VALUES (42, 'Safari. Team', 'Only Users not User groups should be displayed
- Those who have already joined/viewed the document
- Members+guests who have been invited but have not yet joined/viewed the document', 2, 1, 2, '2020-02-29 13:23:50.648774+02', '2020-03-02 19:57:05.369143+02');
INSERT INTO public.post VALUES (15, 'Freehand. "Copy link" option doesn''t work when using Edge or Firefox', 'Yezzzz', 3, 4, 2, '2020-02-11 22:57:21.415789+02', '2020-02-13 15:50:21.214682+02');
INSERT INTO public.post VALUES (16, 'Freehand. "Copy link" option doesn''t work when using Edge or Firefox', 'Desc', 3, 6, 3, '2020-02-11 22:57:39.227247+02', '2020-02-13 15:50:39.605346+02');
INSERT INTO public.post VALUES (47, ' A simple primary alertâcheck it out!', ' A simple primary alertâcheck it out!', 3, 60, 2, '2020-03-01 13:26:35.648089+02', '2020-03-02 21:36:34.474909+02');
INSERT INTO public.post VALUES (20, 'New', 'right?', 2, 3, 2, '2020-02-13 15:58:11.850722+02', '2020-02-13 21:26:32.256115+02');
INSERT INTO public.post VALUES (21, 'Buttons', 'buttons', 1, 3, 2, '2020-02-13 21:28:44.802767+02', '2020-02-15 12:08:07.54671+02');
INSERT INTO public.post VALUES (2, 'Second post by the 1st user', 'Some desc', 2, 1, 2, '2020-02-04 20:07:06.355298+02', '2020-02-15 12:08:12.84796+02');
INSERT INTO public.post VALUES (28, 'Buttons', 'right?', 3, 3, 1, '2020-02-19 18:22:38.526563+02', '2020-02-19 18:22:38.526563+02');
INSERT INTO public.post VALUES (30, 'ads', 'ads', 2, 1, 1, '2020-02-19 18:39:55.17965+02', '2020-02-19 18:39:55.17965+02');
INSERT INTO public.post VALUES (31, 'Buttons', 'right?', 3, 1, 1, '2020-02-19 18:45:56.269051+02', '2020-02-19 18:45:56.269051+02');
INSERT INTO public.post VALUES (32, 'Safari. Team', 'Yezzzz', 2, 1, 1, '2020-02-20 18:24:16.950277+02', '2020-02-20 18:24:16.950277+02');
INSERT INTO public.post VALUES (22, 'Safari. Team', 'Desc', 3, 2, 3, '2020-02-15 12:08:35.995646+02', '2020-02-24 17:52:16.734018+02');
INSERT INTO public.post VALUES (33, 'Reloading', 'Reloading', 2, 1, 1, '2020-02-24 18:45:14.22871+02', '2020-02-24 18:45:14.22871+02');
INSERT INTO public.post VALUES (34, 'Reloading', 'right?', 3, 1, 1, '2020-02-24 19:18:01.730183+02', '2020-02-24 19:18:01.730183+02');
INSERT INTO public.post VALUES (24, 'Retest permission issues', 'A card is a flexible and extensible content container. It includes options for headers and footers, a wide variety of content, contextual background colors, and powerful display options. If youâre familiar with Bootstrap 3, cards replace our old panels, wells, and thumbnails. Similar functionality to those components is available as modifier classes for cards.', 2, 5, 2, '2020-02-16 21:49:16.618356+02', '2020-02-24 19:36:40.263812+02');
INSERT INTO public.post VALUES (26, 'New', 'right?', 1, 1, 3, '2020-02-19 18:18:11.91697+02', '2020-02-24 19:36:48.397204+02');
INSERT INTO public.post VALUES (27, 'NewDFGHJasdasddsa', 'asdasdasdasd', 3, 1, 2, '2020-02-19 18:19:49.282289+02', '2020-02-24 22:37:07.728984+02');
INSERT INTO public.post VALUES (1, 'First post', 'Description to the first post', 1, 1, 2, '2020-02-04 20:07:06.355298+02', '2020-03-02 19:57:24.44272+02');
INSERT INTO public.post VALUES (36, '123', '123', 1, 1, 1, '2020-02-25 21:08:01.957618+02', '2020-02-25 21:08:01.957618+02');
INSERT INTO public.post VALUES (37, 'New', 'ads', 1, 1, 1, '2020-02-25 21:09:19.246547+02', '2020-02-25 21:09:19.246547+02');
INSERT INTO public.post VALUES (41, '1234567890123456789012', '1234567890123456789012', 2, 6, 2, '2020-02-26 18:45:16.352656+02', '2020-02-28 21:57:27.379037+02');
INSERT INTO public.post VALUES (39, 'NewDFGHJasdasddsa', '1234567890123456789012', 2, 3, 2, '2020-02-26 17:08:37.68924+02', '2020-02-28 22:00:36.228954+02');
INSERT INTO public.post VALUES (40, 'Description should have at least 15 characters', 'Description should have at least 15 characters', 2, 7, 2, '2020-02-26 17:25:10.200495+02', '2020-02-28 22:00:52.93913+02');
INSERT INTO public.post VALUES (4, '1st by 2nd user', 'A card is a flexible and extensible content container. It includes options for headers and footers, a wide variety of content, contextual background colors, and powerful display options. If youâre familiar with Bootstrap 3, cards replace our old panels, wells, and thumbnails. Similar functionality to those components is available as modifier classes for cards.', 1, 2, 2, '2020-02-04 20:07:06.355298+02', '2020-02-28 22:01:08.274996+02');
INSERT INTO public.post VALUES (29, 'ads', 'ads', 3, 3, 2, '2020-02-19 18:38:58.454931+02', '2020-03-02 20:47:59.673658+02');
INSERT INTO public.post VALUES (46, 'Character.isWhitespace() method', 'The java.lang.Character.isWhitespace() is an inbuilt method in a java that determines if the specified character (Unicode code point) is white space according to Java. A character is a Java whitespace character if and only if it satisfies one of the following criteria:', 1, 2, 2, '2020-02-29 18:33:13.365798+02', '2020-03-01 14:01:31.394272+02');


--
-- TOC entry 3222 (class 0 OID 90271)
-- Dependencies: 205
-- Data for Name: post_status; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.post_status VALUES (1, 'NEW', '2020-02-04 20:01:21.066875+02', '2020-02-04 20:01:21.066875+02');
INSERT INTO public.post_status VALUES (2, 'APPROVED', '2020-02-04 20:01:21.066875+02', '2020-02-04 20:01:21.066875+02');
INSERT INTO public.post_status VALUES (3, 'DECLINED', '2020-02-04 20:01:21.066875+02', '2020-02-04 20:01:21.066875+02');


--
-- TOC entry 3220 (class 0 OID 90251)
-- Dependencies: 203
-- Data for Name: post_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.post_type VALUES (1, 'Sale', '2020-02-04 19:56:26.891766+02', '2020-02-04 19:59:15.206721+02');
INSERT INTO public.post_type VALUES (2, 'Buy', '2020-02-04 19:56:26.891766+02', '2020-02-04 19:59:15.206721+02');
INSERT INTO public.post_type VALUES (3, 'Trade', '2020-02-04 19:56:26.891766+02', '2020-02-04 19:59:15.206721+02');


--
-- TOC entry 3216 (class 0 OID 90227)
-- Dependencies: 199
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.role VALUES (2, 'MANAGER', '2020-02-04 19:19:04.01177+02', '2020-02-04 19:19:04.01177+02');
INSERT INTO public.role VALUES (3, 'USER', '2020-02-04 19:19:04.01177+02', '2020-02-04 19:19:04.01177+02');
INSERT INTO public.role VALUES (1, 'ADMIN', '2020-02-04 19:18:45.157334+02', '2020-02-04 19:22:44.514715+02');
INSERT INTO public.role VALUES (4, 'OWNER', '2020-02-09 13:51:04.688619+02', '2020-02-09 13:51:04.688619+02');


--
-- TOC entry 3224 (class 0 OID 90313)
-- Dependencies: 207
-- Data for Name: user_activation; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.user_activation VALUES (1, 32, '4e46c5c43f4e4e90b86cae70ba0d57cf', false);
INSERT INTO public.user_activation VALUES (2, 33, '50ddef653c564400abdfb97f1e2e21b8', false);
INSERT INTO public.user_activation VALUES (3, 34, '8b8b863ad7eb49c88d1636521e6a1155', false);


--
-- TOC entry 3214 (class 0 OID 90212)
-- Dependencies: 197
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.users VALUES (62, 'xobera1400', 'xobera1400@oppamail.com', 'MTIzNDU2Nzg=', false, 3, '2020-03-02 18:40:46.975964+02', '2020-03-02 18:40:46.975964+02', false);
INSERT INTO public.users VALUES (10, 'user10@mail.com', 'user10@mail.com', 'MTIzNDU2Nzg=', false, 3, '2020-02-04 19:35:45.942488+02', '2020-02-25 10:40:38.720826+02', true);
INSERT INTO public.users VALUES (56, 'admin', 'Ð°Ð°Ð°@asda.dd', 'YWRtaW4=', false, 3, '2020-02-27 18:03:51.824879+02', '2020-02-27 18:03:51.824879+02', false);
INSERT INTO public.users VALUES (64, 'mopoi2773', 'mopofi2773@mailimail.com', 'MTIzNDU2Nzg=', false, 3, '2020-03-02 18:49:09.58137+02', '2020-03-02 18:49:09.58137+02', false);
INSERT INTO public.users VALUES (66, 'movad70616', 'movad70616@nuevomail.com', 'MTIzNDU2Nzg=', false, 3, '2020-03-02 19:24:06.024322+02', '2020-03-02 19:24:06.024322+02', false);
INSERT INTO public.users VALUES (68, 'meceda569', 'meceda5695@edusamail.net', 'MTIzNDU2Nzg=', false, 3, '2020-03-02 19:30:17.507492+02', '2020-03-02 19:30:30.980526+02', true);
INSERT INTO public.users VALUES (17, 'admin2', 'admin2@mail.com', 'MTIzNDU2Nzg=', false, 1, '2020-02-04 19:35:45.942488+02', '2020-03-02 20:58:13.094064+02', true);
INSERT INTO public.users VALUES (53, 'sdfsdfsdf@sds.sad', 'sdfsdfsdf@sds.sad', 'MTIzNDU2Nzg=', false, 3, '2020-02-24 19:18:57.635743+02', '2020-02-24 19:27:14.599147+02', false);
INSERT INTO public.users VALUES (5, 'user5', 'user5@mail.com', 'MTIzNDU2Nzg=', false, 3, '2020-02-04 19:35:45.942488+02', '2020-02-24 19:27:14.599147+02', true);
INSERT INTO public.users VALUES (6, 'user6', 'user6@mail.com', 'MTIzNDU2Nzg=', false, 3, '2020-02-04 19:35:45.942488+02', '2020-02-24 19:27:14.599147+02', true);
INSERT INTO public.users VALUES (8, 'user8', 'user8@mail.com', 'MTIzNDU2Nzg=', false, 3, '2020-02-04 19:35:45.942488+02', '2020-02-24 19:27:14.599147+02', true);
INSERT INTO public.users VALUES (16, 'admin1', 'admin1@mail.com', 'MTIzNDU2Nzg=', false, 1, '2020-02-04 19:35:45.942488+02', '2020-03-02 21:55:56.855684+02', true);
INSERT INTO public.users VALUES (9, 'user9', 'user9@mail.com', 'MTIzNDU2Nzg=', false, 3, '2020-02-04 19:35:45.942488+02', '2020-02-24 19:27:14.599147+02', true);
INSERT INTO public.users VALUES (12, 'manager2', 'manager2@mail.com', 'MTIzNDU2Nzg=', false, 2, '2020-02-04 19:35:45.942488+02', '2020-02-24 19:27:14.599147+02', true);
INSERT INTO public.users VALUES (13, 'manager3', 'manager3@mail.com', 'MTIzNDU2Nzg=', false, 2, '2020-02-04 19:35:45.942488+02', '2020-02-24 19:27:14.599147+02', true);
INSERT INTO public.users VALUES (14, 'manager4', 'manager4@mail.com', 'MTIzNDU2Nzg=', false, 2, '2020-02-04 19:35:45.942488+02', '2020-02-24 19:27:14.599147+02', true);
INSERT INTO public.users VALUES (55, 'newUser', 'newUser@mail.com', 'MTIzNDU2Nzg=', false, 3, '2020-02-24 19:26:25.450196+02', '2020-02-24 19:27:14.599147+02', false);
INSERT INTO public.users VALUES (57, 'jicod16894', 'jicod16894@finxmail.com', 'amljb2QxNjg5NA==', false, 3, '2020-02-29 16:41:21.187937+02', '2020-02-29 16:55:26.810578+02', true);
INSERT INTO public.users VALUES (15, 'manager5', 'manager5@mail.com', 'MTIzNDU2Nzg=', false, 2, '2020-02-04 19:35:45.942488+02', '2020-03-02 22:16:52.21162+02', true);
INSERT INTO public.users VALUES (36, 'kesahop241@qmailers.com', 'kesahop241@qmailers.com', 'MTIzNDU2Nzg=', false, 3, '2020-02-16 13:31:45.520453+02', '2020-02-29 20:05:29.825855+02', true);
INSERT INTO public.users VALUES (7, 'user7', 'user7@mail.com', 'MTIzNDU2Nzg=', false, 3, '2020-02-04 19:35:45.942488+02', '2020-02-29 20:12:06.699977+02', true);
INSERT INTO public.users VALUES (37, 'babiwa1449@nwesmail.com', 'babiwa1449@nwesmail.com', 'MTIzNDU2Nzg=', false, 3, '2020-02-16 13:35:33.346794+02', '2020-02-29 20:12:41.824376+02', true);
INSERT INTO public.users VALUES (18, 'admin3', 'admin3@mail.com', 'MTIzNDU2Nzg=', false, 1, '2020-02-04 19:35:45.942488+02', '2020-02-24 19:27:14.599147+02', true);
INSERT INTO public.users VALUES (19, 'U', 'primaryownerv7qa@invisionapp.com', 'MTIzNDU2Nzg=', false, 1, '2020-02-11 17:29:41.700491+02', '2020-02-24 19:27:14.599147+02', true);
INSERT INTO public.users VALUES (29, 'user223', 'rigor70947@xrpmail.com', 'MTIzNDU2Nzg=', false, 3, '2020-02-15 14:37:31.916215+02', '2020-02-24 19:27:14.599147+02', false);
INSERT INTO public.users VALUES (21, '111', 'Fedir_@i.ua', 'MTIzNDU2Nzg=', false, 3, '2020-02-12 18:45:03.01381+02', '2020-02-29 20:18:52.526734+02', false);
INSERT INTO public.users VALUES (59, 'ddddd             dddddd', 'cvbnj@asd.asdas', 'MTIzNDU2Nzg=', false, 3, '2020-02-29 20:58:12.29298+02', '2020-02-29 20:58:12.29298+02', false);
INSERT INTO public.users VALUES (30, 'user226', 'bibedop768@eigoemail.com', 'MTIzNDU2Nzg=', false, 3, '2020-02-15 14:38:33.419428+02', '2020-02-24 19:27:14.599147+02', false);
INSERT INTO public.users VALUES (41, 'gatapi2868@link3mail.com', 'gatapi2868@link3mail.com', 'MTIzNDU2Nzg=', false, 3, '2020-02-18 14:43:01.278547+02', '2020-03-01 12:11:31.18264+02', false);
INSERT INTO public.users VALUES (31, 'notactive', 'tirapof250@jmail7.com', 'MTIzNDU2Nzg=', false, 3, '2020-02-16 10:29:34.142489+02', '2020-02-24 19:27:14.599147+02', false);
INSERT INTO public.users VALUES (61, 'qweq', 'sesila3531@finxmail.com', 'ZHNhc2RhMTIzNDU2Nzg=', false, 3, '2020-03-02 18:30:03.787618+02', '2020-03-02 18:30:03.787618+02', false);
INSERT INTO public.users VALUES (32, 'yofon7862', 'yofon78628@era7mail.com', 'MTIzNDU2Nzg=', false, 3, '2020-02-16 11:34:15.03022+02', '2020-02-24 19:27:14.599147+02', false);
INSERT INTO public.users VALUES (33, 'vabam49243', 'vabam49243@mailboxt.net', 'MTIzNDU2Nzg=', false, 3, '2020-02-16 11:37:41.676936+02', '2020-02-24 19:27:14.599147+02', false);
INSERT INTO public.users VALUES (34, 'kitaha4668', 'kitaha4668@nwesmail.com', 'MTIzNDU2Nzg=', false, 3, '2020-02-16 11:39:09.892572+02', '2020-02-24 19:27:14.599147+02', false);
INSERT INTO public.users VALUES (35, 'lexik77397', 'lexik77397@nwesmail.com', 'MTIzNDU2Nzg=', false, 3, '2020-02-16 13:21:25.36077+02', '2020-02-24 19:27:14.599147+02', true);
INSERT INTO public.users VALUES (38, 'meloxoh753@qmailers.com', 'meloxoh753@qmailers.com', 'MTIzNDU2Nzg=', false, 3, '2020-02-16 13:39:46.083588+02', '2020-02-24 19:27:14.599147+02', true);
INSERT INTO public.users VALUES (39, 'necej20097@xmailsme.com', 'necej20097@xmailsme.com', 'MTIzNDU2Nzg=', false, 3, '2020-02-16 19:49:12.283407+02', '2020-02-24 19:27:14.599147+02', true);
INSERT INTO public.users VALUES (42, 'sojes55925@maillei.com', 'sojes55925@maillei.com', 'MTIzNDU2Nzg=', false, 3, '2020-02-18 14:46:12.466484+02', '2020-02-24 19:27:14.599147+02', false);
INSERT INTO public.users VALUES (63, 'nikepi4523', 'nikepi4523@jalcemail.net', 'MTIzNDU2Nzg=', false, 3, '2020-03-02 18:43:14.435087+02', '2020-03-02 18:43:14.435087+02', false);
INSERT INTO public.users VALUES (65, 'sovej66460', 'sovej66460@p5mail.com', 'MTIzNDU2Nzg=', false, 3, '2020-03-02 18:50:45.500084+02', '2020-03-02 18:50:45.500084+02', false);
INSERT INTO public.users VALUES (67, 'vayip51150', 'vayip51150@x3mailer.com', 'MTIzNDU2Nzg=', false, 3, '2020-03-02 19:26:26.773476+02', '2020-03-02 19:26:39.293656+02', true);
INSERT INTO public.users VALUES (3, 'user3', 'user3@mail.com', 'MTIzNDU2Nzg=', false, 3, '2020-02-04 19:35:45.942488+02', '2020-03-02 20:55:43.23403+02', true);
INSERT INTO public.users VALUES (44, 'sefawi5537@maillei.com', 'sefawi5537@maillei.com', 'MTIzNDU2Nzg=', false, 3, '2020-02-18 14:51:18.950621+02', '2020-02-24 19:27:14.599147+02', false);
INSERT INTO public.users VALUES (45, 'hicagoc131@xhyemail.com', 'hicagoc131@xhyemail.com', 'MTIzNDU2Nzg=', false, 3, '2020-02-18 14:52:15.647805+02', '2020-02-24 19:27:14.599147+02', false);
INSERT INTO public.users VALUES (46, 'wajane3889@link3mail.com', 'wajane3889@link3mail.com', 'MTIzNDU2Nzg=', false, 3, '2020-02-18 14:53:25.424399+02', '2020-02-24 19:27:14.599147+02', false);
INSERT INTO public.users VALUES (47, 'mewexod623@link3mail.com', 'mewexod623@link3mail.com', 'MTIzNDU2Nzg=', false, 3, '2020-02-18 14:55:46.940444+02', '2020-02-24 19:27:14.599147+02', false);
INSERT INTO public.users VALUES (48, 'jenel70512@maillei.com', 'jenel70512@maillei.com', 'MTIzNDU2Nzg=', false, 3, '2020-02-18 15:15:04.736797+02', '2020-02-24 19:27:14.599147+02', false);
INSERT INTO public.users VALUES (49, 'neged54345@cmailing.com', 'neged54345@cmailing.com', 'MTIzNDU2Nzg=', false, 3, '2020-02-18 15:17:03.109587+02', '2020-02-24 19:27:14.599147+02', true);
INSERT INTO public.users VALUES (50, 'picedol466@webbamail.com', 'picedol466@webbamail.com', 'MTIzNDU2Nzg=', false, 3, '2020-02-18 15:36:06.005087+02', '2020-02-24 19:27:14.599147+02', true);
INSERT INTO public.users VALUES (23, 'user228', 'rigor710947@xrpmail.com', 'MTIzNDU2Nzg=', false, 3, '2020-02-15 13:44:50.707149+02', '2020-02-24 19:27:14.599147+02', false);
INSERT INTO public.users VALUES (2, 'user2', 'user2@mail.com', 'MTIzNDU2Nzg=', false, 3, '2020-02-04 19:35:45.942488+02', '2020-03-02 22:18:24.822964+02', true);
INSERT INTO public.users VALUES (25, 'user230', 'rigor730947@xrpmail.com', 'MTIzNDU2Nzg=', false, 3, '2020-02-15 13:54:26.160253+02', '2020-02-24 19:27:14.599147+02', false);
INSERT INTO public.users VALUES (26, 'user231', 'rigor740947@xrpmail.com', 'MTIzNDU2Nzg=', false, 3, '2020-02-15 14:25:30.167793+02', '2020-02-24 19:27:14.599147+02', false);
INSERT INTO public.users VALUES (1, 'user1', 'user1@mail.com', 'MTIzNDU2Nzg=', false, 3, '2020-02-04 19:35:45.942488+02', '2020-03-02 22:18:25.813342+02', true);
INSERT INTO public.users VALUES (28, 'user233', 'rigor760947@xrpmail.com', 'MTIzNDU2Nzg=', false, 3, '2020-02-15 14:36:17.796331+02', '2020-02-24 19:27:14.599147+02', false);
INSERT INTO public.users VALUES (51, 'fojah61739@xhyemail.com', 'fojah61739@xhyemail.com', 'MTIzNDU2Nzg=', false, 3, '2020-02-19 18:11:02.161741+02', '2020-02-24 19:27:14.599147+02', false);
INSERT INTO public.users VALUES (52, 'kebet74924@cmailing.com', 'kebet74924@cmailing.com', 'MTIzNDU2Nzg=', false, 3, '2020-02-19 18:12:45.793884+02', '2020-02-24 19:27:14.599147+02', true);
INSERT INTO public.users VALUES (22, 'user227', 'rigor700947@xrpmail.com', 'MTIzNDU2Nzg=', false, 3, '2020-02-15 13:43:30.088197+02', '2020-03-02 22:18:29.334812+02', false);
INSERT INTO public.users VALUES (27, 'user232', 'rigor750947@xrpmail.com', 'MTIzNDU2Nzg=', false, 3, '2020-02-15 14:30:40.064392+02', '2020-03-02 22:18:32.482208+02', false);
INSERT INTO public.users VALUES (4, 'user4', 'user4@mail.com', 'MTIzNDU2Nzg=', false, 3, '2020-02-04 19:35:45.942488+02', '2020-02-24 19:27:14.599147+02', true);
INSERT INTO public.users VALUES (11, 'manager1', 'manager1@mail.com', 'MTIzNDU2Nzg=', false, 2, '2020-02-04 19:35:45.942488+02', '2020-02-24 19:27:14.599147+02', true);
INSERT INTO public.users VALUES (58, 'domet48780', 'domet48780@jalcemail.net', 'ZG9tZXQ0ODc4MA==', false, 3, '2020-02-29 17:27:46.521221+02', '2020-02-29 17:29:31.937068+02', true);
INSERT INTO public.users VALUES (24, 'user229', 'rigor720947@xrpmail.com', 'MTIzNDU2Nzg=', false, 3, '2020-02-15 13:52:22.755213+02', '2020-02-29 20:21:41.335357+02', false);
INSERT INTO public.users VALUES (60, 'testUser1', 'tanaw22877@mytrumail.com', 'MTIzNDU2Nzg=', false, 3, '2020-03-01 13:25:03.957064+02', '2020-03-01 13:25:21.101097+02', true);
INSERT INTO public.users VALUES (43, 'new_user2', 'rigor780947@xrpmail.com', 'MTIzNDU2Nzg=', false, 3, '2020-02-18 14:47:03.349552+02', '2020-03-02 21:28:44.434629+02', false);


--
-- TOC entry 3239 (class 0 OID 0)
-- Dependencies: 208
-- Name: account_activation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.account_activation_id_seq', 33, true);


--
-- TOC entry 3240 (class 0 OID 0)
-- Dependencies: 200
-- Name: post_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.post_id_seq', 47, true);


--
-- TOC entry 3241 (class 0 OID 0)
-- Dependencies: 204
-- Name: post_status_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.post_status_id_seq', 3, true);


--
-- TOC entry 3242 (class 0 OID 0)
-- Dependencies: 202
-- Name: post_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.post_type_id_seq', 1, false);


--
-- TOC entry 3243 (class 0 OID 0)
-- Dependencies: 198
-- Name: role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.role_id_seq', 4, true);


--
-- TOC entry 3244 (class 0 OID 0)
-- Dependencies: 206
-- Name: user_activation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_activation_id_seq', 3, true);


--
-- TOC entry 3245 (class 0 OID 0)
-- Dependencies: 196
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 68, true);


-- Completed on 2020-03-03 09:25:37 EET

--
-- PostgreSQL database dump complete
--


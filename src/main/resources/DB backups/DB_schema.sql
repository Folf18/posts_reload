--
-- PostgreSQL database dump
--

-- Dumped from database version 11.4
-- Dumped by pg_dump version 11.4

-- Started on 2020-03-03 09:01:12 EET

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
-- TOC entry 3218 (class 1262 OID 90209)
-- Name: posts_demo; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE posts_demo WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C' LC_CTYPE = 'C';


ALTER DATABASE posts_demo OWNER TO postgres;

\connect posts_demo

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
-- TOC entry 210 (class 1255 OID 90304)
-- Name: trigger_set_timestamp(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.trigger_set_timestamp() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  NEW.updated_at = NOW();
  RETURN NEW;
END;
$$;


ALTER FUNCTION public.trigger_set_timestamp() OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 209 (class 1259 OID 90330)
-- Name: account_activation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.account_activation (
    id integer NOT NULL,
    user_id integer,
    token character varying(80) NOT NULL,
    is_activated boolean DEFAULT false NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.account_activation OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 90328)
-- Name: account_activation_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.account_activation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.account_activation_id_seq OWNER TO postgres;

--
-- TOC entry 3219 (class 0 OID 0)
-- Dependencies: 208
-- Name: account_activation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.account_activation_id_seq OWNED BY public.account_activation.id;


--
-- TOC entry 201 (class 1259 OID 90237)
-- Name: post; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.post (
    id integer NOT NULL,
    summary character varying(255) NOT NULL,
    description character varying,
    post_type_id integer NOT NULL,
    user_id integer NOT NULL,
    post_status_id integer NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.post OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 90235)
-- Name: post_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.post_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.post_id_seq OWNER TO postgres;

--
-- TOC entry 3220 (class 0 OID 0)
-- Dependencies: 200
-- Name: post_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.post_id_seq OWNED BY public.post.id;


--
-- TOC entry 205 (class 1259 OID 90271)
-- Name: post_status; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.post_status (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.post_status OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 90269)
-- Name: post_status_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.post_status_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.post_status_id_seq OWNER TO postgres;

--
-- TOC entry 3221 (class 0 OID 0)
-- Dependencies: 204
-- Name: post_status_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.post_status_id_seq OWNED BY public.post_status.id;


--
-- TOC entry 203 (class 1259 OID 90251)
-- Name: post_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.post_type (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.post_type OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 90249)
-- Name: post_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.post_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.post_type_id_seq OWNER TO postgres;

--
-- TOC entry 3222 (class 0 OID 0)
-- Dependencies: 202
-- Name: post_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.post_type_id_seq OWNED BY public.post_type.id;


--
-- TOC entry 199 (class 1259 OID 90227)
-- Name: role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.role (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.role OWNER TO postgres;

--
-- TOC entry 198 (class 1259 OID 90225)
-- Name: role_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.role_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.role_id_seq OWNER TO postgres;

--
-- TOC entry 3223 (class 0 OID 0)
-- Dependencies: 198
-- Name: role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.role_id_seq OWNED BY public.role.id;


--
-- TOC entry 207 (class 1259 OID 90313)
-- Name: user_activation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_activation (
    id integer NOT NULL,
    user_id integer NOT NULL,
    token character varying(80) NOT NULL,
    is_activated boolean DEFAULT false NOT NULL
);


ALTER TABLE public.user_activation OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 90311)
-- Name: user_activation_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_activation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_activation_id_seq OWNER TO postgres;

--
-- TOC entry 3224 (class 0 OID 0)
-- Dependencies: 206
-- Name: user_activation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_activation_id_seq OWNED BY public.user_activation.id;


--
-- TOC entry 197 (class 1259 OID 90212)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    username character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    is_blocked boolean DEFAULT false NOT NULL,
    role_id integer DEFAULT 1 NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    is_active boolean
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 196 (class 1259 OID 90210)
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
-- TOC entry 3225 (class 0 OID 0)
-- Dependencies: 196
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 3060 (class 2604 OID 90333)
-- Name: account_activation id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_activation ALTER COLUMN id SET DEFAULT nextval('public.account_activation_id_seq'::regclass);


--
-- TOC entry 3049 (class 2604 OID 90240)
-- Name: post id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post ALTER COLUMN id SET DEFAULT nextval('public.post_id_seq'::regclass);


--
-- TOC entry 3055 (class 2604 OID 90274)
-- Name: post_status id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post_status ALTER COLUMN id SET DEFAULT nextval('public.post_status_id_seq'::regclass);


--
-- TOC entry 3052 (class 2604 OID 90254)
-- Name: post_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post_type ALTER COLUMN id SET DEFAULT nextval('public.post_type_id_seq'::regclass);


--
-- TOC entry 3046 (class 2604 OID 90230)
-- Name: role id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role ALTER COLUMN id SET DEFAULT nextval('public.role_id_seq'::regclass);


--
-- TOC entry 3058 (class 2604 OID 90316)
-- Name: user_activation id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_activation ALTER COLUMN id SET DEFAULT nextval('public.user_activation_id_seq'::regclass);


--
-- TOC entry 3041 (class 2604 OID 90215)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 3081 (class 2606 OID 90338)
-- Name: account_activation account_activation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_activation
    ADD CONSTRAINT account_activation_pkey PRIMARY KEY (id);


--
-- TOC entry 3073 (class 2606 OID 90248)
-- Name: post post_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post
    ADD CONSTRAINT post_pkey PRIMARY KEY (id);


--
-- TOC entry 3077 (class 2606 OID 90278)
-- Name: post_status post_status_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post_status
    ADD CONSTRAINT post_status_pkey PRIMARY KEY (id);


--
-- TOC entry 3075 (class 2606 OID 90258)
-- Name: post_type post_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post_type
    ADD CONSTRAINT post_type_pkey PRIMARY KEY (id);


--
-- TOC entry 3071 (class 2606 OID 90234)
-- Name: role role_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 3065 (class 2606 OID 90351)
-- Name: users unique_email; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT unique_email UNIQUE (email);


--
-- TOC entry 3067 (class 2606 OID 90347)
-- Name: users unique_username; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT unique_username UNIQUE (username);


--
-- TOC entry 3079 (class 2606 OID 90319)
-- Name: user_activation user_activation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_activation
    ADD CONSTRAINT user_activation_pkey PRIMARY KEY (id);


--
-- TOC entry 3069 (class 2606 OID 90224)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 3089 (class 2620 OID 90306)
-- Name: post set_timestamp; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER set_timestamp BEFORE UPDATE ON public.post FOR EACH ROW EXECUTE PROCEDURE public.trigger_set_timestamp();


--
-- TOC entry 3091 (class 2620 OID 90307)
-- Name: post_status set_timestamp; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER set_timestamp BEFORE UPDATE ON public.post_status FOR EACH ROW EXECUTE PROCEDURE public.trigger_set_timestamp();


--
-- TOC entry 3090 (class 2620 OID 90308)
-- Name: post_type set_timestamp; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER set_timestamp BEFORE UPDATE ON public.post_type FOR EACH ROW EXECUTE PROCEDURE public.trigger_set_timestamp();


--
-- TOC entry 3088 (class 2620 OID 90309)
-- Name: role set_timestamp; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER set_timestamp BEFORE UPDATE ON public.role FOR EACH ROW EXECUTE PROCEDURE public.trigger_set_timestamp();


--
-- TOC entry 3087 (class 2620 OID 90310)
-- Name: users set_timestamp; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER set_timestamp BEFORE UPDATE ON public.users FOR EACH ROW EXECUTE PROCEDURE public.trigger_set_timestamp();


--
-- TOC entry 3086 (class 2606 OID 90339)
-- Name: account_activation account_activation_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_activation
    ADD CONSTRAINT account_activation_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 3085 (class 2606 OID 90299)
-- Name: post post_post_status_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post
    ADD CONSTRAINT post_post_status_id_fkey FOREIGN KEY (post_status_id) REFERENCES public.post_status(id);


--
-- TOC entry 3083 (class 2606 OID 90284)
-- Name: post post_post_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post
    ADD CONSTRAINT post_post_type_id_fkey FOREIGN KEY (post_type_id) REFERENCES public.post_type(id);


--
-- TOC entry 3084 (class 2606 OID 90289)
-- Name: post post_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post
    ADD CONSTRAINT post_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 3082 (class 2606 OID 90279)
-- Name: users users_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_role_id_fkey FOREIGN KEY (role_id) REFERENCES public.role(id);


-- Completed on 2020-03-03 09:01:13 EET

--
-- PostgreSQL database dump complete
--


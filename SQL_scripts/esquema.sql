-- Creando tabla Tickets

CREATE TABLE IF NOT EXISTS public.tickets
(
    film_code bigint,
    cinema_code bigint,
    total_sales double precision,
    tickets_sold bigint,
    tickets_out bigint,
    show_time bigint,
    occu_perc double precision,
    ticket_price double precision,
    ticket_use bigint,
    capacity double precision,
    date text COLLATE pg_catalog."default",
    month bigint,
    quarter bigint,
    day bigint,
    id_customer bigint,
    id_cinema bigint,
    id_film bigint,
    people_entered double precision,
    people_not_enteredd double precision,
    not_occu_perc double precision,
    CONSTRAINT cinema_ticket_fkey FOREIGN KEY (id_cinema)
        REFERENCES public.cinemas (id_cinema) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE
        NOT VALID,
    CONSTRAINT customer_ticket_fkey FOREIGN KEY (id_customer)
        REFERENCES public.customers (id_customer) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE
        NOT VALID,
    CONSTRAINT film_ticket_fkey FOREIGN KEY (id_film)
        REFERENCES public.films (id_film) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.tickets
    OWNER to postgres;

-- Creando tabla films
CREATE TABLE IF NOT EXISTS public.films
(
    id_film integer NOT NULL DEFAULT nextval('films_id_film_seq'::regclass),
    title character varying COLLATE pg_catalog."default",
    genre character varying COLLATE pg_catalog."default",
    duration_min integer,
    CONSTRAINT film_pkey PRIMARY KEY (id_film)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.films
    OWNER to postgres;

-- Creando tabla customers

CREATE TABLE IF NOT EXISTS public.customers
(
    id_customer integer NOT NULL DEFAULT nextval('customers_id_customer_seq'::regclass),
    name character varying COLLATE pg_catalog."default",
    last_name character varying COLLATE pg_catalog."default",
    phone character varying COLLATE pg_catalog."default",
    email text COLLATE pg_catalog."default",
    CONSTRAINT customer_pkey PRIMARY KEY (id_customer)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.customers
    OWNER to postgres;

-- Creando tabla cinemas

CREATE TABLE IF NOT EXISTS public.cinemas
(
    id_cinema integer NOT NULL DEFAULT nextval('cinemas_id_cinema_seq'::regclass),
    name character varying COLLATE pg_catalog."default",
    location character varying COLLATE pg_catalog."default",
    CONSTRAINT cinema_pkey PRIMARY KEY (id_cinema)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.cinemas
    OWNER to postgres;
























	















	
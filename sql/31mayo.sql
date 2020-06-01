--
-- PostgreSQL database dump
--

-- Dumped from database version 12.2
-- Dumped by pg_dump version 12.2

-- Started on 2020-05-31 22:12:37

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
-- TOC entry 289 (class 1255 OID 36784)
-- Name: actualizar_status(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.actualizar_status(id2 integer) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
saldo2 int;
estado2 varchar;
BEGIN
saldo2 := (SELECT saldo FROM gasto_comun WHERE id = id2);
estado2 := (SELECT estado FROM gasto_comun WHERE id = id2);

IF saldo2 = 0 THEN
IF estado2 = 'Pendiente' THEN
UPDATE gasto_comun SET estado = 'Pagado' WHERE id = id2;
ELSIF estado2 = 'Procesado' THEN
UPDATE gasto_comun SET estado = 'Procesado y pagado' WHERE id = id2;
END IF;
END IF;
END;
$$;


ALTER FUNCTION public.actualizar_status(id2 integer) OWNER TO postgres;

--
-- TOC entry 290 (class 1255 OID 36785)
-- Name: actualizar_status_cuotas(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.actualizar_status_cuotas(id2 integer) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
	saldo2 int;
BEGIN
saldo2 := (SELECT saldo FROM cuotas_especiales WHERE id = id2);

IF saldo2 = 0 THEN
	UPDATE cuotas_especiales SET pagado = 'Pagado' WHERE id = id2;
END IF;
END;
$$;


ALTER FUNCTION public.actualizar_status_cuotas(id2 integer) OWNER TO postgres;

--
-- TOC entry 291 (class 1255 OID 36786)
-- Name: login(character varying, character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.login(usu character varying, pass character varying) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
	DECLARE
	
	usu1 character varying;
	pass1 character varying;
	
	BEGIN
		
		usu1 := (SELECT usuario FROM usuario where usuario=usu AND password=pass);
		pass1 := (SELECT password FROM usuario where usuario=usu AND password=pass);

		IF usu = usu1 AND pass = pass1 THEN 
			RETURN TRUE;
		ELSE
			RETURN FALSE;
		END IF;
		END;
		$$;


ALTER FUNCTION public.login(usu character varying, pass character varying) OWNER TO postgres;

--
-- TOC entry 292 (class 1255 OID 36787)
-- Name: registrar_unidad(character varying, character varying, double precision, character varying[], character varying[], integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.registrar_unidad(numero2 character varying, direccion2 character varying, area2 double precision, cedula2 character varying[], documento2 character varying[], id_condominio integer) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
DECLARE
	cedula_bd character varying(10);
	id_unidad_bd int;
BEGIN
	INSERT INTO unidades(n_unidad, direccion, area, id_condominio) VALUES (numero2, direccion2, area2, documento2);
	
	FOR i IN 1 .. array_length(cedula2, 1) LOOP
		cedula_bd := (SELECT cedula FROM propietario WHERE cedula = cedula2[i]);
		id_unidad_bd := (SELECT max(id) FROM unidad);
		INSERT INTO puente_unidad_propietarios(ci_propietario, id_unidad, documento) VALUES (cedula_bd, id_unidad_bd, documento2);
	END LOOP;
END;
$$;


ALTER FUNCTION public.registrar_unidad(numero2 character varying, direccion2 character varying, area2 double precision, cedula2 character varying[], documento2 character varying[], id_condominio integer) OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 202 (class 1259 OID 36788)
-- Name: asambleas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.asambleas (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL,
    fecha date NOT NULL,
    descripcion character varying(500) NOT NULL,
    id_condominio character varying(15) NOT NULL
);


ALTER TABLE public.asambleas OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 36794)
-- Name: asambleas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.asambleas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asambleas_id_seq OWNER TO postgres;

--
-- TOC entry 3350 (class 0 OID 0)
-- Dependencies: 203
-- Name: asambleas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.asambleas_id_seq OWNED BY public.asambleas.id;


--
-- TOC entry 204 (class 1259 OID 36796)
-- Name: banco; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.banco (
    id integer NOT NULL,
    nombre_banco character varying(100) NOT NULL,
    activo boolean
);


ALTER TABLE public.banco OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 36799)
-- Name: banco_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.banco_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.banco_id_seq OWNER TO postgres;

--
-- TOC entry 3351 (class 0 OID 0)
-- Dependencies: 205
-- Name: banco_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.banco_id_seq OWNED BY public.banco.id;


--
-- TOC entry 206 (class 1259 OID 36801)
-- Name: categoriagasto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categoriagasto (
    id integer NOT NULL,
    nombre character varying(120) NOT NULL,
    descripcion character varying(120) NOT NULL,
    activo boolean
);


ALTER TABLE public.categoriagasto OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 36804)
-- Name: categoriagasto_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.categoriagasto_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categoriagasto_id_seq OWNER TO postgres;

--
-- TOC entry 3352 (class 0 OID 0)
-- Dependencies: 207
-- Name: categoriagasto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.categoriagasto_id_seq OWNED BY public.categoriagasto.id;


--
-- TOC entry 208 (class 1259 OID 36806)
-- Name: cierre_de_mes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cierre_de_mes (
    id integer NOT NULL,
    mes bigint NOT NULL,
    anio bigint NOT NULL,
    id_condominio character varying(15)
);


ALTER TABLE public.cierre_de_mes OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 36809)
-- Name: cierre_de_mes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cierre_de_mes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cierre_de_mes_id_seq OWNER TO postgres;

--
-- TOC entry 3353 (class 0 OID 0)
-- Dependencies: 209
-- Name: cierre_de_mes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cierre_de_mes_id_seq OWNED BY public.cierre_de_mes.id;


--
-- TOC entry 210 (class 1259 OID 36811)
-- Name: cobro_unidad; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cobro_unidad (
    id integer NOT NULL,
    monto double precision NOT NULL,
    descripcion character varying(500) NOT NULL,
    id_cuenta character varying(20) NOT NULL,
    forma_pago character varying(150) NOT NULL,
    referencia character varying(50) NOT NULL,
    fecha date NOT NULL,
    id_fondo bigint NOT NULL,
    id_unidad bigint
);


ALTER TABLE public.cobro_unidad OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 36817)
-- Name: cobro_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cobro_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cobro_id_seq OWNER TO postgres;

--
-- TOC entry 3354 (class 0 OID 0)
-- Dependencies: 211
-- Name: cobro_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cobro_id_seq OWNED BY public.cobro_unidad.id;


--
-- TOC entry 212 (class 1259 OID 36819)
-- Name: comunicados; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.comunicados (
    id integer NOT NULL,
    asunto character varying(300) NOT NULL,
    mensaje character varying(3000) NOT NULL,
    id_condominio character varying(15) NOT NULL
);


ALTER TABLE public.comunicados OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 36825)
-- Name: comunicados_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.comunicados_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comunicados_id_seq OWNER TO postgres;

--
-- TOC entry 3355 (class 0 OID 0)
-- Dependencies: 213
-- Name: comunicados_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.comunicados_id_seq OWNED BY public.comunicados.id;


--
-- TOC entry 214 (class 1259 OID 36827)
-- Name: concepto_gasto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.concepto_gasto (
    id integer NOT NULL,
    nom_concepto character varying(120) NOT NULL,
    descripcion character varying(120) NOT NULL,
    id_categoria integer NOT NULL,
    activo boolean
);


ALTER TABLE public.concepto_gasto OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 36830)
-- Name: concepto_gasto_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.concepto_gasto_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.concepto_gasto_id_seq OWNER TO postgres;

--
-- TOC entry 3356 (class 0 OID 0)
-- Dependencies: 215
-- Name: concepto_gasto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.concepto_gasto_id_seq OWNED BY public.concepto_gasto.id;


--
-- TOC entry 216 (class 1259 OID 36832)
-- Name: condominio; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.condominio (
    rif character varying(15) NOT NULL,
    razon_social character varying(150) NOT NULL,
    telefono character varying(11) NOT NULL,
    correo_electronico character varying(70) NOT NULL,
    activo boolean DEFAULT true NOT NULL
);


ALTER TABLE public.condominio OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 36836)
-- Name: cuenta; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cuenta (
    n_cuenta character varying(20) NOT NULL,
    tipo character varying(10) NOT NULL,
    id_banco bigint NOT NULL,
    ci_persona character varying(10) NOT NULL,
    rif_condominio character varying(15) NOT NULL,
    activo boolean DEFAULT true
);


ALTER TABLE public.cuenta OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 36840)
-- Name: cuenta_pagar; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cuenta_pagar (
    id integer NOT NULL,
    num_ref character varying(10) NOT NULL,
    forma_pago character varying(25) NOT NULL,
    descripcion character varying(60) NOT NULL,
    monto double precision NOT NULL,
    fecha date NOT NULL,
    id_proveedor character varying(10) NOT NULL,
    id_cuenta character varying(20) NOT NULL,
    id_fondo integer NOT NULL
);


ALTER TABLE public.cuenta_pagar OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 36843)
-- Name: cuenta_pagar_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cuenta_pagar_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cuenta_pagar_id_seq OWNER TO postgres;

--
-- TOC entry 3357 (class 0 OID 0)
-- Dependencies: 219
-- Name: cuenta_pagar_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cuenta_pagar_id_seq OWNED BY public.cuenta_pagar.id;


--
-- TOC entry 220 (class 1259 OID 36845)
-- Name: facturas_proveedores; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.facturas_proveedores (
    id integer NOT NULL,
    id_proveedor character varying(15) NOT NULL,
    calcular character varying(200) NOT NULL,
    mes bigint NOT NULL,
    anio bigint NOT NULL,
    monto double precision NOT NULL,
    saldo double precision NOT NULL,
    n_meses bigint NOT NULL,
    id_asamblea bigint,
    observacion character varying(500),
    estado character varying(100) NOT NULL,
    id_condominio character varying(15),
    n_mese_restante bigint,
    pagado character varying(15),
    tipo character varying(20)
);


ALTER TABLE public.facturas_proveedores OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 36851)
-- Name: cuotas_especiales_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cuotas_especiales_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cuotas_especiales_id_seq OWNER TO postgres;

--
-- TOC entry 3358 (class 0 OID 0)
-- Dependencies: 221
-- Name: cuotas_especiales_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cuotas_especiales_id_seq OWNED BY public.facturas_proveedores.id;


--
-- TOC entry 222 (class 1259 OID 36853)
-- Name: detalle_pagos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.detalle_pagos (
    id integer NOT NULL,
    mes bigint NOT NULL,
    anio bigint NOT NULL,
    monto double precision NOT NULL,
    id_gasto bigint,
    id_factura bigint,
    tipo_gasto character varying
);


ALTER TABLE public.detalle_pagos OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 36859)
-- Name: detalle_pagos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.detalle_pagos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.detalle_pagos_id_seq OWNER TO postgres;

--
-- TOC entry 3359 (class 0 OID 0)
-- Dependencies: 223
-- Name: detalle_pagos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.detalle_pagos_id_seq OWNED BY public.detalle_pagos.id;


--
-- TOC entry 224 (class 1259 OID 36861)
-- Name: factura_unidad; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.factura_unidad (
    id integer NOT NULL,
    monto double precision NOT NULL,
    mes bigint NOT NULL,
    anio bigint NOT NULL,
    alicuota double precision NOT NULL,
    estado character varying(50) NOT NULL,
    saldo_restante double precision NOT NULL,
    id_unidad bigint
);


ALTER TABLE public.factura_unidad OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 36864)
-- Name: detalle_total_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.detalle_total_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.detalle_total_id_seq OWNER TO postgres;

--
-- TOC entry 3360 (class 0 OID 0)
-- Dependencies: 225
-- Name: detalle_total_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.detalle_total_id_seq OWNED BY public.factura_unidad.id;


--
-- TOC entry 226 (class 1259 OID 36866)
-- Name: fondos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fondos (
    tipo character varying(100) NOT NULL,
    fecha date NOT NULL,
    descripcion character varying(200) NOT NULL,
    observaciones character varying(200),
    monto_inicial double precision NOT NULL,
    saldo double precision NOT NULL,
    id_condominio character varying(15) NOT NULL,
    id integer NOT NULL,
    activo bigint
);


ALTER TABLE public.fondos OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 36872)
-- Name: fondos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.fondos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fondos_id_seq OWNER TO postgres;

--
-- TOC entry 3361 (class 0 OID 0)
-- Dependencies: 227
-- Name: fondos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.fondos_id_seq OWNED BY public.fondos.id;


--
-- TOC entry 228 (class 1259 OID 36874)
-- Name: forma_pago; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.forma_pago (
    id integer NOT NULL,
    forma_pago character varying NOT NULL,
    activo boolean
);


ALTER TABLE public.forma_pago OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 36880)
-- Name: forma_pago_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.forma_pago_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.forma_pago_id_seq OWNER TO postgres;

--
-- TOC entry 3362 (class 0 OID 0)
-- Dependencies: 229
-- Name: forma_pago_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.forma_pago_id_seq OWNED BY public.forma_pago.id;


--
-- TOC entry 230 (class 1259 OID 36882)
-- Name: funcion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.funcion (
    id integer NOT NULL,
    funcion character varying NOT NULL
);


ALTER TABLE public.funcion OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 36888)
-- Name: funcion_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.funcion_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.funcion_id_seq OWNER TO postgres;

--
-- TOC entry 3363 (class 0 OID 0)
-- Dependencies: 231
-- Name: funcion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.funcion_id_seq OWNED BY public.funcion.id;


--
-- TOC entry 232 (class 1259 OID 36890)
-- Name: gasto_comun; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.gasto_comun (
    id integer NOT NULL,
    tipo character varying(50) NOT NULL,
    mes bigint NOT NULL,
    anio bigint NOT NULL,
    monto double precision NOT NULL,
    n_factura character varying(50) NOT NULL,
    id_proveedor character varying(15) NOT NULL,
    id_concepto bigint NOT NULL,
    observaciones character varying(200),
    fecha date NOT NULL,
    estado character varying(20) NOT NULL,
    id_condominio character varying(15),
    saldo double precision
);


ALTER TABLE public.gasto_comun OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 36893)
-- Name: gasto_comun_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.gasto_comun_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.gasto_comun_id_seq OWNER TO postgres;

--
-- TOC entry 3364 (class 0 OID 0)
-- Dependencies: 233
-- Name: gasto_comun_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.gasto_comun_id_seq OWNED BY public.gasto_comun.id;


--
-- TOC entry 234 (class 1259 OID 36895)
-- Name: interes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.interes (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL,
    factor double precision NOT NULL,
    activo boolean
);


ALTER TABLE public.interes OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 36898)
-- Name: interes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.interes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.interes_id_seq OWNER TO postgres;

--
-- TOC entry 3365 (class 0 OID 0)
-- Dependencies: 235
-- Name: interes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.interes_id_seq OWNED BY public.interes.id;


--
-- TOC entry 236 (class 1259 OID 36900)
-- Name: pagar_cuota_especial; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pagar_cuota_especial (
    id integer NOT NULL,
    numero_ref character varying(10) NOT NULL,
    forma_pago character varying(30) NOT NULL,
    descripcion character varying(200) NOT NULL,
    monto double precision NOT NULL,
    fecha date NOT NULL,
    id_cuenta character varying NOT NULL,
    id_fondo integer NOT NULL,
    id_cuota_e integer NOT NULL
);


ALTER TABLE public.pagar_cuota_especial OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 36906)
-- Name: pagar_cuota_especial_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pagar_cuota_especial_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pagar_cuota_especial_id_seq OWNER TO postgres;

--
-- TOC entry 3366 (class 0 OID 0)
-- Dependencies: 237
-- Name: pagar_cuota_especial_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pagar_cuota_especial_id_seq OWNED BY public.pagar_cuota_especial.id;


--
-- TOC entry 238 (class 1259 OID 36908)
-- Name: persona; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.persona (
    cedula character varying(10) NOT NULL,
    p_nombre character varying(25) NOT NULL,
    s_nombre character varying(25) DEFAULT ''::character varying,
    p_apellido character varying(25) NOT NULL,
    s_apellido character varying(25) DEFAULT ''::character varying,
    telefono character varying(12),
    correo character varying(60),
    activo boolean DEFAULT true
);


ALTER TABLE public.persona OWNER TO postgres;

--
-- TOC entry 239 (class 1259 OID 36914)
-- Name: propietario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.propietario (
    ci_persona character varying(10) NOT NULL,
    activo boolean DEFAULT true
);


ALTER TABLE public.propietario OWNER TO postgres;

--
-- TOC entry 240 (class 1259 OID 36918)
-- Name: proveedores; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.proveedores (
    cedula character varying(15) NOT NULL,
    nombre character varying(40) NOT NULL,
    telefono character varying(15) NOT NULL,
    correo character varying(40) NOT NULL,
    contacto character varying(60) NOT NULL,
    direccion character varying(500) NOT NULL,
    activo bigint
);


ALTER TABLE public.proveedores OWNER TO postgres;

--
-- TOC entry 241 (class 1259 OID 36924)
-- Name: puente_asamblea_propietario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.puente_asamblea_propietario (
    id integer NOT NULL,
    id_asamblea bigint NOT NULL,
    id_propietario character varying(15) NOT NULL
);


ALTER TABLE public.puente_asamblea_propietario OWNER TO postgres;

--
-- TOC entry 242 (class 1259 OID 36927)
-- Name: puente_asamblea_propietario_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.puente_asamblea_propietario_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.puente_asamblea_propietario_id_seq OWNER TO postgres;

--
-- TOC entry 3367 (class 0 OID 0)
-- Dependencies: 242
-- Name: puente_asamblea_propietario_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.puente_asamblea_propietario_id_seq OWNED BY public.puente_asamblea_propietario.id;


--
-- TOC entry 243 (class 1259 OID 36929)
-- Name: puente_cobro_factura; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.puente_cobro_factura (
    id integer NOT NULL,
    id_total bigint NOT NULL,
    id_cobro bigint NOT NULL,
    parte_monto double precision NOT NULL
);


ALTER TABLE public.puente_cobro_factura OWNER TO postgres;

--
-- TOC entry 244 (class 1259 OID 36932)
-- Name: puente_cobro_factura_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.puente_cobro_factura_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.puente_cobro_factura_id_seq OWNER TO postgres;

--
-- TOC entry 3368 (class 0 OID 0)
-- Dependencies: 244
-- Name: puente_cobro_factura_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.puente_cobro_factura_id_seq OWNED BY public.puente_cobro_factura.id;


--
-- TOC entry 245 (class 1259 OID 36934)
-- Name: puente_comunicado_usuario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.puente_comunicado_usuario (
    id integer NOT NULL,
    id_usuario character varying NOT NULL,
    id_comunicado bigint NOT NULL,
    leido bigint
);


ALTER TABLE public.puente_comunicado_usuario OWNER TO postgres;

--
-- TOC entry 246 (class 1259 OID 36940)
-- Name: puente_comunicado_usuario_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.puente_comunicado_usuario_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.puente_comunicado_usuario_id_seq OWNER TO postgres;

--
-- TOC entry 3369 (class 0 OID 0)
-- Dependencies: 246
-- Name: puente_comunicado_usuario_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.puente_comunicado_usuario_id_seq OWNED BY public.puente_comunicado_usuario.id;


--
-- TOC entry 247 (class 1259 OID 36942)
-- Name: puente_concepto_factura; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.puente_concepto_factura (
    id integer NOT NULL,
    id_factura_proveedor bigint NOT NULL,
    id_concepto bigint NOT NULL,
    monto double precision NOT NULL
);


ALTER TABLE public.puente_concepto_factura OWNER TO postgres;

--
-- TOC entry 248 (class 1259 OID 36945)
-- Name: puente_concepto_factura_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.puente_concepto_factura_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.puente_concepto_factura_id_seq OWNER TO postgres;

--
-- TOC entry 3370 (class 0 OID 0)
-- Dependencies: 248
-- Name: puente_concepto_factura_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.puente_concepto_factura_id_seq OWNED BY public.puente_concepto_factura.id;


--
-- TOC entry 249 (class 1259 OID 36947)
-- Name: puente_persona_condominio; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.puente_persona_condominio (
    id integer NOT NULL,
    ci_persona character varying(10) NOT NULL,
    rif_condominio character varying(15) NOT NULL
);


ALTER TABLE public.puente_persona_condominio OWNER TO postgres;

--
-- TOC entry 250 (class 1259 OID 36950)
-- Name: puente_persona_condominio_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.puente_persona_condominio_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.puente_persona_condominio_id_seq OWNER TO postgres;

--
-- TOC entry 3371 (class 0 OID 0)
-- Dependencies: 250
-- Name: puente_persona_condominio_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.puente_persona_condominio_id_seq OWNED BY public.puente_persona_condominio.id;


--
-- TOC entry 251 (class 1259 OID 36952)
-- Name: puente_sancion_unidad; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.puente_sancion_unidad (
    id bigint NOT NULL,
    id_sancion bigint NOT NULL,
    id_unidad bigint
);


ALTER TABLE public.puente_sancion_unidad OWNER TO postgres;

--
-- TOC entry 252 (class 1259 OID 36955)
-- Name: puente_sancion_unidad_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.puente_sancion_unidad_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.puente_sancion_unidad_id_seq OWNER TO postgres;

--
-- TOC entry 3372 (class 0 OID 0)
-- Dependencies: 252
-- Name: puente_sancion_unidad_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.puente_sancion_unidad_id_seq OWNED BY public.puente_sancion_unidad.id;


--
-- TOC entry 253 (class 1259 OID 36957)
-- Name: puente_tipo_funcion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.puente_tipo_funcion (
    id integer NOT NULL,
    id_tipo integer NOT NULL,
    id_funcion integer NOT NULL,
    registrar boolean,
    modificar boolean,
    eliminar boolean,
    todo boolean
);


ALTER TABLE public.puente_tipo_funcion OWNER TO postgres;

--
-- TOC entry 254 (class 1259 OID 36960)
-- Name: puente_tipo_funcion_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.puente_tipo_funcion_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.puente_tipo_funcion_id_seq OWNER TO postgres;

--
-- TOC entry 3373 (class 0 OID 0)
-- Dependencies: 254
-- Name: puente_tipo_funcion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.puente_tipo_funcion_id_seq OWNED BY public.puente_tipo_funcion.id;


--
-- TOC entry 255 (class 1259 OID 36962)
-- Name: puente_unidad_propietarios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.puente_unidad_propietarios (
    id integer NOT NULL,
    ci_propietario character varying(15) NOT NULL,
    id_unidad bigint NOT NULL,
    fecha_desde date DEFAULT LOCALTIMESTAMP(0) NOT NULL,
    fecha_hasta date,
    estado bigint NOT NULL,
    activo boolean DEFAULT true
);


ALTER TABLE public.puente_unidad_propietarios OWNER TO postgres;

--
-- TOC entry 256 (class 1259 OID 36967)
-- Name: puente_unidad_propietarios_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.puente_unidad_propietarios_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.puente_unidad_propietarios_id_seq OWNER TO postgres;

--
-- TOC entry 3374 (class 0 OID 0)
-- Dependencies: 256
-- Name: puente_unidad_propietarios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.puente_unidad_propietarios_id_seq OWNED BY public.puente_unidad_propietarios.id;


--
-- TOC entry 257 (class 1259 OID 36969)
-- Name: responsable; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.responsable (
    ci_persona character varying(10) NOT NULL,
    activo boolean DEFAULT true
);


ALTER TABLE public.responsable OWNER TO postgres;

--
-- TOC entry 258 (class 1259 OID 36973)
-- Name: sancion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sancion (
    id integer NOT NULL,
    tipo character varying(40) NOT NULL,
    mes bigint NOT NULL,
    anio bigint NOT NULL,
    monto double precision NOT NULL,
    descripcion character varying(200) NOT NULL,
    estado character varying(20)
);


ALTER TABLE public.sancion OWNER TO postgres;

--
-- TOC entry 259 (class 1259 OID 36976)
-- Name: sancion_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sancion_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sancion_id_seq OWNER TO postgres;

--
-- TOC entry 3375 (class 0 OID 0)
-- Dependencies: 259
-- Name: sancion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sancion_id_seq OWNED BY public.sancion.id;


--
-- TOC entry 260 (class 1259 OID 36978)
-- Name: tipo_unidad; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tipo_unidad (
    id integer NOT NULL,
    area double precision NOT NULL,
    tipo character varying(60),
    activo boolean DEFAULT true NOT NULL
);


ALTER TABLE public.tipo_unidad OWNER TO postgres;

--
-- TOC entry 261 (class 1259 OID 36982)
-- Name: tipo_unidad_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tipo_unidad_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tipo_unidad_id_seq OWNER TO postgres;

--
-- TOC entry 3376 (class 0 OID 0)
-- Dependencies: 261
-- Name: tipo_unidad_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tipo_unidad_id_seq OWNED BY public.tipo_unidad.id;


--
-- TOC entry 262 (class 1259 OID 36984)
-- Name: tipo_usuario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tipo_usuario (
    id integer NOT NULL,
    tipo character varying NOT NULL
);


ALTER TABLE public.tipo_usuario OWNER TO postgres;

--
-- TOC entry 263 (class 1259 OID 36990)
-- Name: tipo_usuario_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tipo_usuario_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tipo_usuario_id_seq OWNER TO postgres;

--
-- TOC entry 3377 (class 0 OID 0)
-- Dependencies: 263
-- Name: tipo_usuario_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tipo_usuario_id_seq OWNED BY public.tipo_usuario.id;


--
-- TOC entry 264 (class 1259 OID 36992)
-- Name: unidad; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.unidad (
    id integer NOT NULL,
    n_unidad character varying(10) NOT NULL,
    n_documento character varying(15) NOT NULL,
    direccion character varying(200) NOT NULL,
    activo boolean DEFAULT true,
    id_tipo integer NOT NULL,
    alicuota double precision
);


ALTER TABLE public.unidad OWNER TO postgres;

--
-- TOC entry 265 (class 1259 OID 36996)
-- Name: unidad_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.unidad_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.unidad_id_seq OWNER TO postgres;

--
-- TOC entry 3378 (class 0 OID 0)
-- Dependencies: 265
-- Name: unidad_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.unidad_id_seq OWNED BY public.unidad.id;


--
-- TOC entry 266 (class 1259 OID 36998)
-- Name: usuario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuario (
    id integer NOT NULL,
    usuario character varying(25) NOT NULL,
    password character varying(32) NOT NULL,
    pregunta character varying(120) NOT NULL,
    respuesta character varying(120) NOT NULL,
    ci_persona character varying(10),
    id_tipo_usuario integer,
    activo boolean DEFAULT true
);


ALTER TABLE public.usuario OWNER TO postgres;

--
-- TOC entry 267 (class 1259 OID 37002)
-- Name: usuario_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.usuario_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.usuario_id_seq OWNER TO postgres;

--
-- TOC entry 3379 (class 0 OID 0)
-- Dependencies: 267
-- Name: usuario_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.usuario_id_seq OWNED BY public.usuario.id;


--
-- TOC entry 268 (class 1259 OID 37004)
-- Name: v_condominio; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.v_condominio AS
 SELECT condominio.rif,
    condominio.razon_social,
    condominio.telefono,
    condominio.correo_electronico AS correo
   FROM public.condominio
  WHERE (condominio.activo = true);


ALTER TABLE public.v_condominio OWNER TO postgres;

--
-- TOC entry 269 (class 1259 OID 37008)
-- Name: v_cuenta; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.v_cuenta AS
 SELECT cue.n_cuenta,
    cue.tipo,
    cue.id_banco,
    ban.nombre_banco AS banco,
    cue.ci_persona,
    per.p_nombre AS nombre,
    per.p_apellido AS apellido,
    cue.rif_condominio,
    cue.activo
   FROM ((public.cuenta cue
     JOIN public.banco ban ON ((ban.id = cue.id_banco)))
     JOIN public.persona per ON (((per.cedula)::text = (cue.ci_persona)::text)))
  WHERE (cue.activo = true);


ALTER TABLE public.v_cuenta OWNER TO postgres;

--
-- TOC entry 270 (class 1259 OID 37013)
-- Name: v_cuenta_inactivo; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.v_cuenta_inactivo AS
 SELECT cue.n_cuenta,
    cue.tipo,
    cue.id_banco,
    ban.nombre_banco AS banco,
    cue.ci_persona,
    per.p_nombre AS nombre,
    per.p_apellido AS apellido,
    cue.rif_condominio,
    cue.activo
   FROM ((public.cuenta cue
     JOIN public.banco ban ON ((ban.id = cue.id_banco)))
     JOIN public.persona per ON (((per.cedula)::text = (cue.ci_persona)::text)))
  WHERE (cue.activo = false);


ALTER TABLE public.v_cuenta_inactivo OWNER TO postgres;

--
-- TOC entry 271 (class 1259 OID 37018)
-- Name: v_dueno_unidad; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.v_dueno_unidad AS
 SELECT prop.ci_persona,
    puente.id,
    puente.id_unidad,
    puente.fecha_hasta
   FROM (public.propietario prop
     LEFT JOIN public.puente_unidad_propietarios puente ON (((prop.ci_persona)::text = (puente.ci_propietario)::text)))
  WHERE ((prop.activo = true) AND (puente.fecha_hasta IS NULL));


ALTER TABLE public.v_dueno_unidad OWNER TO postgres;

--
-- TOC entry 272 (class 1259 OID 37022)
-- Name: v_permisos; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.v_permisos AS
 SELECT u.usuario,
    tipo.id,
    tipo.tipo,
    puente.id_funcion,
    f.funcion,
    puente.registrar,
    puente.modificar,
    puente.eliminar,
    puente.todo
   FROM (((public.puente_tipo_funcion puente
     JOIN public.tipo_usuario tipo ON ((tipo.id = puente.id_tipo)))
     JOIN public.funcion f ON ((f.id = puente.id_funcion)))
     JOIN public.usuario u ON ((u.id_tipo_usuario = puente.id_tipo)));


ALTER TABLE public.v_permisos OWNER TO postgres;

--
-- TOC entry 273 (class 1259 OID 37027)
-- Name: v_propietario; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.v_propietario AS
 SELECT pro.ci_persona,
    per.p_nombre,
    per.s_nombre,
    per.p_apellido,
    per.s_apellido,
    per.telefono,
    per.correo
   FROM (public.propietario pro
     JOIN public.persona per ON (((per.cedula)::text = (pro.ci_persona)::text)))
  WHERE (pro.activo = true);


ALTER TABLE public.v_propietario OWNER TO postgres;

--
-- TOC entry 274 (class 1259 OID 37031)
-- Name: v_propietario_inactivo; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.v_propietario_inactivo AS
 SELECT pro.ci_persona,
    per.p_nombre,
    per.s_nombre,
    per.p_apellido,
    per.s_apellido,
    per.telefono,
    per.correo
   FROM (public.propietario pro
     JOIN public.persona per ON (((per.cedula)::text = (pro.ci_persona)::text)))
  WHERE (pro.activo = false);


ALTER TABLE public.v_propietario_inactivo OWNER TO postgres;

--
-- TOC entry 275 (class 1259 OID 37035)
-- Name: v_responsable; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.v_responsable AS
 SELECT r.ci_persona,
    per.p_nombre,
    per.s_nombre,
    per.p_apellido,
    per.s_apellido,
    per.telefono,
    per.correo
   FROM (public.responsable r
     JOIN public.persona per ON (((per.cedula)::text = (r.ci_persona)::text)))
  WHERE (r.activo = true);


ALTER TABLE public.v_responsable OWNER TO postgres;

--
-- TOC entry 276 (class 1259 OID 37039)
-- Name: v_responsable_inactivo; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.v_responsable_inactivo AS
 SELECT r.ci_persona,
    per.p_nombre,
    per.s_nombre,
    per.p_apellido,
    per.s_apellido,
    per.telefono,
    per.correo
   FROM (public.responsable r
     JOIN public.persona per ON (((per.cedula)::text = (r.ci_persona)::text)))
  WHERE (r.activo = false);


ALTER TABLE public.v_responsable_inactivo OWNER TO postgres;

--
-- TOC entry 277 (class 1259 OID 37043)
-- Name: v_tipo_unidad; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.v_tipo_unidad AS
 SELECT tu.id,
    tu.tipo,
    tu.area
   FROM public.tipo_unidad tu
  WHERE (tu.activo = true);


ALTER TABLE public.v_tipo_unidad OWNER TO postgres;

--
-- TOC entry 278 (class 1259 OID 37047)
-- Name: v_tipo_unidad_inactivo; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.v_tipo_unidad_inactivo AS
 SELECT tu.id,
    tu.tipo,
    tu.area
   FROM public.tipo_unidad tu
  WHERE (tu.activo = false);


ALTER TABLE public.v_tipo_unidad_inactivo OWNER TO postgres;

--
-- TOC entry 279 (class 1259 OID 37051)
-- Name: v_unidad; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.v_unidad AS
 SELECT u.id,
    u.n_unidad,
    u.n_documento,
    u.direccion,
    tu.id AS id_tipo,
    tu.tipo,
    tu.area
   FROM (public.unidad u
     JOIN public.tipo_unidad tu ON ((tu.id = u.id_tipo)))
  WHERE (u.activo = true);


ALTER TABLE public.v_unidad OWNER TO postgres;

--
-- TOC entry 280 (class 1259 OID 37055)
-- Name: v_unidad_propietario; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.v_unidad_propietario AS
 SELECT u.id,
    pro.ci_persona,
    pro.p_nombre,
    pro.s_nombre,
    pro.p_apellido,
    pro.s_apellido,
    pro.telefono,
    pro.correo,
    puente.id AS id_puente,
    puente.fecha_desde,
    puente.fecha_hasta,
    puente.estado
   FROM ((public.v_propietario pro
     JOIN public.puente_unidad_propietarios puente ON (((puente.ci_propietario)::text = (pro.ci_persona)::text)))
     JOIN public.unidad u ON ((u.id = puente.id_unidad)))
  WHERE ((u.activo = true) AND (puente.estado = 1));


ALTER TABLE public.v_unidad_propietario OWNER TO postgres;

--
-- TOC entry 281 (class 1259 OID 37060)
-- Name: v_unidades_inactivas; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.v_unidades_inactivas AS
 SELECT unidad.id,
    unidad.n_unidad,
    unidad.n_documento,
    unidad.direccion
   FROM public.unidad
  WHERE (unidad.activo = false);


ALTER TABLE public.v_unidades_inactivas OWNER TO postgres;

--
-- TOC entry 282 (class 1259 OID 37064)
-- Name: v_usuario; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.v_usuario AS
 SELECT usuario.id,
    usuario.usuario,
    usuario.ci_persona
   FROM public.usuario
  WHERE (usuario.activo = true);


ALTER TABLE public.v_usuario OWNER TO postgres;

--
-- TOC entry 283 (class 1259 OID 37068)
-- Name: v_usuario_inactivo; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.v_usuario_inactivo AS
 SELECT usuario.id,
    usuario.usuario,
    usuario.ci_persona
   FROM public.usuario
  WHERE (usuario.activo = false);


ALTER TABLE public.v_usuario_inactivo OWNER TO postgres;

--
-- TOC entry 284 (class 1259 OID 37072)
-- Name: visita; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.visita (
    id integer NOT NULL,
    fecha date DEFAULT LOCALTIMESTAMP(0),
    hora time without time zone DEFAULT LOCALTIMESTAMP(0),
    placa character varying(8),
    modelo character varying(25),
    color character varying(15),
    ci_visitante character varying(10) NOT NULL,
    id_unidad integer NOT NULL
);


ALTER TABLE public.visita OWNER TO postgres;

--
-- TOC entry 285 (class 1259 OID 37077)
-- Name: visitante; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.visitante (
    ci_persona character varying(10) NOT NULL,
    activo boolean DEFAULT true
);


ALTER TABLE public.visitante OWNER TO postgres;

--
-- TOC entry 286 (class 1259 OID 37081)
-- Name: v_visita; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.v_visita AS
 SELECT vis.id,
    vis.id_unidad,
    u.n_unidad,
    vis.fecha,
    vis.hora,
    vis.placa AS matricula,
    vis.modelo,
    vis.color,
    vis.ci_visitante AS cedula,
    per.p_nombre AS nombre,
    per.p_apellido AS apellido
   FROM (((public.visita vis
     JOIN public.unidad u ON ((u.id = vis.id_unidad)))
     JOIN public.visitante v ON (((v.ci_persona)::text = (vis.ci_visitante)::text)))
     JOIN public.persona per ON (((per.cedula)::text = (v.ci_persona)::text)));


ALTER TABLE public.v_visita OWNER TO postgres;

--
-- TOC entry 287 (class 1259 OID 37086)
-- Name: v_visitante; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.v_visitante AS
 SELECT v.ci_persona AS cedula,
    per.p_nombre AS nombre,
    per.p_apellido AS apellido
   FROM (public.visitante v
     JOIN public.persona per ON (((per.cedula)::text = (v.ci_persona)::text)))
  WHERE (v.activo = true);


ALTER TABLE public.v_visitante OWNER TO postgres;

--
-- TOC entry 288 (class 1259 OID 37090)
-- Name: visita_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.visita_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.visita_id_seq OWNER TO postgres;

--
-- TOC entry 3380 (class 0 OID 0)
-- Dependencies: 288
-- Name: visita_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.visita_id_seq OWNED BY public.visita.id;


--
-- TOC entry 2983 (class 2604 OID 37092)
-- Name: asambleas id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.asambleas ALTER COLUMN id SET DEFAULT nextval('public.asambleas_id_seq'::regclass);


--
-- TOC entry 2984 (class 2604 OID 37093)
-- Name: banco id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.banco ALTER COLUMN id SET DEFAULT nextval('public.banco_id_seq'::regclass);


--
-- TOC entry 2985 (class 2604 OID 37094)
-- Name: categoriagasto id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categoriagasto ALTER COLUMN id SET DEFAULT nextval('public.categoriagasto_id_seq'::regclass);


--
-- TOC entry 2986 (class 2604 OID 37095)
-- Name: cierre_de_mes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cierre_de_mes ALTER COLUMN id SET DEFAULT nextval('public.cierre_de_mes_id_seq'::regclass);


--
-- TOC entry 2987 (class 2604 OID 37096)
-- Name: cobro_unidad id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cobro_unidad ALTER COLUMN id SET DEFAULT nextval('public.cobro_id_seq'::regclass);


--
-- TOC entry 2988 (class 2604 OID 37097)
-- Name: comunicados id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comunicados ALTER COLUMN id SET DEFAULT nextval('public.comunicados_id_seq'::regclass);


--
-- TOC entry 2989 (class 2604 OID 37098)
-- Name: concepto_gasto id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.concepto_gasto ALTER COLUMN id SET DEFAULT nextval('public.concepto_gasto_id_seq'::regclass);


--
-- TOC entry 2992 (class 2604 OID 37099)
-- Name: cuenta_pagar id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cuenta_pagar ALTER COLUMN id SET DEFAULT nextval('public.cuenta_pagar_id_seq'::regclass);


--
-- TOC entry 2994 (class 2604 OID 37100)
-- Name: detalle_pagos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detalle_pagos ALTER COLUMN id SET DEFAULT nextval('public.detalle_pagos_id_seq'::regclass);


--
-- TOC entry 2995 (class 2604 OID 37101)
-- Name: factura_unidad id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factura_unidad ALTER COLUMN id SET DEFAULT nextval('public.detalle_total_id_seq'::regclass);


--
-- TOC entry 2993 (class 2604 OID 37102)
-- Name: facturas_proveedores id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.facturas_proveedores ALTER COLUMN id SET DEFAULT nextval('public.cuotas_especiales_id_seq'::regclass);


--
-- TOC entry 2996 (class 2604 OID 37103)
-- Name: fondos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fondos ALTER COLUMN id SET DEFAULT nextval('public.fondos_id_seq'::regclass);


--
-- TOC entry 2997 (class 2604 OID 37104)
-- Name: forma_pago id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.forma_pago ALTER COLUMN id SET DEFAULT nextval('public.forma_pago_id_seq'::regclass);


--
-- TOC entry 2998 (class 2604 OID 37105)
-- Name: funcion id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcion ALTER COLUMN id SET DEFAULT nextval('public.funcion_id_seq'::regclass);


--
-- TOC entry 2999 (class 2604 OID 37106)
-- Name: gasto_comun id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gasto_comun ALTER COLUMN id SET DEFAULT nextval('public.gasto_comun_id_seq'::regclass);


--
-- TOC entry 3000 (class 2604 OID 37107)
-- Name: interes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.interes ALTER COLUMN id SET DEFAULT nextval('public.interes_id_seq'::regclass);


--
-- TOC entry 3001 (class 2604 OID 37108)
-- Name: pagar_cuota_especial id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pagar_cuota_especial ALTER COLUMN id SET DEFAULT nextval('public.pagar_cuota_especial_id_seq'::regclass);


--
-- TOC entry 3006 (class 2604 OID 37109)
-- Name: puente_asamblea_propietario id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.puente_asamblea_propietario ALTER COLUMN id SET DEFAULT nextval('public.puente_asamblea_propietario_id_seq'::regclass);


--
-- TOC entry 3007 (class 2604 OID 37110)
-- Name: puente_cobro_factura id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.puente_cobro_factura ALTER COLUMN id SET DEFAULT nextval('public.puente_cobro_factura_id_seq'::regclass);


--
-- TOC entry 3008 (class 2604 OID 37111)
-- Name: puente_comunicado_usuario id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.puente_comunicado_usuario ALTER COLUMN id SET DEFAULT nextval('public.puente_comunicado_usuario_id_seq'::regclass);


--
-- TOC entry 3009 (class 2604 OID 37112)
-- Name: puente_concepto_factura id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.puente_concepto_factura ALTER COLUMN id SET DEFAULT nextval('public.puente_concepto_factura_id_seq'::regclass);


--
-- TOC entry 3010 (class 2604 OID 37113)
-- Name: puente_persona_condominio id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.puente_persona_condominio ALTER COLUMN id SET DEFAULT nextval('public.puente_persona_condominio_id_seq'::regclass);


--
-- TOC entry 3011 (class 2604 OID 37114)
-- Name: puente_sancion_unidad id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.puente_sancion_unidad ALTER COLUMN id SET DEFAULT nextval('public.puente_sancion_unidad_id_seq'::regclass);


--
-- TOC entry 3012 (class 2604 OID 37115)
-- Name: puente_tipo_funcion id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.puente_tipo_funcion ALTER COLUMN id SET DEFAULT nextval('public.puente_tipo_funcion_id_seq'::regclass);


--
-- TOC entry 3015 (class 2604 OID 37116)
-- Name: puente_unidad_propietarios id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.puente_unidad_propietarios ALTER COLUMN id SET DEFAULT nextval('public.puente_unidad_propietarios_id_seq'::regclass);


--
-- TOC entry 3017 (class 2604 OID 37117)
-- Name: sancion id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sancion ALTER COLUMN id SET DEFAULT nextval('public.sancion_id_seq'::regclass);


--
-- TOC entry 3019 (class 2604 OID 37118)
-- Name: tipo_unidad id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipo_unidad ALTER COLUMN id SET DEFAULT nextval('public.tipo_unidad_id_seq'::regclass);


--
-- TOC entry 3020 (class 2604 OID 37119)
-- Name: tipo_usuario id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipo_usuario ALTER COLUMN id SET DEFAULT nextval('public.tipo_usuario_id_seq'::regclass);


--
-- TOC entry 3022 (class 2604 OID 37120)
-- Name: unidad id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.unidad ALTER COLUMN id SET DEFAULT nextval('public.unidad_id_seq'::regclass);


--
-- TOC entry 3024 (class 2604 OID 37121)
-- Name: usuario id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario ALTER COLUMN id SET DEFAULT nextval('public.usuario_id_seq'::regclass);


--
-- TOC entry 3027 (class 2604 OID 37122)
-- Name: visita id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.visita ALTER COLUMN id SET DEFAULT nextval('public.visita_id_seq'::regclass);


--
-- TOC entry 3276 (class 0 OID 36788)
-- Dependencies: 202
-- Data for Name: asambleas; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3278 (class 0 OID 36796)
-- Dependencies: 204
-- Data for Name: banco; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.banco VALUES (4, 'Provincial', true);
INSERT INTO public.banco VALUES (6, 'Venezuela', true);
INSERT INTO public.banco VALUES (1, 'Banesco', true);
INSERT INTO public.banco VALUES (5, 'Mercantil', true);
INSERT INTO public.banco VALUES (7, 'BOD', true);
INSERT INTO public.banco VALUES (8, 'Fondo Comun', true);
INSERT INTO public.banco VALUES (10, 'Fuerzas Armadas', true);
INSERT INTO public.banco VALUES (11, 'Venezolana de Credito', true);
INSERT INTO public.banco VALUES (9, 'Banplus', true);
INSERT INTO public.banco VALUES (3, 'Caribe', true);


--
-- TOC entry 3280 (class 0 OID 36801)
-- Dependencies: 206
-- Data for Name: categoriagasto; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.categoriagasto VALUES (3, 'Reparaciones', 'Conjunto de conceptos de reparaciones', true);
INSERT INTO public.categoriagasto VALUES (4, 'Uso comun', 'Conjunto de conceptos de uso comun y consumo', true);
INSERT INTO public.categoriagasto VALUES (6, 'asda', 'ddasda', true);
INSERT INTO public.categoriagasto VALUES (1, 'Administrativo', 'Conjunto de conceptos administrativos', true);
INSERT INTO public.categoriagasto VALUES (2, 'Mantenimiento', 'Conjunto de conceptos de mantenimiento', true);
INSERT INTO public.categoriagasto VALUES (5, 'fsfsfdsfs', 'Conjunto de conceptos administrativo', true);


--
-- TOC entry 3282 (class 0 OID 36806)
-- Dependencies: 208
-- Data for Name: cierre_de_mes; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.cierre_de_mes VALUES (57, 5, 2020, '21321312');


--
-- TOC entry 3284 (class 0 OID 36811)
-- Dependencies: 210
-- Data for Name: cobro_unidad; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.cobro_unidad VALUES (11, 12500, 'asdas', '01020045120268985654', 'Transferencia', 'asdsad', '2020-05-09', 55, 66);
INSERT INTO public.cobro_unidad VALUES (12, 10000, 'fdf', '01020045120268985654', 'Transferencia', '12313', '2020-05-09', 55, 66);


--
-- TOC entry 3286 (class 0 OID 36819)
-- Dependencies: 212
-- Data for Name: comunicados; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3288 (class 0 OID 36827)
-- Dependencies: 214
-- Data for Name: concepto_gasto; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.concepto_gasto VALUES (11, 'Provisión utilidades ', 'Utilidades del trabajador', 1, true);
INSERT INTO public.concepto_gasto VALUES (10, 'Liquidación ', 'Liquidacion trabajador', 1, true);
INSERT INTO public.concepto_gasto VALUES (12, 'Provisión vacaciones ', 'Vacaciones trabajador', 1, true);
INSERT INTO public.concepto_gasto VALUES (13, 'Ley de alimentación', 'Pago alimentación', 1, true);
INSERT INTO public.concepto_gasto VALUES (14, 'FAHO', 'Fondo de ahorro obligatorio de la vivienda', 1, true);
INSERT INTO public.concepto_gasto VALUES (15, 'Caja chica', 'Caja chica', 1, true);
INSERT INTO public.concepto_gasto VALUES (16, 'Mant. ascensores', 'Mantenimiento de los asecensores', 2, true);
INSERT INTO public.concepto_gasto VALUES (17, 'Mant. hidroneumatico', 'Mantenimiento del hidroneumatico', 2, true);
INSERT INTO public.concepto_gasto VALUES (18, 'Mant. porton electrico', 'Mantenimiento del porton electrico', 2, true);
INSERT INTO public.concepto_gasto VALUES (19, 'Mant. cerco electrico', 'Mantenimiento del cerco electrico', 2, true);
INSERT INTO public.concepto_gasto VALUES (20, 'Mant. areas verdes', 'Mantenimiento de areas verdes', 2, true);
INSERT INTO public.concepto_gasto VALUES (21, 'Mant. piscina', 'Mantenimiento de la piscina', 2, true);
INSERT INTO public.concepto_gasto VALUES (22, 'Mant. parque infantil', 'Mantenimiento del parque infantil', 2, true);
INSERT INTO public.concepto_gasto VALUES (23, 'Mant. camaras vigilancia', 'Mantenimiento camaras de vigilancia', 2, true);
INSERT INTO public.concepto_gasto VALUES (24, 'Mant. tuberias', 'Mantenimiento de tuberias ', 2, true);
INSERT INTO public.concepto_gasto VALUES (25, 'Mant. estacionamiento', 'Mantenimiento del estacionamiento ', 2, true);
INSERT INTO public.concepto_gasto VALUES (26, 'Mant. pintura edif. ', 'Pintura de areas comunes ', 2, true);
INSERT INTO public.concepto_gasto VALUES (27, 'Mant. alumbrado elect. ', 'Mantenimiento del alumbrado elect.', 2, true);
INSERT INTO public.concepto_gasto VALUES (28, 'Mant. compra prod. limp.', 'Gastos productos de limpieza', 2, true);
INSERT INTO public.concepto_gasto VALUES (29, 'Mant. prod. limpieza ', 'Gasto otros productos', 2, true);
INSERT INTO public.concepto_gasto VALUES (30, 'Repar. ascensores', 'Reparacion de los asecensores', 3, true);
INSERT INTO public.concepto_gasto VALUES (31, 'Repar. tuberia', 'Reparacion de tuberias de aguas', 3, true);
INSERT INTO public.concepto_gasto VALUES (32, 'Repar. porton', 'Reparacion del porton electrico', 3, true);
INSERT INTO public.concepto_gasto VALUES (33, 'Repar. cerco elect.', 'Reparacion del cerco electrico', 3, true);
INSERT INTO public.concepto_gasto VALUES (34, 'Repar. hidroneumatico.', 'Reparacion la bomba de agua', 3, true);
INSERT INTO public.concepto_gasto VALUES (35, 'Repar. camaras.', 'Reparacion de camaras', 3, true);
INSERT INTO public.concepto_gasto VALUES (36, 'Repar. electricas.', 'Reparacion/Sustitucion de componentes electricos', 3, true);
INSERT INTO public.concepto_gasto VALUES (37, 'Consumo de electricidad', 'Consumo de electricidad', 3, true);
INSERT INTO public.concepto_gasto VALUES (40, 'HidroCapital', 'Consumo de agua', 4, true);
INSERT INTO public.concepto_gasto VALUES (41, 'Vigilancia', 'Gastos por vigilancia', 4, true);
INSERT INTO public.concepto_gasto VALUES (2, 'Salario conserje', 'Salario del conserje del condominio', 1, true);
INSERT INTO public.concepto_gasto VALUES (3, 'Honorarios administradora', 'Honorarios administradora del condominio', 1, true);
INSERT INTO public.concepto_gasto VALUES (4, 'Gastos oficina', 'Gastos en material de oficina', 1, true);
INSERT INTO public.concepto_gasto VALUES (9, 'Bono Vacacional ', 'Bono vacacional trabajador', 1, true);
INSERT INTO public.concepto_gasto VALUES (7, 'Prestaciones soc.', 'Prestaciones sociales trabajador', 1, true);
INSERT INTO public.concepto_gasto VALUES (8, 'Seguro social', 'Seguro social trabajador', 1, true);
INSERT INTO public.concepto_gasto VALUES (5, 'Gastos varios', 'Gastos fotocopias, impresiones, internet', 1, true);
INSERT INTO public.concepto_gasto VALUES (6, 'Retiro prestaciones', 'Retiro de prestaciones sociales', 1, true);
INSERT INTO public.concepto_gasto VALUES (1, 'Honorarios administrador', 'Honorarios del administrador del condominio', 1, true);
INSERT INTO public.concepto_gasto VALUES (39, 'Cantv', 'sad', 4, true);


--
-- TOC entry 3290 (class 0 OID 36832)
-- Dependencies: 216
-- Data for Name: condominio; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.condominio VALUES ('J22318939', 'CAMPO GUATACARO', '04140542620', 'AJHENSUAREZ@GMAIL.COM', true);


--
-- TOC entry 3291 (class 0 OID 36836)
-- Dependencies: 217
-- Data for Name: cuenta; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.cuenta VALUES ('44444444444444444444', 'Corriente', 5, 'V-11276626', 'J22318939', true);


--
-- TOC entry 3292 (class 0 OID 36840)
-- Dependencies: 218
-- Data for Name: cuenta_pagar; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3296 (class 0 OID 36853)
-- Dependencies: 222
-- Data for Name: detalle_pagos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.detalle_pagos VALUES (1316, 5, 2020, 2000, 79, 157, 'Gasto comun');
INSERT INTO public.detalle_pagos VALUES (1317, 5, 2020, 5000, 80, 157, 'Gasto comun');
INSERT INTO public.detalle_pagos VALUES (1318, 5, 2020, 5000, 76, 157, 'Cuota especial');
INSERT INTO public.detalle_pagos VALUES (1319, 5, 2020, 1000, 80, 157, 'Sancion');
INSERT INTO public.detalle_pagos VALUES (1320, 5, 2020, 100, 82, 157, 'Sancion');
INSERT INTO public.detalle_pagos VALUES (1321, 5, 2020, 1000, 81, 157, 'Sancion');
INSERT INTO public.detalle_pagos VALUES (1322, 5, 2020, 7200, 8, 157, 'Interes');
INSERT INTO public.detalle_pagos VALUES (1323, 5, 2020, 1200, 9, 157, 'Interes');


--
-- TOC entry 3298 (class 0 OID 36861)
-- Dependencies: 224
-- Data for Name: factura_unidad; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.factura_unidad VALUES (157, 22500, 5, 2020, 1, 'Pagado', 0, 66);


--
-- TOC entry 3294 (class 0 OID 36845)
-- Dependencies: 220
-- Data for Name: facturas_proveedores; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.facturas_proveedores VALUES (77, '17102635', 'Total de Inmuebles', 5, 2020, 2000, 2000, 1, 0, '', 'Mensualidad Completada', '21321312', 0, NULL, NULL);
INSERT INTO public.facturas_proveedores VALUES (76, 'J-1001245215', 'Alicuota', 5, 2020, 10000, 10000, 2, 0, '', 'Mensualidad Completada', '21321312', 0, NULL, NULL);
INSERT INTO public.facturas_proveedores VALUES (78, 'J-1001245215', 'Alicuota', 6, 2020, 20000, 20000, 2, 0, 'asad', 'Pendiente', '21321312', 2, NULL, NULL);
INSERT INTO public.facturas_proveedores VALUES (79, 'J-1001245215', 'Alicuota', 6, 2020, 20000, 20000, 1, 0, 'asad', 'Pendiente', '21321312', 1, NULL, NULL);
INSERT INTO public.facturas_proveedores VALUES (80, 'J-2457021456', 'Alicuota', 6, 2020, 30000, 30000, 1, 0, '', 'Pendiente', '21321312', 1, NULL, NULL);
INSERT INTO public.facturas_proveedores VALUES (81, 'J-2457021456', 'Alicuota', 5, 2021, 1323, 1323, 2, 0, 'sada', 'Pendiente', '21321312', 2, NULL, NULL);


--
-- TOC entry 3300 (class 0 OID 36866)
-- Dependencies: 226
-- Data for Name: fondos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.fondos VALUES ('asdads', '2020-05-09', 'adsasd', 'asda', 31231, 31231, '21321312', 56, 1);
INSERT INTO public.fondos VALUES ('sdadsad', '2020-05-16', 'fsdfds', 'sdfsd', 0, 0, '21321312', 58, 0);
INSERT INTO public.fondos VALUES ('asdad', '2020-05-16', 'dadsad', 'sadas', 21313, 0, '21321312', 55, 1);
INSERT INTO public.fondos VALUES ('asdsad', '2020-05-10', 'fsf', 'sfdsd', 0, 0, '21321312', 57, 1);


--
-- TOC entry 3302 (class 0 OID 36874)
-- Dependencies: 228
-- Data for Name: forma_pago; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.forma_pago VALUES (1, 'dsfsdf', true);
INSERT INTO public.forma_pago VALUES (2, 'td', true);


--
-- TOC entry 3304 (class 0 OID 36882)
-- Dependencies: 230
-- Data for Name: funcion; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.funcion VALUES (1, 'Asambleas');
INSERT INTO public.funcion VALUES (2, 'Banco');
INSERT INTO public.funcion VALUES (3, 'Categoria Gastos');
INSERT INTO public.funcion VALUES (4, 'Concepto Gastos');
INSERT INTO public.funcion VALUES (5, 'Comunicados');
INSERT INTO public.funcion VALUES (6, 'Condominio');
INSERT INTO public.funcion VALUES (7, 'Cuenta');
INSERT INTO public.funcion VALUES (8, 'Cuentas por cobrar');
INSERT INTO public.funcion VALUES (9, 'Cuentas por pagar');
INSERT INTO public.funcion VALUES (10, 'Cuotas especiales');
INSERT INTO public.funcion VALUES (11, 'Fondo');
INSERT INTO public.funcion VALUES (12, 'Gastos comunes');
INSERT INTO public.funcion VALUES (13, 'Gestionar Usuario');
INSERT INTO public.funcion VALUES (14, 'Intereses');
INSERT INTO public.funcion VALUES (15, 'Pago de cuotas especiales');
INSERT INTO public.funcion VALUES (16, 'Propietarios');
INSERT INTO public.funcion VALUES (17, 'Proveedores');
INSERT INTO public.funcion VALUES (18, 'Recibo');
INSERT INTO public.funcion VALUES (19, 'Responsables');
INSERT INTO public.funcion VALUES (20, 'Sanciones');
INSERT INTO public.funcion VALUES (21, 'Tipo de usuario');
INSERT INTO public.funcion VALUES (22, 'Unidades');
INSERT INTO public.funcion VALUES (23, 'Registro de visitas');
INSERT INTO public.funcion VALUES (24, 'Visitas autorizadas');
INSERT INTO public.funcion VALUES (25, 'Generar recibo');
INSERT INTO public.funcion VALUES (26, 'Tipo de unidad');


--
-- TOC entry 3306 (class 0 OID 36890)
-- Dependencies: 232
-- Data for Name: gasto_comun; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.gasto_comun VALUES (79, 'Ordinario', 5, 2020, 2000, '2727722', '24666587', 25, '', '2020-05-14', 'Pendiente de Pago', '21321312', 2000);
INSERT INTO public.gasto_comun VALUES (80, 'Ordinario', 5, 2020, 5000, '2727722', 'J-54785696', 26, '', '2020-05-14', 'Pendiente de Pago', '21321312', 5000);
INSERT INTO public.gasto_comun VALUES (81, 'Ordinario', 6, 2020, 100, '1212', 'J-1001245215', 29, 'perro', '2020-05-12', 'Pendiente', '21321312', 100);


--
-- TOC entry 3308 (class 0 OID 36895)
-- Dependencies: 234
-- Data for Name: interes; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.interes VALUES (26, 'reserva', 30, true);
INSERT INTO public.interes VALUES (27, 'inflacion', 30, true);


--
-- TOC entry 3310 (class 0 OID 36900)
-- Dependencies: 236
-- Data for Name: pagar_cuota_especial; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3312 (class 0 OID 36908)
-- Dependencies: 238
-- Data for Name: persona; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.persona VALUES ('V-26942316', 'Diego', '', 'Rodríguez', '', '04120520962', 'diegordgz8@outlook.com', true);
INSERT INTO public.persona VALUES ('V-11276626', 'Dana', '', 'Montilla', '', '99999999999', '77777', true);
INSERT INTO public.persona VALUES ('V-22318939', 'anthony', 'jhen', 'suarez', 'leal', '04145371749', 'ajhen', true);
INSERT INTO public.persona VALUES ('V-22318938', 'jhosbert', 'angelys', 'suarez', 'rodriguez', '04145371744', 'jhos', true);
INSERT INTO public.persona VALUES ('V-7552887', 'hilda', 'carmen', 'suarez', 'rodriguez', '04141414141', 'sdadasd', true);
INSERT INTO public.persona VALUES ('V-9602345', 'jenny', 'coromoto', 'leal', 'gil', '31231455423', 'asdadadd', true);
INSERT INTO public.persona VALUES ('V-9602344', 'yaneth', 'margarita', 'leal', 'leal', '96855242224', 'dsdadgggccc', true);
INSERT INTO public.persona VALUES ('V-16111353', 'johil', 'aisbel', 'suarez', 'rodriguez', '14257595854', 'johil', true);
INSERT INTO public.persona VALUES ('V-23654789', 'dsfsdf', NULL, 'sdf', NULL, NULL, NULL, true);
INSERT INTO public.persona VALUES ('V-14523698', 'cghc', NULL, 'ghcg', NULL, NULL, NULL, true);
INSERT INTO public.persona VALUES ('V-12365478', 'vhn', NULL, 'gv', NULL, NULL, NULL, true);


--
-- TOC entry 3313 (class 0 OID 36914)
-- Dependencies: 239
-- Data for Name: propietario; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.propietario VALUES ('V-7552887', true);
INSERT INTO public.propietario VALUES ('V-9602345', true);
INSERT INTO public.propietario VALUES ('V-9602344', true);
INSERT INTO public.propietario VALUES ('V-26942316', true);


--
-- TOC entry 3314 (class 0 OID 36918)
-- Dependencies: 240
-- Data for Name: proveedores; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.proveedores VALUES ('J-1001245215', 'Ferreteria Todo', '02542458796', 'Ferreteriatodo@gmail.com', 'Señor José', 'Av. 4, centro comercial aris, local 3', 1);
INSERT INTO public.proveedores VALUES ('J-2457021456', 'Carpinteria Madera Blanca', '0254217965', 'CarpinteriaMB@gmail.com', 'Señora Luisa', '8 Av, esquina de la calle 12', 1);
INSERT INTO public.proveedores VALUES ('J-2457903215', 'Cristaleria Azul', '0254789635', 'Cristaleria_Azul@hotmail.com', 'Señor Armando', 'Calle 3 con esquina 7', 1);
INSERT INTO public.proveedores VALUES ('24666587', 'Hermanos Fontaneros', '04245886335', 'Hfontaneros@gmail.com', 'Señor Juan', '30 Av. entre calle 3 y 4  ', 1);
INSERT INTO public.proveedores VALUES ('17102635', 'Servicios de Limpieza', '04165048963', 'Luisa1@hotmail.com', 'Señora Luisa', '-', 1);
INSERT INTO public.proveedores VALUES ('J-54785696', 'Libreria la Rosa', '04125789654', 'Libreria_laRosa@hotmail.com', 'Juan', 'Calle 2', 1);
INSERT INTO public.proveedores VALUES ('12457896', 'Reparacion de Ascensor', '0414157896', '-', 'Julio', 'Calle 6', 1);
INSERT INTO public.proveedores VALUES ('J-215479658', 'Reparacion Electrica', '04141544400', '-', 'Alvaro', 'Calle 14', 1);
INSERT INTO public.proveedores VALUES ('20111045', 'Reparacion de Porton', '04167247578', '-', 'Julian', 'Calle 12', 1);
INSERT INTO public.proveedores VALUES ('J-547859655', 'Reparacion de Camaras', '04162488965', 'RC@hotmail.com', 'Jose', 'Calle 34', 1);


--
-- TOC entry 3315 (class 0 OID 36924)
-- Dependencies: 241
-- Data for Name: puente_asamblea_propietario; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3317 (class 0 OID 36929)
-- Dependencies: 243
-- Data for Name: puente_cobro_factura; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.puente_cobro_factura VALUES (8, 157, 11, 12500);
INSERT INTO public.puente_cobro_factura VALUES (9, 157, 12, 10000);


--
-- TOC entry 3319 (class 0 OID 36934)
-- Dependencies: 245
-- Data for Name: puente_comunicado_usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3321 (class 0 OID 36942)
-- Dependencies: 247
-- Data for Name: puente_concepto_factura; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.puente_concepto_factura VALUES (1, 81, 29, 1223);
INSERT INTO public.puente_concepto_factura VALUES (2, 81, 28, 100);


--
-- TOC entry 3323 (class 0 OID 36947)
-- Dependencies: 249
-- Data for Name: puente_persona_condominio; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3325 (class 0 OID 36952)
-- Dependencies: 251
-- Data for Name: puente_sancion_unidad; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.puente_sancion_unidad VALUES (192, 80, 66);
INSERT INTO public.puente_sancion_unidad VALUES (193, 82, 66);
INSERT INTO public.puente_sancion_unidad VALUES (194, 81, 66);
INSERT INTO public.puente_sancion_unidad VALUES (195, 83, 66);
INSERT INTO public.puente_sancion_unidad VALUES (196, 84, 11);
INSERT INTO public.puente_sancion_unidad VALUES (197, 84, 12);


--
-- TOC entry 3327 (class 0 OID 36957)
-- Dependencies: 253
-- Data for Name: puente_tipo_funcion; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.puente_tipo_funcion VALUES (1, 1, 1, true, true, true, true);
INSERT INTO public.puente_tipo_funcion VALUES (2, 1, 2, true, true, true, true);
INSERT INTO public.puente_tipo_funcion VALUES (3, 1, 3, true, true, true, true);
INSERT INTO public.puente_tipo_funcion VALUES (4, 1, 4, true, true, true, true);
INSERT INTO public.puente_tipo_funcion VALUES (5, 1, 5, true, true, true, true);
INSERT INTO public.puente_tipo_funcion VALUES (6, 1, 6, true, true, true, true);
INSERT INTO public.puente_tipo_funcion VALUES (7, 1, 7, true, true, true, true);
INSERT INTO public.puente_tipo_funcion VALUES (8, 1, 8, true, true, true, true);
INSERT INTO public.puente_tipo_funcion VALUES (9, 1, 9, true, true, true, true);
INSERT INTO public.puente_tipo_funcion VALUES (10, 1, 10, true, true, true, true);
INSERT INTO public.puente_tipo_funcion VALUES (11, 1, 11, true, true, true, true);
INSERT INTO public.puente_tipo_funcion VALUES (12, 1, 12, true, true, true, true);
INSERT INTO public.puente_tipo_funcion VALUES (13, 1, 13, true, true, true, true);
INSERT INTO public.puente_tipo_funcion VALUES (14, 1, 14, true, true, true, true);
INSERT INTO public.puente_tipo_funcion VALUES (15, 1, 15, true, true, true, true);
INSERT INTO public.puente_tipo_funcion VALUES (16, 1, 16, true, true, true, true);
INSERT INTO public.puente_tipo_funcion VALUES (17, 1, 17, true, true, true, true);
INSERT INTO public.puente_tipo_funcion VALUES (18, 1, 18, true, true, true, true);
INSERT INTO public.puente_tipo_funcion VALUES (19, 1, 19, true, true, true, true);
INSERT INTO public.puente_tipo_funcion VALUES (20, 1, 20, true, true, true, true);
INSERT INTO public.puente_tipo_funcion VALUES (21, 1, 21, true, true, true, true);
INSERT INTO public.puente_tipo_funcion VALUES (22, 1, 22, true, true, true, true);
INSERT INTO public.puente_tipo_funcion VALUES (23, 1, 23, true, true, true, true);
INSERT INTO public.puente_tipo_funcion VALUES (24, 1, 24, true, true, true, true);
INSERT INTO public.puente_tipo_funcion VALUES (25, 2, 1, true, true, true, true);
INSERT INTO public.puente_tipo_funcion VALUES (26, 2, 5, true, true, true, true);
INSERT INTO public.puente_tipo_funcion VALUES (27, 2, 6, true, true, true, true);
INSERT INTO public.puente_tipo_funcion VALUES (28, 2, 8, true, true, true, true);
INSERT INTO public.puente_tipo_funcion VALUES (29, 2, 9, true, true, true, true);
INSERT INTO public.puente_tipo_funcion VALUES (30, 2, 10, true, true, true, true);
INSERT INTO public.puente_tipo_funcion VALUES (31, 2, 23, true, true, true, true);
INSERT INTO public.puente_tipo_funcion VALUES (32, 3, 19, true, true, true, true);
INSERT INTO public.puente_tipo_funcion VALUES (33, 4, 19, false, true, true, false);
INSERT INTO public.puente_tipo_funcion VALUES (34, 5, 19, true, true, false, false);
INSERT INTO public.puente_tipo_funcion VALUES (35, 6, 19, true, false, true, false);
INSERT INTO public.puente_tipo_funcion VALUES (36, 7, 19, true, true, true, true);
INSERT INTO public.puente_tipo_funcion VALUES (37, 1, 26, true, true, true, true);
INSERT INTO public.puente_tipo_funcion VALUES (38, 1, 25, true, true, true, true);


--
-- TOC entry 3329 (class 0 OID 36962)
-- Dependencies: 255
-- Data for Name: puente_unidad_propietarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.puente_unidad_propietarios VALUES (1, 'V-9602345', 1, '2020-05-31', NULL, 1, true);
INSERT INTO public.puente_unidad_propietarios VALUES (3, 'V-7552887', 2, '2020-05-31', NULL, 1, true);
INSERT INTO public.puente_unidad_propietarios VALUES (4, 'V-9602345', 2, '2020-05-31', NULL, 1, true);
INSERT INTO public.puente_unidad_propietarios VALUES (9, 'V-26942316', 1, '2020-05-31', NULL, 1, true);
INSERT INTO public.puente_unidad_propietarios VALUES (10, 'V-7552887', 1, '2020-05-31', NULL, 1, true);
INSERT INTO public.puente_unidad_propietarios VALUES (2, 'V-9602344', 1, '2020-05-31', '2020-05-31', 0, true);
INSERT INTO public.puente_unidad_propietarios VALUES (11, 'V-7552887', 3, '2020-05-31', '2020-05-31', 0, true);
INSERT INTO public.puente_unidad_propietarios VALUES (12, 'V-9602345', 3, '2020-05-31', '2020-05-31', 0, true);
INSERT INTO public.puente_unidad_propietarios VALUES (13, 'V-9602344', 3, '2020-05-31', '2020-05-31', 0, true);
INSERT INTO public.puente_unidad_propietarios VALUES (14, 'V-26942316', 3, '2020-05-31', '2020-05-31', 0, true);
INSERT INTO public.puente_unidad_propietarios VALUES (15, 'V-9602345', 3, '2020-05-31', '2020-05-31', 0, true);
INSERT INTO public.puente_unidad_propietarios VALUES (16, 'V-9602344', 3, '2020-05-31', '2020-05-31', 0, true);
INSERT INTO public.puente_unidad_propietarios VALUES (17, 'V-26942316', 3, '2020-05-31', '2020-05-31', 0, true);
INSERT INTO public.puente_unidad_propietarios VALUES (18, 'V-26942316', 3, '2020-05-31', '2020-05-31', 0, true);
INSERT INTO public.puente_unidad_propietarios VALUES (20, 'V-26942316', 5, '2020-05-31', NULL, 1, true);
INSERT INTO public.puente_unidad_propietarios VALUES (21, 'V-7552887', 5, '2020-05-31', NULL, 1, true);
INSERT INTO public.puente_unidad_propietarios VALUES (22, 'V-9602345', 5, '2020-05-31', NULL, 1, true);
INSERT INTO public.puente_unidad_propietarios VALUES (23, 'V-26942316', 6, '2020-05-31', NULL, 1, true);
INSERT INTO public.puente_unidad_propietarios VALUES (24, 'V-7552887', 6, '2020-05-31', NULL, 1, true);
INSERT INTO public.puente_unidad_propietarios VALUES (25, 'V-26942316', 7, '2020-05-31', NULL, 1, true);
INSERT INTO public.puente_unidad_propietarios VALUES (27, 'V-26942316', 9, '2020-05-31', NULL, 1, true);
INSERT INTO public.puente_unidad_propietarios VALUES (19, 'V-9602345', 3, '2020-05-31', '2020-05-31', 0, true);
INSERT INTO public.puente_unidad_propietarios VALUES (26, 'V-26942316', 8, '2020-05-31', '2020-05-31', 0, true);


--
-- TOC entry 3331 (class 0 OID 36969)
-- Dependencies: 257
-- Data for Name: responsable; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.responsable VALUES ('V-22318938', false);
INSERT INTO public.responsable VALUES ('V-16111353', true);


--
-- TOC entry 3332 (class 0 OID 36973)
-- Dependencies: 258
-- Data for Name: sancion; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.sancion VALUES (80, 'Multa', 5, 2020, 1000, 'nu', 'Procesado');
INSERT INTO public.sancion VALUES (82, 'Multa', 5, 2020, 100, 'nu', 'Procesado');
INSERT INTO public.sancion VALUES (81, 'Multa', 5, 2020, 1000, 'nu', 'Procesado');
INSERT INTO public.sancion VALUES (83, 'Multa', 6, 2020, 1000, 'nu', 'Pendiente');
INSERT INTO public.sancion VALUES (84, 'Multa', 6, 2020, 2000, 'dfsdf', 'Pendiente');


--
-- TOC entry 3334 (class 0 OID 36978)
-- Dependencies: 260
-- Data for Name: tipo_unidad; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tipo_unidad VALUES (1, 80, 'Esquina', true);
INSERT INTO public.tipo_unidad VALUES (3, 500, 'Mediano', true);
INSERT INTO public.tipo_unidad VALUES (5, 100, 'Pequeño', true);
INSERT INTO public.tipo_unidad VALUES (2, 85, 'No esquina', true);


--
-- TOC entry 3336 (class 0 OID 36984)
-- Dependencies: 262
-- Data for Name: tipo_usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tipo_usuario VALUES (1, 'Administrador');
INSERT INTO public.tipo_usuario VALUES (2, 'prueba 1');
INSERT INTO public.tipo_usuario VALUES (3, 'prueba 2 ');
INSERT INTO public.tipo_usuario VALUES (4, 'prueba 3');
INSERT INTO public.tipo_usuario VALUES (5, 'prueba4');
INSERT INTO public.tipo_usuario VALUES (6, 'prueba5');
INSERT INTO public.tipo_usuario VALUES (7, 'prueba 6');


--
-- TOC entry 3338 (class 0 OID 36992)
-- Dependencies: 264
-- Data for Name: unidad; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.unidad VALUES (3, '33', '33', 'lkhkljbhkj', false, 5, 0.06872852146625519);
INSERT INTO public.unidad VALUES (8, 'zxcz', 'zxcz', 'zxzxc', false, 3, 0.36900368332862854);
INSERT INTO public.unidad VALUES (5, '2342', 'sdfsdf', 'sdfdsf', true, 1, 0.08743169158697128);
INSERT INTO public.unidad VALUES (2, '11', '5555', 'kjgkb', true, 1, 0.08743169158697128);
INSERT INTO public.unidad VALUES (9, 'dsfs', 'sdfs', 'sdfsd', true, 3, 0.5464481115341187);
INSERT INTO public.unidad VALUES (7, 'sdfsdf', 'sdfs', 'sdfsdf', true, 2, 0.09289617836475372);
INSERT INTO public.unidad VALUES (6, 'sdfdsfs', 'sdfs', 'sdfsf', true, 2, 0.09289617836475372);
INSERT INTO public.unidad VALUES (1, '22', '3333', 'kvkgh', true, 2, 0.09289617836475372);


--
-- TOC entry 3340 (class 0 OID 36998)
-- Dependencies: 266
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.usuario VALUES (1, 'Ingresar Usuario', '455831477b82574f6bf871193f2f761d', 'pregunta', 'respuesta', NULL, 1, true);
INSERT INTO public.usuario VALUES (2, 'ansua92', '628bfed9ce559d754c3eabcfca44366b', 'hola', 'chao', 'V-22318939', 2, true);
INSERT INTO public.usuario VALUES (3, 'jhensu', '628bfed9ce559d754c3eabcfca44366b', 'hola', 'chao', 'V-22318938', 3, true);
INSERT INTO public.usuario VALUES (4, 'jhos', '426fd6712d44e2dee024ca47bb9ccfca', 'hhh', 'hhh', 'V-11276626', 4, true);
INSERT INTO public.usuario VALUES (5, 'yan', '911f6332e7f90b94b87f15377263995c', 'yan', 'yan', 'V-9602344', 5, true);
INSERT INTO public.usuario VALUES (6, 'coro', 'bd721a246bd2c364e6bc6c1daa4503de', 'coro', 'coro', 'V-9602345', 6, true);
INSERT INTO public.usuario VALUES (7, 'hilda', 'ad31b478525413f0b1b1d8bf0aebeb7c', 'hilda', 'hilda', 'V-7552887', 7, true);


--
-- TOC entry 3342 (class 0 OID 37072)
-- Dependencies: 284
-- Data for Name: visita; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.visita VALUES (54, '2020-05-31', '16:36:56', 'dgh', 'dgdfg', 'dasfsa', 'V-26942316', 1);
INSERT INTO public.visita VALUES (55, '2020-05-31', '17:26:15', '565', 'ghgh', 'fgfg', 'V-11276626', 1);
INSERT INTO public.visita VALUES (56, '2020-05-31', '17:32:55', 'ghc', 'gh', 'gh', 'V-14523698', 3);


--
-- TOC entry 3343 (class 0 OID 37077)
-- Dependencies: 285
-- Data for Name: visitante; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.visitante VALUES ('V-26942316', true);
INSERT INTO public.visitante VALUES ('V-11276626', true);
INSERT INTO public.visitante VALUES ('V-23654789', true);
INSERT INTO public.visitante VALUES ('V-14523698', true);
INSERT INTO public.visitante VALUES ('V-12365478', true);


--
-- TOC entry 3381 (class 0 OID 0)
-- Dependencies: 203
-- Name: asambleas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.asambleas_id_seq', 81, true);


--
-- TOC entry 3382 (class 0 OID 0)
-- Dependencies: 205
-- Name: banco_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.banco_id_seq', 1, false);


--
-- TOC entry 3383 (class 0 OID 0)
-- Dependencies: 207
-- Name: categoriagasto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categoriagasto_id_seq', 1, false);


--
-- TOC entry 3384 (class 0 OID 0)
-- Dependencies: 209
-- Name: cierre_de_mes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cierre_de_mes_id_seq', 57, true);


--
-- TOC entry 3385 (class 0 OID 0)
-- Dependencies: 211
-- Name: cobro_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cobro_id_seq', 12, true);


--
-- TOC entry 3386 (class 0 OID 0)
-- Dependencies: 213
-- Name: comunicados_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.comunicados_id_seq', 53, true);


--
-- TOC entry 3387 (class 0 OID 0)
-- Dependencies: 215
-- Name: concepto_gasto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.concepto_gasto_id_seq', 1, false);


--
-- TOC entry 3388 (class 0 OID 0)
-- Dependencies: 219
-- Name: cuenta_pagar_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cuenta_pagar_id_seq', 1, false);


--
-- TOC entry 3389 (class 0 OID 0)
-- Dependencies: 221
-- Name: cuotas_especiales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cuotas_especiales_id_seq', 81, true);


--
-- TOC entry 3390 (class 0 OID 0)
-- Dependencies: 223
-- Name: detalle_pagos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.detalle_pagos_id_seq', 1323, true);


--
-- TOC entry 3391 (class 0 OID 0)
-- Dependencies: 225
-- Name: detalle_total_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.detalle_total_id_seq', 157, true);


--
-- TOC entry 3392 (class 0 OID 0)
-- Dependencies: 227
-- Name: fondos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.fondos_id_seq', 58, true);


--
-- TOC entry 3393 (class 0 OID 0)
-- Dependencies: 229
-- Name: forma_pago_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.forma_pago_id_seq', 1, false);


--
-- TOC entry 3394 (class 0 OID 0)
-- Dependencies: 231
-- Name: funcion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.funcion_id_seq', 26, true);


--
-- TOC entry 3395 (class 0 OID 0)
-- Dependencies: 233
-- Name: gasto_comun_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.gasto_comun_id_seq', 81, true);


--
-- TOC entry 3396 (class 0 OID 0)
-- Dependencies: 235
-- Name: interes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.interes_id_seq', 27, true);


--
-- TOC entry 3397 (class 0 OID 0)
-- Dependencies: 237
-- Name: pagar_cuota_especial_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pagar_cuota_especial_id_seq', 1, false);


--
-- TOC entry 3398 (class 0 OID 0)
-- Dependencies: 242
-- Name: puente_asamblea_propietario_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.puente_asamblea_propietario_id_seq', 258, true);


--
-- TOC entry 3399 (class 0 OID 0)
-- Dependencies: 244
-- Name: puente_cobro_factura_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.puente_cobro_factura_id_seq', 9, true);


--
-- TOC entry 3400 (class 0 OID 0)
-- Dependencies: 246
-- Name: puente_comunicado_usuario_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.puente_comunicado_usuario_id_seq', 503, true);


--
-- TOC entry 3401 (class 0 OID 0)
-- Dependencies: 248
-- Name: puente_concepto_factura_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.puente_concepto_factura_id_seq', 2, true);


--
-- TOC entry 3402 (class 0 OID 0)
-- Dependencies: 250
-- Name: puente_persona_condominio_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.puente_persona_condominio_id_seq', 2, true);


--
-- TOC entry 3403 (class 0 OID 0)
-- Dependencies: 252
-- Name: puente_sancion_unidad_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.puente_sancion_unidad_id_seq', 197, true);


--
-- TOC entry 3404 (class 0 OID 0)
-- Dependencies: 254
-- Name: puente_tipo_funcion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.puente_tipo_funcion_id_seq', 38, true);


--
-- TOC entry 3405 (class 0 OID 0)
-- Dependencies: 256
-- Name: puente_unidad_propietarios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.puente_unidad_propietarios_id_seq', 27, true);


--
-- TOC entry 3406 (class 0 OID 0)
-- Dependencies: 259
-- Name: sancion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sancion_id_seq', 84, true);


--
-- TOC entry 3407 (class 0 OID 0)
-- Dependencies: 261
-- Name: tipo_unidad_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tipo_unidad_id_seq', 5, true);


--
-- TOC entry 3408 (class 0 OID 0)
-- Dependencies: 263
-- Name: tipo_usuario_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tipo_usuario_id_seq', 7, true);


--
-- TOC entry 3409 (class 0 OID 0)
-- Dependencies: 265
-- Name: unidad_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.unidad_id_seq', 9, true);


--
-- TOC entry 3410 (class 0 OID 0)
-- Dependencies: 267
-- Name: usuario_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.usuario_id_seq', 7, true);


--
-- TOC entry 3411 (class 0 OID 0)
-- Dependencies: 288
-- Name: visita_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.visita_id_seq', 56, true);


--
-- TOC entry 3030 (class 2606 OID 37124)
-- Name: asambleas asambleas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.asambleas
    ADD CONSTRAINT asambleas_pkey PRIMARY KEY (id);


--
-- TOC entry 3032 (class 2606 OID 37126)
-- Name: banco banco_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.banco
    ADD CONSTRAINT banco_pkey PRIMARY KEY (id);


--
-- TOC entry 3034 (class 2606 OID 37128)
-- Name: cierre_de_mes cierre_de_mes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cierre_de_mes
    ADD CONSTRAINT cierre_de_mes_pkey PRIMARY KEY (id);


--
-- TOC entry 3036 (class 2606 OID 37130)
-- Name: cobro_unidad cobro_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cobro_unidad
    ADD CONSTRAINT cobro_pkey PRIMARY KEY (id);


--
-- TOC entry 3038 (class 2606 OID 37132)
-- Name: comunicados comunicados_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comunicados
    ADD CONSTRAINT comunicados_pkey PRIMARY KEY (id);


--
-- TOC entry 3040 (class 2606 OID 37134)
-- Name: condominio condominio_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.condominio
    ADD CONSTRAINT condominio_pkey PRIMARY KEY (rif);


--
-- TOC entry 3042 (class 2606 OID 37136)
-- Name: condominio condominio_rif_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.condominio
    ADD CONSTRAINT condominio_rif_key UNIQUE (rif);


--
-- TOC entry 3046 (class 2606 OID 37138)
-- Name: cuenta_pagar cuenta_pagar_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cuenta_pagar
    ADD CONSTRAINT cuenta_pagar_pkey PRIMARY KEY (id);


--
-- TOC entry 3044 (class 2606 OID 37140)
-- Name: cuenta cuenta_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cuenta
    ADD CONSTRAINT cuenta_pkey PRIMARY KEY (n_cuenta);


--
-- TOC entry 3048 (class 2606 OID 37142)
-- Name: facturas_proveedores cuotas_especiales_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.facturas_proveedores
    ADD CONSTRAINT cuotas_especiales_pkey PRIMARY KEY (id);


--
-- TOC entry 3050 (class 2606 OID 37144)
-- Name: detalle_pagos detalle_pagos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detalle_pagos
    ADD CONSTRAINT detalle_pagos_pkey PRIMARY KEY (id);


--
-- TOC entry 3052 (class 2606 OID 37146)
-- Name: factura_unidad detalle_total_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factura_unidad
    ADD CONSTRAINT detalle_total_pkey PRIMARY KEY (id);


--
-- TOC entry 3054 (class 2606 OID 37148)
-- Name: fondos fondos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fondos
    ADD CONSTRAINT fondos_pkey PRIMARY KEY (id);


--
-- TOC entry 3056 (class 2606 OID 37150)
-- Name: funcion funcion_funcion_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcion
    ADD CONSTRAINT funcion_funcion_key UNIQUE (funcion);


--
-- TOC entry 3058 (class 2606 OID 37152)
-- Name: funcion funcion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcion
    ADD CONSTRAINT funcion_pkey PRIMARY KEY (id);


--
-- TOC entry 3060 (class 2606 OID 37154)
-- Name: gasto_comun gasto_comun_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gasto_comun
    ADD CONSTRAINT gasto_comun_pkey PRIMARY KEY (id);


--
-- TOC entry 3062 (class 2606 OID 37156)
-- Name: interes interes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.interes
    ADD CONSTRAINT interes_pkey PRIMARY KEY (id);


--
-- TOC entry 3064 (class 2606 OID 37158)
-- Name: pagar_cuota_especial pagar_cuota_especial_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pagar_cuota_especial
    ADD CONSTRAINT pagar_cuota_especial_pkey PRIMARY KEY (id);


--
-- TOC entry 3066 (class 2606 OID 37160)
-- Name: persona persona_correo_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_correo_key UNIQUE (correo);


--
-- TOC entry 3068 (class 2606 OID 37162)
-- Name: persona persona_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_pkey PRIMARY KEY (cedula);


--
-- TOC entry 3070 (class 2606 OID 37164)
-- Name: persona persona_telefono_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_telefono_key UNIQUE (telefono);


--
-- TOC entry 3072 (class 2606 OID 37166)
-- Name: propietario propietario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.propietario
    ADD CONSTRAINT propietario_pkey PRIMARY KEY (ci_persona);


--
-- TOC entry 3074 (class 2606 OID 37168)
-- Name: proveedores proveedores_nombre_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.proveedores
    ADD CONSTRAINT proveedores_nombre_key UNIQUE (nombre);


--
-- TOC entry 3076 (class 2606 OID 37170)
-- Name: proveedores proveedores_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.proveedores
    ADD CONSTRAINT proveedores_pkey PRIMARY KEY (cedula);


--
-- TOC entry 3078 (class 2606 OID 37172)
-- Name: puente_asamblea_propietario puente_asamblea_propietario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.puente_asamblea_propietario
    ADD CONSTRAINT puente_asamblea_propietario_pkey PRIMARY KEY (id);


--
-- TOC entry 3080 (class 2606 OID 37174)
-- Name: puente_cobro_factura puente_cobro_factura_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.puente_cobro_factura
    ADD CONSTRAINT puente_cobro_factura_pkey PRIMARY KEY (id);


--
-- TOC entry 3082 (class 2606 OID 37176)
-- Name: puente_comunicado_usuario puente_comunicado_usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.puente_comunicado_usuario
    ADD CONSTRAINT puente_comunicado_usuario_pkey PRIMARY KEY (id);


--
-- TOC entry 3084 (class 2606 OID 37178)
-- Name: puente_concepto_factura puente_concepto_factura_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.puente_concepto_factura
    ADD CONSTRAINT puente_concepto_factura_pkey PRIMARY KEY (id);


--
-- TOC entry 3086 (class 2606 OID 37180)
-- Name: puente_persona_condominio puente_persona_condominio_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.puente_persona_condominio
    ADD CONSTRAINT puente_persona_condominio_pkey PRIMARY KEY (id);


--
-- TOC entry 3088 (class 2606 OID 37182)
-- Name: puente_sancion_unidad puente_sancion_unidad_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.puente_sancion_unidad
    ADD CONSTRAINT puente_sancion_unidad_pkey PRIMARY KEY (id);


--
-- TOC entry 3090 (class 2606 OID 37184)
-- Name: puente_tipo_funcion puente_tipo_funcion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.puente_tipo_funcion
    ADD CONSTRAINT puente_tipo_funcion_pkey PRIMARY KEY (id);


--
-- TOC entry 3092 (class 2606 OID 37186)
-- Name: puente_unidad_propietarios puente_unidad_propietarios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.puente_unidad_propietarios
    ADD CONSTRAINT puente_unidad_propietarios_pkey PRIMARY KEY (id);


--
-- TOC entry 3094 (class 2606 OID 37188)
-- Name: responsable responsable_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.responsable
    ADD CONSTRAINT responsable_pkey PRIMARY KEY (ci_persona);


--
-- TOC entry 3096 (class 2606 OID 37190)
-- Name: sancion sancion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sancion
    ADD CONSTRAINT sancion_pkey PRIMARY KEY (id);


--
-- TOC entry 3098 (class 2606 OID 37192)
-- Name: tipo_unidad tipo_unidad_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipo_unidad
    ADD CONSTRAINT tipo_unidad_pkey PRIMARY KEY (id);


--
-- TOC entry 3100 (class 2606 OID 37194)
-- Name: tipo_usuario tipo_usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipo_usuario
    ADD CONSTRAINT tipo_usuario_pkey PRIMARY KEY (id);


--
-- TOC entry 3102 (class 2606 OID 37196)
-- Name: tipo_usuario tipo_usuario_tipo_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipo_usuario
    ADD CONSTRAINT tipo_usuario_tipo_key UNIQUE (tipo);


--
-- TOC entry 3104 (class 2606 OID 37198)
-- Name: unidad unidad_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.unidad
    ADD CONSTRAINT unidad_pkey PRIMARY KEY (id);


--
-- TOC entry 3106 (class 2606 OID 37200)
-- Name: usuario usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id);


--
-- TOC entry 3108 (class 2606 OID 37202)
-- Name: usuario usuario_usuario_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_usuario_key UNIQUE (usuario);


--
-- TOC entry 3110 (class 2606 OID 37204)
-- Name: visita visita_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.visita
    ADD CONSTRAINT visita_pkey PRIMARY KEY (id);


--
-- TOC entry 3112 (class 2606 OID 37206)
-- Name: visitante visitante_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.visitante
    ADD CONSTRAINT visitante_pkey PRIMARY KEY (ci_persona);


--
-- TOC entry 3113 (class 2606 OID 37207)
-- Name: cuenta cuenta_ci_persona_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cuenta
    ADD CONSTRAINT cuenta_ci_persona_fkey FOREIGN KEY (ci_persona) REFERENCES public.persona(cedula);


--
-- TOC entry 3114 (class 2606 OID 37212)
-- Name: cuenta cuenta_id_banco_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cuenta
    ADD CONSTRAINT cuenta_id_banco_fkey FOREIGN KEY (id_banco) REFERENCES public.banco(id);


--
-- TOC entry 3116 (class 2606 OID 37217)
-- Name: cuenta_pagar cuenta_pagar_id_fondo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cuenta_pagar
    ADD CONSTRAINT cuenta_pagar_id_fondo_fkey FOREIGN KEY (id_fondo) REFERENCES public.fondos(id);


--
-- TOC entry 3117 (class 2606 OID 37222)
-- Name: cuenta_pagar cuenta_pagar_id_proveedor_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cuenta_pagar
    ADD CONSTRAINT cuenta_pagar_id_proveedor_fkey FOREIGN KEY (id_proveedor) REFERENCES public.proveedores(cedula);


--
-- TOC entry 3115 (class 2606 OID 37227)
-- Name: cuenta cuenta_rif_condominio_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cuenta
    ADD CONSTRAINT cuenta_rif_condominio_fkey FOREIGN KEY (rif_condominio) REFERENCES public.condominio(rif);


--
-- TOC entry 3118 (class 2606 OID 37232)
-- Name: pagar_cuota_especial pagar_cuota_especial_id_fondo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pagar_cuota_especial
    ADD CONSTRAINT pagar_cuota_especial_id_fondo_fkey FOREIGN KEY (id_fondo) REFERENCES public.fondos(id);


--
-- TOC entry 3119 (class 2606 OID 37237)
-- Name: propietario propietario_ci_persona_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.propietario
    ADD CONSTRAINT propietario_ci_persona_fkey FOREIGN KEY (ci_persona) REFERENCES public.persona(cedula);


--
-- TOC entry 3120 (class 2606 OID 37242)
-- Name: puente_persona_condominio puente_persona_condominio_ci_persona_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.puente_persona_condominio
    ADD CONSTRAINT puente_persona_condominio_ci_persona_fkey FOREIGN KEY (ci_persona) REFERENCES public.persona(cedula);


--
-- TOC entry 3121 (class 2606 OID 37247)
-- Name: puente_persona_condominio puente_persona_condominio_rif_condominio_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.puente_persona_condominio
    ADD CONSTRAINT puente_persona_condominio_rif_condominio_fkey FOREIGN KEY (rif_condominio) REFERENCES public.condominio(rif);


--
-- TOC entry 3122 (class 2606 OID 37252)
-- Name: puente_tipo_funcion puente_tipo_funcion_id_funcion_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.puente_tipo_funcion
    ADD CONSTRAINT puente_tipo_funcion_id_funcion_fkey FOREIGN KEY (id_funcion) REFERENCES public.funcion(id);


--
-- TOC entry 3123 (class 2606 OID 37257)
-- Name: puente_tipo_funcion puente_tipo_funcion_id_tipo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.puente_tipo_funcion
    ADD CONSTRAINT puente_tipo_funcion_id_tipo_fkey FOREIGN KEY (id_tipo) REFERENCES public.tipo_usuario(id);


--
-- TOC entry 3124 (class 2606 OID 37262)
-- Name: puente_unidad_propietarios puente_unidad_propietarios_ci_propietario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.puente_unidad_propietarios
    ADD CONSTRAINT puente_unidad_propietarios_ci_propietario_fkey FOREIGN KEY (ci_propietario) REFERENCES public.propietario(ci_persona);


--
-- TOC entry 3125 (class 2606 OID 37267)
-- Name: puente_unidad_propietarios puente_unidad_propietarios_id_unidad_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.puente_unidad_propietarios
    ADD CONSTRAINT puente_unidad_propietarios_id_unidad_fkey FOREIGN KEY (id_unidad) REFERENCES public.unidad(id);


--
-- TOC entry 3126 (class 2606 OID 37272)
-- Name: responsable responsable_ci_persona_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.responsable
    ADD CONSTRAINT responsable_ci_persona_fkey FOREIGN KEY (ci_persona) REFERENCES public.persona(cedula);


--
-- TOC entry 3127 (class 2606 OID 37277)
-- Name: unidad unidad_id_tipo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.unidad
    ADD CONSTRAINT unidad_id_tipo_fkey FOREIGN KEY (id_tipo) REFERENCES public.tipo_unidad(id);


--
-- TOC entry 3128 (class 2606 OID 37282)
-- Name: usuario usuario_ci_persona_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_ci_persona_fkey FOREIGN KEY (ci_persona) REFERENCES public.persona(cedula);


--
-- TOC entry 3129 (class 2606 OID 37287)
-- Name: usuario usuario_id_tipo_usuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_id_tipo_usuario_fkey FOREIGN KEY (id_tipo_usuario) REFERENCES public.tipo_usuario(id);


--
-- TOC entry 3130 (class 2606 OID 37292)
-- Name: visita visita_id_unidad_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.visita
    ADD CONSTRAINT visita_id_unidad_fkey FOREIGN KEY (id_unidad) REFERENCES public.unidad(id) NOT VALID;


--
-- TOC entry 3131 (class 2606 OID 37297)
-- Name: visitante visitante_ci_persona_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.visitante
    ADD CONSTRAINT visitante_ci_persona_fkey FOREIGN KEY (ci_persona) REFERENCES public.persona(cedula);


-- Completed on 2020-05-31 22:12:38

--
-- PostgreSQL database dump complete
--

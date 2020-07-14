
--
-- TOC entry 301 (class 1255 OID 88978)
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
-- TOC entry 302 (class 1255 OID 88979)
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
-- TOC entry 303 (class 1255 OID 88980)
-- Name: cambiar_clave(character varying, character varying, character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.cambiar_clave(usuario2 character varying, password_nuevo character varying, password_actual character varying) RETURNS boolean
    LANGUAGE plpgsql
    AS $$ 
DECLARE
	password_bd character varying;
	usuario_bd character varying;

BEGIN
		usuario_bd := (SELECT usuario FROM usuario where usuario=usuario2 AND password=password_actual);
		password_bd := (SELECT password FROM usuario where usuario=usuario2 AND password=password_actual);
	
	IF password_actual = password_bd AND usuario2 = usuario_bd THEN
		UPDATE usuario SET password = password_nuevo WHERE usuario = usuario2;
		RETURN TRUE;
	
	ELSE 
		RETURN FALSE;
		
	END IF;
	END;
$$;


ALTER FUNCTION public.cambiar_clave(usuario2 character varying, password_nuevo character varying, password_actual character varying) OWNER TO postgres;

--
-- TOC entry 304 (class 1255 OID 88981)
-- Name: cambiar_pregunta(character varying, character varying, character varying, character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.cambiar_pregunta(usuario2 character varying, pregunta2 character varying, respuesta2 character varying, password2 character varying) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
DECLARE
	password_bd character varying;
	usuario_bd character varying;

BEGIN
	usuario_bd := (SELECT usuario FROM usuario where usuario=usuario2 AND password=password2);
	password_bd := (SELECT password FROM usuario where usuario=usuario2 AND password=password2);
	
	IF password2 = password_bd AND usuario2 = usuario_bd THEN
		UPDATE usuario SET pregunta = pregunta2, respuesta = respuesta2 WHERE usuario = usuario2;
		RETURN TRUE;
	
	ELSE 
		RETURN FALSE;
		
	END IF;
	END;
$$;


ALTER FUNCTION public.cambiar_pregunta(usuario2 character varying, pregunta2 character varying, respuesta2 character varying, password2 character varying) OWNER TO postgres;

--
-- TOC entry 305 (class 1255 OID 88982)
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
-- TOC entry 307 (class 1255 OID 89681)
-- Name: pagar_gasto(integer, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.pagar_gasto(id2 integer, monto2 double precision) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
	saldo_bd double precision;
BEGIN
	UPDATE gasto SET saldo = saldo - monto2 WHERE id = id2;
	
	saldo_bd := (SELECT saldo FROM gasto WHERE id = id2);

	IF saldo_bd = 0 THEN
		UPDATE gasto SET pagado = 'Pagado' WHERE id = id2;
	END IF;
END;
$$;


ALTER FUNCTION public.pagar_gasto(id2 integer, monto2 double precision) OWNER TO postgres;

--
-- TOC entry 306 (class 1255 OID 88983)
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
-- TOC entry 202 (class 1259 OID 88984)
-- Name: asambleas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.asambleas (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL,
    fecha date NOT NULL,
    descripcion text NOT NULL
);


ALTER TABLE public.asambleas OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 88990)
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
-- TOC entry 3442 (class 0 OID 0)
-- Dependencies: 203
-- Name: asambleas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.asambleas_id_seq OWNED BY public.asambleas.id;


--
-- TOC entry 204 (class 1259 OID 88992)
-- Name: banco; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.banco (
    id integer NOT NULL,
    nombre_banco character varying(100) NOT NULL,
    activo boolean
);


ALTER TABLE public.banco OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 88995)
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
-- TOC entry 3443 (class 0 OID 0)
-- Dependencies: 205
-- Name: banco_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.banco_id_seq OWNED BY public.banco.id;


--
-- TOC entry 206 (class 1259 OID 88997)
-- Name: categoriagasto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categoriagasto (
    id integer NOT NULL,
    nombre character varying(120) NOT NULL,
    descripcion character varying(120) NOT NULL,
    activo boolean DEFAULT true NOT NULL
);


ALTER TABLE public.categoriagasto OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 89001)
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
-- TOC entry 3444 (class 0 OID 0)
-- Dependencies: 207
-- Name: categoriagasto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.categoriagasto_id_seq OWNED BY public.categoriagasto.id;


--
-- TOC entry 208 (class 1259 OID 89003)
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
    id_unidad bigint,
    moneda character varying,
    paridad double precision
);


ALTER TABLE public.cobro_unidad OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 89009)
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
-- TOC entry 3445 (class 0 OID 0)
-- Dependencies: 209
-- Name: cobro_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cobro_id_seq OWNED BY public.cobro_unidad.id;


--
-- TOC entry 210 (class 1259 OID 89011)
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
-- TOC entry 211 (class 1259 OID 89017)
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
-- TOC entry 3446 (class 0 OID 0)
-- Dependencies: 211
-- Name: comunicados_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.comunicados_id_seq OWNED BY public.comunicados.id;


--
-- TOC entry 212 (class 1259 OID 89019)
-- Name: concepto_gasto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.concepto_gasto (
    id integer NOT NULL,
    nom_concepto character varying(120) NOT NULL,
    descripcion character varying(120) NOT NULL,
    id_categoria integer NOT NULL,
    activo boolean DEFAULT true NOT NULL
);


ALTER TABLE public.concepto_gasto OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 89023)
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
-- TOC entry 3447 (class 0 OID 0)
-- Dependencies: 213
-- Name: concepto_gasto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.concepto_gasto_id_seq OWNED BY public.concepto_gasto.id;


--
-- TOC entry 214 (class 1259 OID 89025)
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
-- TOC entry 215 (class 1259 OID 89029)
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
-- TOC entry 295 (class 1259 OID 89637)
-- Name: cuenta_pagar; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cuenta_pagar (
    id integer NOT NULL,
    num_ref character varying(10),
    descripcion character varying(60) NOT NULL,
    monto double precision NOT NULL,
    fecha date NOT NULL,
    moneda character varying(10) NOT NULL,
    tasa_cambio double precision,
    id_forma_pago integer NOT NULL,
    id_gasto integer NOT NULL,
    n_cuenta character varying(20),
    id_fondo integer NOT NULL
);


ALTER TABLE public.cuenta_pagar OWNER TO postgres;

--
-- TOC entry 294 (class 1259 OID 89635)
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
-- TOC entry 3448 (class 0 OID 0)
-- Dependencies: 294
-- Name: cuenta_pagar_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cuenta_pagar_id_seq OWNED BY public.cuenta_pagar.id;


--
-- TOC entry 216 (class 1259 OID 89038)
-- Name: detalle_pagos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.detalle_pagos (
    id integer NOT NULL,
    mes bigint NOT NULL,
    anio bigint NOT NULL,
    monto_dolar double precision NOT NULL,
    id_gasto bigint,
    id_unidad bigint,
    tipo_gasto character varying,
    monto_bolivar double precision,
    paridad double precision,
    moneda_dominante character varying,
    saldo_restante_bolivar double precision,
    saldo_restante_dolar double precision
);


ALTER TABLE public.detalle_pagos OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 89044)
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
-- TOC entry 3449 (class 0 OID 0)
-- Dependencies: 217
-- Name: detalle_pagos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.detalle_pagos_id_seq OWNED BY public.detalle_pagos.id;


--
-- TOC entry 218 (class 1259 OID 89046)
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
    moneda character varying,
    activo boolean DEFAULT true NOT NULL
);


ALTER TABLE public.fondos OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 89053)
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
-- TOC entry 3450 (class 0 OID 0)
-- Dependencies: 219
-- Name: fondos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.fondos_id_seq OWNED BY public.fondos.id;


--
-- TOC entry 220 (class 1259 OID 89055)
-- Name: forma_pago; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.forma_pago (
    id integer NOT NULL,
    forma_pago character varying NOT NULL,
    activo boolean DEFAULT true NOT NULL
);


ALTER TABLE public.forma_pago OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 89061)
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
-- TOC entry 3451 (class 0 OID 0)
-- Dependencies: 221
-- Name: forma_pago_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.forma_pago_id_seq OWNED BY public.forma_pago.id;


--
-- TOC entry 222 (class 1259 OID 89063)
-- Name: funcion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.funcion (
    id integer NOT NULL,
    funcion character varying NOT NULL
);


ALTER TABLE public.funcion OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 89069)
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
-- TOC entry 3452 (class 0 OID 0)
-- Dependencies: 223
-- Name: funcion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.funcion_id_seq OWNED BY public.funcion.id;


--
-- TOC entry 293 (class 1259 OID 89607)
-- Name: gasto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.gasto (
    id integer NOT NULL,
    nombre character varying(50) NOT NULL,
    tipo character varying(20) NOT NULL,
    id_proveedor character varying(15) NOT NULL,
    calcular_por character varying(20) NOT NULL,
    mes integer NOT NULL,
    anio integer NOT NULL,
    n_meses integer NOT NULL,
    id_asamblea integer,
    observacion text DEFAULT ''::text,
    meses_restantes integer NOT NULL,
    monto double precision NOT NULL,
    saldo double precision NOT NULL,
    estado character varying DEFAULT 'Pendiente'::character varying NOT NULL,
    pagado character varying DEFAULT 'Pendiente'::character varying NOT NULL,
    moneda character varying NOT NULL
);


ALTER TABLE public.gasto OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 89079)
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
-- TOC entry 225 (class 1259 OID 89082)
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
-- TOC entry 3453 (class 0 OID 0)
-- Dependencies: 225
-- Name: gasto_comun_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.gasto_comun_id_seq OWNED BY public.gasto_comun.id;


--
-- TOC entry 292 (class 1259 OID 89605)
-- Name: gasto_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.gasto_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.gasto_id_seq OWNER TO postgres;

--
-- TOC entry 3454 (class 0 OID 0)
-- Dependencies: 292
-- Name: gasto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.gasto_id_seq OWNED BY public.gasto.id;


--
-- TOC entry 226 (class 1259 OID 89086)
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
-- TOC entry 227 (class 1259 OID 89089)
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
-- TOC entry 3455 (class 0 OID 0)
-- Dependencies: 227
-- Name: interes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.interes_id_seq OWNED BY public.interes.id;


--
-- TOC entry 228 (class 1259 OID 89091)
-- Name: mensaje; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mensaje (
    id integer NOT NULL,
    asunto character varying(60) DEFAULT 'Sin Asunto'::character varying,
    contenido character varying(420) NOT NULL,
    emisor integer NOT NULL,
    fecha timestamp without time zone DEFAULT LOCALTIMESTAMP(0) NOT NULL
);


ALTER TABLE public.mensaje OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 89096)
-- Name: mensaje_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.mensaje_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mensaje_id_seq OWNER TO postgres;

--
-- TOC entry 3456 (class 0 OID 0)
-- Dependencies: 229
-- Name: mensaje_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.mensaje_id_seq OWNED BY public.mensaje.id;


--
-- TOC entry 230 (class 1259 OID 89098)
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
-- TOC entry 231 (class 1259 OID 89104)
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
-- TOC entry 3457 (class 0 OID 0)
-- Dependencies: 231
-- Name: pagar_cuota_especial_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pagar_cuota_especial_id_seq OWNED BY public.pagar_cuota_especial.id;


--
-- TOC entry 232 (class 1259 OID 89106)
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
-- TOC entry 233 (class 1259 OID 89112)
-- Name: propietario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.propietario (
    ci_persona character varying(10) NOT NULL,
    activo boolean DEFAULT true
);


ALTER TABLE public.propietario OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 89116)
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
-- TOC entry 235 (class 1259 OID 89122)
-- Name: puente_asambleas_propietario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.puente_asambleas_propietario (
    id integer NOT NULL,
    id_asamblea bigint NOT NULL,
    ci_propietario character varying(10) NOT NULL
);


ALTER TABLE public.puente_asambleas_propietario OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 89125)
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
-- TOC entry 3458 (class 0 OID 0)
-- Dependencies: 236
-- Name: puente_asamblea_propietario_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.puente_asamblea_propietario_id_seq OWNED BY public.puente_asambleas_propietario.id;


--
-- TOC entry 237 (class 1259 OID 89127)
-- Name: puente_cobro_factura; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.puente_cobro_factura (
    id integer NOT NULL,
    id_detalle_pagos bigint NOT NULL,
    id_cobro bigint NOT NULL,
    parte_monto double precision NOT NULL,
    moneda character varying
);


ALTER TABLE public.puente_cobro_factura OWNER TO postgres;

--
-- TOC entry 238 (class 1259 OID 89133)
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
-- TOC entry 3459 (class 0 OID 0)
-- Dependencies: 238
-- Name: puente_cobro_factura_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.puente_cobro_factura_id_seq OWNED BY public.puente_cobro_factura.id;


--
-- TOC entry 239 (class 1259 OID 89135)
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
-- TOC entry 240 (class 1259 OID 89141)
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
-- TOC entry 3460 (class 0 OID 0)
-- Dependencies: 240
-- Name: puente_comunicado_usuario_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.puente_comunicado_usuario_id_seq OWNED BY public.puente_comunicado_usuario.id;


--
-- TOC entry 241 (class 1259 OID 89143)
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
-- TOC entry 242 (class 1259 OID 89146)
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
-- TOC entry 3461 (class 0 OID 0)
-- Dependencies: 242
-- Name: puente_concepto_factura_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.puente_concepto_factura_id_seq OWNED BY public.puente_concepto_factura.id;


--
-- TOC entry 297 (class 1259 OID 89665)
-- Name: puente_gasto_concepto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.puente_gasto_concepto (
    id integer NOT NULL,
    id_gasto integer,
    id_concepto integer,
    monto double precision NOT NULL
);


ALTER TABLE public.puente_gasto_concepto OWNER TO postgres;

--
-- TOC entry 296 (class 1259 OID 89663)
-- Name: puente_gasto_concepto_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.puente_gasto_concepto_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.puente_gasto_concepto_id_seq OWNER TO postgres;

--
-- TOC entry 3462 (class 0 OID 0)
-- Dependencies: 296
-- Name: puente_gasto_concepto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.puente_gasto_concepto_id_seq OWNED BY public.puente_gasto_concepto.id;


--
-- TOC entry 243 (class 1259 OID 89153)
-- Name: puente_mensaje_usuario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.puente_mensaje_usuario (
    id integer NOT NULL,
    id_mensaje integer NOT NULL,
    receptor integer NOT NULL,
    leido boolean DEFAULT false NOT NULL,
    activo boolean DEFAULT true
);


ALTER TABLE public.puente_mensaje_usuario OWNER TO postgres;

--
-- TOC entry 244 (class 1259 OID 89158)
-- Name: puente_mensaje_usuario_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.puente_mensaje_usuario_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.puente_mensaje_usuario_id_seq OWNER TO postgres;

--
-- TOC entry 3463 (class 0 OID 0)
-- Dependencies: 244
-- Name: puente_mensaje_usuario_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.puente_mensaje_usuario_id_seq OWNED BY public.puente_mensaje_usuario.id;


--
-- TOC entry 245 (class 1259 OID 89160)
-- Name: puente_persona_condominio; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.puente_persona_condominio (
    id integer NOT NULL,
    ci_persona character varying(10) NOT NULL,
    rif_condominio character varying(15) NOT NULL
);


ALTER TABLE public.puente_persona_condominio OWNER TO postgres;

--
-- TOC entry 246 (class 1259 OID 89163)
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
-- TOC entry 3464 (class 0 OID 0)
-- Dependencies: 246
-- Name: puente_persona_condominio_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.puente_persona_condominio_id_seq OWNED BY public.puente_persona_condominio.id;


--
-- TOC entry 247 (class 1259 OID 89165)
-- Name: puente_sancion_unidad; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.puente_sancion_unidad (
    id bigint NOT NULL,
    id_sancion bigint NOT NULL,
    id_unidad bigint
);


ALTER TABLE public.puente_sancion_unidad OWNER TO postgres;

--
-- TOC entry 248 (class 1259 OID 89168)
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
-- TOC entry 3465 (class 0 OID 0)
-- Dependencies: 248
-- Name: puente_sancion_unidad_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.puente_sancion_unidad_id_seq OWNED BY public.puente_sancion_unidad.id;


--
-- TOC entry 249 (class 1259 OID 89170)
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
-- TOC entry 250 (class 1259 OID 89173)
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
-- TOC entry 3466 (class 0 OID 0)
-- Dependencies: 250
-- Name: puente_tipo_funcion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.puente_tipo_funcion_id_seq OWNED BY public.puente_tipo_funcion.id;


--
-- TOC entry 251 (class 1259 OID 89175)
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
-- TOC entry 252 (class 1259 OID 89180)
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
-- TOC entry 3467 (class 0 OID 0)
-- Dependencies: 252
-- Name: puente_unidad_propietarios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.puente_unidad_propietarios_id_seq OWNED BY public.puente_unidad_propietarios.id;


--
-- TOC entry 253 (class 1259 OID 89182)
-- Name: responsable; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.responsable (
    ci_persona character varying(10) NOT NULL,
    activo boolean DEFAULT true
);


ALTER TABLE public.responsable OWNER TO postgres;

--
-- TOC entry 254 (class 1259 OID 89186)
-- Name: sancion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sancion (
    id integer NOT NULL,
    tipo character varying(40) NOT NULL,
    mes bigint NOT NULL,
    anio bigint NOT NULL,
    monto double precision NOT NULL,
    descripcion character varying(200) NOT NULL,
    estado character varying(20),
    moneda character varying(10)
);


ALTER TABLE public.sancion OWNER TO postgres;

--
-- TOC entry 255 (class 1259 OID 89189)
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
-- TOC entry 3468 (class 0 OID 0)
-- Dependencies: 255
-- Name: sancion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sancion_id_seq OWNED BY public.sancion.id;


--
-- TOC entry 256 (class 1259 OID 89191)
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
-- TOC entry 257 (class 1259 OID 89195)
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
-- TOC entry 3469 (class 0 OID 0)
-- Dependencies: 257
-- Name: tipo_unidad_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tipo_unidad_id_seq OWNED BY public.tipo_unidad.id;


--
-- TOC entry 258 (class 1259 OID 89197)
-- Name: tipo_usuario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tipo_usuario (
    id integer NOT NULL,
    tipo character varying NOT NULL
);


ALTER TABLE public.tipo_usuario OWNER TO postgres;

--
-- TOC entry 259 (class 1259 OID 89203)
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
-- TOC entry 3470 (class 0 OID 0)
-- Dependencies: 259
-- Name: tipo_usuario_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tipo_usuario_id_seq OWNED BY public.tipo_usuario.id;


--
-- TOC entry 260 (class 1259 OID 89205)
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
-- TOC entry 261 (class 1259 OID 89209)
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
-- TOC entry 3471 (class 0 OID 0)
-- Dependencies: 261
-- Name: unidad_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.unidad_id_seq OWNED BY public.unidad.id;


--
-- TOC entry 262 (class 1259 OID 89211)
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
-- TOC entry 263 (class 1259 OID 89215)
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
-- TOC entry 3472 (class 0 OID 0)
-- Dependencies: 263
-- Name: usuario_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.usuario_id_seq OWNED BY public.usuario.id;


--
-- TOC entry 264 (class 1259 OID 89217)
-- Name: v_asambleas; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.v_asambleas AS
 SELECT asa.id,
    asa.nombre,
    asa.descripcion,
    asa.fecha
   FROM public.asambleas asa;


ALTER TABLE public.v_asambleas OWNER TO postgres;

--
-- TOC entry 265 (class 1259 OID 89221)
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
-- TOC entry 266 (class 1259 OID 89225)
-- Name: v_asambleas_propietario; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.v_asambleas_propietario AS
 SELECT asa.id,
    pr.ci_persona AS cedula,
    pr.p_nombre AS nombre,
    pr.p_apellido AS apellido,
    pu.id AS id_puente
   FROM ((public.v_propietario pr
     JOIN public.puente_asambleas_propietario pu ON (((pu.ci_propietario)::text = (pr.ci_persona)::text)))
     JOIN public.asambleas asa ON ((asa.id = pu.id_asamblea)));


ALTER TABLE public.v_asambleas_propietario OWNER TO postgres;

--
-- TOC entry 267 (class 1259 OID 89229)
-- Name: v_bandeja_entrada; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.v_bandeja_entrada AS
 SELECT me.id,
    me.asunto,
    me.contenido,
    me.fecha,
    me.emisor AS id_emisor,
    u1.ci_persona AS cedula,
    pe.p_nombre AS nombre,
    pe.p_apellido AS apellido,
    pu.receptor,
    pu.leido,
    pu.activo
   FROM ((((public.mensaje me
     JOIN public.usuario u1 ON ((u1.id = me.emisor)))
     JOIN public.puente_mensaje_usuario pu ON ((pu.id_mensaje = me.id)))
     JOIN public.usuario u2 ON ((u2.id = pu.receptor)))
     JOIN public.persona pe ON (((pe.cedula)::text = (u1.ci_persona)::text)));


ALTER TABLE public.v_bandeja_entrada OWNER TO postgres;

--
-- TOC entry 268 (class 1259 OID 89234)
-- Name: v_bandeja_salida; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.v_bandeja_salida AS
 SELECT me.id,
    me.asunto,
    me.contenido,
    me.fecha,
    me.emisor AS id_emisor,
    u.ci_persona AS cedula,
    pe.p_nombre AS nombre,
    pe.p_apellido AS apellido
   FROM ((public.mensaje me
     JOIN public.usuario u ON ((u.id = me.emisor)))
     JOIN public.persona pe ON (((pe.cedula)::text = (u.ci_persona)::text)));


ALTER TABLE public.v_bandeja_salida OWNER TO postgres;

--
-- TOC entry 269 (class 1259 OID 89239)
-- Name: v_concepto_gasto; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.v_concepto_gasto AS
 SELECT cg.id,
    cg.nom_concepto AS nombre,
    cg.descripcion,
    cat.id AS id_categoria,
    cat.nombre AS nombre_categoria,
    cg.activo
   FROM (public.concepto_gasto cg
     JOIN public.categoriagasto cat ON ((cat.id = cg.id_categoria)));


ALTER TABLE public.v_concepto_gasto OWNER TO postgres;

--
-- TOC entry 270 (class 1259 OID 89243)
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
-- TOC entry 271 (class 1259 OID 89247)
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
-- TOC entry 272 (class 1259 OID 89252)
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
-- TOC entry 298 (class 1259 OID 89682)
-- Name: v_cuenta_pagar; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.v_cuenta_pagar AS
 SELECT cp.id,
    cp.num_ref,
    cp.descripcion,
    cp.monto,
    cp.moneda,
    cp.tasa_cambio,
    cp.fecha,
    cp.id_gasto,
    ga.nombre AS gasto,
    cp.n_cuenta,
    cu.id_banco,
    b.nombre_banco AS banco,
    cp.id_fondo,
    f.tipo AS fondo,
    cp.id_forma_pago,
    fp.forma_pago
   FROM (((((public.cuenta_pagar cp
     JOIN public.gasto ga ON ((ga.id = cp.id_gasto)))
     JOIN public.cuenta cu ON (((cu.n_cuenta)::text = (cp.n_cuenta)::text)))
     JOIN public.banco b ON ((b.id = cu.id_banco)))
     JOIN public.fondos f ON ((f.id = cp.id_fondo)))
     JOIN public.forma_pago fp ON ((fp.id = cp.id_forma_pago)))
  ORDER BY cp.fecha DESC;


ALTER TABLE public.v_cuenta_pagar OWNER TO postgres;

--
-- TOC entry 273 (class 1259 OID 89257)
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
-- TOC entry 299 (class 1259 OID 89687)
-- Name: v_gasto; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.v_gasto AS
 SELECT ga.id,
    ga.tipo,
    ga.nombre,
    ga.id_proveedor,
    ga.moneda,
    pr.nombre AS proveedor,
    ga.calcular_por,
    ga.mes,
    ga.anio,
    ga.monto,
    ga.saldo,
    ga.n_meses,
    ga.meses_restantes,
    asa.id AS id_asamblea,
    asa.nombre AS asamblea,
    asa.fecha AS fecha_asamblea,
    ga.observacion,
    ga.estado,
    ga.pagado
   FROM ((public.gasto ga
     JOIN public.proveedores pr ON (((pr.cedula)::text = (ga.id_proveedor)::text)))
     LEFT JOIN public.asambleas asa ON ((asa.id = ga.id_asamblea)));


ALTER TABLE public.v_gasto OWNER TO postgres;

--
-- TOC entry 300 (class 1259 OID 89692)
-- Name: v_gasto_concepto; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.v_gasto_concepto AS
 SELECT ga.id AS id_gasto,
    cg.id AS id_concepto,
    cg.nombre,
    pu.monto,
    pu.id AS id_puente
   FROM ((public.v_concepto_gasto cg
     JOIN public.puente_gasto_concepto pu ON ((pu.id_concepto = cg.id)))
     JOIN public.gasto ga ON ((ga.id = pu.id_gasto)));


ALTER TABLE public.v_gasto_concepto OWNER TO postgres;

--
-- TOC entry 274 (class 1259 OID 89271)
-- Name: v_mensaje_usuario; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.v_mensaje_usuario AS
 SELECT pu.id_mensaje,
    pu.receptor AS id_receptor,
    u.ci_persona AS cedula,
    pe.p_nombre AS nombre,
    pe.p_apellido AS apellido
   FROM ((public.puente_mensaje_usuario pu
     JOIN public.usuario u ON ((u.id = pu.receptor)))
     JOIN public.persona pe ON (((pe.cedula)::text = (u.ci_persona)::text)));


ALTER TABLE public.v_mensaje_usuario OWNER TO postgres;

--
-- TOC entry 275 (class 1259 OID 89276)
-- Name: v_perfil; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.v_perfil AS
 SELECT per.p_nombre,
    per.s_nombre,
    per.p_apellido,
    per.s_apellido,
    per.telefono,
    per.correo,
    usu.id,
    usu.usuario,
    usu.pregunta,
    tip.id AS id_tipo,
    tip.tipo
   FROM ((public.persona per
     JOIN public.usuario usu ON (((usu.ci_persona)::text = (per.cedula)::text)))
     JOIN public.tipo_usuario tip ON ((tip.id = usu.id_tipo_usuario)));


ALTER TABLE public.v_perfil OWNER TO postgres;

--
-- TOC entry 276 (class 1259 OID 89281)
-- Name: v_permisos; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.v_permisos AS
 SELECT u.usuario,
    tipo.id AS id_tipo,
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
-- TOC entry 277 (class 1259 OID 89286)
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
-- TOC entry 278 (class 1259 OID 89290)
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
-- TOC entry 279 (class 1259 OID 89294)
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
-- TOC entry 280 (class 1259 OID 89298)
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
-- TOC entry 281 (class 1259 OID 89302)
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
-- TOC entry 282 (class 1259 OID 89306)
-- Name: v_unidad; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.v_unidad AS
 SELECT u.id,
    u.n_unidad,
    u.n_documento,
    u.direccion,
    u.alicuota,
    tu.id AS id_tipo,
    tu.tipo,
    tu.area
   FROM (public.unidad u
     JOIN public.tipo_unidad tu ON ((tu.id = u.id_tipo)))
  WHERE (u.activo = true);


ALTER TABLE public.v_unidad OWNER TO postgres;

--
-- TOC entry 283 (class 1259 OID 89310)
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
-- TOC entry 284 (class 1259 OID 89315)
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
-- TOC entry 285 (class 1259 OID 89319)
-- Name: v_usuario; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.v_usuario AS
 SELECT u.id,
    u.usuario,
    u.ci_persona AS cedula,
    pe.p_nombre AS nombre,
    pe.p_apellido AS apellido
   FROM (public.usuario u
     JOIN public.persona pe ON (((pe.cedula)::text = (u.ci_persona)::text)))
  WHERE (u.activo = true);


ALTER TABLE public.v_usuario OWNER TO postgres;

--
-- TOC entry 286 (class 1259 OID 89323)
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
-- TOC entry 287 (class 1259 OID 89327)
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
-- TOC entry 288 (class 1259 OID 89332)
-- Name: visitante; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.visitante (
    ci_persona character varying(10) NOT NULL,
    activo boolean DEFAULT true
);


ALTER TABLE public.visitante OWNER TO postgres;

--
-- TOC entry 289 (class 1259 OID 89336)
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
-- TOC entry 290 (class 1259 OID 89341)
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
-- TOC entry 291 (class 1259 OID 89345)
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
-- TOC entry 3473 (class 0 OID 0)
-- Dependencies: 291
-- Name: visita_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.visita_id_seq OWNED BY public.visita.id;


--
-- TOC entry 3033 (class 2604 OID 89347)
-- Name: asambleas id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.asambleas ALTER COLUMN id SET DEFAULT nextval('public.asambleas_id_seq'::regclass);


--
-- TOC entry 3034 (class 2604 OID 89348)
-- Name: banco id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.banco ALTER COLUMN id SET DEFAULT nextval('public.banco_id_seq'::regclass);


--
-- TOC entry 3036 (class 2604 OID 89349)
-- Name: categoriagasto id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categoriagasto ALTER COLUMN id SET DEFAULT nextval('public.categoriagasto_id_seq'::regclass);


--
-- TOC entry 3037 (class 2604 OID 89350)
-- Name: cobro_unidad id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cobro_unidad ALTER COLUMN id SET DEFAULT nextval('public.cobro_id_seq'::regclass);


--
-- TOC entry 3038 (class 2604 OID 89351)
-- Name: comunicados id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comunicados ALTER COLUMN id SET DEFAULT nextval('public.comunicados_id_seq'::regclass);


--
-- TOC entry 3040 (class 2604 OID 89352)
-- Name: concepto_gasto id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.concepto_gasto ALTER COLUMN id SET DEFAULT nextval('public.concepto_gasto_id_seq'::regclass);


--
-- TOC entry 3089 (class 2604 OID 89640)
-- Name: cuenta_pagar id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cuenta_pagar ALTER COLUMN id SET DEFAULT nextval('public.cuenta_pagar_id_seq'::regclass);


--
-- TOC entry 3043 (class 2604 OID 89354)
-- Name: detalle_pagos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detalle_pagos ALTER COLUMN id SET DEFAULT nextval('public.detalle_pagos_id_seq'::regclass);


--
-- TOC entry 3045 (class 2604 OID 89355)
-- Name: fondos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fondos ALTER COLUMN id SET DEFAULT nextval('public.fondos_id_seq'::regclass);


--
-- TOC entry 3046 (class 2604 OID 89356)
-- Name: forma_pago id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.forma_pago ALTER COLUMN id SET DEFAULT nextval('public.forma_pago_id_seq'::regclass);


--
-- TOC entry 3048 (class 2604 OID 89357)
-- Name: funcion id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcion ALTER COLUMN id SET DEFAULT nextval('public.funcion_id_seq'::regclass);


--
-- TOC entry 3085 (class 2604 OID 89610)
-- Name: gasto id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gasto ALTER COLUMN id SET DEFAULT nextval('public.gasto_id_seq'::regclass);


--
-- TOC entry 3049 (class 2604 OID 89359)
-- Name: gasto_comun id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gasto_comun ALTER COLUMN id SET DEFAULT nextval('public.gasto_comun_id_seq'::regclass);


--
-- TOC entry 3050 (class 2604 OID 89360)
-- Name: interes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.interes ALTER COLUMN id SET DEFAULT nextval('public.interes_id_seq'::regclass);


--
-- TOC entry 3053 (class 2604 OID 89361)
-- Name: mensaje id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mensaje ALTER COLUMN id SET DEFAULT nextval('public.mensaje_id_seq'::regclass);


--
-- TOC entry 3054 (class 2604 OID 89362)
-- Name: pagar_cuota_especial id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pagar_cuota_especial ALTER COLUMN id SET DEFAULT nextval('public.pagar_cuota_especial_id_seq'::regclass);


--
-- TOC entry 3059 (class 2604 OID 89363)
-- Name: puente_asambleas_propietario id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.puente_asambleas_propietario ALTER COLUMN id SET DEFAULT nextval('public.puente_asamblea_propietario_id_seq'::regclass);


--
-- TOC entry 3060 (class 2604 OID 89364)
-- Name: puente_cobro_factura id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.puente_cobro_factura ALTER COLUMN id SET DEFAULT nextval('public.puente_cobro_factura_id_seq'::regclass);


--
-- TOC entry 3061 (class 2604 OID 89365)
-- Name: puente_comunicado_usuario id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.puente_comunicado_usuario ALTER COLUMN id SET DEFAULT nextval('public.puente_comunicado_usuario_id_seq'::regclass);


--
-- TOC entry 3062 (class 2604 OID 89366)
-- Name: puente_concepto_factura id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.puente_concepto_factura ALTER COLUMN id SET DEFAULT nextval('public.puente_concepto_factura_id_seq'::regclass);


--
-- TOC entry 3090 (class 2604 OID 89668)
-- Name: puente_gasto_concepto id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.puente_gasto_concepto ALTER COLUMN id SET DEFAULT nextval('public.puente_gasto_concepto_id_seq'::regclass);


--
-- TOC entry 3065 (class 2604 OID 89368)
-- Name: puente_mensaje_usuario id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.puente_mensaje_usuario ALTER COLUMN id SET DEFAULT nextval('public.puente_mensaje_usuario_id_seq'::regclass);


--
-- TOC entry 3066 (class 2604 OID 89369)
-- Name: puente_persona_condominio id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.puente_persona_condominio ALTER COLUMN id SET DEFAULT nextval('public.puente_persona_condominio_id_seq'::regclass);


--
-- TOC entry 3067 (class 2604 OID 89370)
-- Name: puente_sancion_unidad id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.puente_sancion_unidad ALTER COLUMN id SET DEFAULT nextval('public.puente_sancion_unidad_id_seq'::regclass);


--
-- TOC entry 3068 (class 2604 OID 89371)
-- Name: puente_tipo_funcion id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.puente_tipo_funcion ALTER COLUMN id SET DEFAULT nextval('public.puente_tipo_funcion_id_seq'::regclass);


--
-- TOC entry 3071 (class 2604 OID 89372)
-- Name: puente_unidad_propietarios id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.puente_unidad_propietarios ALTER COLUMN id SET DEFAULT nextval('public.puente_unidad_propietarios_id_seq'::regclass);


--
-- TOC entry 3073 (class 2604 OID 89373)
-- Name: sancion id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sancion ALTER COLUMN id SET DEFAULT nextval('public.sancion_id_seq'::regclass);


--
-- TOC entry 3075 (class 2604 OID 89374)
-- Name: tipo_unidad id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipo_unidad ALTER COLUMN id SET DEFAULT nextval('public.tipo_unidad_id_seq'::regclass);


--
-- TOC entry 3076 (class 2604 OID 89375)
-- Name: tipo_usuario id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipo_usuario ALTER COLUMN id SET DEFAULT nextval('public.tipo_usuario_id_seq'::regclass);


--
-- TOC entry 3078 (class 2604 OID 89376)
-- Name: unidad id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.unidad ALTER COLUMN id SET DEFAULT nextval('public.unidad_id_seq'::regclass);


--
-- TOC entry 3080 (class 2604 OID 89377)
-- Name: usuario id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario ALTER COLUMN id SET DEFAULT nextval('public.usuario_id_seq'::regclass);


--
-- TOC entry 3083 (class 2604 OID 89378)
-- Name: visita id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.visita ALTER COLUMN id SET DEFAULT nextval('public.visita_id_seq'::regclass);


--
-- TOC entry 3366 (class 0 OID 88984)
-- Dependencies: 202
-- Data for Name: asambleas; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.asambleas VALUES (82, 'jdfgfg', '1969-12-31', 'sfsdfsd');
INSERT INTO public.asambleas VALUES (83, 'fgjh', '1969-12-31', 'fghfgh');
INSERT INTO public.asambleas VALUES (84, 'kñk', '1969-12-31', 'kñklñ');
INSERT INTO public.asambleas VALUES (85, 'ghjf', '1969-12-31', 'fghfgh');


--
-- TOC entry 3368 (class 0 OID 88992)
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
-- TOC entry 3370 (class 0 OID 88997)
-- Dependencies: 206
-- Data for Name: categoriagasto; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.categoriagasto VALUES (4, 'Uso comun', 'Conjunto de conceptos de uso comun y consumo', true);
INSERT INTO public.categoriagasto VALUES (6, 'asda', 'ddasda', true);
INSERT INTO public.categoriagasto VALUES (5, 'fsfsfdsfs', 'Conjunto de conceptos administrativo', true);
INSERT INTO public.categoriagasto VALUES (7, 'baba', 'baba', true);


--
-- TOC entry 3372 (class 0 OID 89003)
-- Dependencies: 208
-- Data for Name: cobro_unidad; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.cobro_unidad VALUES (80, 800000, 'fdsfsdf', '44444444444444444444', 'Transferencia', 'sfdsfds', '2020-06-12', 57, 11, 'Bolívar', 200000);
INSERT INTO public.cobro_unidad VALUES (81, 17000, 'fdsfsdf', '44444444444444444444', 'Transferencia', 'sfdsfds', '2020-06-12', 57, 11, 'Bolívar', 200000);
INSERT INTO public.cobro_unidad VALUES (82, 13, 'vxvcx', '44444444444444444444', 'Efectivo', 'xcvx', '2020-06-06', 58, 10, 'Dólar', 100000);
INSERT INTO public.cobro_unidad VALUES (83, 130000, 'vxvcx', '44444444444444444444', 'Efectivo', 'xcvx', '2020-06-06', 57, 10, 'Bolívar', 100000);
INSERT INTO public.cobro_unidad VALUES (84, 7250, 'vxvcx', '44444444444444444444', 'Efectivo', 'xcvx', '2020-06-06', 57, 10, 'Bolívar', 100000);


--
-- TOC entry 3374 (class 0 OID 89011)
-- Dependencies: 210
-- Data for Name: comunicados; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3376 (class 0 OID 89019)
-- Dependencies: 212
-- Data for Name: concepto_gasto; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.concepto_gasto VALUES (40, 'HidroCapital', 'Consumo de agua', 4, true);
INSERT INTO public.concepto_gasto VALUES (41, 'Vigilancia', 'Gastos por vigilancia', 4, true);
INSERT INTO public.concepto_gasto VALUES (39, 'Cantv', 'sad', 4, true);
INSERT INTO public.concepto_gasto VALUES (11, 'Provisión utilidades ', 'Utilidades del trabajador', 5, true);
INSERT INTO public.concepto_gasto VALUES (10, 'Liquidación ', 'Liquidacion trabajador', 5, true);
INSERT INTO public.concepto_gasto VALUES (12, 'Provisión vacaciones ', 'Vacaciones trabajador', 5, true);
INSERT INTO public.concepto_gasto VALUES (13, 'Ley de alimentación', 'Pago alimentación', 5, true);
INSERT INTO public.concepto_gasto VALUES (14, 'FAHO', 'Fondo de ahorro obligatorio de la vivienda', 5, true);
INSERT INTO public.concepto_gasto VALUES (15, 'Caja chica', 'Caja chica', 5, true);
INSERT INTO public.concepto_gasto VALUES (3, 'Honorarios administradora', 'Honorarios administradora del condominio', 5, true);
INSERT INTO public.concepto_gasto VALUES (4, 'Gastos oficina', 'Gastos en material de oficina', 5, true);
INSERT INTO public.concepto_gasto VALUES (9, 'Bono Vacacional ', 'Bono vacacional trabajador', 5, true);
INSERT INTO public.concepto_gasto VALUES (7, 'Prestaciones soc.', 'Prestaciones sociales trabajador', 5, true);
INSERT INTO public.concepto_gasto VALUES (8, 'Seguro social', 'Seguro social trabajador', 5, true);
INSERT INTO public.concepto_gasto VALUES (5, 'Gastos varios', 'Gastos fotocopias, impresiones, internet', 5, true);
INSERT INTO public.concepto_gasto VALUES (6, 'Retiro prestaciones', 'Retiro de prestaciones sociales', 5, true);
INSERT INTO public.concepto_gasto VALUES (16, 'Mant. ascensores', 'Mantenimiento de los asecensores', 6, true);
INSERT INTO public.concepto_gasto VALUES (17, 'Mant. hidroneumatico', 'Mantenimiento del hidroneumatico', 6, true);
INSERT INTO public.concepto_gasto VALUES (18, 'Mant. porton electrico', 'Mantenimiento del porton electrico', 6, true);
INSERT INTO public.concepto_gasto VALUES (19, 'Mant. cerco electrico', 'Mantenimiento del cerco electrico', 6, true);
INSERT INTO public.concepto_gasto VALUES (20, 'Mant. areas verdes', 'Mantenimiento de areas verdes', 6, true);
INSERT INTO public.concepto_gasto VALUES (21, 'Mant. piscina', 'Mantenimiento de la piscina', 6, true);
INSERT INTO public.concepto_gasto VALUES (22, 'Mant. parque infantil', 'Mantenimiento del parque infantil', 6, true);
INSERT INTO public.concepto_gasto VALUES (23, 'Mant. camaras vigilancia', 'Mantenimiento camaras de vigilancia', 6, true);
INSERT INTO public.concepto_gasto VALUES (24, 'Mant. tuberias', 'Mantenimiento de tuberias ', 6, true);
INSERT INTO public.concepto_gasto VALUES (25, 'Mant. estacionamiento', 'Mantenimiento del estacionamiento ', 6, true);
INSERT INTO public.concepto_gasto VALUES (26, 'Mant. pintura edif. ', 'Pintura de areas comunes ', 6, true);
INSERT INTO public.concepto_gasto VALUES (27, 'Mant. alumbrado elect. ', 'Mantenimiento del alumbrado elect.', 6, true);
INSERT INTO public.concepto_gasto VALUES (28, 'Mant. compra prod. limp.', 'Gastos productos de limpieza', 6, true);
INSERT INTO public.concepto_gasto VALUES (29, 'Mant. prod. limpieza ', 'Gasto otros productos', 6, true);
INSERT INTO public.concepto_gasto VALUES (30, 'Repar. ascensores', 'Reparacion de los asecensores', 6, true);
INSERT INTO public.concepto_gasto VALUES (31, 'Repar. tuberia', 'Reparacion de tuberias de aguas', 6, true);
INSERT INTO public.concepto_gasto VALUES (32, 'Repar. porton', 'Reparacion del porton electrico', 6, true);
INSERT INTO public.concepto_gasto VALUES (33, 'Repar. cerco elect.', 'Reparacion del cerco electrico', 6, true);
INSERT INTO public.concepto_gasto VALUES (34, 'Repar. hidroneumatico.', 'Reparacion la bomba de agua', 6, true);
INSERT INTO public.concepto_gasto VALUES (35, 'Repar. camaras.', 'Reparacion de camaras', 6, true);
INSERT INTO public.concepto_gasto VALUES (36, 'Repar. electricas.', 'Reparacion/Sustitucion de componentes electricos', 6, true);
INSERT INTO public.concepto_gasto VALUES (37, 'Consumo de electricidad', 'Consumo de electricidad', 6, true);
INSERT INTO public.concepto_gasto VALUES (38, 'jkkjkjk', 'jkjkjkjkjk', 4, true);
INSERT INTO public.concepto_gasto VALUES (42, 'qw', 'qw', 4, true);
INSERT INTO public.concepto_gasto VALUES (43, 'baba', 'baba', 7, true);
INSERT INTO public.concepto_gasto VALUES (44, 'bobo', 'bobo', 7, true);


--
-- TOC entry 3378 (class 0 OID 89025)
-- Dependencies: 214
-- Data for Name: condominio; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.condominio VALUES ('J22318939', 'CAMPO GUATACARO', '04140542620', 'AJHENSUAREZ@GMAIL.COM', true);


--
-- TOC entry 3379 (class 0 OID 89029)
-- Dependencies: 215
-- Data for Name: cuenta; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.cuenta VALUES ('44444444444444444444', 'Corriente', 5, 'V-11276626', 'J22318939', true);


--
-- TOC entry 3434 (class 0 OID 89637)
-- Dependencies: 295
-- Data for Name: cuenta_pagar; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3380 (class 0 OID 89038)
-- Dependencies: 216
-- Data for Name: detalle_pagos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.detalle_pagos VALUES (1593, 6, 2020, 0.7575, 27, 10, 'Interes', 151500, 200000, 'Dólar', 151500, 0);
INSERT INTO public.detalle_pagos VALUES (1584, 6, 2020, 0.025, 21, 10, 'Ordinario', 5000, 200000, 'Dólar', 5000, 0);
INSERT INTO public.detalle_pagos VALUES (1586, 6, 2020, 2.5, 20, 10, 'Extraordinario', 500000, 200000, 'Dólar', 500000, 0);
INSERT INTO public.detalle_pagos VALUES (1588, 6, 2020, 0.2525, 92, 10, 'Sancion', 50500, 200000, 'Dólar', 50500, 0);
INSERT INTO public.detalle_pagos VALUES (1589, 6, 2020, 10, 93, 10, 'Sancion', 2000000, 200000, 'Dólar', 2000000, 0);
INSERT INTO public.detalle_pagos VALUES (1591, 6, 2020, 0.7575, 26, 10, 'Interes', 151500, 200000, 'Dólar', 151500, 0);
INSERT INTO public.detalle_pagos VALUES (1601, 4, 2020, 10, 23, 10, 'Ordinario', 2000000, 200000, 'Dólar', 2000000, 10);
INSERT INTO public.detalle_pagos VALUES (1602, 4, 2020, 10, 23, 11, 'Ordinario', 2000000, 200000, 'Dólar', 2000000, 10);
INSERT INTO public.detalle_pagos VALUES (1603, 4, 2020, 3, 26, 10, 'Interes', 600000, 200000, 'Dólar', 600000, 3);
INSERT INTO public.detalle_pagos VALUES (1604, 4, 2020, 3, 26, 11, 'Interes', 600000, 200000, 'Dólar', 600000, 3);
INSERT INTO public.detalle_pagos VALUES (1605, 4, 2020, 3, 27, 10, 'Interes', 600000, 200000, 'Dólar', 600000, 3);
INSERT INTO public.detalle_pagos VALUES (1606, 4, 2020, 3, 27, 11, 'Interes', 600000, 200000, 'Dólar', 600000, 3);
INSERT INTO public.detalle_pagos VALUES (1585, 6, 2020, 0.025, 21, 11, 'Ordinario', 5000, 200000, 'Dólar', 5000, 0);
INSERT INTO public.detalle_pagos VALUES (1587, 6, 2020, 2.5, 20, 11, 'Extraordinario', 500000, 200000, 'Dólar', 500000, 0);
INSERT INTO public.detalle_pagos VALUES (1590, 6, 2020, 0.005, 94, 11, 'Sancion', 1000, 200000, 'Dólar', 1000, 0);
INSERT INTO public.detalle_pagos VALUES (1592, 6, 2020, 0.7575, 26, 11, 'Interes', 151500, 200000, 'Dólar', 151500, 0);
INSERT INTO public.detalle_pagos VALUES (1594, 6, 2020, 0.7575, 27, 11, 'Interes', 151500, 200000, 'Dólar', 151500, 0);
INSERT INTO public.detalle_pagos VALUES (1596, 5, 2020, 0.027777777777777776, 22, 11, 'Ordinario', 5000, 180000, 'Bolívar', 0, 0.027777777777777776);
INSERT INTO public.detalle_pagos VALUES (1598, 5, 2020, 0.008333333333333333, 26, 11, 'Interes', 1500, 180000, 'Bolívar', 0, 0.008333333333333333);
INSERT INTO public.detalle_pagos VALUES (1600, 5, 2020, 0.008333333333333333, 27, 11, 'Interes', 1500, 180000, 'Bolívar', 0, 0.008333333333333333);
INSERT INTO public.detalle_pagos VALUES (1595, 5, 2020, 0.027777777777777776, 22, 10, 'Ordinario', 5000, 180000, 'Bolívar', 0, 0.027777777777777776);
INSERT INTO public.detalle_pagos VALUES (1597, 5, 2020, 0.008333333333333333, 26, 10, 'Interes', 1500, 180000, 'Bolívar', 0, 0.008333333333333333);
INSERT INTO public.detalle_pagos VALUES (1599, 5, 2020, 0.008333333333333333, 27, 10, 'Interes', 1500, 180000, 'Bolívar', 0, 0.008333333333333333);


--
-- TOC entry 3382 (class 0 OID 89046)
-- Dependencies: 218
-- Data for Name: fondos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.fondos VALUES ('casa blanca', '2020-06-08', 'puto', '11111				', 10000, 1845599, 'J22318939', 59, 'Bolívar', true);
INSERT INTO public.fondos VALUES ('sdadsad', '2020-05-16', 'fsdfds', 'sdfsd', 1, 17.12, 'J22318939', 58, 'Dólar', true);
INSERT INTO public.fondos VALUES ('asdsad', '2020-05-10', 'fsf', 'sfdsd', 0, 6722429, 'J22318939', 57, 'Bolívar', true);
INSERT INTO public.fondos VALUES ('asdads', '2020-05-09', 'adsasd', 'asda', 31231, 1755780, 'J22318939', 56, 'Bolívar', true);
INSERT INTO public.fondos VALUES ('asdad', '2020-05-16', 'dadsad', 'sadas', 21313, 1011578.62, 'J22318939', 55, 'Bolívar', true);


--
-- TOC entry 3384 (class 0 OID 89055)
-- Dependencies: 220
-- Data for Name: forma_pago; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.forma_pago VALUES (1, 'dsfsdf', true);
INSERT INTO public.forma_pago VALUES (2, 'td', true);


--
-- TOC entry 3386 (class 0 OID 89063)
-- Dependencies: 222
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
INSERT INTO public.funcion VALUES (10, 'Fondo');
INSERT INTO public.funcion VALUES (11, 'Gasto');
INSERT INTO public.funcion VALUES (12, 'Generar recibo');
INSERT INTO public.funcion VALUES (13, 'Gestionar Usuario');
INSERT INTO public.funcion VALUES (14, 'Intereses');
INSERT INTO public.funcion VALUES (15, 'Pago de cuotas especiales');
INSERT INTO public.funcion VALUES (16, 'Propietarios');
INSERT INTO public.funcion VALUES (17, 'Proveedores');
INSERT INTO public.funcion VALUES (18, 'Recibo');
INSERT INTO public.funcion VALUES (19, 'Responsables');
INSERT INTO public.funcion VALUES (20, 'Sanciones');
INSERT INTO public.funcion VALUES (21, 'Tipo de unidad');
INSERT INTO public.funcion VALUES (22, 'Tipo de usuario');
INSERT INTO public.funcion VALUES (23, 'Unidades');
INSERT INTO public.funcion VALUES (24, 'Registro de visitas');
INSERT INTO public.funcion VALUES (25, 'Visitas autorizadas');
INSERT INTO public.funcion VALUES (26, 'Cuotas especiales
');
INSERT INTO public.funcion VALUES (27, 'Cuotas especiales');


--
-- TOC entry 3432 (class 0 OID 89607)
-- Dependencies: 293
-- Data for Name: gasto; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3388 (class 0 OID 89079)
-- Dependencies: 224
-- Data for Name: gasto_comun; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.gasto_comun VALUES (79, 'Ordinario', 5, 2020, 2000, '2727722', '24666587', 25, '', '2020-05-14', 'Pendiente de Pago', '21321312', 2000);
INSERT INTO public.gasto_comun VALUES (80, 'Ordinario', 5, 2020, 5000, '2727722', 'J-54785696', 26, '', '2020-05-14', 'Pendiente de Pago', '21321312', 5000);
INSERT INTO public.gasto_comun VALUES (81, 'Ordinario', 6, 2020, 100, '1212', 'J-1001245215', 29, 'perro', '2020-05-12', 'Pendiente', '21321312', 100);


--
-- TOC entry 3390 (class 0 OID 89086)
-- Dependencies: 226
-- Data for Name: interes; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.interes VALUES (26, 'reserva', 30, true);
INSERT INTO public.interes VALUES (27, 'inflacion', 30, true);


--
-- TOC entry 3392 (class 0 OID 89091)
-- Dependencies: 228
-- Data for Name: mensaje; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.mensaje VALUES (1, 'asunto1', 'prueba leido', 1, '2020-06-11 19:05:39');
INSERT INTO public.mensaje VALUES (2, 'asunto2', 'prueba no leido', 1, '2020-06-11 19:05:53');
INSERT INTO public.mensaje VALUES (3, 'guebo', 'sdfsf', 1, '2020-06-11 23:05:58');


--
-- TOC entry 3394 (class 0 OID 89098)
-- Dependencies: 230
-- Data for Name: pagar_cuota_especial; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3396 (class 0 OID 89106)
-- Dependencies: 232
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
INSERT INTO public.persona VALUES ('V-32547896', 'hgjgh', 'ghfgh', 'fgjhf', 'fhfgh', '66666666666', 'fhh', true);
INSERT INTO public.persona VALUES ('V-12345678', 'admin', '', 'istrador', '', NULL, NULL, true);


--
-- TOC entry 3397 (class 0 OID 89112)
-- Dependencies: 233
-- Data for Name: propietario; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.propietario VALUES ('V-7552887', true);
INSERT INTO public.propietario VALUES ('V-9602345', true);
INSERT INTO public.propietario VALUES ('V-9602344', true);
INSERT INTO public.propietario VALUES ('V-26942316', true);


--
-- TOC entry 3398 (class 0 OID 89116)
-- Dependencies: 234
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
-- TOC entry 3399 (class 0 OID 89122)
-- Dependencies: 235
-- Data for Name: puente_asambleas_propietario; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.puente_asambleas_propietario VALUES (259, 82, 'V-7552887');
INSERT INTO public.puente_asambleas_propietario VALUES (260, 82, 'V-9602345');
INSERT INTO public.puente_asambleas_propietario VALUES (261, 83, 'V-26942316');
INSERT INTO public.puente_asambleas_propietario VALUES (262, 83, 'V-9602344');
INSERT INTO public.puente_asambleas_propietario VALUES (263, 84, 'V-7552887');
INSERT INTO public.puente_asambleas_propietario VALUES (264, 84, 'V-9602345');
INSERT INTO public.puente_asambleas_propietario VALUES (265, 84, 'V-9602344');
INSERT INTO public.puente_asambleas_propietario VALUES (266, 85, 'V-26942316');
INSERT INTO public.puente_asambleas_propietario VALUES (267, 85, 'V-7552887');
INSERT INTO public.puente_asambleas_propietario VALUES (268, 85, 'V-9602345');


--
-- TOC entry 3401 (class 0 OID 89127)
-- Dependencies: 237
-- Data for Name: puente_cobro_factura; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.puente_cobro_factura VALUES (15, 1585, 80, 5000, 'Bolívar');
INSERT INTO public.puente_cobro_factura VALUES (16, 1587, 80, 500000, 'Bolívar');
INSERT INTO public.puente_cobro_factura VALUES (17, 1590, 80, 1000, 'Bolívar');
INSERT INTO public.puente_cobro_factura VALUES (18, 1592, 80, 151500, 'Bolívar');
INSERT INTO public.puente_cobro_factura VALUES (19, 1594, 80, 142500, 'Bolívar');
INSERT INTO public.puente_cobro_factura VALUES (24, 1594, 81, 9000, 'Bolívar');
INSERT INTO public.puente_cobro_factura VALUES (25, 1596, 81, 5000, 'Bolívar');
INSERT INTO public.puente_cobro_factura VALUES (26, 1598, 81, 1500, 'Bolívar');
INSERT INTO public.puente_cobro_factura VALUES (27, 1600, 81, 1500, 'Bolívar');
INSERT INTO public.puente_cobro_factura VALUES (28, 1595, 82, 0.05, 'Dólar');
INSERT INTO public.puente_cobro_factura VALUES (29, 1597, 82, 0.015, 'Dólar');
INSERT INTO public.puente_cobro_factura VALUES (30, 1599, 82, 0.015, 'Dólar');
INSERT INTO public.puente_cobro_factura VALUES (31, 1591, 82, 0.7575, 'Dólar');
INSERT INTO public.puente_cobro_factura VALUES (32, 1593, 82, 0.7575, 'Dólar');
INSERT INTO public.puente_cobro_factura VALUES (33, 1584, 82, 0.025, 'Dólar');
INSERT INTO public.puente_cobro_factura VALUES (34, 1586, 82, 2.5, 'Dólar');
INSERT INTO public.puente_cobro_factura VALUES (35, 1588, 82, 0.2525, 'Dólar');
INSERT INTO public.puente_cobro_factura VALUES (36, 1589, 82, 8.6275, 'Dólar');
INSERT INTO public.puente_cobro_factura VALUES (37, 1589, 83, 130000, 'Bolívar');
INSERT INTO public.puente_cobro_factura VALUES (38, 1589, 84, 7250, 'Bolívar');


--
-- TOC entry 3403 (class 0 OID 89135)
-- Dependencies: 239
-- Data for Name: puente_comunicado_usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3405 (class 0 OID 89143)
-- Dependencies: 241
-- Data for Name: puente_concepto_factura; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.puente_concepto_factura VALUES (1, 81, 29, 1223);
INSERT INTO public.puente_concepto_factura VALUES (2, 81, 28, 100);


--
-- TOC entry 3436 (class 0 OID 89665)
-- Dependencies: 297
-- Data for Name: puente_gasto_concepto; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3407 (class 0 OID 89153)
-- Dependencies: 243
-- Data for Name: puente_mensaje_usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.puente_mensaje_usuario VALUES (2, 2, 9, false, true);
INSERT INTO public.puente_mensaje_usuario VALUES (1, 1, 9, true, true);
INSERT INTO public.puente_mensaje_usuario VALUES (3, 3, 9, false, true);


--
-- TOC entry 3409 (class 0 OID 89160)
-- Dependencies: 245
-- Data for Name: puente_persona_condominio; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3411 (class 0 OID 89165)
-- Dependencies: 247
-- Data for Name: puente_sancion_unidad; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.puente_sancion_unidad VALUES (215, 92, 10);
INSERT INTO public.puente_sancion_unidad VALUES (216, 93, 10);
INSERT INTO public.puente_sancion_unidad VALUES (217, 94, 11);


--
-- TOC entry 3413 (class 0 OID 89170)
-- Dependencies: 249
-- Data for Name: puente_tipo_funcion; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.puente_tipo_funcion VALUES (39, 1, 1, true, true, true, true);
INSERT INTO public.puente_tipo_funcion VALUES (40, 1, 2, true, true, true, true);
INSERT INTO public.puente_tipo_funcion VALUES (41, 1, 3, true, true, true, true);
INSERT INTO public.puente_tipo_funcion VALUES (42, 1, 4, true, true, true, true);
INSERT INTO public.puente_tipo_funcion VALUES (43, 1, 5, true, true, true, true);
INSERT INTO public.puente_tipo_funcion VALUES (44, 1, 6, true, true, true, true);
INSERT INTO public.puente_tipo_funcion VALUES (45, 1, 7, true, true, true, true);
INSERT INTO public.puente_tipo_funcion VALUES (46, 1, 8, true, true, true, true);
INSERT INTO public.puente_tipo_funcion VALUES (47, 1, 9, true, true, true, true);
INSERT INTO public.puente_tipo_funcion VALUES (48, 1, 10, true, true, true, true);
INSERT INTO public.puente_tipo_funcion VALUES (49, 1, 11, true, true, true, true);
INSERT INTO public.puente_tipo_funcion VALUES (50, 1, 12, true, true, true, true);
INSERT INTO public.puente_tipo_funcion VALUES (51, 1, 13, true, true, true, true);
INSERT INTO public.puente_tipo_funcion VALUES (52, 1, 14, true, true, true, true);
INSERT INTO public.puente_tipo_funcion VALUES (53, 1, 15, true, true, true, true);
INSERT INTO public.puente_tipo_funcion VALUES (54, 1, 16, true, true, true, true);
INSERT INTO public.puente_tipo_funcion VALUES (55, 1, 17, true, true, true, true);
INSERT INTO public.puente_tipo_funcion VALUES (56, 1, 18, true, true, true, true);
INSERT INTO public.puente_tipo_funcion VALUES (57, 1, 19, true, true, true, true);
INSERT INTO public.puente_tipo_funcion VALUES (58, 1, 20, true, true, true, true);
INSERT INTO public.puente_tipo_funcion VALUES (59, 1, 21, true, true, true, true);
INSERT INTO public.puente_tipo_funcion VALUES (60, 1, 22, true, true, true, true);
INSERT INTO public.puente_tipo_funcion VALUES (61, 1, 23, true, true, true, true);
INSERT INTO public.puente_tipo_funcion VALUES (62, 1, 24, true, true, true, true);
INSERT INTO public.puente_tipo_funcion VALUES (63, 1, 25, true, true, true, true);
INSERT INTO public.puente_tipo_funcion VALUES (64, 1, 26, true, true, true, true);
INSERT INTO public.puente_tipo_funcion VALUES (65, 1, 27, true, true, true, true);


--
-- TOC entry 3415 (class 0 OID 89175)
-- Dependencies: 251
-- Data for Name: puente_unidad_propietarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.puente_unidad_propietarios VALUES (28, 'V-26942316', 10, '2020-06-11', NULL, 1, true);
INSERT INTO public.puente_unidad_propietarios VALUES (29, 'V-26942316', 11, '2020-06-11', NULL, 1, true);


--
-- TOC entry 3417 (class 0 OID 89182)
-- Dependencies: 253
-- Data for Name: responsable; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.responsable VALUES ('V-22318938', false);
INSERT INTO public.responsable VALUES ('V-16111353', true);
INSERT INTO public.responsable VALUES ('V-32547896', true);


--
-- TOC entry 3418 (class 0 OID 89186)
-- Dependencies: 254
-- Data for Name: sancion; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.sancion VALUES (92, 'Interes de mora', 6, 2020, 10, 'ghjg', 'Procesado', 'Bolívar');
INSERT INTO public.sancion VALUES (93, 'Multa', 6, 2020, 10, 'ghjg', 'Procesado', 'Dólar');
INSERT INTO public.sancion VALUES (94, 'Multa', 6, 2020, 1000, 'ghjg', 'Procesado', 'Bolívar');


--
-- TOC entry 3420 (class 0 OID 89191)
-- Dependencies: 256
-- Data for Name: tipo_unidad; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tipo_unidad VALUES (1, 80, 'Esquina', true);
INSERT INTO public.tipo_unidad VALUES (3, 500, 'Mediano', true);
INSERT INTO public.tipo_unidad VALUES (5, 100, 'Pequeño', true);
INSERT INTO public.tipo_unidad VALUES (2, 85, 'No esquina', true);


--
-- TOC entry 3422 (class 0 OID 89197)
-- Dependencies: 258
-- Data for Name: tipo_usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tipo_usuario VALUES (1, 'Administrador');


--
-- TOC entry 3424 (class 0 OID 89205)
-- Dependencies: 260
-- Data for Name: unidad; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.unidad VALUES (10, '25', '2524', 'jkl', true, 1, 0.5);
INSERT INTO public.unidad VALUES (11, 'jkjl', 'jlj', 'jljkl', true, 1, 0.5);


--
-- TOC entry 3426 (class 0 OID 89211)
-- Dependencies: 262
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.usuario VALUES (1, 'Ingresar Usuario', '455831477b82574f6bf871193f2f761d', 'pregunta', 'respuesta', 'V-12345678', 1, true);
INSERT INTO public.usuario VALUES (9, 'ajhen', '455831477b82574f6bf871193f2f761d', 'question', 'a363b8d13575101a0226e8d0d054f2e7', 'V-22318939', 1, true);


--
-- TOC entry 3428 (class 0 OID 89327)
-- Dependencies: 287
-- Data for Name: visita; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3429 (class 0 OID 89332)
-- Dependencies: 288
-- Data for Name: visitante; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.visitante VALUES ('V-26942316', true);
INSERT INTO public.visitante VALUES ('V-11276626', true);
INSERT INTO public.visitante VALUES ('V-23654789', true);
INSERT INTO public.visitante VALUES ('V-14523698', true);
INSERT INTO public.visitante VALUES ('V-12365478', true);


--
-- TOC entry 3474 (class 0 OID 0)
-- Dependencies: 203
-- Name: asambleas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.asambleas_id_seq', 85, true);


--
-- TOC entry 3475 (class 0 OID 0)
-- Dependencies: 205
-- Name: banco_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.banco_id_seq', 1, false);


--
-- TOC entry 3476 (class 0 OID 0)
-- Dependencies: 207
-- Name: categoriagasto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categoriagasto_id_seq', 7, true);


--
-- TOC entry 3477 (class 0 OID 0)
-- Dependencies: 209
-- Name: cobro_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cobro_id_seq', 84, true);


--
-- TOC entry 3478 (class 0 OID 0)
-- Dependencies: 211
-- Name: comunicados_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.comunicados_id_seq', 53, true);


--
-- TOC entry 3479 (class 0 OID 0)
-- Dependencies: 213
-- Name: concepto_gasto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.concepto_gasto_id_seq', 44, true);


--
-- TOC entry 3480 (class 0 OID 0)
-- Dependencies: 294
-- Name: cuenta_pagar_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cuenta_pagar_id_seq', 1, false);


--
-- TOC entry 3481 (class 0 OID 0)
-- Dependencies: 217
-- Name: detalle_pagos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.detalle_pagos_id_seq', 1606, true);


--
-- TOC entry 3482 (class 0 OID 0)
-- Dependencies: 219
-- Name: fondos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.fondos_id_seq', 59, true);


--
-- TOC entry 3483 (class 0 OID 0)
-- Dependencies: 221
-- Name: forma_pago_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.forma_pago_id_seq', 1, false);


--
-- TOC entry 3484 (class 0 OID 0)
-- Dependencies: 223
-- Name: funcion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.funcion_id_seq', 27, true);


--
-- TOC entry 3485 (class 0 OID 0)
-- Dependencies: 225
-- Name: gasto_comun_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.gasto_comun_id_seq', 81, true);


--
-- TOC entry 3486 (class 0 OID 0)
-- Dependencies: 292
-- Name: gasto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.gasto_id_seq', 1, false);


--
-- TOC entry 3487 (class 0 OID 0)
-- Dependencies: 227
-- Name: interes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.interes_id_seq', 27, true);


--
-- TOC entry 3488 (class 0 OID 0)
-- Dependencies: 229
-- Name: mensaje_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.mensaje_id_seq', 3, true);


--
-- TOC entry 3489 (class 0 OID 0)
-- Dependencies: 231
-- Name: pagar_cuota_especial_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pagar_cuota_especial_id_seq', 1, false);


--
-- TOC entry 3490 (class 0 OID 0)
-- Dependencies: 236
-- Name: puente_asamblea_propietario_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.puente_asamblea_propietario_id_seq', 268, true);


--
-- TOC entry 3491 (class 0 OID 0)
-- Dependencies: 238
-- Name: puente_cobro_factura_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.puente_cobro_factura_id_seq', 38, true);


--
-- TOC entry 3492 (class 0 OID 0)
-- Dependencies: 240
-- Name: puente_comunicado_usuario_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.puente_comunicado_usuario_id_seq', 503, true);


--
-- TOC entry 3493 (class 0 OID 0)
-- Dependencies: 242
-- Name: puente_concepto_factura_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.puente_concepto_factura_id_seq', 2, true);


--
-- TOC entry 3494 (class 0 OID 0)
-- Dependencies: 296
-- Name: puente_gasto_concepto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.puente_gasto_concepto_id_seq', 1, false);


--
-- TOC entry 3495 (class 0 OID 0)
-- Dependencies: 244
-- Name: puente_mensaje_usuario_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.puente_mensaje_usuario_id_seq', 3, true);


--
-- TOC entry 3496 (class 0 OID 0)
-- Dependencies: 246
-- Name: puente_persona_condominio_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.puente_persona_condominio_id_seq', 2, true);


--
-- TOC entry 3497 (class 0 OID 0)
-- Dependencies: 248
-- Name: puente_sancion_unidad_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.puente_sancion_unidad_id_seq', 217, true);


--
-- TOC entry 3498 (class 0 OID 0)
-- Dependencies: 250
-- Name: puente_tipo_funcion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.puente_tipo_funcion_id_seq', 65, true);


--
-- TOC entry 3499 (class 0 OID 0)
-- Dependencies: 252
-- Name: puente_unidad_propietarios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.puente_unidad_propietarios_id_seq', 29, true);


--
-- TOC entry 3500 (class 0 OID 0)
-- Dependencies: 255
-- Name: sancion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sancion_id_seq', 94, true);


--
-- TOC entry 3501 (class 0 OID 0)
-- Dependencies: 257
-- Name: tipo_unidad_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tipo_unidad_id_seq', 5, true);


--
-- TOC entry 3502 (class 0 OID 0)
-- Dependencies: 259
-- Name: tipo_usuario_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tipo_usuario_id_seq', 7, true);


--
-- TOC entry 3503 (class 0 OID 0)
-- Dependencies: 261
-- Name: unidad_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.unidad_id_seq', 11, true);


--
-- TOC entry 3504 (class 0 OID 0)
-- Dependencies: 263
-- Name: usuario_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.usuario_id_seq', 9, true);


--
-- TOC entry 3505 (class 0 OID 0)
-- Dependencies: 291
-- Name: visita_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.visita_id_seq', 56, true);


--
-- TOC entry 3092 (class 2606 OID 89380)
-- Name: asambleas asambleas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.asambleas
    ADD CONSTRAINT asambleas_pkey PRIMARY KEY (id);


--
-- TOC entry 3094 (class 2606 OID 89382)
-- Name: banco banco_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.banco
    ADD CONSTRAINT banco_pkey PRIMARY KEY (id);


--
-- TOC entry 3096 (class 2606 OID 89384)
-- Name: categoriagasto categoriagasto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categoriagasto
    ADD CONSTRAINT categoriagasto_pkey PRIMARY KEY (id);


--
-- TOC entry 3098 (class 2606 OID 89386)
-- Name: cobro_unidad cobro_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cobro_unidad
    ADD CONSTRAINT cobro_pkey PRIMARY KEY (id);


--
-- TOC entry 3100 (class 2606 OID 89388)
-- Name: comunicados comunicados_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comunicados
    ADD CONSTRAINT comunicados_pkey PRIMARY KEY (id);


--
-- TOC entry 3102 (class 2606 OID 89390)
-- Name: concepto_gasto concepto_gasto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.concepto_gasto
    ADD CONSTRAINT concepto_gasto_pkey PRIMARY KEY (id);


--
-- TOC entry 3104 (class 2606 OID 89392)
-- Name: condominio condominio_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.condominio
    ADD CONSTRAINT condominio_pkey PRIMARY KEY (rif);


--
-- TOC entry 3106 (class 2606 OID 89394)
-- Name: condominio condominio_rif_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.condominio
    ADD CONSTRAINT condominio_rif_key UNIQUE (rif);


--
-- TOC entry 3180 (class 2606 OID 89642)
-- Name: cuenta_pagar cuenta_pagar_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cuenta_pagar
    ADD CONSTRAINT cuenta_pagar_pkey PRIMARY KEY (id);


--
-- TOC entry 3108 (class 2606 OID 89398)
-- Name: cuenta cuenta_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cuenta
    ADD CONSTRAINT cuenta_pkey PRIMARY KEY (n_cuenta);


--
-- TOC entry 3110 (class 2606 OID 89400)
-- Name: detalle_pagos detalle_pagos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detalle_pagos
    ADD CONSTRAINT detalle_pagos_pkey PRIMARY KEY (id);


--
-- TOC entry 3112 (class 2606 OID 89402)
-- Name: fondos fondos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fondos
    ADD CONSTRAINT fondos_pkey PRIMARY KEY (id);


--
-- TOC entry 3114 (class 2606 OID 89634)
-- Name: forma_pago forma_pago_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.forma_pago
    ADD CONSTRAINT forma_pago_pkey PRIMARY KEY (id);


--
-- TOC entry 3116 (class 2606 OID 89404)
-- Name: funcion funcion_funcion_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcion
    ADD CONSTRAINT funcion_funcion_key UNIQUE (funcion);


--
-- TOC entry 3118 (class 2606 OID 89406)
-- Name: funcion funcion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcion
    ADD CONSTRAINT funcion_pkey PRIMARY KEY (id);


--
-- TOC entry 3120 (class 2606 OID 89408)
-- Name: gasto_comun gasto_comun_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gasto_comun
    ADD CONSTRAINT gasto_comun_pkey PRIMARY KEY (id);


--
-- TOC entry 3178 (class 2606 OID 89618)
-- Name: gasto gasto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gasto
    ADD CONSTRAINT gasto_pkey PRIMARY KEY (id);


--
-- TOC entry 3122 (class 2606 OID 89412)
-- Name: interes interes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.interes
    ADD CONSTRAINT interes_pkey PRIMARY KEY (id);


--
-- TOC entry 3124 (class 2606 OID 89414)
-- Name: mensaje mensaje_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mensaje
    ADD CONSTRAINT mensaje_pkey PRIMARY KEY (id);


--
-- TOC entry 3126 (class 2606 OID 89416)
-- Name: pagar_cuota_especial pagar_cuota_especial_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pagar_cuota_especial
    ADD CONSTRAINT pagar_cuota_especial_pkey PRIMARY KEY (id);


--
-- TOC entry 3128 (class 2606 OID 89418)
-- Name: persona persona_correo_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_correo_key UNIQUE (correo);


--
-- TOC entry 3130 (class 2606 OID 89420)
-- Name: persona persona_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_pkey PRIMARY KEY (cedula);


--
-- TOC entry 3132 (class 2606 OID 89422)
-- Name: persona persona_telefono_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_telefono_key UNIQUE (telefono);


--
-- TOC entry 3134 (class 2606 OID 89424)
-- Name: propietario propietario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.propietario
    ADD CONSTRAINT propietario_pkey PRIMARY KEY (ci_persona);


--
-- TOC entry 3136 (class 2606 OID 89426)
-- Name: proveedores proveedores_nombre_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.proveedores
    ADD CONSTRAINT proveedores_nombre_key UNIQUE (nombre);


--
-- TOC entry 3138 (class 2606 OID 89428)
-- Name: proveedores proveedores_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.proveedores
    ADD CONSTRAINT proveedores_pkey PRIMARY KEY (cedula);


--
-- TOC entry 3140 (class 2606 OID 89430)
-- Name: puente_asambleas_propietario puente_asamblea_propietario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.puente_asambleas_propietario
    ADD CONSTRAINT puente_asamblea_propietario_pkey PRIMARY KEY (id);


--
-- TOC entry 3142 (class 2606 OID 89432)
-- Name: puente_cobro_factura puente_cobro_factura_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.puente_cobro_factura
    ADD CONSTRAINT puente_cobro_factura_pkey PRIMARY KEY (id);


--
-- TOC entry 3144 (class 2606 OID 89434)
-- Name: puente_comunicado_usuario puente_comunicado_usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.puente_comunicado_usuario
    ADD CONSTRAINT puente_comunicado_usuario_pkey PRIMARY KEY (id);


--
-- TOC entry 3146 (class 2606 OID 89436)
-- Name: puente_concepto_factura puente_concepto_factura_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.puente_concepto_factura
    ADD CONSTRAINT puente_concepto_factura_pkey PRIMARY KEY (id);


--
-- TOC entry 3182 (class 2606 OID 89670)
-- Name: puente_gasto_concepto puente_gasto_concepto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.puente_gasto_concepto
    ADD CONSTRAINT puente_gasto_concepto_pkey PRIMARY KEY (id);


--
-- TOC entry 3148 (class 2606 OID 89440)
-- Name: puente_mensaje_usuario puente_mensaje_usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.puente_mensaje_usuario
    ADD CONSTRAINT puente_mensaje_usuario_pkey PRIMARY KEY (id);


--
-- TOC entry 3150 (class 2606 OID 89442)
-- Name: puente_persona_condominio puente_persona_condominio_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.puente_persona_condominio
    ADD CONSTRAINT puente_persona_condominio_pkey PRIMARY KEY (id);


--
-- TOC entry 3152 (class 2606 OID 89444)
-- Name: puente_sancion_unidad puente_sancion_unidad_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.puente_sancion_unidad
    ADD CONSTRAINT puente_sancion_unidad_pkey PRIMARY KEY (id);


--
-- TOC entry 3154 (class 2606 OID 89446)
-- Name: puente_tipo_funcion puente_tipo_funcion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.puente_tipo_funcion
    ADD CONSTRAINT puente_tipo_funcion_pkey PRIMARY KEY (id);


--
-- TOC entry 3156 (class 2606 OID 89448)
-- Name: puente_unidad_propietarios puente_unidad_propietarios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.puente_unidad_propietarios
    ADD CONSTRAINT puente_unidad_propietarios_pkey PRIMARY KEY (id);


--
-- TOC entry 3158 (class 2606 OID 89450)
-- Name: responsable responsable_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.responsable
    ADD CONSTRAINT responsable_pkey PRIMARY KEY (ci_persona);


--
-- TOC entry 3160 (class 2606 OID 89452)
-- Name: sancion sancion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sancion
    ADD CONSTRAINT sancion_pkey PRIMARY KEY (id);


--
-- TOC entry 3162 (class 2606 OID 89454)
-- Name: tipo_unidad tipo_unidad_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipo_unidad
    ADD CONSTRAINT tipo_unidad_pkey PRIMARY KEY (id);


--
-- TOC entry 3164 (class 2606 OID 89456)
-- Name: tipo_usuario tipo_usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipo_usuario
    ADD CONSTRAINT tipo_usuario_pkey PRIMARY KEY (id);


--
-- TOC entry 3166 (class 2606 OID 89458)
-- Name: tipo_usuario tipo_usuario_tipo_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipo_usuario
    ADD CONSTRAINT tipo_usuario_tipo_key UNIQUE (tipo);


--
-- TOC entry 3168 (class 2606 OID 89460)
-- Name: unidad unidad_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.unidad
    ADD CONSTRAINT unidad_pkey PRIMARY KEY (id);


--
-- TOC entry 3170 (class 2606 OID 89462)
-- Name: usuario usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id);


--
-- TOC entry 3172 (class 2606 OID 89464)
-- Name: usuario usuario_usuario_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_usuario_key UNIQUE (usuario);


--
-- TOC entry 3174 (class 2606 OID 89466)
-- Name: visita visita_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.visita
    ADD CONSTRAINT visita_pkey PRIMARY KEY (id);


--
-- TOC entry 3176 (class 2606 OID 89468)
-- Name: visitante visitante_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.visitante
    ADD CONSTRAINT visitante_pkey PRIMARY KEY (ci_persona);


--
-- TOC entry 3190 (class 2606 OID 89469)
-- Name: puente_asambleas_propietario asambleas_ci_propietario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.puente_asambleas_propietario
    ADD CONSTRAINT asambleas_ci_propietario_fkey FOREIGN KEY (ci_propietario) REFERENCES public.propietario(ci_persona) NOT VALID;


--
-- TOC entry 3184 (class 2606 OID 89474)
-- Name: cuenta cuenta_ci_persona_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cuenta
    ADD CONSTRAINT cuenta_ci_persona_fkey FOREIGN KEY (ci_persona) REFERENCES public.persona(cedula);


--
-- TOC entry 3185 (class 2606 OID 89479)
-- Name: cuenta cuenta_id_banco_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cuenta
    ADD CONSTRAINT cuenta_id_banco_fkey FOREIGN KEY (id_banco) REFERENCES public.banco(id);


--
-- TOC entry 3209 (class 2606 OID 89658)
-- Name: cuenta_pagar cuenta_pagar_id_fondo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cuenta_pagar
    ADD CONSTRAINT cuenta_pagar_id_fondo_fkey FOREIGN KEY (id_fondo) REFERENCES public.fondos(id);


--
-- TOC entry 3206 (class 2606 OID 89643)
-- Name: cuenta_pagar cuenta_pagar_id_forma_pago_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cuenta_pagar
    ADD CONSTRAINT cuenta_pagar_id_forma_pago_fkey FOREIGN KEY (id_forma_pago) REFERENCES public.forma_pago(id);


--
-- TOC entry 3207 (class 2606 OID 89648)
-- Name: cuenta_pagar cuenta_pagar_id_gasto_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cuenta_pagar
    ADD CONSTRAINT cuenta_pagar_id_gasto_fkey FOREIGN KEY (id_gasto) REFERENCES public.gasto(id);


--
-- TOC entry 3208 (class 2606 OID 89653)
-- Name: cuenta_pagar cuenta_pagar_n_cuenta_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cuenta_pagar
    ADD CONSTRAINT cuenta_pagar_n_cuenta_fkey FOREIGN KEY (n_cuenta) REFERENCES public.cuenta(n_cuenta);


--
-- TOC entry 3186 (class 2606 OID 89494)
-- Name: cuenta cuenta_rif_condominio_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cuenta
    ADD CONSTRAINT cuenta_rif_condominio_fkey FOREIGN KEY (rif_condominio) REFERENCES public.condominio(rif);


--
-- TOC entry 3205 (class 2606 OID 89619)
-- Name: gasto gasto_id_asamblea_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gasto
    ADD CONSTRAINT gasto_id_asamblea_fkey FOREIGN KEY (id_asamblea) REFERENCES public.asambleas(id);


--
-- TOC entry 3183 (class 2606 OID 89504)
-- Name: concepto_gasto id_categoria; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.concepto_gasto
    ADD CONSTRAINT id_categoria FOREIGN KEY (id_categoria) REFERENCES public.categoriagasto(id) NOT VALID;


--
-- TOC entry 3187 (class 2606 OID 89509)
-- Name: mensaje mensaje_emisor_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mensaje
    ADD CONSTRAINT mensaje_emisor_fkey FOREIGN KEY (emisor) REFERENCES public.usuario(id);


--
-- TOC entry 3188 (class 2606 OID 89514)
-- Name: pagar_cuota_especial pagar_cuota_especial_id_fondo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pagar_cuota_especial
    ADD CONSTRAINT pagar_cuota_especial_id_fondo_fkey FOREIGN KEY (id_fondo) REFERENCES public.fondos(id);


--
-- TOC entry 3189 (class 2606 OID 89519)
-- Name: propietario propietario_ci_persona_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.propietario
    ADD CONSTRAINT propietario_ci_persona_fkey FOREIGN KEY (ci_persona) REFERENCES public.persona(cedula);


--
-- TOC entry 3211 (class 2606 OID 89676)
-- Name: puente_gasto_concepto puente_gasto_concepto_id_concepto_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.puente_gasto_concepto
    ADD CONSTRAINT puente_gasto_concepto_id_concepto_fkey FOREIGN KEY (id_concepto) REFERENCES public.concepto_gasto(id);


--
-- TOC entry 3210 (class 2606 OID 89671)
-- Name: puente_gasto_concepto puente_gasto_concepto_id_gasto_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.puente_gasto_concepto
    ADD CONSTRAINT puente_gasto_concepto_id_gasto_fkey FOREIGN KEY (id_gasto) REFERENCES public.concepto_gasto(id);


--
-- TOC entry 3191 (class 2606 OID 89534)
-- Name: puente_mensaje_usuario puente_mensaje_usuario_id_mensaje_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.puente_mensaje_usuario
    ADD CONSTRAINT puente_mensaje_usuario_id_mensaje_fkey FOREIGN KEY (id_mensaje) REFERENCES public.mensaje(id);


--
-- TOC entry 3192 (class 2606 OID 89539)
-- Name: puente_mensaje_usuario puente_mensaje_usuario_receptor_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.puente_mensaje_usuario
    ADD CONSTRAINT puente_mensaje_usuario_receptor_fkey FOREIGN KEY (receptor) REFERENCES public.usuario(id);


--
-- TOC entry 3193 (class 2606 OID 89544)
-- Name: puente_persona_condominio puente_persona_condominio_ci_persona_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.puente_persona_condominio
    ADD CONSTRAINT puente_persona_condominio_ci_persona_fkey FOREIGN KEY (ci_persona) REFERENCES public.persona(cedula);


--
-- TOC entry 3194 (class 2606 OID 89549)
-- Name: puente_persona_condominio puente_persona_condominio_rif_condominio_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.puente_persona_condominio
    ADD CONSTRAINT puente_persona_condominio_rif_condominio_fkey FOREIGN KEY (rif_condominio) REFERENCES public.condominio(rif);


--
-- TOC entry 3195 (class 2606 OID 89554)
-- Name: puente_tipo_funcion puente_tipo_funcion_id_funcion_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.puente_tipo_funcion
    ADD CONSTRAINT puente_tipo_funcion_id_funcion_fkey FOREIGN KEY (id_funcion) REFERENCES public.funcion(id);


--
-- TOC entry 3196 (class 2606 OID 89559)
-- Name: puente_tipo_funcion puente_tipo_funcion_id_tipo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.puente_tipo_funcion
    ADD CONSTRAINT puente_tipo_funcion_id_tipo_fkey FOREIGN KEY (id_tipo) REFERENCES public.tipo_usuario(id);


--
-- TOC entry 3197 (class 2606 OID 89564)
-- Name: puente_unidad_propietarios puente_unidad_propietarios_ci_propietario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.puente_unidad_propietarios
    ADD CONSTRAINT puente_unidad_propietarios_ci_propietario_fkey FOREIGN KEY (ci_propietario) REFERENCES public.propietario(ci_persona);


--
-- TOC entry 3198 (class 2606 OID 89569)
-- Name: puente_unidad_propietarios puente_unidad_propietarios_id_unidad_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.puente_unidad_propietarios
    ADD CONSTRAINT puente_unidad_propietarios_id_unidad_fkey FOREIGN KEY (id_unidad) REFERENCES public.unidad(id);


--
-- TOC entry 3199 (class 2606 OID 89574)
-- Name: responsable responsable_ci_persona_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.responsable
    ADD CONSTRAINT responsable_ci_persona_fkey FOREIGN KEY (ci_persona) REFERENCES public.persona(cedula);


--
-- TOC entry 3200 (class 2606 OID 89579)
-- Name: unidad unidad_id_tipo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.unidad
    ADD CONSTRAINT unidad_id_tipo_fkey FOREIGN KEY (id_tipo) REFERENCES public.tipo_unidad(id);


--
-- TOC entry 3201 (class 2606 OID 89584)
-- Name: usuario usuario_ci_persona_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_ci_persona_fkey FOREIGN KEY (ci_persona) REFERENCES public.persona(cedula);


--
-- TOC entry 3202 (class 2606 OID 89589)
-- Name: usuario usuario_id_tipo_usuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_id_tipo_usuario_fkey FOREIGN KEY (id_tipo_usuario) REFERENCES public.tipo_usuario(id);


--
-- TOC entry 3203 (class 2606 OID 89594)
-- Name: visita visita_id_unidad_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.visita
    ADD CONSTRAINT visita_id_unidad_fkey FOREIGN KEY (id_unidad) REFERENCES public.unidad(id) NOT VALID;


--
-- TOC entry 3204 (class 2606 OID 89599)
-- Name: visitante visitante_ci_persona_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.visitante
    ADD CONSTRAINT visitante_ci_persona_fkey FOREIGN KEY (ci_persona) REFERENCES public.persona(cedula);


-- Completed on 2020-06-15 13:24:22

--
-- PostgreSQL database dump complete
--

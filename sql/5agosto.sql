PGDMP                         x            sgc    12.2    12.2 �   �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    161325    sgc    DATABASE     �   CREATE DATABASE sgc WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Spanish_Venezuela.1252' LC_CTYPE = 'Spanish_Venezuela.1252';
    DROP DATABASE sgc;
                postgres    false            $           1255    161326 F   agregar_asambleas(character varying, date, character varying, integer)    FUNCTION       CREATE FUNCTION public.agregar_asambleas(nombre2 character varying, fecha2 date, descripcion2 character varying, id_usuario2 integer) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
DECLARE
	resul int;
BEGIN
	INSERT INTO asambleas(nombre, descripcion, fecha) VALUES (nombre2, descripcion2, fecha2);
	GET DIAGNOSTICS resul = ROW_COUNT;
	
	IF resul>0 THEN
 		UPDATE bitacora SET id_usuario = id_usuario2
		WHERE bitacora.id_bitacora = (SELECT MAX(id_bitacora) FROM bitacora);
	RETURN true;
	
	ELSE
		RETURN false;
	END IF;
END;
$$;
 �   DROP FUNCTION public.agregar_asambleas(nombre2 character varying, fecha2 date, descripcion2 character varying, id_usuario2 integer);
       public          postgres    false            %           1255    161327 )   agregar_banco(character varying, integer)    FUNCTION     �  CREATE FUNCTION public.agregar_banco(nombre2 character varying, id_usuario2 integer) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
DECLARE
	resul int;
BEGIN
	INSERT INTO banco (nombre_banco) VALUES (nombre2);
	GET DIAGNOSTICS resul = ROW_COUNT;
	
	IF resul > 0 THEN
 		UPDATE bitacora SET id_usuario = id_usuario2
		WHERE bitacora.id_bitacora = (SELECT MAX(id_bitacora) FROM bitacora);
		RETURN true;
	ELSE
		RETURN false;
	END IF;
END;
$$;
 T   DROP FUNCTION public.agregar_banco(nombre2 character varying, id_usuario2 integer);
       public          postgres    false            &           1255    161328 @   agregar_categoria(integer, character varying, character varying)    FUNCTION     �  CREATE FUNCTION public.agregar_categoria(id_usuario2 integer, nombre2 character varying, descripcion2 character varying) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
DECLARE
	resul int;
BEGIN
	INSERT INTO categoriagasto (nombre, descripcion) VALUES (nombre2, descripcion2);
	GET DIAGNOSTICS resul = ROW_COUNT;

	IF resul > 0 THEN
 		UPDATE bitacora SET id_usuario = id_usuario2
		WHERE bitacora.id_bitacora = (SELECT MAX(id_bitacora) FROM bitacora);
	RETURN true;
		
	ELSE
		RETURN false;
	END IF;	
END;
$$;
 x   DROP FUNCTION public.agregar_categoria(id_usuario2 integer, nombre2 character varying, descripcion2 character varying);
       public          postgres    false            '           1255    161329 H   agregar_concepto(character varying, character varying, integer, integer)    FUNCTION     6  CREATE FUNCTION public.agregar_concepto(nombre2 character varying, descripcion2 character varying, id_categoria2 integer, id_usuario2 integer) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
DECLARE
	resul int;
BEGIN
	INSERT INTO concepto_gasto(nom_concepto, descripcion, id_categoria) VALUES (nombre2, descripcion2, id_categoria2);
	GET DIAGNOSTICS resul = ROW_COUNT;

	IF resul > 0 THEN
 		UPDATE bitacora SET id_usuario = id_usuario2
		WHERE bitacora.id_bitacora = (SELECT MAX(id_bitacora) FROM bitacora);
		RETURN true;
		
	ELSE
		RETURN false;
	END IF;
END;
$$;
 �   DROP FUNCTION public.agregar_concepto(nombre2 character varying, descripcion2 character varying, id_categoria2 integer, id_usuario2 integer);
       public          postgres    false            (           1255    161330 g   agregar_condominio(integer, character varying, character varying, character varying, character varying)    FUNCTION     y  CREATE FUNCTION public.agregar_condominio(id_usuario2 integer, rif2 character varying, razon_social2 character varying, telefono2 character varying, correo_electronico2 character varying) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
DECLARE
	resul int;
BEGIN
	INSERT INTO condominio (rif, razon_social, telefono, correo_electronico)
	VALUES(rif2, razon_social2, telefono2, correo_electronico2);
	GET DIAGNOSTICS resul = ROW_COUNT;

	IF resul > 0 THEN
 		UPDATE bitacora SET id_usuario = id_usuario2
		WHERE bitacora.id_bitacora = (SELECT MAX(id_bitacora) FROM bitacora);
		RETURN true;
		
	ELSE
		RETURN false;
	END IF;
	
END;
$$;
 �   DROP FUNCTION public.agregar_condominio(id_usuario2 integer, rif2 character varying, razon_social2 character varying, telefono2 character varying, correo_electronico2 character varying);
       public          postgres    false            )           1255    161331 Y   agregar_cuenta(character varying, character varying, integer, character varying, integer)    FUNCTION     S  CREATE FUNCTION public.agregar_cuenta(n_cuenta2 character varying, tipo2 character varying, id_banco2 integer, ci_rif2 character varying, id_usuario2 integer) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
DECLARE
	letra char;
	resul int;
BEGIN
	letra := SUBSTRING(ci_rif2 FROM 1 FOR 1);
	
	IF letra = 'V' OR letra = 'E' THEN
		INSERT INTO cuenta (n_cuenta, tipo, id_banco, ci_persona) VALUES (n_cuenta2, tipo2, id_banco2, ci_rif2);
		GET DIAGNOSTICS resul = ROW_COUNT;

	ELSIF letra = 'J' THEN
		INSERT INTO cuenta (n_cuenta, tipo, id_banco, rif_condominio) VALUES (n_cuenta2, tipo2, id_banco2, ci_rif2);
		GET DIAGNOSTICS resul = ROW_COUNT;
	END IF;
	
	IF resul > 0 THEN
 		UPDATE bitacora SET id_usuario = id_usuario2
		WHERE bitacora.id_bitacora = (SELECT MAX(id_bitacora) FROM bitacora);
		RETURN true;
		
	ELSE
		RETURN false;
	END IF;
END;
$$;
 �   DROP FUNCTION public.agregar_cuenta(n_cuenta2 character varying, tipo2 character varying, id_banco2 integer, ci_rif2 character varying, id_usuario2 integer);
       public          postgres    false            +           1255    161332 �   agregar_cuenta_pagar(character varying, character varying, character varying, double precision, date, double precision, integer, integer, character varying, integer, integer)    FUNCTION     h  CREATE FUNCTION public.agregar_cuenta_pagar(descripcion2 character varying, num_ref2 character varying, moneda2 character varying, monto2 double precision, fecha2 date, tasa_cambio2 double precision, id_gasto2 integer, id_forma_pago2 integer, n_cuenta2 character varying, id_fondo2 integer, id_usuario2 integer) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
DECLARE
	resul int;
BEGIN
	INSERT INTO cuenta_pagar (descripcion, num_ref, moneda, monto, fecha, tasa_cambio, id_gasto,
	id_forma_pago, n_cuenta, id_fondo) VALUES (descripcion2, num_ref2, moneda2, monto2, fecha2,
	tasa_cambio2, id_gasto2, id_forma_pago2, n_cuenta2, id_fondo2);
	GET DIAGNOSTICS resul = ROW_COUNT;
	
	IF resul > 0 THEN
 		UPDATE bitacora SET id_usuario = id_usuario2
		WHERE bitacora.id_bitacora = (SELECT MAX(id_bitacora) FROM bitacora);
		RETURN true;
		
	ELSE
		RETURN false;
	END IF;
END;
$$;
 7  DROP FUNCTION public.agregar_cuenta_pagar(descripcion2 character varying, num_ref2 character varying, moneda2 character varying, monto2 double precision, fecha2 date, tasa_cambio2 double precision, id_gasto2 integer, id_forma_pago2 integer, n_cuenta2 character varying, id_fondo2 integer, id_usuario2 integer);
       public          postgres    false            -           1255    161333 {   agregar_fondos(integer, character varying, date, character varying, character varying, double precision, character varying)    FUNCTION     �  CREATE FUNCTION public.agregar_fondos(id_usuario2 integer, tipo2 character varying, fecha2 date, descripcion2 character varying, observaciones2 character varying, monto_inicial2 double precision, moneda2 character varying) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
DECLARE
	resul int;
BEGIN
	INSERT INTO fondos(tipo, fecha, descripcion, observaciones, monto_inicial, saldo, moneda)
	VALUES (tipo2, fecha2, descripcion2, observaciones2, monto_inicial2, monto_inicial2, moneda2);
	GET DIAGNOSTICS resul = ROW_COUNT;
	
	IF resul > 0 THEN
 		UPDATE bitacora SET id_usuario = id_usuario2
		WHERE bitacora.id_bitacora = (SELECT MAX(id_bitacora) FROM bitacora);
	RETURN true;
		
	ELSE
		RETURN false;
	END IF;	
END;
$$;
 �   DROP FUNCTION public.agregar_fondos(id_usuario2 integer, tipo2 character varying, fecha2 date, descripcion2 character varying, observaciones2 character varying, monto_inicial2 double precision, moneda2 character varying);
       public          postgres    false            .           1255    161334 .   agregar_forma_pago(character varying, integer)    FUNCTION     �  CREATE FUNCTION public.agregar_forma_pago(nombre2 character varying, id_usuario2 integer) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
DECLARE
	resul int;
BEGIN
	INSERT INTO forma_pago (forma_pago) VALUES (nombre2);
	GET DIAGNOSTICS resul = ROW_COUNT;

	IF resul > 0 THEN
 		UPDATE bitacora SET id_usuario = id_usuario2
		WHERE bitacora.id_bitacora = (SELECT MAX(id_bitacora) FROM bitacora);
		RETURN true;
		
	ELSE
		RETURN false;
	END IF;
END;
$$;
 Y   DROP FUNCTION public.agregar_forma_pago(nombre2 character varying, id_usuario2 integer);
       public          postgres    false            <           1255    161335 �   agregar_gasto(character varying, character varying, character varying, character varying, integer, integer, integer, integer, text, integer, double precision, character varying, integer)    FUNCTION     �  CREATE FUNCTION public.agregar_gasto(nombre2 character varying, tipo2 character varying, id_proveedor2 character varying, calcular_por2 character varying, mes2 integer, anio2 integer, n_meses2 integer, id_asamblea2 integer, observacion2 text, meses_restantes2 integer, monto2 double precision, moneda2 character varying, id_usuario2 integer) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
DECLARE
	resul int;
BEGIN
	INSERT INTO gasto(nombre, tipo, id_proveedor, calcular_por, mes, anio, n_meses, observacion, id_asamblea, meses_restantes, monto, saldo, moneda) VALUES (nombre2, tipo2, id_proveedor2, calcular_por2, mes2, anio2, n_meses2, observacion2, id_asamblea2, meses_restantes2, monto2, monto2, moneda2);
	GET DIAGNOSTICS resul = ROW_COUNT;

	IF resul > 0 THEN
 		UPDATE bitacora SET id_usuario = id_usuario2
		WHERE bitacora.id_bitacora = (SELECT MAX(id_bitacora) FROM bitacora);
		RETURN true;
		
	ELSE
		RETURN false;
	END IF;
END;
$$;
 U  DROP FUNCTION public.agregar_gasto(nombre2 character varying, tipo2 character varying, id_proveedor2 character varying, calcular_por2 character varying, mes2 integer, anio2 integer, n_meses2 integer, id_asamblea2 integer, observacion2 text, meses_restantes2 integer, monto2 double precision, moneda2 character varying, id_usuario2 integer);
       public          postgres    false            =           1255    161336 P   agregar_interes(character varying, double precision, character varying, integer)    FUNCTION     *  CREATE FUNCTION public.agregar_interes(nombre2 character varying, factor2 double precision, rif_condominio2 character varying, id_usuario2 integer) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
DECLARE
	resul int;
BEGIN
	INSERT INTO interes (nombre, factor, rif_condominio) VALUES (nombre2, factor2, rif_condominio2);
	GET DIAGNOSTICS resul = ROW_COUNT;
	
	IF resul > 0 THEN
	 	UPDATE bitacora SET id_usuario = id_usuario2
		WHERE bitacora.id_bitacora = (SELECT MAX(id_bitacora) FROM bitacora);
		RETURN true;
		
	ELSE
		RETURN false;
	END IF;
END;
$$;
 �   DROP FUNCTION public.agregar_interes(nombre2 character varying, factor2 double precision, rif_condominio2 character varying, id_usuario2 integer);
       public          postgres    false            >           1255    161337 �   agregar_propietario(character varying, character varying, character varying, character varying, character varying, character varying, character varying, boolean, integer)    FUNCTION     �  CREATE FUNCTION public.agregar_propietario(_cedula character varying, _p_nombre character varying, _s_nombre character varying, _p_apellido character varying, _s_apellido character varying, _telefono character varying, _correo character varying, _existe boolean, _id_usuario integer) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
DECLARE
	resul integer;
	fila RECORD;
BEGIN
	IF _existe = false THEN
		RAISE INFO 'Agregando en la tabla persona...';
		INSERT INTO persona (cedula, p_nombre, s_nombre, p_apellido, s_apellido, telefono, correo) VALUES (_cedula, _p_nombre, _s_nombre, _p_apellido, _s_apellido, _telefono, _correo) ON CONFLICT DO NOTHING;
		GET DIAGNOSTICS resul = ROW_COUNT;

		IF resul <> 1 THEN
			RAISE WARNING 'No se pudo agregar en persona';
			RETURN false;
		ELSE
			RAISE INFO 'Éxito';
			SELECT * INTO fila FROM persona WHERE cedula = _cedula;
		END IF;
	END IF;

	RAISE INFO 'Agregando en la tabla propietario...';
	INSERT INTO propietario (ci_persona) VALUES (_cedula) ON CONFLICT DO NOTHING;
	GET DIAGNOSTICS resul = ROW_COUNT;

	IF resul <> 1 THEN
		RAISE WARNING 'No se pudo agregar en propietario';
		RETURN false;

	ELSE
		RAISE INFO 'Éxito';
		RAISE INFO 'Actualizando la bitácora...';
		UPDATE bitacora SET id_usuario = _id_usuario, valor_nuevo = fila WHERE bitacora.id_bitacora = (SELECT MAX(id_bitacora) FROM bitacora) AND tabla = 'propietario';
		RETURN true;
	END IF;
END;
$$;
   DROP FUNCTION public.agregar_propietario(_cedula character varying, _p_nombre character varying, _s_nombre character varying, _p_apellido character varying, _s_apellido character varying, _telefono character varying, _correo character varying, _existe boolean, _id_usuario integer);
       public          postgres    false            ?           1255    161338 �   agregar_proveedor(character varying, character varying, character varying, character varying, character varying, character varying, integer)    FUNCTION     �  CREATE FUNCTION public.agregar_proveedor(cedula2 character varying, nombre2 character varying, telefono2 character varying, correo2 character varying, contacto2 character varying, direccion2 character varying, id_usuario2 integer) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
DECLARE
	resul int;
BEGIN
	INSERT INTO proveedores(cedula, nombre, telefono, correo, contacto, direccion) VALUES (cedula2, nombre2, telefono2, correo2, contacto2, direccion2);
	GET DIAGNOSTICS resul = ROW_COUNT;

	IF resul > 0 THEN
	 	UPDATE bitacora SET id_usuario = id_usuario2
		WHERE bitacora.id_bitacora = (SELECT MAX(id_bitacora) FROM bitacora);
		RETURN true;
		
	ELSE
		RETURN false;
	END IF;
END;
$$;
 �   DROP FUNCTION public.agregar_proveedor(cedula2 character varying, nombre2 character varying, telefono2 character varying, correo2 character varying, contacto2 character varying, direccion2 character varying, id_usuario2 integer);
       public          postgres    false            @           1255    161339 �   agregar_sancion(character varying, integer, integer, double precision, character varying, character varying, character varying, integer)    FUNCTION     �  CREATE FUNCTION public.agregar_sancion(tipo2 character varying, mes2 integer, anio2 integer, monto2 double precision, descripcion2 character varying, estado2 character varying, moneda2 character varying, id_usuario2 integer) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
DECLARE
	resul int;
BEGIN
	INSERT INTO sancion(tipo, mes, anio, monto, descripcion,  estado, moneda) VALUES (tipo2, mes2, anio2, monto2, descripcion2,  estado2, moneda2);
	GET DIAGNOSTICS resul = ROW_COUNT;

	IF resul > 0 THEN	
 		UPDATE bitacora SET id_usuario = id_usuario2
		WHERE bitacora.id_bitacora = (SELECT MAX(id_bitacora) FROM bitacora);
		RETURN true;
		
	ELSE
		RETURN false;
	END IF;
END;
$$;
 �   DROP FUNCTION public.agregar_sancion(tipo2 character varying, mes2 integer, anio2 integer, monto2 double precision, descripcion2 character varying, estado2 character varying, moneda2 character varying, id_usuario2 integer);
       public          postgres    false            A           1255    161340 A   agregar_tipo_unidad(character varying, double precision, integer)    FUNCTION     �  CREATE FUNCTION public.agregar_tipo_unidad(tipo2 character varying, area2 double precision, id_usuario2 integer) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
DECLARE
	resul int;
BEGIN
	INSERT INTO tipo_unidad(tipo, area) VALUES (tipo2,area2);
	GET DIAGNOSTICS resul = ROW_COUNT;

	IF resul > 0 THEN
 		UPDATE bitacora SET id_usuario = id_usuario2
		WHERE bitacora.id_bitacora = (SELECT MAX(id_bitacora) FROM bitacora);
		RETURN true;
		
	ELSE
		RETURN false;
	END IF;
END;
$$;
 p   DROP FUNCTION public.agregar_tipo_unidad(tipo2 character varying, area2 double precision, id_usuario2 integer);
       public          postgres    false            B           1255    161341 Y   agregar_unidad(character varying, character varying, character varying, integer, integer)    FUNCTION     R  CREATE FUNCTION public.agregar_unidad(n_unidad2 character varying, n_documento2 character varying, direccion2 character varying, id_tipo2 integer, id_usuario2 integer) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
DECLARE
	resul int;
BEGIN
	INSERT INTO unidad(n_unidad, n_documento, direccion, id_tipo) VALUES (n_unidad2, n_documento2, direccion2, id_tipo2);
	GET DIAGNOSTICS resul = ROW_COUNT;

	IF resul > 0 THEN
 		UPDATE bitacora SET id_usuario = id_usuario2
		WHERE bitacora.id_bitacora = (SELECT MAX(id_bitacora) FROM bitacora);
		RETURN true;
		
	ELSE
		RETURN false;
	END IF;
END;
$$;
 �   DROP FUNCTION public.agregar_unidad(n_unidad2 character varying, n_documento2 character varying, direccion2 character varying, id_tipo2 integer, id_usuario2 integer);
       public          postgres    false            C           1255    161342 u   agregar_visita(integer, character varying, integer, character varying, character varying, character varying, integer)    FUNCTION     �  CREATE FUNCTION public.agregar_visita(id_unidad2 integer, ci_persona2 character varying, n_personas2 integer, matricula2 character varying, modelo2 character varying, color2 character varying, id_usuario2 integer) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
DECLARE
	resul int;
BEGIN
	INSERT INTO visita(id_unidad, ci_visitante, n_personas, matricula, modelo, color) VALUES (id_unidad2, ci_persona2, n_personas2, matricula2, modelo2, color2);
	GET DIAGNOSTICS resul = ROW_COUNT;

	IF resul > 0 THEN
 		UPDATE bitacora SET id_usuario = id_usuario2
		WHERE bitacora.id_bitacora = (SELECT MAX(id_bitacora) FROM bitacora);
		RETURN true;
		
	ELSE
		RETURN false;
	END IF;
END;
$$;
 �   DROP FUNCTION public.agregar_visita(id_unidad2 integer, ci_persona2 character varying, n_personas2 integer, matricula2 character varying, modelo2 character varying, color2 character varying, id_usuario2 integer);
       public          postgres    false            D           1255    161343    calcular_alicuota()    FUNCTION       CREATE FUNCTION public.calcular_alicuota() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
	area_total double precision;
BEGIN
	area_total := (SELECT SUM(tp.area) FROM unidad AS u INNER JOIN tipo_unidad AS tp ON u.id_tipo = tp.id WHERE 	 u.activo = true);
		
	UPDATE unidad SET alicuota = (SELECT area FROM tipo_unidad WHERE id = id_tipo) / area_total;
	
RETURN NEW;
END;
$$;
 *   DROP FUNCTION public.calcular_alicuota();
       public          postgres    false            *           1255    161344 F   cambiar_clave(character varying, character varying, character varying)    FUNCTION     �  CREATE FUNCTION public.cambiar_clave(usuario2 character varying, password_nuevo character varying, password_actual character varying) RETURNS boolean
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
 �   DROP FUNCTION public.cambiar_clave(usuario2 character varying, password_nuevo character varying, password_actual character varying);
       public          postgres    false            E           1255    161345 \   cambiar_pregunta(character varying, character varying, character varying, character varying)    FUNCTION     �  CREATE FUNCTION public.cambiar_pregunta(usuario2 character varying, pregunta2 character varying, respuesta2 character varying, password2 character varying) RETURNS boolean
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
 �   DROP FUNCTION public.cambiar_pregunta(usuario2 character varying, pregunta2 character varying, respuesta2 character varying, password2 character varying);
       public          postgres    false            F           1255    161346     eliminar_banco(integer, integer)    FUNCTION     �  CREATE FUNCTION public.eliminar_banco(id2 integer, id_usuario2 integer) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
DECLARE
	resul int;
BEGIN

	UPDATE banco SET activo = false WHERE id = id2;
	GET DIAGNOSTICS resul = ROW_COUNT;

	IF resul > 0 THEN	
 		UPDATE bitacora SET id_usuario = id_usuario2, operacion = 'Eliminado', valor_nuevo = null
		WHERE bitacora.id_bitacora = (SELECT MAX(id_bitacora) FROM bitacora);
		RETURN true;
		
	ELSE
		RETURN false;
	END IF;
END;
$$;
 G   DROP FUNCTION public.eliminar_banco(id2 integer, id_usuario2 integer);
       public          postgres    false            G           1255    161347 $   eliminar_categoria(integer, integer)    FUNCTION     �  CREATE FUNCTION public.eliminar_categoria(id_usuario2 integer, id2 integer) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
DECLARE
	resul int;
BEGIN
	UPDATE categoriagasto SET activo=false WHERE id=id2;
	GET DIAGNOSTICS resul = ROW_COUNT;

	IF resul > 0 THEN
 		UPDATE bitacora SET id_usuario = id_usuario2, operacion = 'Eliminado', valor_nuevo = null
		WHERE bitacora.id_bitacora = (SELECT MAX(id_bitacora) FROM bitacora);
	RETURN true;
		
	ELSE
		RETURN false;
	END IF;
END;
$$;
 K   DROP FUNCTION public.eliminar_categoria(id_usuario2 integer, id2 integer);
       public          postgres    false            H           1255    161348 #   eliminar_concepto(integer, integer)    FUNCTION     �  CREATE FUNCTION public.eliminar_concepto(id2 integer, id_usuario2 integer) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
DECLARE
	resul int;
BEGIN
	UPDATE concepto_gasto SET activo=false WHERE id = id2;
	GET DIAGNOSTICS resul = ROW_COUNT;

	IF resul > 0 THEN
 		UPDATE bitacora SET id_usuario = id_usuario2, operacion = 'Eliminado', valor_nuevo = null
		WHERE bitacora.id_bitacora = (SELECT MAX(id_bitacora) FROM bitacora);
	RETURN true;
		
	ELSE
		RETURN false;
	END IF;	
END;
$$;
 J   DROP FUNCTION public.eliminar_concepto(id2 integer, id_usuario2 integer);
       public          postgres    false            I           1255    161349 +   eliminar_cuenta(character varying, integer)    FUNCTION     �  CREATE FUNCTION public.eliminar_cuenta(n_cuenta2 character varying, id_usuario2 integer) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
DECLARE
	resul int;
BEGIN
	UPDATE cuenta SET activo=false WHERE n_cuenta = n_cuenta2;
	GET DIAGNOSTICS resul = ROW_COUNT;
	
	IF resul > 0 THEN
 		UPDATE bitacora SET id_usuario = id_usuario2, operacion = 'Eliminado', valor_nuevo = null
	   	WHERE bitacora.id_bitacora = (SELECT MAX(id_bitacora) FROM bitacora);
		RETURN true;
		
	ELSE
		RETURN false;
	END IF;
END;
$$;
 X   DROP FUNCTION public.eliminar_cuenta(n_cuenta2 character varying, id_usuario2 integer);
       public          postgres    false            J           1255    161350 !   eliminar_fondos(integer, integer)    FUNCTION     �  CREATE FUNCTION public.eliminar_fondos(id_usuario2 integer, id2 integer) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
DECLARE
	resul int;
BEGIN
	UPDATE fondos SET activo=false WHERE id=id2;
	GET DIAGNOSTICS resul = ROW_COUNT;

	IF resul > 0 THEN
 		UPDATE bitacora SET id_usuario = id_usuario2, operacion = 'Eliminado', valor_nuevo = null
		WHERE bitacora.id_bitacora = (SELECT MAX(id_bitacora) FROM bitacora);
		RETURN true;
		
	ELSE
		RETURN false;
	END IF;
END;
$$;
 H   DROP FUNCTION public.eliminar_fondos(id_usuario2 integer, id2 integer);
       public          postgres    false            K           1255    161351 %   eliminar_forma_pago(integer, integer)    FUNCTION     �  CREATE FUNCTION public.eliminar_forma_pago(id2 integer, id_usuario2 integer) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
DECLARE
	resul int;
BEGIN
	UPDATE forma_pago SET activo = false WHERE id = id2;
	GET DIAGNOSTICS resul = ROW_COUNT;

	IF resul > 0 THEN
 		UPDATE bitacora SET id_usuario = id_usuario2, operacion = 'Eliminado', valor_nuevo = null
		WHERE bitacora.id_bitacora = (SELECT MAX(id_bitacora) FROM bitacora);
		RETURN true;
		
	ELSE
		RETURN false;
	END IF;
END;
$$;
 L   DROP FUNCTION public.eliminar_forma_pago(id2 integer, id_usuario2 integer);
       public          postgres    false            L           1255    161352 "   eliminar_interes(integer, integer)    FUNCTION     �  CREATE FUNCTION public.eliminar_interes(id2 integer, id_usuario2 integer) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
DECLARE
	resul int;
BEGIN
	UPDATE interes SET activo = false WHERE id = id2;
	GET DIAGNOSTICS resul = ROW_COUNT;

	IF resul > 0 THEN
	 	UPDATE bitacora SET id_usuario = id_usuario2, operacion = 'Eliminado', valor_nuevo = null
		WHERE bitacora.id_bitacora = (SELECT MAX(id_bitacora) FROM bitacora);
		RETURN true;
		
	ELSE
		RETURN false;
	END IF;
END;
$$;
 I   DROP FUNCTION public.eliminar_interes(id2 integer, id_usuario2 integer);
       public          postgres    false            M           1255    161353    eliminar_mensaje()    FUNCTION     �  CREATE FUNCTION public.eliminar_mensaje() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
	emisor_bd boolean;
	receptor_bd integer;
BEGIN
	emisor_bd := true;
	--RAISE INFO 'Consultando si el emisor eliminó el mensaje con id: %...', OLD.id;
	emisor_bd := (SELECT activo_emisor FROM mensaje AS msj WHERE msj.id = NEW.id);
	--RAISE INFO 'El resultado es %', emisor_bd;

	IF emisor_bd = true THEN
		--RAISE INFO 'Emisor no ha eliminado el mensaje';
		RETURN null;
	
	ELSE
		--RAISE INFO 'Emisor eliminó el mensaje. Buscando en receptores...';
		receptor_bd := (SELECT COUNT(*) FROM puente_mensaje_usuario WHERE activo_receptor = true AND id_mensaje = OLD.id);
	
		IF receptor_bd = 0 THEN
			--RAISE INFO 'Todos los receptores eliminaron el mensaje';
			DELETE FROM puente_mensaje_usuario WHERE id_mensaje = OLD.id;
			DELETE FROM mensaje WHERE id = old.id;
			
			RETURN NEW;
			
		ELSE
			RETURN null;
		END IF;
	END IF;
END;
$$;
 )   DROP FUNCTION public.eliminar_mensaje();
       public          postgres    false            N           1255    161354 .   eliminar_proveedor(character varying, integer)    FUNCTION     �  CREATE FUNCTION public.eliminar_proveedor(cedula2 character varying, id_usuario2 integer) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
DECLARE
	resul int;
BEGIN
	UPDATE proveedores SET activo = false WHERE cedula = cedula2;
	GET DIAGNOSTICS resul = ROW_COUNT;

	IF resul > 0 THEN
 		UPDATE bitacora SET id_usuario = id_usuario2, operacion = 'Eliminado', valor_nuevo = null
		WHERE bitacora.id_bitacora = (SELECT MAX(id_bitacora) FROM bitacora);
		RETURN true;
		
	ELSE
		RETURN false;
	END IF;
END;
$$;
 Y   DROP FUNCTION public.eliminar_proveedor(cedula2 character varying, id_usuario2 integer);
       public          postgres    false            O           1255    161355 "   eliminar_sancion(integer, integer)    FUNCTION     �  CREATE FUNCTION public.eliminar_sancion(id2 integer, id_usuario2 integer) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
DECLARE
	resul int;
BEGIN
	DELETE FROM sancion WHERE id=id2;
	GET DIAGNOSTICS resul = ROW_COUNT;

	IF resul > 0 THEN
 		UPDATE bitacora SET id_usuario = id_usuario2, operacion = 'Eliminado', valor_nuevo = null
		WHERE bitacora.id_bitacora = (SELECT MAX(id_bitacora) FROM bitacora);
		RETURN true;
		
	ELSE
		RETURN false;
	END IF;
END;
$$;
 I   DROP FUNCTION public.eliminar_sancion(id2 integer, id_usuario2 integer);
       public          postgres    false            P           1255    161356 &   eliminar_tipo_unidad(integer, integer)    FUNCTION     �  CREATE FUNCTION public.eliminar_tipo_unidad(tipo2 integer, id_usuario2 integer) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
DECLARE
	resul int;
BEGIN
	UPDATE tipo_unidad SET activo = false WHERE id = tipo2;
	GET DIAGNOSTICS resul = ROW_COUNT;

	IF resul > 0 THEN
 		UPDATE bitacora SET id_usuario = id_usuario2, operacion = 'Eliminado', valor_nuevo = null
		WHERE bitacora.id_bitacora = (SELECT MAX(id_bitacora) FROM bitacora);
		RETURN true;
		
	ELSE
		RETURN false;
	END IF;
END;
$$;
 O   DROP FUNCTION public.eliminar_tipo_unidad(tipo2 integer, id_usuario2 integer);
       public          postgres    false            ,           1255    161357 !   eliminar_unidad(integer, integer)    FUNCTION     �  CREATE FUNCTION public.eliminar_unidad(id2 integer, id_usuario2 integer) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
DECLARE
	resul int;
BEGIN
	UPDATE unidad SET activo = false WHERE id = id2;
	GET DIAGNOSTICS resul = ROW_COUNT;

	IF resul > 0 THEN
 		UPDATE bitacora SET id_usuario = id_usuario2, operacion = 'Eliminado', valor_nuevo = null
		WHERE bitacora.id_bitacora = (SELECT MAX(id_bitacora) FROM bitacora);
	RETURN true;
		
	ELSE
		RETURN false;
	END IF;
END;
$$;
 H   DROP FUNCTION public.eliminar_unidad(id2 integer, id_usuario2 integer);
       public          postgres    false            /           1255    161358    limpiar_mensaje()    FUNCTION     �  CREATE FUNCTION public.limpiar_mensaje() RETURNS void
    LANGUAGE plpgsql
    AS $$
	BEGIN

		DELETE FROM puente_mensaje_usuario AS pu WHERE (SELECT id FROM mensaje AS me WHERE pu.id_mensaje = me.id) = id_mensaje AND ((LOCALTIMESTAMP(0)::DATE) - (SELECT fecha FROM mensaje AS me WHERE pu.id_mensaje = me.id)::DATE > 90) ;
		
		DELETE FROM mensaje WHERE (LOCALTIMESTAMP(0)::DATE - fecha::DATE) > 90;
	 
	END;
	$$;
 (   DROP FUNCTION public.limpiar_mensaje();
       public          postgres    false            #           1255    161359    llenar_bitacora()    FUNCTION     �  CREATE FUNCTION public.llenar_bitacora() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
	IF TG_OP = 'INSERT' THEN
		INSERT INTO bitacora (operacion, tabla, valor_nuevo)
		VALUES ('Registro', TG_TABLE_NAME, NEW);
		RETURN NEW;
		END IF;
	IF TG_OP = 'UPDATE' THEN
		INSERT INTO bitacora (operacion, tabla, valor_viejo, valor_nuevo)
		VALUES (TG_OP, TG_TABLE_NAME, OLD, NEW);
		RETURN NEW;
	END IF;
	RETURN NEW;
END;
$$;
 (   DROP FUNCTION public.llenar_bitacora();
       public          postgres    false            Q           1255    161360 +   login(character varying, character varying)    FUNCTION     �  CREATE FUNCTION public.login(usu character varying, pass character varying) RETURNS boolean
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
 K   DROP FUNCTION public.login(usu character varying, pass character varying);
       public          postgres    false            R           1255    161361    mayuscula_asambleas()    FUNCTION     �   CREATE FUNCTION public.mayuscula_asambleas() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN

	NEW.nombre = UPPER(NEW.nombre);
	NEW.descripcion = UPPER(NEW.descripcion);

	RETURN NEW;
END;
$$;
 ,   DROP FUNCTION public.mayuscula_asambleas();
       public          postgres    false            S           1255    161362    mayuscula_banco()    FUNCTION     �   CREATE FUNCTION public.mayuscula_banco() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN

	NEW.nombre_banco = UPPER(NEW.nombre_banco);

	RETURN NEW;
END;
$$;
 (   DROP FUNCTION public.mayuscula_banco();
       public          postgres    false            T           1255    161363    mayuscula_categoriagasto()    FUNCTION     �   CREATE FUNCTION public.mayuscula_categoriagasto() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN

	NEW.nombre = UPPER(NEW.nombre);
	NEW.descripcion = UPPER(NEW.descripcion);

	RETURN NEW;
END;
$$;
 1   DROP FUNCTION public.mayuscula_categoriagasto();
       public          postgres    false            U           1255    161364    mayuscula_cobro_unidad()    FUNCTION     �   CREATE FUNCTION public.mayuscula_cobro_unidad() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN

	NEW.descripcion = UPPER(NEW.descripcion);

	RETURN NEW;
END;
$$;
 /   DROP FUNCTION public.mayuscula_cobro_unidad();
       public          postgres    false            V           1255    161365    mayuscula_concepto_gasto()    FUNCTION     �   CREATE FUNCTION public.mayuscula_concepto_gasto() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
	
	NEW.nom_concepto = UPPER(NEW.nom_concepto);
	NEW.descripcion = UPPER(NEW.descripcion);
	
	RETURN NEW;
END;
$$;
 1   DROP FUNCTION public.mayuscula_concepto_gasto();
       public          postgres    false            W           1255    161366    mayuscula_condominio()    FUNCTION     �   CREATE FUNCTION public.mayuscula_condominio() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
	
	NEW.razon_social = UPPER(NEW.razon_social);
	NEW.correo_electronico = UPPER(NEW.correo_electronico);
	
	RETURN NEW;
END;
$$;
 -   DROP FUNCTION public.mayuscula_condominio();
       public          postgres    false            X           1255    161367    mayuscula_cuenta()    FUNCTION     �   CREATE FUNCTION public.mayuscula_cuenta() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
	
	NEW.tipo = UPPER(NEW.tipo);
	
	RETURN NEW;
END;
$$;
 )   DROP FUNCTION public.mayuscula_cuenta();
       public          postgres    false            Y           1255    161368    mayuscula_cuenta_pagar()    FUNCTION     �   CREATE FUNCTION public.mayuscula_cuenta_pagar() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
	
	NEW.descripcion = UPPER(NEW.descripcion);	
	
	RETURN NEW;
END;
$$;
 /   DROP FUNCTION public.mayuscula_cuenta_pagar();
       public          postgres    false            Z           1255    161369    mayuscula_detalle_pagos()    FUNCTION     �   CREATE FUNCTION public.mayuscula_detalle_pagos() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
	
	NEW.tipo_gasto = UPPER(NEW.tipo_gasto);
	
	RETURN NEW;
END;
$$;
 0   DROP FUNCTION public.mayuscula_detalle_pagos();
       public          postgres    false            [           1255    161370    mayuscula_fondos()    FUNCTION     �   CREATE FUNCTION public.mayuscula_fondos() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
	
	NEW.tipo = UPPER(NEW.tipo);
	NEW.descripcion = UPPER(NEW.descripcion);
	NEW.observaciones = UPPER(NEW.observaciones);
	
	RETURN NEW;
END;
$$;
 )   DROP FUNCTION public.mayuscula_fondos();
       public          postgres    false            \           1255    161371    mayuscula_forma_pago()    FUNCTION     �   CREATE FUNCTION public.mayuscula_forma_pago() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
	
	NEW.forma_pago = UPPER(NEW.forma_pago);
	
	RETURN NEW;
END;
$$;
 -   DROP FUNCTION public.mayuscula_forma_pago();
       public          postgres    false            ]           1255    161372    mayuscula_gasto()    FUNCTION     �   CREATE FUNCTION public.mayuscula_gasto() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
	
	NEW.nombre = UPPER(NEW.nombre);
	NEW.tipo = UPPER(NEW.tipo);
	NEW.observacion = UPPER(NEW.observacion);
	
	RETURN NEW;
END;
$$;
 (   DROP FUNCTION public.mayuscula_gasto();
       public          postgres    false            ^           1255    161373    mayuscula_interes()    FUNCTION     �   CREATE FUNCTION public.mayuscula_interes() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
	
	NEW.nombre = UPPER(NEW.nombre);
	
	RETURN NEW;
END;
$$;
 *   DROP FUNCTION public.mayuscula_interes();
       public          postgres    false            _           1255    161374    mayuscula_persona()    FUNCTION     7  CREATE FUNCTION public.mayuscula_persona() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
	
	NEW.p_nombre = UPPER(NEW.p_nombre);
	NEW.s_nombre = UPPER(NEW.s_nombre);
	NEW.p_apellido = UPPER(NEW.p_apellido);
	NEW.s_apellido = UPPER(NEW.s_apellido);
	NEW.correo = UPPER(NEW.correo);
	
	RETURN NEW;
END;
$$;
 *   DROP FUNCTION public.mayuscula_persona();
       public          postgres    false            `           1255    161375    mayuscula_proveedores()    FUNCTION       CREATE FUNCTION public.mayuscula_proveedores() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
	
	NEW.nombre = UPPER(NEW.nombre);
	NEW.correo = UPPER(NEW.correo);
	NEW.contacto = UPPER(NEW.contacto);
	NEW.direccion = UPPER(NEW.direccion);
	
	RETURN NEW;
END;
$$;
 .   DROP FUNCTION public.mayuscula_proveedores();
       public          postgres    false            a           1255    161376    mayuscula_sancion()    FUNCTION     �   CREATE FUNCTION public.mayuscula_sancion() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
	
	NEW.descripcion = UPPER(NEW.descripcion);
	
	RETURN NEW;
END;
$$;
 *   DROP FUNCTION public.mayuscula_sancion();
       public          postgres    false            b           1255    161377    mayuscula_tipo_unidad()    FUNCTION     �   CREATE FUNCTION public.mayuscula_tipo_unidad() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
	
	NEW.tipo = UPPER(NEW.tipo);
	
	RETURN NEW;
END;
$$;
 .   DROP FUNCTION public.mayuscula_tipo_unidad();
       public          postgres    false            c           1255    161378    mayuscula_tipo_usuario()    FUNCTION     �   CREATE FUNCTION public.mayuscula_tipo_usuario() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
	
	NEW.tipo = UPPER(NEW.tipo);
	
	RETURN NEW;
END;
$$;
 /   DROP FUNCTION public.mayuscula_tipo_usuario();
       public          postgres    false            d           1255    161379    mayuscula_unidad()    FUNCTION     �   CREATE FUNCTION public.mayuscula_unidad() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
	
	NEW.n_unidad = UPPER(NEW.n_unidad);
	NEW.n_documento = UPPER(NEW.n_documento);
	NEW.direccion = UPPER(NEW.direccion);

	RETURN NEW;
END;
$$;
 )   DROP FUNCTION public.mayuscula_unidad();
       public          postgres    false            e           1255    161380    mayuscula_visita()    FUNCTION     �   CREATE FUNCTION public.mayuscula_visita() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
	
	NEW.matricula = UPPER(NEW.matricula);
	NEW.modelo = UPPER(NEW.modelo);
	NEW.color = UPPER(NEW.color);

	RETURN NEW;
END;
$$;
 )   DROP FUNCTION public.mayuscula_visita();
       public          postgres    false            f           1255    161381 4   modificar_banco(integer, character varying, integer)    FUNCTION     �  CREATE FUNCTION public.modificar_banco(id2 integer, nombre2 character varying, id_usuario2 integer) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
DECLARE	
	resul int;
BEGIN
	UPDATE banco SET nombre_banco = nombre2 WHERE id = id2;
	GET DIAGNOSTICS resul = ROW_COUNT;
	
	IF resul > 0 THEN
 		UPDATE bitacora SET id_usuario = id_usuario2, operacion = 'Modificado'
		WHERE bitacora.id_bitacora = (SELECT MAX(id_bitacora) FROM bitacora);
	RETURN true;
	
	ELSE
		RETURN false;
	END IF;
END;
$$;
 c   DROP FUNCTION public.modificar_banco(id2 integer, nombre2 character varying, id_usuario2 integer);
       public          postgres    false            g           1255    161382 K   modificar_categoria(integer, character varying, character varying, integer)    FUNCTION     %  CREATE FUNCTION public.modificar_categoria(id_usuario2 integer, nombre2 character varying, descripcion2 character varying, id2 integer) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
DECLARE
	resul int;
BEGIN
	UPDATE categoriagasto SET nombre=nombre2, descripcion=descripcion2 WHERE id=id2;
	GET DIAGNOSTICS resul = ROW_COUNT;

	IF resul > 0 THEN
		UPDATE bitacora SET id_usuario = id_usuario2, operacion = 'Modificado'
		WHERE bitacora.id_bitacora = (SELECT MAX(id_bitacora) FROM bitacora);
	RETURN true;
		
	ELSE
		RETURN false;
	END IF;
END;
$$;
 �   DROP FUNCTION public.modificar_categoria(id_usuario2 integer, nombre2 character varying, descripcion2 character varying, id2 integer);
       public          postgres    false            h           1255    161383 S   modificar_concepto(integer, character varying, character varying, integer, integer)    FUNCTION     g  CREATE FUNCTION public.modificar_concepto(id2 integer, nombre2 character varying, descripcion2 character varying, id_categoria2 integer, id_usuario2 integer) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
DECLARE
	resul int;
BEGIN
	UPDATE concepto_gasto SET nom_concepto = nombre2, descripcion = descripcion2, id_categoria = id_categoria2 WHERE id = id2;
	GET DIAGNOSTICS resul = ROW_COUNT;

	IF resul > 0 THEN
 		UPDATE bitacora SET id_usuario = id_usuario2, operacion = 'Modificado'
		WHERE bitacora.id_bitacora = (SELECT MAX(id_bitacora) FROM bitacora);
		RETURN true;
		
	ELSE
		RETURN false;
	END IF;
END;
$$;
 �   DROP FUNCTION public.modificar_concepto(id2 integer, nombre2 character varying, descripcion2 character varying, id_categoria2 integer, id_usuario2 integer);
       public          postgres    false            i           1255    161384 i   modificar_condominio(integer, character varying, character varying, character varying, character varying)    FUNCTION     p  CREATE FUNCTION public.modificar_condominio(id_usuario2 integer, rif2 character varying, razon_social2 character varying, telefono2 character varying, correo_electronico2 character varying) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
DECLARE
	resul int;
BEGIN
	UPDATE condominio SET razon_social=razon_social2, telefono=telefono2, 	correo_electronico=correo_electronico2 WHERE rif=rif2;
	GET DIAGNOSTICS resul = ROW_COUNT;

	IF resul > 0 THEN
 		UPDATE bitacora SET id_usuario = id_usuario2
		WHERE bitacora.id_bitacora = (SELECT MAX(id_bitacora) FROM bitacora);
		RETURN true;
		
	ELSE
		RETURN false;
	END IF;
END;
$$;
 �   DROP FUNCTION public.modificar_condominio(id_usuario2 integer, rif2 character varying, razon_social2 character varying, telefono2 character varying, correo_electronico2 character varying);
       public          postgres    false            j           1255    161385 [   modificar_cuenta(character varying, integer, character varying, character varying, integer)    FUNCTION     W  CREATE FUNCTION public.modificar_cuenta(tipo2 character varying, id_banco2 integer, ci_persona2 character varying, n_cuenta2 character varying, id_usuario2 integer) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
DECLARE
	resul int;
BEGIN
	UPDATE cuenta SET tipo=tipo2, id_banco=id_banco2, ci_persona=ci_persona2
	WHERE n_cuenta=n_cuenta2;
	GET DIAGNOSTICS resul = ROW_COUNT;

	IF resul > 0 THEN
 		UPDATE bitacora SET id_usuario = id_usuario2, operacion = 'Modificado'
		WHERE bitacora.id_bitacora = (SELECT MAX(id_bitacora) FROM bitacora);
		RETURN true;
		
	ELSE
		RETURN false;
	END IF;
END;
$$;
 �   DROP FUNCTION public.modificar_cuenta(tipo2 character varying, id_banco2 integer, ci_persona2 character varying, n_cuenta2 character varying, id_usuario2 integer);
       public          postgres    false            k           1255    161386 [   modificar_fondos(integer, character varying, character varying, character varying, integer)    FUNCTION     X  CREATE FUNCTION public.modificar_fondos(id_usuario2 integer, tipo2 character varying, descripcion2 character varying, observaciones2 character varying, id2 integer) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
DECLARE
	resul int;
BEGIN
	UPDATE fondos SET descripcion=descripcion2, observaciones=observaciones2, 
	tipo=tipo2 WHERE id=id2;
	GET DIAGNOSTICS resul = ROW_COUNT;

	IF resul > 0 THEN
 		UPDATE bitacora SET id_usuario = id_usuario2, operacion = 'modificado'
		WHERE bitacora.id_bitacora = (SELECT MAX(id_bitacora) FROM bitacora);
		RETURN true;
		
	ELSE
		RETURN false;
	END IF;
END;
$$;
 �   DROP FUNCTION public.modificar_fondos(id_usuario2 integer, tipo2 character varying, descripcion2 character varying, observaciones2 character varying, id2 integer);
       public          postgres    false            l           1255    161387 9   modificar_forma_pago(integer, character varying, integer)    FUNCTION     �  CREATE FUNCTION public.modificar_forma_pago(id2 integer, nombre2 character varying, id_usuario2 integer) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
DECLARE
	resul int;
BEGIN
	UPDATE forma_pago SET forma_pago = nombre2 WHERE id = id2;
	GET DIAGNOSTICS resul = ROW_COUNT;

	IF resul > 0 THEN
 		UPDATE bitacora SET id_usuario = id_usuario2, operacion = 'Modificado'
		WHERE bitacora.id_bitacora = (SELECT MAX(id_bitacora) FROM bitacora);
		RETURN true;
		
	ELSE
		RETURN false;
	END IF;
END;
$$;
 h   DROP FUNCTION public.modificar_forma_pago(id2 integer, nombre2 character varying, id_usuario2 integer);
       public          postgres    false            m           1255    161388 �   modificar_gasto(integer, character varying, character varying, character varying, character varying, integer, integer, integer, integer, text, integer, double precision, double precision, character varying, integer)    FUNCTION       CREATE FUNCTION public.modificar_gasto(id2 integer, nombre2 character varying, tipo2 character varying, id_proveedor2 character varying, calcular_por2 character varying, mes2 integer, anio2 integer, n_meses2 integer, id_asamblea2 integer, observacion2 text, meses_restantes2 integer, monto2 double precision, saldo2 double precision, moneda2 character varying, id_usuario2 integer) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
DECLARE
	resul int;
BEGIN
	UPDATE gasto SET nombre = nombre2, tipo = tipo2, id_proveedor = id_proveedor2, calcular_por = calcular_por2, mes = mes2, anio = anio2, n_meses = n_meses2, id_asamblea =id_asamblea2, observacion = observacion2, meses_restantes = meses_restantes2, monto = monto2, saldo = saldo2, moneda = moneda2 WHERE id = id2;
	GET DIAGNOSTICS resul = ROW_COUNT;
	
	IF resul > 0 THEN
 		UPDATE bitacora SET id_usuario = id_usuario2, operacion = 'Modificado'
		WHERE bitacora.id_bitacora = (SELECT MAX(id_bitacora) FROM bitacora);
		RETURN true;
		
	ELSE
		RETURN false;
	END IF;
END;
$$;
 }  DROP FUNCTION public.modificar_gasto(id2 integer, nombre2 character varying, tipo2 character varying, id_proveedor2 character varying, calcular_por2 character varying, mes2 integer, anio2 integer, n_meses2 integer, id_asamblea2 integer, observacion2 text, meses_restantes2 integer, monto2 double precision, saldo2 double precision, moneda2 character varying, id_usuario2 integer);
       public          postgres    false            n           1255    161389 H   modificar_interes(integer, character varying, double precision, integer)    FUNCTION       CREATE FUNCTION public.modificar_interes(id2 integer, nombre2 character varying, factor2 double precision, id_usuario2 integer) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
DECLARE
	resul int;
BEGIN
	UPDATE interes SET nombre = nombre2, factor = factor2 WHERE id = id2;
	GET DIAGNOSTICS resul = ROW_COUNT;

	IF resul > 0 THEN
	 	UPDATE bitacora SET id_usuario = id_usuario2, operacion = 'Modificado'
		WHERE bitacora.id_bitacora = (SELECT MAX(id_bitacora) FROM bitacora);
		RETURN true;
		
	ELSE
		RETURN false;
	END IF;
END;
$$;
    DROP FUNCTION public.modificar_interes(id2 integer, nombre2 character varying, factor2 double precision, id_usuario2 integer);
       public          postgres    false            o           1255    161390 �   modificar_proveedor(character varying, character varying, character varying, character varying, character varying, character varying, integer)    FUNCTION     �  CREATE FUNCTION public.modificar_proveedor(cedula2 character varying, nombre2 character varying, telefono2 character varying, correo2 character varying, contacto2 character varying, direccion2 character varying, id_usuario2 integer) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
DECLARE
	resul int;
BEGIN
	UPDATE proveedores SET nombre = nombre2, telefono = telefono2, correo = correo2, contacto = contacto2, direccion = direccion2 WHERE cedula = cedula2;
	GET DIAGNOSTICS resul = ROW_COUNT;

	IF resul > 0 THEN
 		UPDATE bitacora SET id_usuario = id_usuario2, operacion = 'Modificado'
		WHERE bitacora.id_bitacora = (SELECT MAX(id_bitacora) FROM bitacora);
		RETURN true;
		
	ELSE
		RETURN false;
	END IF;
END;
$$;
 �   DROP FUNCTION public.modificar_proveedor(cedula2 character varying, nombre2 character varying, telefono2 character varying, correo2 character varying, contacto2 character varying, direccion2 character varying, id_usuario2 integer);
       public          postgres    false            p           1255    161391 �   modificar_sancion(character varying, integer, integer, double precision, character varying, character varying, integer, integer)    FUNCTION     �  CREATE FUNCTION public.modificar_sancion(tipo2 character varying, mes2 integer, anio2 integer, monto2 double precision, descripcion2 character varying, moneda2 character varying, id2 integer, id_usuario2 integer) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
DECLARE
	resul int;
BEGIN
	UPDATE sancion SET tipo=tipo2, mes=mes2, anio=anio2, monto=monto2, descripcion=descripcion2, moneda=moneda2 WHERE id=id2;
	GET DIAGNOSTICS resul = ROW_COUNT;

	IF resul > 0 THEN
 		UPDATE bitacora SET id_usuario = id_usuario2, operacion = 'Modificado'
		WHERE bitacora.id_bitacora = (SELECT MAX(id_bitacora) FROM bitacora);
		RETURN true;
		
	ELSE
		RETURN false;
	END IF;
END;
$$;
 �   DROP FUNCTION public.modificar_sancion(tipo2 character varying, mes2 integer, anio2 integer, monto2 double precision, descripcion2 character varying, moneda2 character varying, id2 integer, id_usuario2 integer);
       public          postgres    false            q           1255    161392 L   modificar_tipo_unidad(character varying, double precision, integer, integer)    FUNCTION       CREATE FUNCTION public.modificar_tipo_unidad(tipo2 character varying, area2 double precision, id2 integer, id_usuario2 integer) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
DECLARE
	resul int;
BEGIN
	UPDATE tipo_unidad SET tipo = tipo2, area = area2 WHERE id = id2;
	GET DIAGNOSTICS resul = ROW_COUNT;

	IF resul > 0 THEN
 		UPDATE bitacora SET id_usuario = id_usuario2, operacion = 'Modificado'
		WHERE bitacora.id_bitacora = (SELECT MAX(id_bitacora) FROM bitacora);
		RETURN true;
		
	ELSE
		RETURN false;
	END IF;
END;
$$;
    DROP FUNCTION public.modificar_tipo_unidad(tipo2 character varying, area2 double precision, id2 integer, id_usuario2 integer);
       public          postgres    false            r           1255    161393 ;   modificar_tipo_usuario(character varying, integer, integer)    FUNCTION     �  CREATE FUNCTION public.modificar_tipo_usuario(_tipo character varying, _id integer, _id_usuario integer) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
DECLARE
	resul int;
	
BEGIN
	UPDATE tipo_usuario SET tipo = _tipo WHERE id = _id;
	GET DIAGNOSTICS resul = ROW_COUNT;

	IF resul > 0 THEN
	
 		UPDATE bitacora SET id_usuario = _id_usuario, operacion = 'Modificado'
		WHERE bitacora.id_bitacora = (SELECT MAX(id_bitacora) FROM bitacora);
		RETURN true;
		
	ELSE
		RETURN false;
	END IF;
END;
$$;
 h   DROP FUNCTION public.modificar_tipo_usuario(_tipo character varying, _id integer, _id_usuario integer);
       public          postgres    false            s           1255    161394 Q   modificar_unidad(character varying, character varying, integer, integer, integer)    FUNCTION     O  CREATE FUNCTION public.modificar_unidad(n_documento2 character varying, direccion2 character varying, id_tipo2 integer, id2 integer, id_usuario2 integer) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
DECLARE
	resul int;
BEGIN
	UPDATE unidad SET n_documento = n_documento2, direccion = direccion2, id_tipo=id_tipo2 WHERE id = id2;
	GET DIAGNOSTICS resul = ROW_COUNT;

	IF resul > 0 THEN
 		UPDATE bitacora SET id_usuario = id_usuario2, operacion = 'Modificado'
		WHERE bitacora.id_bitacora = (SELECT MAX(id_bitacora) FROM bitacora);
		RETURN true;
		
	ELSE
		RETURN false;
	END IF;
END;
$$;
 �   DROP FUNCTION public.modificar_unidad(n_documento2 character varying, direccion2 character varying, id_tipo2 integer, id2 integer, id_usuario2 integer);
       public          postgres    false            t           1255    161395    pagar_gasto()    FUNCTION     �  CREATE FUNCTION public.pagar_gasto() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE

	saldo_bd double precision;
	
BEGIN
	
	UPDATE fondos SET saldo = saldo - NEW.monto WHERE id = NEW.id_fondo;

	UPDATE gasto SET saldo = saldo - NEW.monto WHERE id = NEW.id_gasto;
	
	saldo_bd := (SELECT saldo FROM gasto WHERE id = NEW.id_gasto);

	IF saldo_bd = 0 THEN
	
		UPDATE gasto SET pagado = 'Pagado' WHERE id = NEW.id_gasto;
		
	END IF;
	
	RETURN NEW;
END;
$$;
 $   DROP FUNCTION public.pagar_gasto();
       public          postgres    false            u           1255    161396 +   reactivar_banco(character varying, integer)    FUNCTION     �  CREATE FUNCTION public.reactivar_banco(nombre_banco2 character varying, id_usuario2 integer) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
DECLARE
	resul int;
BEGIN
	UPDATE banco SET activo=true WHERE nombre_banco=nombre_banco2;
	GET DIAGNOSTICS resul = ROW_COUNT;
	
	IF resul > 0 THEN
 		UPDATE bitacora SET id_usuario = id_usuario2, operacion = 'Registro', valor_viejo = null
		WHERE bitacora.id_bitacora = (SELECT MAX(id_bitacora) FROM bitacora);
		RETURN true;
		
	ELSE
		RETURN false;
	END IF;
END;
$$;
 \   DROP FUNCTION public.reactivar_banco(nombre_banco2 character varying, id_usuario2 integer);
       public          postgres    false            v           1255    161397 B   reactivar_categoria(character varying, character varying, integer)    FUNCTION     8  CREATE FUNCTION public.reactivar_categoria(nombre2 character varying, descripcion2 character varying, id_usuario2 integer) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
DECLARE
	resul int;
BEGIN
	UPDATE categoriagasto SET descripcion = descripcion2, activo = true WHERE nombre = nombre2;
	GET DIAGNOSTICS resul = ROW_COUNT;
	
	IF resul > 0 THEN
 		UPDATE bitacora SET id_usuario = id_usuario2, operacion = 'Registro', valor_viejo = null
		WHERE bitacora.id_bitacora = (SELECT MAX(id_bitacora) FROM bitacora);
		RETURN true;
		
	ELSE
		RETURN false;
	END IF;
END;
$$;
 z   DROP FUNCTION public.reactivar_categoria(nombre2 character varying, descripcion2 character varying, id_usuario2 integer);
       public          postgres    false            w           1255    161398 .   reactivar_concepto(character varying, integer)    FUNCTION        CREATE FUNCTION public.reactivar_concepto(nombre2 character varying, id_usuario2 integer) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
DECLARE
	resul int;
BEGIN
	UPDATE concepto_gasto SET activo = true WHERE nom_concepto = nombre2;
	GET DIAGNOSTICS resul = ROW_COUNT;

	IF resul > 0 THEN
 		UPDATE bitacora SET id_usuario = id_usuario2, operacion = 'Registro', valor_viejo = null
		WHERE bitacora.id_bitacora = (SELECT MAX(id_bitacora) FROM bitacora);
		RETURN true;
		
	ELSE
		RETURN false;
	END IF;
END;
$$;
 Y   DROP FUNCTION public.reactivar_concepto(nombre2 character varying, id_usuario2 integer);
       public          postgres    false            x           1255    161399 ,   reactivar_cuenta(character varying, integer)    FUNCTION     �  CREATE FUNCTION public.reactivar_cuenta(n_cuenta2 character varying, id_usuario2 integer) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
DECLARE
	resul int;
BEGIN
	UPDATE cuenta SET activo = true WHERE n_cuenta = n_cuenta2;
	GET DIAGNOSTICS resul = ROW_COUNT;
	
	IF resul > 0 THEN
 		UPDATE bitacora SET id_usuario = id_usuario2, operacion = 'Registro', valor_viejo = null
		WHERE bitacora.id_bitacora = (SELECT MAX(id_bitacora) FROM bitacora);
		RETURN true;
		
	ELSE
		RETURN false;
	END IF;
END;
$$;
 Y   DROP FUNCTION public.reactivar_cuenta(n_cuenta2 character varying, id_usuario2 integer);
       public          postgres    false            y           1255    161400 !   reactivar_fondo(integer, integer)    FUNCTION     �  CREATE FUNCTION public.reactivar_fondo(id2 integer, id_usuario2 integer) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
DECLARE
	resul int;
BEGIN
	UPDATE fondos SET activo=true WHERE id=id2;
	GET DIAGNOSTICS resul = ROW_COUNT;

	IF resul > 0 THEN
 		UPDATE bitacora SET id_usuario = id_usuario2, operacion = 'Registro', valor_viejo = null
		WHERE bitacora.id_bitacora = (SELECT MAX(id_bitacora) FROM bitacora);
		RETURN true;
		
	ELSE
		RETURN false;
	END IF;
END;
$$;
 H   DROP FUNCTION public.reactivar_fondo(id2 integer, id_usuario2 integer);
       public          postgres    false            z           1255    161401 0   reactivar_forma_pago(character varying, integer)    FUNCTION     �  CREATE FUNCTION public.reactivar_forma_pago(nombre2 character varying, id_usuario2 integer) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
DECLARE
	resul int;
BEGIN
	UPDATE forma_pago SET activo = true WHERE forma_pago = nombre2;
	GET DIAGNOSTICS resul = ROW_COUNT;

	IF resul > 0 THEN
 		UPDATE bitacora SET id_usuario = id_usuario2, operacion = 'Registro', valor_viejo = null
		WHERE bitacora.id_bitacora = (SELECT MAX(id_bitacora) FROM bitacora);
		RETURN true;
		
	ELSE
		RETURN false;
	END IF;
END;
$$;
 [   DROP FUNCTION public.reactivar_forma_pago(nombre2 character varying, id_usuario2 integer);
       public          postgres    false            {           1255    161402 #   reactivar_interes(integer, integer)    FUNCTION     �  CREATE FUNCTION public.reactivar_interes(id2 integer, id_usuario2 integer) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
DECLARE
	resul int;
BEGIN
	UPDATE interes SET activo = true WHERE id = id2;
	GET DIAGNOSTICS resul = ROW_COUNT;

	IF resul > 0 THEN
	 	UPDATE bitacora SET id_usuario = id_usuario2, operacion = 'Registro', valor_viejo = null
		WHERE bitacora.id_bitacora = (SELECT MAX(id_bitacora) FROM bitacora);
		RETURN true;
		
	ELSE
		RETURN false;
	END IF;
END;
$$;
 J   DROP FUNCTION public.reactivar_interes(id2 integer, id_usuario2 integer);
       public          postgres    false            |           1255    161403 /   reactivar_proveedor(character varying, integer)    FUNCTION     �  CREATE FUNCTION public.reactivar_proveedor(cedula2 character varying, id_usuario2 integer) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
DECLARE
	resul int;
BEGIN
	UPDATE proveedores SET activo = true WHERE cedula = cedula2;
	GET DIAGNOSTICS resul = ROW_COUNT;

	IF resul > 0 THEN
 		UPDATE bitacora SET id_usuario = id_usuario2, operacion = 'Registro', valor_viejo = null
		WHERE bitacora.id_bitacora = (SELECT MAX(id_bitacora) FROM bitacora);
		RETURN true;
		
	ELSE
		RETURN false;
	END IF;
END;
$$;
 Z   DROP FUNCTION public.reactivar_proveedor(cedula2 character varying, id_usuario2 integer);
       public          postgres    false            }           1255    161404 1   reactivar_tipo_unidad(character varying, integer)    FUNCTION     �  CREATE FUNCTION public.reactivar_tipo_unidad(tipo2 character varying, id_usuario2 integer) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
DECLARE
	resul int;
BEGIN
	UPDATE tipo_unidad SET activo = true WHERE tipo = tipo2;
	GET DIAGNOSTICS resul = ROW_COUNT;

	IF resul > 0 THEN
 		UPDATE bitacora SET id_usuario = id_usuario2, operacion = 'Registro', valor_viejo = null
		WHERE bitacora.id_bitacora = (SELECT MAX(id_bitacora) FROM bitacora);
		RETURN true;
		
	ELSE
		RETURN false;
	END IF;
END;
$$;
 Z   DROP FUNCTION public.reactivar_tipo_unidad(tipo2 character varying, id_usuario2 integer);
       public          postgres    false            ~           1255    161405 ,   reactivar_unidad(character varying, integer)    FUNCTION     �  CREATE FUNCTION public.reactivar_unidad(n_unidad2 character varying, id_usuario2 integer) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
DECLARE
	resul int;
BEGIN
	UPDATE unidad SET activo = true WHERE n_unidad = n_unidad2;
	GET DIAGNOSTICS resul = ROW_COUNT;

	IF resul > 0 THEN
 		UPDATE bitacora SET id_usuario = id_usuario2, operacion = 'Registro', valor_viejo = null
		WHERE bitacora.id_bitacora = (SELECT MAX(id_bitacora) FROM bitacora);
		RETURN true;
		
	ELSE
		RETURN false;
	END IF;
END;
$$;
 Y   DROP FUNCTION public.reactivar_unidad(n_unidad2 character varying, id_usuario2 integer);
       public          postgres    false                       1255    161406 �   registrar_cuota(integer, integer, integer, integer, double precision, double precision, character varying, character varying, double precision, double precision, double precision, double precision, integer)    FUNCTION       CREATE FUNCTION public.registrar_cuota(id_unidad2 integer, id_gasto2 integer, mes2 integer, anio2 integer, monto_dolar2 double precision, monto_bolivar2 double precision, tipo_gasto2 character varying, moneda_dominante2 character varying, paridad2 double precision, saldo_restante_bolivar2 double precision, saldo_restante_dolar2 double precision, alicuota2 double precision, id_usuario2 integer) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
DECLARE
	resul int;
BEGIN
	INSERT INTO recibo (
		id_unidad, id_gasto, mes, anio, monto_dolar, monto_bolivar, tipo_gasto, moneda_dominante, paridad, saldo_restante_bolivar, saldo_restante_dolar, alicuota
	) VALUES (
		id_unidad2, id_gasto2, mes2, anio2, monto_dolar2, monto_bolivar2, tipo_gasto2, moneda_dominante2, paridad2, monto_bolivar2, monto_dolar2, alicuota2
	);
	GET DIAGNOSTICS resul = ROW_COUNT;

	IF resul > 0 THEN
 		UPDATE bitacora SET id_usuario = id_usuario2
		WHERE bitacora.id_bitacora = (SELECT MAX(id_bitacora) FROM bitacora);
		RETURN true;
		
	ELSE
		RETURN false;
	END IF;
END;
$$;
 �  DROP FUNCTION public.registrar_cuota(id_unidad2 integer, id_gasto2 integer, mes2 integer, anio2 integer, monto_dolar2 double precision, monto_bolivar2 double precision, tipo_gasto2 character varying, moneda_dominante2 character varying, paridad2 double precision, saldo_restante_bolivar2 double precision, saldo_restante_dolar2 double precision, alicuota2 double precision, id_usuario2 integer);
       public          postgres    false            �           1255    161407 �   registrar_interes(integer, integer, integer, integer, double precision, double precision, character varying, character varying, double precision, double precision, double precision, double precision, integer)    FUNCTION     ,  CREATE FUNCTION public.registrar_interes(id_unidad2 integer, id_gasto2 integer, mes2 integer, anio2 integer, monto_dolar2 double precision, monto_bolivar2 double precision, tipo_gasto2 character varying, moneda_dominante2 character varying, paridad2 double precision, saldo_restante_bolivar2 double precision, saldo_restante_dolar2 double precision, alicuota2 double precision, id_usuario2 integer) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
DECLARE
	resul int;
BEGIN
	INSERT INTO recibo (
		id_unidad, id_gasto, mes, anio, monto_dolar, monto_bolivar, tipo_gasto, moneda_dominante, paridad, saldo_restante_bolivar, saldo_restante_dolar, alicuota
	) VALUES (
		id_unidad2, id_gasto2, mes2, anio2, monto_dolar2, monto_bolivar2, tipo_gasto2, moneda_dominante2, paridad2, saldo_restante_bolivar2, saldo_restante_dolar2, alicuota2
	);
	GET DIAGNOSTICS resul = ROW_COUNT;

	IF resul > 0 THEN
	 	UPDATE bitacora SET id_usuario = id_usuario2
		WHERE bitacora.id_bitacora = (SELECT MAX(id_bitacora) FROM bitacora);
		RETURN true;
		
	ELSE
		RETURN false;
	END IF;
END;
$$;
 �  DROP FUNCTION public.registrar_interes(id_unidad2 integer, id_gasto2 integer, mes2 integer, anio2 integer, monto_dolar2 double precision, monto_bolivar2 double precision, tipo_gasto2 character varying, moneda_dominante2 character varying, paridad2 double precision, saldo_restante_bolivar2 double precision, saldo_restante_dolar2 double precision, alicuota2 double precision, id_usuario2 integer);
       public          postgres    false            �           1255    161408 "   registrar_salida(integer, integer)    FUNCTION       CREATE FUNCTION public.registrar_salida(id2 integer, id_usuario2 integer) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
DECLARE
	resul int;
BEGIN

	UPDATE visita SET fecha_salida = LOCALTIMESTAMP(0), hora_salida = LOCALTIMESTAMP(0) WHERE id = id2;
	GET DIAGNOSTICS resul = ROW_COUNT;

	IF resul > 0 THEN
 		UPDATE bitacora SET id_usuario = id_usuario2, operacion = 'Registro de salida'
		WHERE bitacora.id_bitacora = (SELECT MAX(id_bitacora) FROM bitacora);
		RETURN true;
		
	ELSE
		RETURN false;
	END IF;
END;
$$;
 I   DROP FUNCTION public.registrar_salida(id2 integer, id_usuario2 integer);
       public          postgres    false            �            1259    161409 	   asambleas    TABLE     �   CREATE TABLE public.asambleas (
    id integer NOT NULL,
    nombre character varying(60) NOT NULL,
    descripcion text NOT NULL,
    fecha date NOT NULL
);
    DROP TABLE public.asambleas;
       public         heap    postgres    false            �            1259    161415    asambleas_id_seq    SEQUENCE     �   CREATE SEQUENCE public.asambleas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.asambleas_id_seq;
       public          postgres    false    202            �           0    0    asambleas_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.asambleas_id_seq OWNED BY public.asambleas.id;
          public          postgres    false    203            �            1259    161417    banco    TABLE     �   CREATE TABLE public.banco (
    id integer NOT NULL,
    nombre_banco character varying(30) NOT NULL,
    activo boolean DEFAULT true
);
    DROP TABLE public.banco;
       public         heap    postgres    false            �            1259    161421    banco_id_seq    SEQUENCE     �   CREATE SEQUENCE public.banco_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.banco_id_seq;
       public          postgres    false    204            �           0    0    banco_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.banco_id_seq OWNED BY public.banco.id;
          public          postgres    false    205            �            1259    161423    bitacora    TABLE       CREATE TABLE public.bitacora (
    id_bitacora integer NOT NULL,
    operacion text NOT NULL,
    tabla text NOT NULL,
    id_usuario integer,
    valor_viejo text,
    valor_nuevo text,
    fecha_hora timestamp without time zone DEFAULT LOCALTIMESTAMP(0)
);
    DROP TABLE public.bitacora;
       public         heap    postgres    false            �            1259    161430    bitacora_id_bitacora_seq    SEQUENCE     �   CREATE SEQUENCE public.bitacora_id_bitacora_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.bitacora_id_bitacora_seq;
       public          postgres    false    206            �           0    0    bitacora_id_bitacora_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.bitacora_id_bitacora_seq OWNED BY public.bitacora.id_bitacora;
          public          postgres    false    207            �            1259    161432    categoriagasto    TABLE     �   CREATE TABLE public.categoriagasto (
    id integer NOT NULL,
    nombre character varying(50) NOT NULL,
    descripcion character varying(200),
    activo boolean DEFAULT true NOT NULL
);
 "   DROP TABLE public.categoriagasto;
       public         heap    postgres    false            �            1259    161436    categoriagasto_id_seq    SEQUENCE     �   CREATE SEQUENCE public.categoriagasto_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.categoriagasto_id_seq;
       public          postgres    false    208            �           0    0    categoriagasto_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.categoriagasto_id_seq OWNED BY public.categoriagasto.id;
          public          postgres    false    209            �            1259    161438    cobro_unidad    TABLE     �  CREATE TABLE public.cobro_unidad (
    id integer NOT NULL,
    monto double precision NOT NULL,
    descripcion character varying(500) NOT NULL,
    id_cuenta character varying(20) NOT NULL,
    forma_pago character varying(150) NOT NULL,
    referencia character varying(50) NOT NULL,
    fecha date NOT NULL,
    id_fondo bigint NOT NULL,
    id_unidad bigint NOT NULL,
    moneda character varying NOT NULL,
    paridad double precision NOT NULL
);
     DROP TABLE public.cobro_unidad;
       public         heap    postgres    false            �            1259    161444    cobro_unidad_id_seq    SEQUENCE     �   CREATE SEQUENCE public.cobro_unidad_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.cobro_unidad_id_seq;
       public          postgres    false    210            �           0    0    cobro_unidad_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.cobro_unidad_id_seq OWNED BY public.cobro_unidad.id;
          public          postgres    false    211            �            1259    161446    concepto_gasto    TABLE     �   CREATE TABLE public.concepto_gasto (
    id integer NOT NULL,
    nom_concepto character varying(120) NOT NULL,
    descripcion character varying(120) NOT NULL,
    id_categoria integer NOT NULL,
    activo boolean DEFAULT true
);
 "   DROP TABLE public.concepto_gasto;
       public         heap    postgres    false            �            1259    161450    concepto_gasto_id_seq    SEQUENCE     �   CREATE SEQUENCE public.concepto_gasto_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.concepto_gasto_id_seq;
       public          postgres    false    212            �           0    0    concepto_gasto_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.concepto_gasto_id_seq OWNED BY public.concepto_gasto.id;
          public          postgres    false    213            �            1259    161452 
   condominio    TABLE        CREATE TABLE public.condominio (
    rif character varying(11) NOT NULL,
    razon_social character varying(200) NOT NULL,
    telefono character varying(12) NOT NULL,
    correo_electronico character varying(80) DEFAULT ''::character varying,
    activo boolean DEFAULT true NOT NULL
);
    DROP TABLE public.condominio;
       public         heap    postgres    false            �            1259    161457    cuenta    TABLE       CREATE TABLE public.cuenta (
    n_cuenta character varying(20) NOT NULL,
    tipo character varying(10) NOT NULL,
    id_banco bigint NOT NULL,
    ci_persona character varying(11),
    rif_condominio character varying(11),
    activo boolean DEFAULT true
);
    DROP TABLE public.cuenta;
       public         heap    postgres    false            �            1259    161461    cuenta_pagar    TABLE     �  CREATE TABLE public.cuenta_pagar (
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
     DROP TABLE public.cuenta_pagar;
       public         heap    postgres    false            �            1259    161464    cuenta_pagar_id_seq    SEQUENCE     �   CREATE SEQUENCE public.cuenta_pagar_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.cuenta_pagar_id_seq;
       public          postgres    false    216            �           0    0    cuenta_pagar_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.cuenta_pagar_id_seq OWNED BY public.cuenta_pagar.id;
          public          postgres    false    217            �            1259    161466    detalle_pagos    TABLE     �  CREATE TABLE public.detalle_pagos (
    id integer NOT NULL,
    mes bigint NOT NULL,
    anio bigint NOT NULL,
    monto_dolar double precision NOT NULL,
    id_gasto integer NOT NULL,
    id_unidad integer NOT NULL,
    tipo_gasto character varying NOT NULL,
    monto_bolivar double precision NOT NULL,
    paridad double precision NOT NULL,
    moneda_dominante character varying NOT NULL,
    saldo_restante_bolivar double precision NOT NULL,
    saldo_restante_dolar double precision
);
 !   DROP TABLE public.detalle_pagos;
       public         heap    postgres    false            �            1259    161472    detalle_pagos_id_seq    SEQUENCE     �   CREATE SEQUENCE public.detalle_pagos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.detalle_pagos_id_seq;
       public          postgres    false    218            �           0    0    detalle_pagos_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.detalle_pagos_id_seq OWNED BY public.detalle_pagos.id;
          public          postgres    false    219            �            1259    161474    fondos    TABLE     y  CREATE TABLE public.fondos (
    tipo character varying(100) NOT NULL,
    fecha date NOT NULL,
    descripcion character varying(200) NOT NULL,
    observaciones character varying(200),
    monto_inicial double precision NOT NULL,
    saldo double precision NOT NULL,
    id integer NOT NULL,
    activo boolean DEFAULT true NOT NULL,
    moneda character varying NOT NULL
);
    DROP TABLE public.fondos;
       public         heap    postgres    false            �            1259    161481    fondos_id_seq    SEQUENCE     �   CREATE SEQUENCE public.fondos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.fondos_id_seq;
       public          postgres    false    220            �           0    0    fondos_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.fondos_id_seq OWNED BY public.fondos.id;
          public          postgres    false    221            �            1259    161483 
   forma_pago    TABLE     �   CREATE TABLE public.forma_pago (
    id integer NOT NULL,
    forma_pago character varying NOT NULL,
    activo boolean DEFAULT true NOT NULL
);
    DROP TABLE public.forma_pago;
       public         heap    postgres    false            �            1259    161490    forma_pago_id_seq    SEQUENCE     �   CREATE SEQUENCE public.forma_pago_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.forma_pago_id_seq;
       public          postgres    false    222            �           0    0    forma_pago_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.forma_pago_id_seq OWNED BY public.forma_pago.id;
          public          postgres    false    223            �            1259    161492    funcion    TABLE     a   CREATE TABLE public.funcion (
    id integer NOT NULL,
    funcion character varying NOT NULL
);
    DROP TABLE public.funcion;
       public         heap    postgres    false            �            1259    161498    funcion_id_seq    SEQUENCE     �   CREATE SEQUENCE public.funcion_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.funcion_id_seq;
       public          postgres    false    224            �           0    0    funcion_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.funcion_id_seq OWNED BY public.funcion.id;
          public          postgres    false    225            �            1259    161500    gasto    TABLE     �  CREATE TABLE public.gasto (
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
    DROP TABLE public.gasto;
       public         heap    postgres    false            �            1259    161509    gasto_id_seq    SEQUENCE     �   CREATE SEQUENCE public.gasto_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.gasto_id_seq;
       public          postgres    false    226            �           0    0    gasto_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.gasto_id_seq OWNED BY public.gasto.id;
          public          postgres    false    227            �            1259    161511    interes    TABLE     �   CREATE TABLE public.interes (
    id integer NOT NULL,
    nombre character varying(50) NOT NULL,
    factor double precision NOT NULL,
    activo boolean DEFAULT true,
    rif_condominio character varying
);
    DROP TABLE public.interes;
       public         heap    postgres    false            �            1259    161518    interes_id_seq    SEQUENCE     �   CREATE SEQUENCE public.interes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.interes_id_seq;
       public          postgres    false    228            �           0    0    interes_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.interes_id_seq OWNED BY public.interes.id;
          public          postgres    false    229            �            1259    161520    mensaje    TABLE     J  CREATE TABLE public.mensaje (
    id integer NOT NULL,
    asunto character varying(60) DEFAULT 'Sin Asunto'::character varying,
    contenido character varying(420) NOT NULL,
    emisor integer NOT NULL,
    fecha timestamp without time zone DEFAULT LOCALTIMESTAMP(0) NOT NULL,
    activo_emisor boolean DEFAULT true NOT NULL
);
    DROP TABLE public.mensaje;
       public         heap    postgres    false            �            1259    161526    mensaje_id_seq    SEQUENCE     �   CREATE SEQUENCE public.mensaje_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.mensaje_id_seq;
       public          postgres    false    230            �           0    0    mensaje_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.mensaje_id_seq OWNED BY public.mensaje.id;
          public          postgres    false    231            �            1259    161528    persona    TABLE     �  CREATE TABLE public.persona (
    cedula character varying(11) NOT NULL,
    p_nombre character varying(25) NOT NULL,
    s_nombre character varying(25) DEFAULT ''::character varying,
    p_apellido character varying(25) NOT NULL,
    s_apellido character varying(25) DEFAULT ''::character varying,
    telefono character varying(12),
    correo character varying(60),
    activo boolean DEFAULT true NOT NULL
);
    DROP TABLE public.persona;
       public         heap    postgres    false            �            1259    161534    propietario    TABLE     t   CREATE TABLE public.propietario (
    ci_persona character varying(11) NOT NULL,
    activo boolean DEFAULT true
);
    DROP TABLE public.propietario;
       public         heap    postgres    false            �            1259    161538    proveedores    TABLE     O  CREATE TABLE public.proveedores (
    cedula character varying(11) NOT NULL,
    nombre character varying(60) NOT NULL,
    telefono character varying(12) NOT NULL,
    correo character varying(80),
    contacto character varying(60) NOT NULL,
    direccion character varying(150) NOT NULL,
    activo boolean DEFAULT true NOT NULL
);
    DROP TABLE public.proveedores;
       public         heap    postgres    false            �            1259    161542    puente_asambleas_propietario    TABLE     �   CREATE TABLE public.puente_asambleas_propietario (
    id integer NOT NULL,
    id_asamblea integer NOT NULL,
    ci_propietario character varying(11) NOT NULL
);
 0   DROP TABLE public.puente_asambleas_propietario;
       public         heap    postgres    false            �            1259    161545 #   puente_asambleas_propietario_id_seq    SEQUENCE     �   CREATE SEQUENCE public.puente_asambleas_propietario_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE public.puente_asambleas_propietario_id_seq;
       public          postgres    false    235            �           0    0 #   puente_asambleas_propietario_id_seq    SEQUENCE OWNED BY     k   ALTER SEQUENCE public.puente_asambleas_propietario_id_seq OWNED BY public.puente_asambleas_propietario.id;
          public          postgres    false    236            �            1259    161547    puente_cobro_factura    TABLE     �   CREATE TABLE public.puente_cobro_factura (
    id integer NOT NULL,
    id_recibo bigint NOT NULL,
    id_cobro bigint NOT NULL,
    parte_monto double precision NOT NULL,
    moneda character varying
);
 (   DROP TABLE public.puente_cobro_factura;
       public         heap    postgres    false            �            1259    161553    puente_cobro_factura_id_seq    SEQUENCE     �   CREATE SEQUENCE public.puente_cobro_factura_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.puente_cobro_factura_id_seq;
       public          postgres    false    237            �           0    0    puente_cobro_factura_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.puente_cobro_factura_id_seq OWNED BY public.puente_cobro_factura.id;
          public          postgres    false    238            �            1259    161555    puente_gasto_concepto    TABLE     �   CREATE TABLE public.puente_gasto_concepto (
    id integer NOT NULL,
    id_gasto integer,
    id_concepto integer,
    monto double precision NOT NULL
);
 )   DROP TABLE public.puente_gasto_concepto;
       public         heap    postgres    false            �            1259    161558    puente_gasto_concepto_id_seq    SEQUENCE     �   CREATE SEQUENCE public.puente_gasto_concepto_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.puente_gasto_concepto_id_seq;
       public          postgres    false    239            �           0    0    puente_gasto_concepto_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.puente_gasto_concepto_id_seq OWNED BY public.puente_gasto_concepto.id;
          public          postgres    false    240            �            1259    161560    puente_mensaje_usuario    TABLE     �   CREATE TABLE public.puente_mensaje_usuario (
    id integer NOT NULL,
    id_mensaje integer NOT NULL,
    receptor integer NOT NULL,
    leido boolean DEFAULT false NOT NULL,
    activo_receptor boolean DEFAULT true NOT NULL
);
 *   DROP TABLE public.puente_mensaje_usuario;
       public         heap    postgres    false            �            1259    161565    puente_mensaje_usuario_id_seq    SEQUENCE     �   CREATE SEQUENCE public.puente_mensaje_usuario_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.puente_mensaje_usuario_id_seq;
       public          postgres    false    241            �           0    0    puente_mensaje_usuario_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.puente_mensaje_usuario_id_seq OWNED BY public.puente_mensaje_usuario.id;
          public          postgres    false    242            �            1259    161567    puente_persona_condominio    TABLE     �   CREATE TABLE public.puente_persona_condominio (
    id integer NOT NULL,
    ci_persona character varying(11) NOT NULL,
    rif_condominio character varying(15) NOT NULL
);
 -   DROP TABLE public.puente_persona_condominio;
       public         heap    postgres    false            �            1259    161570     puente_persona_condominio_id_seq    SEQUENCE     �   CREATE SEQUENCE public.puente_persona_condominio_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.puente_persona_condominio_id_seq;
       public          postgres    false    243            �           0    0     puente_persona_condominio_id_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public.puente_persona_condominio_id_seq OWNED BY public.puente_persona_condominio.id;
          public          postgres    false    244            �            1259    161572    puente_sancion_unidad    TABLE     �   CREATE TABLE public.puente_sancion_unidad (
    id integer NOT NULL,
    id_sancion integer NOT NULL,
    id_unidad bigint NOT NULL
);
 )   DROP TABLE public.puente_sancion_unidad;
       public         heap    postgres    false            �            1259    161575    puente_sancion_unidad_id_seq    SEQUENCE     �   CREATE SEQUENCE public.puente_sancion_unidad_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.puente_sancion_unidad_id_seq;
       public          postgres    false    245            �           0    0    puente_sancion_unidad_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.puente_sancion_unidad_id_seq OWNED BY public.puente_sancion_unidad.id;
          public          postgres    false    246            �            1259    161577    puente_tipo_funcion    TABLE     �   CREATE TABLE public.puente_tipo_funcion (
    id integer NOT NULL,
    id_tipo integer NOT NULL,
    id_funcion integer NOT NULL,
    ver boolean,
    registrar boolean,
    modificar boolean,
    eliminar boolean
);
 '   DROP TABLE public.puente_tipo_funcion;
       public         heap    postgres    false            �            1259    161580    puente_tipo_funcion_id_seq    SEQUENCE     �   CREATE SEQUENCE public.puente_tipo_funcion_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.puente_tipo_funcion_id_seq;
       public          postgres    false    247            �           0    0    puente_tipo_funcion_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.puente_tipo_funcion_id_seq OWNED BY public.puente_tipo_funcion.id;
          public          postgres    false    248            �            1259    161582    puente_unidad_propietarios    TABLE     *  CREATE TABLE public.puente_unidad_propietarios (
    id integer NOT NULL,
    ci_propietario character varying(11) NOT NULL,
    id_unidad bigint NOT NULL,
    fecha_desde date DEFAULT LOCALTIMESTAMP(0) NOT NULL,
    fecha_hasta date,
    estado bigint NOT NULL,
    activo boolean DEFAULT true
);
 .   DROP TABLE public.puente_unidad_propietarios;
       public         heap    postgres    false            �            1259    161587 !   puente_unidad_propietarios_id_seq    SEQUENCE     �   CREATE SEQUENCE public.puente_unidad_propietarios_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.puente_unidad_propietarios_id_seq;
       public          postgres    false    249            �           0    0 !   puente_unidad_propietarios_id_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.puente_unidad_propietarios_id_seq OWNED BY public.puente_unidad_propietarios.id;
          public          postgres    false    250            �            1259    161589    recibo    TABLE     �  CREATE TABLE public.recibo (
    id integer NOT NULL,
    mes smallint NOT NULL,
    anio smallint NOT NULL,
    monto_dolar double precision NOT NULL,
    id_gasto bigint,
    id_unidad bigint,
    tipo_gasto character varying,
    monto_bolivar double precision,
    paridad double precision,
    moneda_dominante character varying,
    saldo_restante_bolivar double precision,
    saldo_restante_dolar double precision,
    alicuota double precision
);
    DROP TABLE public.recibo;
       public         heap    postgres    false            �            1259    161595    recibo_id_seq    SEQUENCE     �   CREATE SEQUENCE public.recibo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.recibo_id_seq;
       public          postgres    false    251            �           0    0    recibo_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.recibo_id_seq OWNED BY public.recibo.id;
          public          postgres    false    252            �            1259    161597    responsable    TABLE     t   CREATE TABLE public.responsable (
    ci_persona character varying(11) NOT NULL,
    activo boolean DEFAULT true
);
    DROP TABLE public.responsable;
       public         heap    postgres    false            �            1259    161601    sancion    TABLE     8  CREATE TABLE public.sancion (
    id integer NOT NULL,
    tipo character varying(40) NOT NULL,
    mes bigint NOT NULL,
    anio bigint NOT NULL,
    monto double precision NOT NULL,
    descripcion character varying(120) NOT NULL,
    estado character varying(20) NOT NULL,
    moneda character varying(10)
);
    DROP TABLE public.sancion;
       public         heap    postgres    false            �            1259    161604    sancion_id_seq    SEQUENCE     �   CREATE SEQUENCE public.sancion_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.sancion_id_seq;
       public          postgres    false    254            �           0    0    sancion_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.sancion_id_seq OWNED BY public.sancion.id;
          public          postgres    false    255                        1259    161606    tipo_unidad    TABLE     �   CREATE TABLE public.tipo_unidad (
    id integer NOT NULL,
    area double precision NOT NULL,
    tipo character varying(60),
    activo boolean DEFAULT true NOT NULL
);
    DROP TABLE public.tipo_unidad;
       public         heap    postgres    false                       1259    161610    tipo_unidad_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tipo_unidad_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.tipo_unidad_id_seq;
       public          postgres    false    256            �           0    0    tipo_unidad_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.tipo_unidad_id_seq OWNED BY public.tipo_unidad.id;
          public          postgres    false    257                       1259    161612    tipo_usuario    TABLE     �   CREATE TABLE public.tipo_usuario (
    id integer NOT NULL,
    tipo character varying NOT NULL,
    activo boolean DEFAULT true NOT NULL
);
     DROP TABLE public.tipo_usuario;
       public         heap    postgres    false                       1259    161619    tipo_usuario_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tipo_usuario_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.tipo_usuario_id_seq;
       public          postgres    false    258            �           0    0    tipo_usuario_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.tipo_usuario_id_seq OWNED BY public.tipo_usuario.id;
          public          postgres    false    259                       1259    161621    unidad    TABLE     "  CREATE TABLE public.unidad (
    id integer NOT NULL,
    n_unidad character varying(10) NOT NULL,
    n_documento character varying(15) NOT NULL,
    direccion character varying(200) NOT NULL,
    activo boolean DEFAULT true,
    alicuota double precision,
    id_tipo integer NOT NULL
);
    DROP TABLE public.unidad;
       public         heap    postgres    false                       1259    161625    unidad_id_seq    SEQUENCE     �   CREATE SEQUENCE public.unidad_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.unidad_id_seq;
       public          postgres    false    260            �           0    0    unidad_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.unidad_id_seq OWNED BY public.unidad.id;
          public          postgres    false    261                       1259    161627    usuario    TABLE     S  CREATE TABLE public.usuario (
    id integer NOT NULL,
    usuario character varying(25) NOT NULL,
    password character varying(32) NOT NULL,
    pregunta character varying(120) NOT NULL,
    respuesta character varying(120) NOT NULL,
    ci_persona character varying(11),
    id_tipo_usuario integer,
    activo boolean DEFAULT true
);
    DROP TABLE public.usuario;
       public         heap    postgres    false                       1259    161631    usuario_id_seq    SEQUENCE     �   CREATE SEQUENCE public.usuario_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.usuario_id_seq;
       public          postgres    false    262            �           0    0    usuario_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.usuario_id_seq OWNED BY public.usuario.id;
          public          postgres    false    263                       1259    161633    v_area_total    VIEW     �   CREATE VIEW public.v_area_total AS
 SELECT sum(tu.area) AS area
   FROM (public.tipo_unidad tu
     JOIN public.unidad u ON ((u.id_tipo = tu.id)))
  WHERE (u.activo = true);
    DROP VIEW public.v_area_total;
       public          postgres    false    260    260    256    256            	           1259    161637    v_asambleas    VIEW     �   CREATE VIEW public.v_asambleas AS
 SELECT asa.id,
    asa.nombre,
    asa.descripcion,
    asa.fecha
   FROM public.asambleas asa;
    DROP VIEW public.v_asambleas;
       public          postgres    false    202    202    202    202            
           1259    161641    v_propietario    VIEW     +  CREATE VIEW public.v_propietario AS
 SELECT pro.ci_persona,
    per.p_nombre,
    per.s_nombre,
    per.p_apellido,
    per.s_apellido,
    per.telefono,
    per.correo,
    pro.activo
   FROM (public.propietario pro
     JOIN public.persona per ON (((per.cedula)::text = (pro.ci_persona)::text)));
     DROP VIEW public.v_propietario;
       public          postgres    false    233    232    232    232    232    233    232    232    232                       1259    161645    v_asambleas_propietario    VIEW     y  CREATE VIEW public.v_asambleas_propietario AS
 SELECT asa.id,
    pr.ci_persona AS cedula,
    pr.p_nombre AS nombre,
    pr.p_apellido AS apellido,
    pu.id AS id_puente
   FROM ((public.v_propietario pr
     JOIN public.puente_asambleas_propietario pu ON (((pu.ci_propietario)::text = (pr.ci_persona)::text)))
     JOIN public.asambleas asa ON ((asa.id = pu.id_asamblea)));
 *   DROP VIEW public.v_asambleas_propietario;
       public          postgres    false    202    235    235    266    266    235    266                       1259    161649    v_bandeja_entrada    VIEW     W  CREATE VIEW public.v_bandeja_entrada AS
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
    pu.activo_receptor
   FROM ((((public.mensaje me
     JOIN public.usuario u1 ON ((u1.id = me.emisor)))
     JOIN public.puente_mensaje_usuario pu ON ((pu.id_mensaje = me.id)))
     JOIN public.usuario u2 ON ((u2.id = pu.receptor)))
     JOIN public.persona pe ON (((pe.cedula)::text = (u1.ci_persona)::text)))
  WHERE (pu.activo_receptor = true);
 $   DROP VIEW public.v_bandeja_entrada;
       public          postgres    false    230    230    262    262    241    241    241    230    241    232    232    232    230    230                       1259    161654    v_bandeja_salida    VIEW     �  CREATE VIEW public.v_bandeja_salida AS
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
     JOIN public.persona pe ON (((pe.cedula)::text = (u.ci_persona)::text)))
  WHERE (me.activo_emisor = true);
 #   DROP VIEW public.v_bandeja_salida;
       public          postgres    false    230    230    230    232    232    232    262    262    230    230    230                       1259    161659 
   v_bitacora    VIEW     �  CREATE VIEW public.v_bitacora AS
 SELECT bitacora.id_bitacora,
    bitacora.operacion,
    bitacora.tabla,
    usu.usuario,
    usu.ci_persona AS cedula,
    concat(per.p_nombre, ' ', per.p_apellido) AS persona,
    bitacora.valor_viejo,
    bitacora.valor_nuevo,
    bitacora.fecha_hora AS fecha
   FROM ((public.bitacora
     JOIN public.usuario usu ON ((bitacora.id_usuario = usu.id)))
     JOIN public.persona per ON (((per.cedula)::text = (usu.ci_persona)::text)));
    DROP VIEW public.v_bitacora;
       public          postgres    false    206    206    206    206    206    206    206    232    232    232    262    262    262                       1259    161664    v_concepto_gasto    VIEW       CREATE VIEW public.v_concepto_gasto AS
 SELECT cg.id,
    cg.nom_concepto AS nombre,
    cg.descripcion,
    cat.id AS id_categoria,
    cat.nombre AS nombre_categoria,
    cg.activo
   FROM (public.concepto_gasto cg
     JOIN public.categoriagasto cat ON ((cat.id = cg.id_categoria)));
 #   DROP VIEW public.v_concepto_gasto;
       public          postgres    false    208    208    212    212    212    212    212                       1259    161668    v_condominio    VIEW     �   CREATE VIEW public.v_condominio AS
 SELECT condominio.rif,
    condominio.razon_social,
    condominio.telefono,
    condominio.correo_electronico AS correo
   FROM public.condominio;
    DROP VIEW public.v_condominio;
       public          postgres    false    214    214    214    214                       1259    161672    v_cuenta    VIEW     !  CREATE VIEW public.v_cuenta AS
 SELECT cue.n_cuenta,
    cue.tipo,
    cue.id_banco,
    ban.nombre_banco AS banco,
    cue.ci_persona,
    per.p_nombre AS nombre,
    per.p_apellido AS apellido,
    cue.rif_condominio,
    co.razon_social,
    cue.activo
   FROM (((public.cuenta cue
     JOIN public.banco ban ON ((ban.id = cue.id_banco)))
     LEFT JOIN public.persona per ON (((per.cedula)::text = (cue.ci_persona)::text)))
     LEFT JOIN public.condominio co ON (((co.rif)::text = (cue.rif_condominio)::text)))
  WHERE (cue.activo = true);
    DROP VIEW public.v_cuenta;
       public          postgres    false    204    215    215    215    232    232    232    215    215    214    214    204    215                       1259    161677    v_cuenta_pagar    VIEW     �  CREATE VIEW public.v_cuenta_pagar AS
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
 !   DROP VIEW public.v_cuenta_pagar;
       public          postgres    false    216    220    220    222    222    226    226    204    204    215    215    216    216    216    216    216    216    216    216    216    216                       1259    161682    v_dueno_unidad    VIEW     T  CREATE VIEW public.v_dueno_unidad AS
 SELECT prop.ci_persona,
    puente.id,
    puente.id_unidad,
    puente.fecha_hasta
   FROM (public.propietario prop
     LEFT JOIN public.puente_unidad_propietarios puente ON (((prop.ci_persona)::text = (puente.ci_propietario)::text)))
  WHERE ((prop.activo = true) AND (puente.fecha_hasta IS NULL));
 !   DROP VIEW public.v_dueno_unidad;
       public          postgres    false    233    249    249    249    249    233                       1259    161686    v_gasto    VIEW     7  CREATE VIEW public.v_gasto AS
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
    DROP VIEW public.v_gasto;
       public          postgres    false    226    202    202    202    226    226    226    226    226    226    226    226    226    226    226    226    226    226    226    234    234                       1259    161691    v_gasto_concepto    VIEW     5  CREATE VIEW public.v_gasto_concepto AS
 SELECT ga.id AS id_gasto,
    cg.id AS id_concepto,
    cg.nombre,
    pu.monto,
    pu.id AS id_puente
   FROM ((public.v_concepto_gasto cg
     JOIN public.puente_gasto_concepto pu ON ((pu.id_concepto = cg.id)))
     JOIN public.gasto ga ON ((ga.id = pu.id_gasto)));
 #   DROP VIEW public.v_gasto_concepto;
       public          postgres    false    226    239    239    239    239    271    271                       1259    161696    v_mensaje_usuario    VIEW     c  CREATE VIEW public.v_mensaje_usuario AS
 SELECT pu.id_mensaje,
    pu.receptor AS id_receptor,
    u.ci_persona AS cedula,
    pe.p_nombre AS nombre,
    pe.p_apellido AS apellido
   FROM ((public.puente_mensaje_usuario pu
     JOIN public.usuario u ON ((u.id = pu.receptor)))
     JOIN public.persona pe ON (((pe.cedula)::text = (u.ci_persona)::text)));
 $   DROP VIEW public.v_mensaje_usuario;
       public          postgres    false    232    232    232    262    262    241    241                       1259    161701    v_perfil    VIEW     �  CREATE VIEW public.v_perfil AS
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
    DROP VIEW public.v_perfil;
       public          postgres    false    262    262    262    262    262    258    232    258    232    232    232    232    232    232                       1259    161706 
   v_permisos    VIEW     �  CREATE VIEW public.v_permisos AS
 SELECT u.usuario,
    tipo.id AS id_tipo,
    tipo.tipo,
    puente.id_funcion,
    f.funcion,
    puente.ver,
    puente.registrar,
    puente.modificar,
    puente.eliminar
   FROM (((public.puente_tipo_funcion puente
     JOIN public.tipo_usuario tipo ON ((tipo.id = puente.id_tipo)))
     JOIN public.funcion f ON ((f.id = puente.id_funcion)))
     JOIN public.usuario u ON ((u.id_tipo_usuario = puente.id_tipo)));
    DROP VIEW public.v_permisos;
       public          postgres    false    258    247    247    247    247    247    247    224    224    258    262    262                       1259    161711    v_responsable    VIEW     #  CREATE VIEW public.v_responsable AS
 SELECT r.ci_persona,
    per.p_nombre,
    per.s_nombre,
    per.p_apellido,
    per.s_apellido,
    per.telefono,
    per.correo,
    r.activo
   FROM (public.responsable r
     JOIN public.persona per ON (((per.cedula)::text = (r.ci_persona)::text)));
     DROP VIEW public.v_responsable;
       public          postgres    false    253    232    232    232    232    232    232    232    253                       1259    161715    v_tipo_funcion    VIEW     Y  CREATE VIEW public.v_tipo_funcion AS
 SELECT tipo.id,
    puente.id_funcion,
    f.funcion,
    puente.ver,
    puente.registrar,
    puente.modificar,
    puente.eliminar
   FROM ((public.puente_tipo_funcion puente
     JOIN public.tipo_usuario tipo ON ((tipo.id = puente.id_tipo)))
     JOIN public.funcion f ON ((f.id = puente.id_funcion)));
 !   DROP VIEW public.v_tipo_funcion;
       public          postgres    false    258    224    224    247    247    247    247    247    247                       1259    161719    v_tipo_unidad    VIEW     z   CREATE VIEW public.v_tipo_unidad AS
 SELECT tu.id,
    tu.tipo,
    tu.area,
    tu.activo
   FROM public.tipo_unidad tu;
     DROP VIEW public.v_tipo_unidad;
       public          postgres    false    256    256    256    256                       1259    161723    v_tipo_usuario    VIEW     {   CREATE VIEW public.v_tipo_usuario AS
 SELECT tu.id,
    tu.tipo
   FROM public.tipo_usuario tu
  WHERE (tu.activo = true);
 !   DROP VIEW public.v_tipo_usuario;
       public          postgres    false    258    258    258                       1259    161727    v_unidad    VIEW     m  CREATE VIEW public.v_unidad AS
 SELECT u.id,
    u.n_unidad,
    u.n_documento,
    u.direccion,
    u.alicuota,
    tu.id AS id_tipo,
    tu.tipo,
    ( SELECT tipo_unidad.area
           FROM public.tipo_unidad
          WHERE (tipo_unidad.id = u.id_tipo)) AS area,
    u.activo
   FROM (public.unidad u
     JOIN public.tipo_unidad tu ON ((tu.id = u.id_tipo)));
    DROP VIEW public.v_unidad;
       public          postgres    false    256    256    256    260    260    260    260    260    260    260                       1259    161732    v_unidad_propietario    VIEW       CREATE VIEW public.v_unidad_propietario AS
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
 '   DROP VIEW public.v_unidad_propietario;
       public          postgres    false    266    249    249    249    249    266    266    266    266    266    260    260    249    249    266                       1259    161737 	   v_usuario    VIEW       CREATE VIEW public.v_usuario AS
 SELECT u.id,
    u.usuario,
    u.ci_persona AS cedula,
    pe.p_nombre AS nombre,
    pe.p_apellido AS apellido
   FROM (public.usuario u
     JOIN public.persona pe ON (((pe.cedula)::text = (u.ci_persona)::text)))
  WHERE (u.activo = true);
    DROP VIEW public.v_usuario;
       public          postgres    false    262    262    262    232    232    232    262                        1259    161741    visita    TABLE     �  CREATE TABLE public.visita (
    id integer NOT NULL,
    fecha_entrada date DEFAULT LOCALTIMESTAMP(0),
    hora_entrada time without time zone DEFAULT LOCALTIMESTAMP(0),
    fecha_salida date,
    hora_salida time without time zone,
    n_personas smallint,
    matricula character varying(8),
    modelo character varying(25),
    color character varying(15),
    ci_visitante character varying(11) NOT NULL,
    id_unidad integer NOT NULL
);
    DROP TABLE public.visita;
       public         heap    postgres    false            !           1259    161746    v_visita    VIEW     �  CREATE VIEW public.v_visita AS
 SELECT vis.id,
    vis.id_unidad,
    u.n_unidad,
    vis.ci_visitante AS cedula,
    per.p_nombre AS nombre,
    per.p_apellido AS apellido,
    vis.n_personas,
    vis.fecha_entrada,
    vis.hora_entrada,
    vis.fecha_salida,
    vis.hora_salida,
    vis.matricula,
    vis.modelo,
    vis.color
   FROM ((public.visita vis
     JOIN public.unidad u ON ((u.id = vis.id_unidad)))
     JOIN public.persona per ON (((per.cedula)::text = (vis.ci_visitante)::text)));
    DROP VIEW public.v_visita;
       public          postgres    false    232    232    232    260    260    288    288    288    288    288    288    288    288    288    288    288            "           1259    161751    visita_id_seq    SEQUENCE     �   CREATE SEQUENCE public.visita_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.visita_id_seq;
       public          postgres    false    288            �           0    0    visita_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.visita_id_seq OWNED BY public.visita.id;
          public          postgres    false    290                       2604    161753    asambleas id    DEFAULT     l   ALTER TABLE ONLY public.asambleas ALTER COLUMN id SET DEFAULT nextval('public.asambleas_id_seq'::regclass);
 ;   ALTER TABLE public.asambleas ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    203    202                       2604    161754    banco id    DEFAULT     d   ALTER TABLE ONLY public.banco ALTER COLUMN id SET DEFAULT nextval('public.banco_id_seq'::regclass);
 7   ALTER TABLE public.banco ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    205    204                       2604    161755    bitacora id_bitacora    DEFAULT     |   ALTER TABLE ONLY public.bitacora ALTER COLUMN id_bitacora SET DEFAULT nextval('public.bitacora_id_bitacora_seq'::regclass);
 C   ALTER TABLE public.bitacora ALTER COLUMN id_bitacora DROP DEFAULT;
       public          postgres    false    207    206                       2604    161756    categoriagasto id    DEFAULT     v   ALTER TABLE ONLY public.categoriagasto ALTER COLUMN id SET DEFAULT nextval('public.categoriagasto_id_seq'::regclass);
 @   ALTER TABLE public.categoriagasto ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    209    208            	           2604    161757    cobro_unidad id    DEFAULT     r   ALTER TABLE ONLY public.cobro_unidad ALTER COLUMN id SET DEFAULT nextval('public.cobro_unidad_id_seq'::regclass);
 >   ALTER TABLE public.cobro_unidad ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    211    210                       2604    161758    concepto_gasto id    DEFAULT     v   ALTER TABLE ONLY public.concepto_gasto ALTER COLUMN id SET DEFAULT nextval('public.concepto_gasto_id_seq'::regclass);
 @   ALTER TABLE public.concepto_gasto ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    213    212                       2604    161759    cuenta_pagar id    DEFAULT     r   ALTER TABLE ONLY public.cuenta_pagar ALTER COLUMN id SET DEFAULT nextval('public.cuenta_pagar_id_seq'::regclass);
 >   ALTER TABLE public.cuenta_pagar ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    217    216                       2604    161760    detalle_pagos id    DEFAULT     t   ALTER TABLE ONLY public.detalle_pagos ALTER COLUMN id SET DEFAULT nextval('public.detalle_pagos_id_seq'::regclass);
 ?   ALTER TABLE public.detalle_pagos ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    219    218                       2604    161761 	   fondos id    DEFAULT     f   ALTER TABLE ONLY public.fondos ALTER COLUMN id SET DEFAULT nextval('public.fondos_id_seq'::regclass);
 8   ALTER TABLE public.fondos ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    221    220                       2604    161762    forma_pago id    DEFAULT     n   ALTER TABLE ONLY public.forma_pago ALTER COLUMN id SET DEFAULT nextval('public.forma_pago_id_seq'::regclass);
 <   ALTER TABLE public.forma_pago ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    223    222                       2604    161763 
   funcion id    DEFAULT     h   ALTER TABLE ONLY public.funcion ALTER COLUMN id SET DEFAULT nextval('public.funcion_id_seq'::regclass);
 9   ALTER TABLE public.funcion ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    225    224                       2604    161764    gasto id    DEFAULT     d   ALTER TABLE ONLY public.gasto ALTER COLUMN id SET DEFAULT nextval('public.gasto_id_seq'::regclass);
 7   ALTER TABLE public.gasto ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    227    226                       2604    161765 
   interes id    DEFAULT     h   ALTER TABLE ONLY public.interes ALTER COLUMN id SET DEFAULT nextval('public.interes_id_seq'::regclass);
 9   ALTER TABLE public.interes ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    229    228                       2604    161766 
   mensaje id    DEFAULT     h   ALTER TABLE ONLY public.mensaje ALTER COLUMN id SET DEFAULT nextval('public.mensaje_id_seq'::regclass);
 9   ALTER TABLE public.mensaje ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    231    230            %           2604    161767    puente_asambleas_propietario id    DEFAULT     �   ALTER TABLE ONLY public.puente_asambleas_propietario ALTER COLUMN id SET DEFAULT nextval('public.puente_asambleas_propietario_id_seq'::regclass);
 N   ALTER TABLE public.puente_asambleas_propietario ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    236    235            &           2604    161768    puente_cobro_factura id    DEFAULT     �   ALTER TABLE ONLY public.puente_cobro_factura ALTER COLUMN id SET DEFAULT nextval('public.puente_cobro_factura_id_seq'::regclass);
 F   ALTER TABLE public.puente_cobro_factura ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    238    237            '           2604    161769    puente_gasto_concepto id    DEFAULT     �   ALTER TABLE ONLY public.puente_gasto_concepto ALTER COLUMN id SET DEFAULT nextval('public.puente_gasto_concepto_id_seq'::regclass);
 G   ALTER TABLE public.puente_gasto_concepto ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    240    239            *           2604    161770    puente_mensaje_usuario id    DEFAULT     �   ALTER TABLE ONLY public.puente_mensaje_usuario ALTER COLUMN id SET DEFAULT nextval('public.puente_mensaje_usuario_id_seq'::regclass);
 H   ALTER TABLE public.puente_mensaje_usuario ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    242    241            +           2604    161771    puente_persona_condominio id    DEFAULT     �   ALTER TABLE ONLY public.puente_persona_condominio ALTER COLUMN id SET DEFAULT nextval('public.puente_persona_condominio_id_seq'::regclass);
 K   ALTER TABLE public.puente_persona_condominio ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    244    243            ,           2604    161772    puente_sancion_unidad id    DEFAULT     �   ALTER TABLE ONLY public.puente_sancion_unidad ALTER COLUMN id SET DEFAULT nextval('public.puente_sancion_unidad_id_seq'::regclass);
 G   ALTER TABLE public.puente_sancion_unidad ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    246    245            -           2604    161773    puente_tipo_funcion id    DEFAULT     �   ALTER TABLE ONLY public.puente_tipo_funcion ALTER COLUMN id SET DEFAULT nextval('public.puente_tipo_funcion_id_seq'::regclass);
 E   ALTER TABLE public.puente_tipo_funcion ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    248    247            0           2604    161774    puente_unidad_propietarios id    DEFAULT     �   ALTER TABLE ONLY public.puente_unidad_propietarios ALTER COLUMN id SET DEFAULT nextval('public.puente_unidad_propietarios_id_seq'::regclass);
 L   ALTER TABLE public.puente_unidad_propietarios ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    250    249            1           2604    161775 	   recibo id    DEFAULT     f   ALTER TABLE ONLY public.recibo ALTER COLUMN id SET DEFAULT nextval('public.recibo_id_seq'::regclass);
 8   ALTER TABLE public.recibo ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    252    251            3           2604    161776 
   sancion id    DEFAULT     h   ALTER TABLE ONLY public.sancion ALTER COLUMN id SET DEFAULT nextval('public.sancion_id_seq'::regclass);
 9   ALTER TABLE public.sancion ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    255    254            5           2604    161777    tipo_unidad id    DEFAULT     p   ALTER TABLE ONLY public.tipo_unidad ALTER COLUMN id SET DEFAULT nextval('public.tipo_unidad_id_seq'::regclass);
 =   ALTER TABLE public.tipo_unidad ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    257    256            7           2604    161778    tipo_usuario id    DEFAULT     r   ALTER TABLE ONLY public.tipo_usuario ALTER COLUMN id SET DEFAULT nextval('public.tipo_usuario_id_seq'::regclass);
 >   ALTER TABLE public.tipo_usuario ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    259    258            9           2604    161779 	   unidad id    DEFAULT     f   ALTER TABLE ONLY public.unidad ALTER COLUMN id SET DEFAULT nextval('public.unidad_id_seq'::regclass);
 8   ALTER TABLE public.unidad ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    261    260            ;           2604    161780 
   usuario id    DEFAULT     h   ALTER TABLE ONLY public.usuario ALTER COLUMN id SET DEFAULT nextval('public.usuario_id_seq'::regclass);
 9   ALTER TABLE public.usuario ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    263    262            >           2604    161781 	   visita id    DEFAULT     f   ALTER TABLE ONLY public.visita ALTER COLUMN id SET DEFAULT nextval('public.visita_id_seq'::regclass);
 8   ALTER TABLE public.visita ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    290    288            �          0    161409 	   asambleas 
   TABLE DATA                 public          postgres    false    202   ��      �          0    161417    banco 
   TABLE DATA                 public          postgres    false    204   ,�      �          0    161423    bitacora 
   TABLE DATA                 public          postgres    false    206   ��      �          0    161432    categoriagasto 
   TABLE DATA                 public          postgres    false    208   M�      �          0    161438    cobro_unidad 
   TABLE DATA                 public          postgres    false    210   o�      �          0    161446    concepto_gasto 
   TABLE DATA                 public          postgres    false    212   ��      �          0    161452 
   condominio 
   TABLE DATA                 public          postgres    false    214   ��      �          0    161457    cuenta 
   TABLE DATA                 public          postgres    false    215   *�      �          0    161461    cuenta_pagar 
   TABLE DATA                 public          postgres    false    216   ��      �          0    161466    detalle_pagos 
   TABLE DATA                 public          postgres    false    218   ��      �          0    161474    fondos 
   TABLE DATA                 public          postgres    false    220   ��      �          0    161483 
   forma_pago 
   TABLE DATA                 public          postgres    false    222   ��      �          0    161492    funcion 
   TABLE DATA                 public          postgres    false    224   v�      �          0    161500    gasto 
   TABLE DATA                 public          postgres    false    226   ��      �          0    161511    interes 
   TABLE DATA                 public          postgres    false    228   H�      �          0    161520    mensaje 
   TABLE DATA                 public          postgres    false    230   ��      �          0    161528    persona 
   TABLE DATA                 public          postgres    false    232   ��      �          0    161534    propietario 
   TABLE DATA                 public          postgres    false    233   ��      �          0    161538    proveedores 
   TABLE DATA                 public          postgres    false    234   ��      �          0    161542    puente_asambleas_propietario 
   TABLE DATA                 public          postgres    false    235   &�      �          0    161547    puente_cobro_factura 
   TABLE DATA                 public          postgres    false    237   a      �          0    161555    puente_gasto_concepto 
   TABLE DATA                 public          postgres    false    239   {      �          0    161560    puente_mensaje_usuario 
   TABLE DATA                 public          postgres    false    241   �      �          0    161567    puente_persona_condominio 
   TABLE DATA                 public          postgres    false    243   �      �          0    161572    puente_sancion_unidad 
   TABLE DATA                 public          postgres    false    245   �      �          0    161577    puente_tipo_funcion 
   TABLE DATA                 public          postgres    false    247   S      �          0    161582    puente_unidad_propietarios 
   TABLE DATA                 public          postgres    false    249   3      �          0    161589    recibo 
   TABLE DATA                 public          postgres    false    251   -      �          0    161597    responsable 
   TABLE DATA                 public          postgres    false    253   G      �          0    161601    sancion 
   TABLE DATA                 public          postgres    false    254   �      �          0    161606    tipo_unidad 
   TABLE DATA                 public          postgres    false    256   Y      �          0    161612    tipo_usuario 
   TABLE DATA                 public          postgres    false    258   -      �          0    161621    unidad 
   TABLE DATA                 public          postgres    false    260   �      �          0    161627    usuario 
   TABLE DATA                 public          postgres    false    262   �      �          0    161741    visita 
   TABLE DATA                 public          postgres    false    288   1      �           0    0    asambleas_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.asambleas_id_seq', 10, true);
          public          postgres    false    203            �           0    0    banco_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.banco_id_seq', 10, true);
          public          postgres    false    205            �           0    0    bitacora_id_bitacora_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.bitacora_id_bitacora_seq', 5932, true);
          public          postgres    false    207            �           0    0    categoriagasto_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.categoriagasto_id_seq', 10, true);
          public          postgres    false    209            �           0    0    cobro_unidad_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.cobro_unidad_id_seq', 1, false);
          public          postgres    false    211            �           0    0    concepto_gasto_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.concepto_gasto_id_seq', 55, true);
          public          postgres    false    213            �           0    0    cuenta_pagar_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.cuenta_pagar_id_seq', 6, true);
          public          postgres    false    217            �           0    0    detalle_pagos_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.detalle_pagos_id_seq', 1, false);
          public          postgres    false    219            �           0    0    fondos_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.fondos_id_seq', 7, true);
          public          postgres    false    221            �           0    0    forma_pago_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.forma_pago_id_seq', 10, true);
          public          postgres    false    223            �           0    0    funcion_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.funcion_id_seq', 24, true);
          public          postgres    false    225            �           0    0    gasto_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.gasto_id_seq', 100, true);
          public          postgres    false    227            �           0    0    interes_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.interes_id_seq', 2, true);
          public          postgres    false    229            �           0    0    mensaje_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.mensaje_id_seq', 1, false);
          public          postgres    false    231            �           0    0 #   puente_asambleas_propietario_id_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('public.puente_asambleas_propietario_id_seq', 82, true);
          public          postgres    false    236            �           0    0    puente_cobro_factura_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.puente_cobro_factura_id_seq', 1, false);
          public          postgres    false    238            �           0    0    puente_gasto_concepto_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.puente_gasto_concepto_id_seq', 100, true);
          public          postgres    false    240            �           0    0    puente_mensaje_usuario_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.puente_mensaje_usuario_id_seq', 1, false);
          public          postgres    false    242            �           0    0     puente_persona_condominio_id_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.puente_persona_condominio_id_seq', 1, false);
          public          postgres    false    244            �           0    0    puente_sancion_unidad_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.puente_sancion_unidad_id_seq', 14, true);
          public          postgres    false    246            �           0    0    puente_tipo_funcion_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.puente_tipo_funcion_id_seq', 24, true);
          public          postgres    false    248            �           0    0 !   puente_unidad_propietarios_id_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public.puente_unidad_propietarios_id_seq', 208, true);
          public          postgres    false    250            �           0    0    recibo_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.recibo_id_seq', 1, false);
          public          postgres    false    252            �           0    0    sancion_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.sancion_id_seq', 10, true);
          public          postgres    false    255            �           0    0    tipo_unidad_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.tipo_unidad_id_seq', 10, true);
          public          postgres    false    257            �           0    0    tipo_usuario_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.tipo_usuario_id_seq', 1, true);
          public          postgres    false    259            �           0    0    unidad_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.unidad_id_seq', 101, true);
          public          postgres    false    261                        0    0    usuario_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.usuario_id_seq', 1, true);
          public          postgres    false    263                       0    0    visita_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.visita_id_seq', 1, false);
          public          postgres    false    290            @           2606    161783    asambleas asambleas_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.asambleas
    ADD CONSTRAINT asambleas_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.asambleas DROP CONSTRAINT asambleas_pkey;
       public            postgres    false    202            B           2606    161785    banco banco_nombre_banco_key 
   CONSTRAINT     _   ALTER TABLE ONLY public.banco
    ADD CONSTRAINT banco_nombre_banco_key UNIQUE (nombre_banco);
 F   ALTER TABLE ONLY public.banco DROP CONSTRAINT banco_nombre_banco_key;
       public            postgres    false    204            D           2606    161787    banco banco_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.banco
    ADD CONSTRAINT banco_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.banco DROP CONSTRAINT banco_pkey;
       public            postgres    false    204            F           2606    161789    bitacora bitacora_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.bitacora
    ADD CONSTRAINT bitacora_pkey PRIMARY KEY (id_bitacora);
 @   ALTER TABLE ONLY public.bitacora DROP CONSTRAINT bitacora_pkey;
       public            postgres    false    206            H           2606    161791 (   categoriagasto categoriagasto_nombre_key 
   CONSTRAINT     e   ALTER TABLE ONLY public.categoriagasto
    ADD CONSTRAINT categoriagasto_nombre_key UNIQUE (nombre);
 R   ALTER TABLE ONLY public.categoriagasto DROP CONSTRAINT categoriagasto_nombre_key;
       public            postgres    false    208            J           2606    161793 "   categoriagasto categoriagasto_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.categoriagasto
    ADD CONSTRAINT categoriagasto_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.categoriagasto DROP CONSTRAINT categoriagasto_pkey;
       public            postgres    false    208            L           2606    161795    cobro_unidad cobro_unidad_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.cobro_unidad
    ADD CONSTRAINT cobro_unidad_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.cobro_unidad DROP CONSTRAINT cobro_unidad_pkey;
       public            postgres    false    210            N           2606    161797 "   concepto_gasto concepto_gasto_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.concepto_gasto
    ADD CONSTRAINT concepto_gasto_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.concepto_gasto DROP CONSTRAINT concepto_gasto_pkey;
       public            postgres    false    212            P           2606    161799    condominio condominio_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.condominio
    ADD CONSTRAINT condominio_pkey PRIMARY KEY (rif);
 D   ALTER TABLE ONLY public.condominio DROP CONSTRAINT condominio_pkey;
       public            postgres    false    214            T           2606    161801    cuenta_pagar cuenta_pagar_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.cuenta_pagar
    ADD CONSTRAINT cuenta_pagar_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.cuenta_pagar DROP CONSTRAINT cuenta_pagar_pkey;
       public            postgres    false    216            R           2606    161803    cuenta cuenta_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.cuenta
    ADD CONSTRAINT cuenta_pkey PRIMARY KEY (n_cuenta);
 <   ALTER TABLE ONLY public.cuenta DROP CONSTRAINT cuenta_pkey;
       public            postgres    false    215            V           2606    161805     detalle_pagos detalle_pagos_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.detalle_pagos
    ADD CONSTRAINT detalle_pagos_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.detalle_pagos DROP CONSTRAINT detalle_pagos_pkey;
       public            postgres    false    218            X           2606    161807    fondos fondos_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.fondos
    ADD CONSTRAINT fondos_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.fondos DROP CONSTRAINT fondos_pkey;
       public            postgres    false    220            Z           2606    161809 $   forma_pago forma_pago_forma_pago_key 
   CONSTRAINT     e   ALTER TABLE ONLY public.forma_pago
    ADD CONSTRAINT forma_pago_forma_pago_key UNIQUE (forma_pago);
 N   ALTER TABLE ONLY public.forma_pago DROP CONSTRAINT forma_pago_forma_pago_key;
       public            postgres    false    222            \           2606    161811    forma_pago forma_pago_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.forma_pago
    ADD CONSTRAINT forma_pago_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.forma_pago DROP CONSTRAINT forma_pago_pkey;
       public            postgres    false    222            ^           2606    161813    funcion funcion_funcion_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.funcion
    ADD CONSTRAINT funcion_funcion_key UNIQUE (funcion);
 E   ALTER TABLE ONLY public.funcion DROP CONSTRAINT funcion_funcion_key;
       public            postgres    false    224            `           2606    161815    funcion funcion_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.funcion
    ADD CONSTRAINT funcion_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.funcion DROP CONSTRAINT funcion_pkey;
       public            postgres    false    224            b           2606    161817    gasto gasto_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.gasto
    ADD CONSTRAINT gasto_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.gasto DROP CONSTRAINT gasto_pkey;
       public            postgres    false    226            d           2606    161819    interes interes_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.interes
    ADD CONSTRAINT interes_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.interes DROP CONSTRAINT interes_pkey;
       public            postgres    false    228            f           2606    161821    mensaje mensaje_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.mensaje
    ADD CONSTRAINT mensaje_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.mensaje DROP CONSTRAINT mensaje_pkey;
       public            postgres    false    230            h           2606    161823    persona persona_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_pkey PRIMARY KEY (cedula);
 >   ALTER TABLE ONLY public.persona DROP CONSTRAINT persona_pkey;
       public            postgres    false    232            j           2606    161825    propietario propietario_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.propietario
    ADD CONSTRAINT propietario_pkey PRIMARY KEY (ci_persona);
 F   ALTER TABLE ONLY public.propietario DROP CONSTRAINT propietario_pkey;
       public            postgres    false    233            l           2606    161827    proveedores proveedores_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.proveedores
    ADD CONSTRAINT proveedores_pkey PRIMARY KEY (cedula);
 F   ALTER TABLE ONLY public.proveedores DROP CONSTRAINT proveedores_pkey;
       public            postgres    false    234            n           2606    161829 >   puente_asambleas_propietario puente_asambleas_propietario_pkey 
   CONSTRAINT     |   ALTER TABLE ONLY public.puente_asambleas_propietario
    ADD CONSTRAINT puente_asambleas_propietario_pkey PRIMARY KEY (id);
 h   ALTER TABLE ONLY public.puente_asambleas_propietario DROP CONSTRAINT puente_asambleas_propietario_pkey;
       public            postgres    false    235            p           2606    161831 .   puente_cobro_factura puente_cobro_factura_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.puente_cobro_factura
    ADD CONSTRAINT puente_cobro_factura_pkey PRIMARY KEY (id);
 X   ALTER TABLE ONLY public.puente_cobro_factura DROP CONSTRAINT puente_cobro_factura_pkey;
       public            postgres    false    237            r           2606    161833 0   puente_gasto_concepto puente_gasto_concepto_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.puente_gasto_concepto
    ADD CONSTRAINT puente_gasto_concepto_pkey PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.puente_gasto_concepto DROP CONSTRAINT puente_gasto_concepto_pkey;
       public            postgres    false    239            t           2606    161835 2   puente_mensaje_usuario puente_mensaje_usuario_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.puente_mensaje_usuario
    ADD CONSTRAINT puente_mensaje_usuario_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.puente_mensaje_usuario DROP CONSTRAINT puente_mensaje_usuario_pkey;
       public            postgres    false    241            v           2606    161837 8   puente_persona_condominio puente_persona_condominio_pkey 
   CONSTRAINT     v   ALTER TABLE ONLY public.puente_persona_condominio
    ADD CONSTRAINT puente_persona_condominio_pkey PRIMARY KEY (id);
 b   ALTER TABLE ONLY public.puente_persona_condominio DROP CONSTRAINT puente_persona_condominio_pkey;
       public            postgres    false    243            x           2606    161839 0   puente_sancion_unidad puente_sancion_unidad_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.puente_sancion_unidad
    ADD CONSTRAINT puente_sancion_unidad_pkey PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.puente_sancion_unidad DROP CONSTRAINT puente_sancion_unidad_pkey;
       public            postgres    false    245            z           2606    161841 ,   puente_tipo_funcion puente_tipo_funcion_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.puente_tipo_funcion
    ADD CONSTRAINT puente_tipo_funcion_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.puente_tipo_funcion DROP CONSTRAINT puente_tipo_funcion_pkey;
       public            postgres    false    247            |           2606    161843 :   puente_unidad_propietarios puente_unidad_propietarios_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.puente_unidad_propietarios
    ADD CONSTRAINT puente_unidad_propietarios_pkey PRIMARY KEY (id);
 d   ALTER TABLE ONLY public.puente_unidad_propietarios DROP CONSTRAINT puente_unidad_propietarios_pkey;
       public            postgres    false    249            ~           2606    161845    recibo recibo_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.recibo
    ADD CONSTRAINT recibo_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.recibo DROP CONSTRAINT recibo_pkey;
       public            postgres    false    251            �           2606    161847    responsable responsable_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.responsable
    ADD CONSTRAINT responsable_pkey PRIMARY KEY (ci_persona);
 F   ALTER TABLE ONLY public.responsable DROP CONSTRAINT responsable_pkey;
       public            postgres    false    253            �           2606    161849    sancion sancion_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.sancion
    ADD CONSTRAINT sancion_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.sancion DROP CONSTRAINT sancion_pkey;
       public            postgres    false    254            �           2606    161851    tipo_unidad tipo_unidad_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.tipo_unidad
    ADD CONSTRAINT tipo_unidad_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.tipo_unidad DROP CONSTRAINT tipo_unidad_pkey;
       public            postgres    false    256            �           2606    161853     tipo_unidad tipo_unidad_tipo_key 
   CONSTRAINT     [   ALTER TABLE ONLY public.tipo_unidad
    ADD CONSTRAINT tipo_unidad_tipo_key UNIQUE (tipo);
 J   ALTER TABLE ONLY public.tipo_unidad DROP CONSTRAINT tipo_unidad_tipo_key;
       public            postgres    false    256            �           2606    161855    tipo_usuario tipo_usuario_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.tipo_usuario
    ADD CONSTRAINT tipo_usuario_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.tipo_usuario DROP CONSTRAINT tipo_usuario_pkey;
       public            postgres    false    258            �           2606    161857 "   tipo_usuario tipo_usuario_tipo_key 
   CONSTRAINT     ]   ALTER TABLE ONLY public.tipo_usuario
    ADD CONSTRAINT tipo_usuario_tipo_key UNIQUE (tipo);
 L   ALTER TABLE ONLY public.tipo_usuario DROP CONSTRAINT tipo_usuario_tipo_key;
       public            postgres    false    258            �           2606    161859    unidad unidad_n_documento_key 
   CONSTRAINT     _   ALTER TABLE ONLY public.unidad
    ADD CONSTRAINT unidad_n_documento_key UNIQUE (n_documento);
 G   ALTER TABLE ONLY public.unidad DROP CONSTRAINT unidad_n_documento_key;
       public            postgres    false    260            �           2606    161861    unidad unidad_n_unidad_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.unidad
    ADD CONSTRAINT unidad_n_unidad_key UNIQUE (n_unidad);
 D   ALTER TABLE ONLY public.unidad DROP CONSTRAINT unidad_n_unidad_key;
       public            postgres    false    260            �           2606    161863    unidad unidad_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.unidad
    ADD CONSTRAINT unidad_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.unidad DROP CONSTRAINT unidad_pkey;
       public            postgres    false    260            �           2606    161865    usuario usuario_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.usuario DROP CONSTRAINT usuario_pkey;
       public            postgres    false    262            �           2606    161867    usuario usuario_usuario_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_usuario_key UNIQUE (usuario);
 E   ALTER TABLE ONLY public.usuario DROP CONSTRAINT usuario_usuario_key;
       public            postgres    false    262            �           2606    161869    visita visita_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.visita
    ADD CONSTRAINT visita_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.visita DROP CONSTRAINT visita_pkey;
       public            postgres    false    288            �           2620    161870    asambleas tg_asambleas    TRIGGER     v   CREATE TRIGGER tg_asambleas BEFORE INSERT ON public.asambleas FOR EACH ROW EXECUTE FUNCTION public.llenar_bitacora();
 /   DROP TRIGGER tg_asambleas ON public.asambleas;
       public          postgres    false    291    202            �           2620    161871    banco tg_banco    TRIGGER     x   CREATE TRIGGER tg_banco BEFORE INSERT OR UPDATE ON public.banco FOR EACH ROW EXECUTE FUNCTION public.llenar_bitacora();
 '   DROP TRIGGER tg_banco ON public.banco;
       public          postgres    false    291    204            �           2620    161872    unidad tg_calcular_alicuota    TRIGGER     �   CREATE TRIGGER tg_calcular_alicuota AFTER INSERT OR UPDATE OF n_documento, direccion, id_tipo ON public.unidad FOR EACH STATEMENT EXECUTE FUNCTION public.calcular_alicuota();
 4   DROP TRIGGER tg_calcular_alicuota ON public.unidad;
       public          postgres    false    260    260    260    260    324            �           2620    161873 !   categoriagasto tg_categoria_gasto    TRIGGER     �   CREATE TRIGGER tg_categoria_gasto BEFORE INSERT OR UPDATE ON public.categoriagasto FOR EACH ROW EXECUTE FUNCTION public.llenar_bitacora();
 :   DROP TRIGGER tg_categoria_gasto ON public.categoriagasto;
       public          postgres    false    208    291            �           2620    161874     concepto_gasto tg_concepto_gasto    TRIGGER     �   CREATE TRIGGER tg_concepto_gasto BEFORE INSERT OR UPDATE ON public.concepto_gasto FOR EACH ROW EXECUTE FUNCTION public.llenar_bitacora();
 9   DROP TRIGGER tg_concepto_gasto ON public.concepto_gasto;
       public          postgres    false    291    212            �           2620    161875    condominio tg_condominio    TRIGGER     �   CREATE TRIGGER tg_condominio BEFORE INSERT OR UPDATE ON public.condominio FOR EACH ROW EXECUTE FUNCTION public.llenar_bitacora();
 1   DROP TRIGGER tg_condominio ON public.condominio;
       public          postgres    false    291    214            �           2620    161876    cuenta tg_cuenta    TRIGGER     z   CREATE TRIGGER tg_cuenta BEFORE INSERT OR UPDATE ON public.cuenta FOR EACH ROW EXECUTE FUNCTION public.llenar_bitacora();
 )   DROP TRIGGER tg_cuenta ON public.cuenta;
       public          postgres    false    215    291            �           2620    161877    cuenta_pagar tg_cuenta_pagar    TRIGGER     �   CREATE TRIGGER tg_cuenta_pagar BEFORE INSERT OR UPDATE ON public.cuenta_pagar FOR EACH ROW EXECUTE FUNCTION public.llenar_bitacora();
 5   DROP TRIGGER tg_cuenta_pagar ON public.cuenta_pagar;
       public          postgres    false    216    291            �           2620    161878    mensaje tg_eliminar_mensaje    TRIGGER     {   CREATE TRIGGER tg_eliminar_mensaje AFTER UPDATE ON public.mensaje FOR EACH ROW EXECUTE FUNCTION public.eliminar_mensaje();
 4   DROP TRIGGER tg_eliminar_mensaje ON public.mensaje;
       public          postgres    false    333    230            �           2620    161879 1   puente_mensaje_usuario tg_eliminar_puente_mensaje    TRIGGER     �   CREATE TRIGGER tg_eliminar_puente_mensaje AFTER UPDATE ON public.puente_mensaje_usuario FOR EACH ROW EXECUTE FUNCTION public.eliminar_mensaje();
 J   DROP TRIGGER tg_eliminar_puente_mensaje ON public.puente_mensaje_usuario;
       public          postgres    false    333    241            �           2620    161880    fondos tg_fondos    TRIGGER     z   CREATE TRIGGER tg_fondos BEFORE INSERT OR UPDATE ON public.fondos FOR EACH ROW EXECUTE FUNCTION public.llenar_bitacora();
 )   DROP TRIGGER tg_fondos ON public.fondos;
       public          postgres    false    220    291            �           2620    161881    forma_pago tg_forma_pago    TRIGGER     �   CREATE TRIGGER tg_forma_pago BEFORE INSERT OR UPDATE ON public.forma_pago FOR EACH ROW EXECUTE FUNCTION public.llenar_bitacora();
 1   DROP TRIGGER tg_forma_pago ON public.forma_pago;
       public          postgres    false    222    291            �           2620    161882    gasto tg_gasto    TRIGGER     x   CREATE TRIGGER tg_gasto BEFORE INSERT OR UPDATE ON public.gasto FOR EACH ROW EXECUTE FUNCTION public.llenar_bitacora();
 '   DROP TRIGGER tg_gasto ON public.gasto;
       public          postgres    false    291    226            �           2620    161883    interes tg_interes    TRIGGER     |   CREATE TRIGGER tg_interes BEFORE INSERT OR UPDATE ON public.interes FOR EACH ROW EXECUTE FUNCTION public.llenar_bitacora();
 +   DROP TRIGGER tg_interes ON public.interes;
       public          postgres    false    291    228            �           2620    161884     asambleas tg_mayuscula_asambleas    TRIGGER     �   CREATE TRIGGER tg_mayuscula_asambleas BEFORE INSERT OR UPDATE ON public.asambleas FOR EACH ROW EXECUTE FUNCTION public.mayuscula_asambleas();
 9   DROP TRIGGER tg_mayuscula_asambleas ON public.asambleas;
       public          postgres    false    338    202            �           2620    161885    banco tg_mayuscula_banco    TRIGGER     �   CREATE TRIGGER tg_mayuscula_banco BEFORE INSERT OR UPDATE ON public.banco FOR EACH ROW EXECUTE FUNCTION public.mayuscula_banco();
 1   DROP TRIGGER tg_mayuscula_banco ON public.banco;
       public          postgres    false    339    204            �           2620    161886 *   categoriagasto tg_mayuscula_categoriagasto    TRIGGER     �   CREATE TRIGGER tg_mayuscula_categoriagasto BEFORE INSERT OR UPDATE ON public.categoriagasto FOR EACH ROW EXECUTE FUNCTION public.mayuscula_categoriagasto();
 C   DROP TRIGGER tg_mayuscula_categoriagasto ON public.categoriagasto;
       public          postgres    false    340    208            �           2620    161887 &   cobro_unidad tg_mayuscula_cobro_unidad    TRIGGER     �   CREATE TRIGGER tg_mayuscula_cobro_unidad BEFORE INSERT OR UPDATE ON public.cobro_unidad FOR EACH ROW EXECUTE FUNCTION public.mayuscula_cobro_unidad();
 ?   DROP TRIGGER tg_mayuscula_cobro_unidad ON public.cobro_unidad;
       public          postgres    false    341    210            �           2620    161888 *   concepto_gasto tg_mayuscula_concepto_gasto    TRIGGER     �   CREATE TRIGGER tg_mayuscula_concepto_gasto BEFORE INSERT OR UPDATE ON public.concepto_gasto FOR EACH ROW EXECUTE FUNCTION public.mayuscula_concepto_gasto();
 C   DROP TRIGGER tg_mayuscula_concepto_gasto ON public.concepto_gasto;
       public          postgres    false    342    212            �           2620    161889 "   condominio tg_mayuscula_condominio    TRIGGER     �   CREATE TRIGGER tg_mayuscula_condominio BEFORE INSERT OR UPDATE ON public.condominio FOR EACH ROW EXECUTE FUNCTION public.mayuscula_condominio();
 ;   DROP TRIGGER tg_mayuscula_condominio ON public.condominio;
       public          postgres    false    343    214            �           2620    161890    cuenta tg_mayuscula_cuenta    TRIGGER     �   CREATE TRIGGER tg_mayuscula_cuenta BEFORE INSERT OR UPDATE ON public.cuenta FOR EACH ROW EXECUTE FUNCTION public.mayuscula_cuenta();
 3   DROP TRIGGER tg_mayuscula_cuenta ON public.cuenta;
       public          postgres    false    344    215            �           2620    161891 &   cuenta_pagar tg_mayuscula_cuenta_pagar    TRIGGER     �   CREATE TRIGGER tg_mayuscula_cuenta_pagar BEFORE INSERT OR UPDATE ON public.cuenta_pagar FOR EACH ROW EXECUTE FUNCTION public.mayuscula_cuenta_pagar();
 ?   DROP TRIGGER tg_mayuscula_cuenta_pagar ON public.cuenta_pagar;
       public          postgres    false    216    345            �           2620    161892 (   detalle_pagos tg_mayuscula_detalle_pagos    TRIGGER     �   CREATE TRIGGER tg_mayuscula_detalle_pagos BEFORE INSERT OR UPDATE ON public.detalle_pagos FOR EACH ROW EXECUTE FUNCTION public.mayuscula_detalle_pagos();
 A   DROP TRIGGER tg_mayuscula_detalle_pagos ON public.detalle_pagos;
       public          postgres    false    346    218            �           2620    161893    fondos tg_mayuscula_fondos    TRIGGER     �   CREATE TRIGGER tg_mayuscula_fondos BEFORE INSERT OR UPDATE ON public.fondos FOR EACH ROW EXECUTE FUNCTION public.mayuscula_fondos();
 3   DROP TRIGGER tg_mayuscula_fondos ON public.fondos;
       public          postgres    false    347    220            �           2620    161894 "   forma_pago tg_mayuscula_forma_pago    TRIGGER     �   CREATE TRIGGER tg_mayuscula_forma_pago BEFORE INSERT OR UPDATE ON public.forma_pago FOR EACH ROW EXECUTE FUNCTION public.mayuscula_forma_pago();
 ;   DROP TRIGGER tg_mayuscula_forma_pago ON public.forma_pago;
       public          postgres    false    348    222            �           2620    161895    gasto tg_mayuscula_gasto    TRIGGER     �   CREATE TRIGGER tg_mayuscula_gasto BEFORE INSERT OR UPDATE ON public.gasto FOR EACH ROW EXECUTE FUNCTION public.mayuscula_gasto();
 1   DROP TRIGGER tg_mayuscula_gasto ON public.gasto;
       public          postgres    false    226    349            �           2620    161896    interes tg_mayuscula_interes    TRIGGER     �   CREATE TRIGGER tg_mayuscula_interes BEFORE INSERT OR UPDATE ON public.interes FOR EACH ROW EXECUTE FUNCTION public.mayuscula_interes();
 5   DROP TRIGGER tg_mayuscula_interes ON public.interes;
       public          postgres    false    350    228            �           2620    161897    persona tg_mayuscula_persona    TRIGGER     �   CREATE TRIGGER tg_mayuscula_persona BEFORE INSERT OR UPDATE ON public.persona FOR EACH ROW EXECUTE FUNCTION public.mayuscula_persona();
 5   DROP TRIGGER tg_mayuscula_persona ON public.persona;
       public          postgres    false    351    232            �           2620    161898 $   proveedores tg_mayuscula_proveedores    TRIGGER     �   CREATE TRIGGER tg_mayuscula_proveedores BEFORE INSERT OR UPDATE ON public.proveedores FOR EACH ROW EXECUTE FUNCTION public.mayuscula_proveedores();
 =   DROP TRIGGER tg_mayuscula_proveedores ON public.proveedores;
       public          postgres    false    234    352            �           2620    161899    sancion tg_mayuscula_sancion    TRIGGER     �   CREATE TRIGGER tg_mayuscula_sancion BEFORE INSERT OR UPDATE ON public.sancion FOR EACH ROW EXECUTE FUNCTION public.mayuscula_sancion();
 5   DROP TRIGGER tg_mayuscula_sancion ON public.sancion;
       public          postgres    false    353    254            �           2620    161900 $   tipo_unidad tg_mayuscula_tipo_unidad    TRIGGER     �   CREATE TRIGGER tg_mayuscula_tipo_unidad BEFORE INSERT OR UPDATE ON public.tipo_unidad FOR EACH ROW EXECUTE FUNCTION public.mayuscula_tipo_unidad();
 =   DROP TRIGGER tg_mayuscula_tipo_unidad ON public.tipo_unidad;
       public          postgres    false    256    354            �           2620    161901 &   tipo_usuario tg_mayuscula_tipo_usuario    TRIGGER     �   CREATE TRIGGER tg_mayuscula_tipo_usuario BEFORE INSERT OR UPDATE ON public.tipo_usuario FOR EACH ROW EXECUTE FUNCTION public.mayuscula_tipo_usuario();
 ?   DROP TRIGGER tg_mayuscula_tipo_usuario ON public.tipo_usuario;
       public          postgres    false    355    258            �           2620    161902    unidad tg_mayuscula_unidad    TRIGGER     �   CREATE TRIGGER tg_mayuscula_unidad BEFORE INSERT OR UPDATE ON public.unidad FOR EACH ROW EXECUTE FUNCTION public.mayuscula_unidad();
 3   DROP TRIGGER tg_mayuscula_unidad ON public.unidad;
       public          postgres    false    260    356            �           2620    161903    visita tg_mayuscula_visita    TRIGGER     �   CREATE TRIGGER tg_mayuscula_visita BEFORE INSERT OR UPDATE ON public.visita FOR EACH ROW EXECUTE FUNCTION public.mayuscula_visita();
 3   DROP TRIGGER tg_mayuscula_visita ON public.visita;
       public          postgres    false    288    357            �           2620    161904    propietario tg_propietario    TRIGGER     �   CREATE TRIGGER tg_propietario BEFORE INSERT OR UPDATE ON public.propietario FOR EACH ROW EXECUTE FUNCTION public.llenar_bitacora();
 3   DROP TRIGGER tg_propietario ON public.propietario;
       public          postgres    false    233    291            �           2620    161905    proveedores tg_proveedores    TRIGGER     �   CREATE TRIGGER tg_proveedores BEFORE INSERT OR UPDATE ON public.proveedores FOR EACH ROW EXECUTE FUNCTION public.llenar_bitacora();
 3   DROP TRIGGER tg_proveedores ON public.proveedores;
       public          postgres    false    291    234            �           2620    161906    recibo tg_recibo    TRIGGER     z   CREATE TRIGGER tg_recibo BEFORE INSERT OR UPDATE ON public.recibo FOR EACH ROW EXECUTE FUNCTION public.llenar_bitacora();
 )   DROP TRIGGER tg_recibo ON public.recibo;
       public          postgres    false    291    251            �           2620    161907    cuenta_pagar tg_restar_saldo    TRIGGER     w   CREATE TRIGGER tg_restar_saldo AFTER INSERT ON public.cuenta_pagar FOR EACH ROW EXECUTE FUNCTION public.pagar_gasto();
 5   DROP TRIGGER tg_restar_saldo ON public.cuenta_pagar;
       public          postgres    false    372    216            �           2620    161908    sancion tg_sancion    TRIGGER     |   CREATE TRIGGER tg_sancion BEFORE INSERT OR UPDATE ON public.sancion FOR EACH ROW EXECUTE FUNCTION public.llenar_bitacora();
 +   DROP TRIGGER tg_sancion ON public.sancion;
       public          postgres    false    254    291            �           2620    161909    tipo_unidad tg_tipo_unidad    TRIGGER     �   CREATE TRIGGER tg_tipo_unidad BEFORE INSERT OR UPDATE ON public.tipo_unidad FOR EACH ROW EXECUTE FUNCTION public.llenar_bitacora();
 3   DROP TRIGGER tg_tipo_unidad ON public.tipo_unidad;
       public          postgres    false    256    291            �           2620    161910    unidad tg_unidad    TRIGGER     z   CREATE TRIGGER tg_unidad BEFORE INSERT OR UPDATE ON public.unidad FOR EACH ROW EXECUTE FUNCTION public.llenar_bitacora();
 )   DROP TRIGGER tg_unidad ON public.unidad;
       public          postgres    false    260    291            �           2620    161911    visita tg_visita    TRIGGER     p   CREATE TRIGGER tg_visita BEFORE INSERT ON public.visita FOR EACH ROW EXECUTE FUNCTION public.llenar_bitacora();
 )   DROP TRIGGER tg_visita ON public.visita;
       public          postgres    false    288    291            �           2606    161912 !   bitacora bitacora_id_usuario_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.bitacora
    ADD CONSTRAINT bitacora_id_usuario_fkey FOREIGN KEY (id_usuario) REFERENCES public.usuario(id);
 K   ALTER TABLE ONLY public.bitacora DROP CONSTRAINT bitacora_id_usuario_fkey;
       public          postgres    false    206    3218    262            �           2606    161917 (   cobro_unidad cobro_unidad_id_cuenta_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.cobro_unidad
    ADD CONSTRAINT cobro_unidad_id_cuenta_fkey FOREIGN KEY (id_cuenta) REFERENCES public.cuenta(n_cuenta);
 R   ALTER TABLE ONLY public.cobro_unidad DROP CONSTRAINT cobro_unidad_id_cuenta_fkey;
       public          postgres    false    3154    215    210            �           2606    161922 '   cobro_unidad cobro_unidad_id_fondo_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.cobro_unidad
    ADD CONSTRAINT cobro_unidad_id_fondo_fkey FOREIGN KEY (id_fondo) REFERENCES public.fondos(id);
 Q   ALTER TABLE ONLY public.cobro_unidad DROP CONSTRAINT cobro_unidad_id_fondo_fkey;
       public          postgres    false    3160    220    210            �           2606    161927 (   cobro_unidad cobro_unidad_id_unidad_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.cobro_unidad
    ADD CONSTRAINT cobro_unidad_id_unidad_fkey FOREIGN KEY (id_unidad) REFERENCES public.unidad(id);
 R   ALTER TABLE ONLY public.cobro_unidad DROP CONSTRAINT cobro_unidad_id_unidad_fkey;
       public          postgres    false    3216    210    260            �           2606    161932 /   concepto_gasto concepto_gasto_id_categoria_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.concepto_gasto
    ADD CONSTRAINT concepto_gasto_id_categoria_fkey FOREIGN KEY (id_categoria) REFERENCES public.categoriagasto(id);
 Y   ALTER TABLE ONLY public.concepto_gasto DROP CONSTRAINT concepto_gasto_id_categoria_fkey;
       public          postgres    false    208    212    3146            �           2606    161937    cuenta cuenta_ci_persona_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.cuenta
    ADD CONSTRAINT cuenta_ci_persona_fkey FOREIGN KEY (ci_persona) REFERENCES public.persona(cedula);
 G   ALTER TABLE ONLY public.cuenta DROP CONSTRAINT cuenta_ci_persona_fkey;
       public          postgres    false    215    232    3176            �           2606    161942    cuenta cuenta_id_banco_fkey    FK CONSTRAINT     {   ALTER TABLE ONLY public.cuenta
    ADD CONSTRAINT cuenta_id_banco_fkey FOREIGN KEY (id_banco) REFERENCES public.banco(id);
 E   ALTER TABLE ONLY public.cuenta DROP CONSTRAINT cuenta_id_banco_fkey;
       public          postgres    false    215    204    3140            �           2606    161947 '   cuenta_pagar cuenta_pagar_id_fondo_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.cuenta_pagar
    ADD CONSTRAINT cuenta_pagar_id_fondo_fkey FOREIGN KEY (id_fondo) REFERENCES public.fondos(id);
 Q   ALTER TABLE ONLY public.cuenta_pagar DROP CONSTRAINT cuenta_pagar_id_fondo_fkey;
       public          postgres    false    220    216    3160            �           2606    161952 ,   cuenta_pagar cuenta_pagar_id_forma_pago_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.cuenta_pagar
    ADD CONSTRAINT cuenta_pagar_id_forma_pago_fkey FOREIGN KEY (id_forma_pago) REFERENCES public.forma_pago(id);
 V   ALTER TABLE ONLY public.cuenta_pagar DROP CONSTRAINT cuenta_pagar_id_forma_pago_fkey;
       public          postgres    false    222    216    3164            �           2606    161957 '   cuenta_pagar cuenta_pagar_id_gasto_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.cuenta_pagar
    ADD CONSTRAINT cuenta_pagar_id_gasto_fkey FOREIGN KEY (id_gasto) REFERENCES public.gasto(id);
 Q   ALTER TABLE ONLY public.cuenta_pagar DROP CONSTRAINT cuenta_pagar_id_gasto_fkey;
       public          postgres    false    226    216    3170            �           2606    161962 '   cuenta_pagar cuenta_pagar_n_cuenta_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.cuenta_pagar
    ADD CONSTRAINT cuenta_pagar_n_cuenta_fkey FOREIGN KEY (n_cuenta) REFERENCES public.cuenta(n_cuenta);
 Q   ALTER TABLE ONLY public.cuenta_pagar DROP CONSTRAINT cuenta_pagar_n_cuenta_fkey;
       public          postgres    false    215    216    3154            �           2606    161967 !   cuenta cuenta_rif_condominio_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.cuenta
    ADD CONSTRAINT cuenta_rif_condominio_fkey FOREIGN KEY (rif_condominio) REFERENCES public.condominio(rif);
 K   ALTER TABLE ONLY public.cuenta DROP CONSTRAINT cuenta_rif_condominio_fkey;
       public          postgres    false    215    3152    214            �           2606    161972 )   detalle_pagos detalle_pagos_id_gasto_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.detalle_pagos
    ADD CONSTRAINT detalle_pagos_id_gasto_fkey FOREIGN KEY (id_gasto) REFERENCES public.gasto(id);
 S   ALTER TABLE ONLY public.detalle_pagos DROP CONSTRAINT detalle_pagos_id_gasto_fkey;
       public          postgres    false    226    218    3170            �           2606    161977 *   detalle_pagos detalle_pagos_id_unidad_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.detalle_pagos
    ADD CONSTRAINT detalle_pagos_id_unidad_fkey FOREIGN KEY (id_unidad) REFERENCES public.unidad(id);
 T   ALTER TABLE ONLY public.detalle_pagos DROP CONSTRAINT detalle_pagos_id_unidad_fkey;
       public          postgres    false    218    3216    260            �           2606    161982    gasto gasto_id_asamblea_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.gasto
    ADD CONSTRAINT gasto_id_asamblea_fkey FOREIGN KEY (id_asamblea) REFERENCES public.asambleas(id);
 F   ALTER TABLE ONLY public.gasto DROP CONSTRAINT gasto_id_asamblea_fkey;
       public          postgres    false    202    226    3136            �           2606    161987    gasto gasto_id_proveedor_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.gasto
    ADD CONSTRAINT gasto_id_proveedor_fkey FOREIGN KEY (id_proveedor) REFERENCES public.proveedores(cedula);
 G   ALTER TABLE ONLY public.gasto DROP CONSTRAINT gasto_id_proveedor_fkey;
       public          postgres    false    3180    234    226            �           2606    161992 #   interes interes_rif_condominio_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.interes
    ADD CONSTRAINT interes_rif_condominio_fkey FOREIGN KEY (rif_condominio) REFERENCES public.condominio(rif);
 M   ALTER TABLE ONLY public.interes DROP CONSTRAINT interes_rif_condominio_fkey;
       public          postgres    false    214    228    3152            �           2606    161997    mensaje mensaje_emisor_fkey    FK CONSTRAINT     {   ALTER TABLE ONLY public.mensaje
    ADD CONSTRAINT mensaje_emisor_fkey FOREIGN KEY (emisor) REFERENCES public.usuario(id);
 E   ALTER TABLE ONLY public.mensaje DROP CONSTRAINT mensaje_emisor_fkey;
       public          postgres    false    3218    230    262            �           2606    162002 '   propietario propietario_ci_persona_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.propietario
    ADD CONSTRAINT propietario_ci_persona_fkey FOREIGN KEY (ci_persona) REFERENCES public.persona(cedula);
 Q   ALTER TABLE ONLY public.propietario DROP CONSTRAINT propietario_ci_persona_fkey;
       public          postgres    false    3176    233    232            �           2606    162007 M   puente_asambleas_propietario puente_asambleas_propietario_ci_propietario_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.puente_asambleas_propietario
    ADD CONSTRAINT puente_asambleas_propietario_ci_propietario_fkey FOREIGN KEY (ci_propietario) REFERENCES public.propietario(ci_persona);
 w   ALTER TABLE ONLY public.puente_asambleas_propietario DROP CONSTRAINT puente_asambleas_propietario_ci_propietario_fkey;
       public          postgres    false    233    3178    235            �           2606    162012 J   puente_asambleas_propietario puente_asambleas_propietario_id_asamblea_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.puente_asambleas_propietario
    ADD CONSTRAINT puente_asambleas_propietario_id_asamblea_fkey FOREIGN KEY (id_asamblea) REFERENCES public.asambleas(id);
 t   ALTER TABLE ONLY public.puente_asambleas_propietario DROP CONSTRAINT puente_asambleas_propietario_id_asamblea_fkey;
       public          postgres    false    235    3136    202            �           2606    162017 7   puente_cobro_factura puente_cobro_factura_id_cobro_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.puente_cobro_factura
    ADD CONSTRAINT puente_cobro_factura_id_cobro_fkey FOREIGN KEY (id_cobro) REFERENCES public.cobro_unidad(id);
 a   ALTER TABLE ONLY public.puente_cobro_factura DROP CONSTRAINT puente_cobro_factura_id_cobro_fkey;
       public          postgres    false    237    3148    210            �           2606    162022 8   puente_cobro_factura puente_cobro_factura_id_recibo_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.puente_cobro_factura
    ADD CONSTRAINT puente_cobro_factura_id_recibo_fkey FOREIGN KEY (id_recibo) REFERENCES public.recibo(id);
 b   ALTER TABLE ONLY public.puente_cobro_factura DROP CONSTRAINT puente_cobro_factura_id_recibo_fkey;
       public          postgres    false    237    3198    251            �           2606    162027 <   puente_gasto_concepto puente_gasto_concepto_id_concepto_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.puente_gasto_concepto
    ADD CONSTRAINT puente_gasto_concepto_id_concepto_fkey FOREIGN KEY (id_concepto) REFERENCES public.concepto_gasto(id);
 f   ALTER TABLE ONLY public.puente_gasto_concepto DROP CONSTRAINT puente_gasto_concepto_id_concepto_fkey;
       public          postgres    false    239    3150    212            �           2606    162032 9   puente_gasto_concepto puente_gasto_concepto_id_gasto_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.puente_gasto_concepto
    ADD CONSTRAINT puente_gasto_concepto_id_gasto_fkey FOREIGN KEY (id_gasto) REFERENCES public.gasto(id);
 c   ALTER TABLE ONLY public.puente_gasto_concepto DROP CONSTRAINT puente_gasto_concepto_id_gasto_fkey;
       public          postgres    false    3170    226    239            �           2606    162037 =   puente_mensaje_usuario puente_mensaje_usuario_id_mensaje_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.puente_mensaje_usuario
    ADD CONSTRAINT puente_mensaje_usuario_id_mensaje_fkey FOREIGN KEY (id_mensaje) REFERENCES public.mensaje(id);
 g   ALTER TABLE ONLY public.puente_mensaje_usuario DROP CONSTRAINT puente_mensaje_usuario_id_mensaje_fkey;
       public          postgres    false    230    3174    241            �           2606    162042 ;   puente_mensaje_usuario puente_mensaje_usuario_receptor_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.puente_mensaje_usuario
    ADD CONSTRAINT puente_mensaje_usuario_receptor_fkey FOREIGN KEY (receptor) REFERENCES public.usuario(id);
 e   ALTER TABLE ONLY public.puente_mensaje_usuario DROP CONSTRAINT puente_mensaje_usuario_receptor_fkey;
       public          postgres    false    262    3218    241            �           2606    162047 C   puente_persona_condominio puente_persona_condominio_ci_persona_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.puente_persona_condominio
    ADD CONSTRAINT puente_persona_condominio_ci_persona_fkey FOREIGN KEY (ci_persona) REFERENCES public.persona(cedula);
 m   ALTER TABLE ONLY public.puente_persona_condominio DROP CONSTRAINT puente_persona_condominio_ci_persona_fkey;
       public          postgres    false    3176    232    243            �           2606    162052 G   puente_persona_condominio puente_persona_condominio_rif_condominio_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.puente_persona_condominio
    ADD CONSTRAINT puente_persona_condominio_rif_condominio_fkey FOREIGN KEY (rif_condominio) REFERENCES public.condominio(rif);
 q   ALTER TABLE ONLY public.puente_persona_condominio DROP CONSTRAINT puente_persona_condominio_rif_condominio_fkey;
       public          postgres    false    3152    243    214            �           2606    162057 ;   puente_sancion_unidad puente_sancion_unidad_id_sancion_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.puente_sancion_unidad
    ADD CONSTRAINT puente_sancion_unidad_id_sancion_fkey FOREIGN KEY (id_sancion) REFERENCES public.sancion(id);
 e   ALTER TABLE ONLY public.puente_sancion_unidad DROP CONSTRAINT puente_sancion_unidad_id_sancion_fkey;
       public          postgres    false    254    3202    245            �           2606    162062 :   puente_sancion_unidad puente_sancion_unidad_id_unidad_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.puente_sancion_unidad
    ADD CONSTRAINT puente_sancion_unidad_id_unidad_fkey FOREIGN KEY (id_unidad) REFERENCES public.unidad(id);
 d   ALTER TABLE ONLY public.puente_sancion_unidad DROP CONSTRAINT puente_sancion_unidad_id_unidad_fkey;
       public          postgres    false    3216    260    245            �           2606    162067 7   puente_tipo_funcion puente_tipo_funcion_id_funcion_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.puente_tipo_funcion
    ADD CONSTRAINT puente_tipo_funcion_id_funcion_fkey FOREIGN KEY (id_funcion) REFERENCES public.funcion(id);
 a   ALTER TABLE ONLY public.puente_tipo_funcion DROP CONSTRAINT puente_tipo_funcion_id_funcion_fkey;
       public          postgres    false    224    247    3168            �           2606    162072 4   puente_tipo_funcion puente_tipo_funcion_id_tipo_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.puente_tipo_funcion
    ADD CONSTRAINT puente_tipo_funcion_id_tipo_fkey FOREIGN KEY (id_tipo) REFERENCES public.tipo_usuario(id);
 ^   ALTER TABLE ONLY public.puente_tipo_funcion DROP CONSTRAINT puente_tipo_funcion_id_tipo_fkey;
       public          postgres    false    258    247    3208            �           2606    162077 I   puente_unidad_propietarios puente_unidad_propietarios_ci_propietario_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.puente_unidad_propietarios
    ADD CONSTRAINT puente_unidad_propietarios_ci_propietario_fkey FOREIGN KEY (ci_propietario) REFERENCES public.propietario(ci_persona);
 s   ALTER TABLE ONLY public.puente_unidad_propietarios DROP CONSTRAINT puente_unidad_propietarios_ci_propietario_fkey;
       public          postgres    false    249    233    3178            �           2606    162082 D   puente_unidad_propietarios puente_unidad_propietarios_id_unidad_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.puente_unidad_propietarios
    ADD CONSTRAINT puente_unidad_propietarios_id_unidad_fkey FOREIGN KEY (id_unidad) REFERENCES public.unidad(id);
 n   ALTER TABLE ONLY public.puente_unidad_propietarios DROP CONSTRAINT puente_unidad_propietarios_id_unidad_fkey;
       public          postgres    false    260    3216    249            �           2606    162087    recibo recibo_id_unidad_fkey    FK CONSTRAINT     ~   ALTER TABLE ONLY public.recibo
    ADD CONSTRAINT recibo_id_unidad_fkey FOREIGN KEY (id_unidad) REFERENCES public.unidad(id);
 F   ALTER TABLE ONLY public.recibo DROP CONSTRAINT recibo_id_unidad_fkey;
       public          postgres    false    3216    260    251            �           2606    162092 '   responsable responsable_ci_persona_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.responsable
    ADD CONSTRAINT responsable_ci_persona_fkey FOREIGN KEY (ci_persona) REFERENCES public.persona(cedula);
 Q   ALTER TABLE ONLY public.responsable DROP CONSTRAINT responsable_ci_persona_fkey;
       public          postgres    false    232    253    3176            �           2606    162097    unidad unidad_id_tipo_fkey    FK CONSTRAINT        ALTER TABLE ONLY public.unidad
    ADD CONSTRAINT unidad_id_tipo_fkey FOREIGN KEY (id_tipo) REFERENCES public.tipo_unidad(id);
 D   ALTER TABLE ONLY public.unidad DROP CONSTRAINT unidad_id_tipo_fkey;
       public          postgres    false    3204    256    260            �           2606    162102    usuario usuario_ci_persona_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_ci_persona_fkey FOREIGN KEY (ci_persona) REFERENCES public.persona(cedula);
 I   ALTER TABLE ONLY public.usuario DROP CONSTRAINT usuario_ci_persona_fkey;
       public          postgres    false    3176    232    262            �           2606    162107 $   usuario usuario_id_tipo_usuario_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_id_tipo_usuario_fkey FOREIGN KEY (id_tipo_usuario) REFERENCES public.tipo_usuario(id);
 N   ALTER TABLE ONLY public.usuario DROP CONSTRAINT usuario_id_tipo_usuario_fkey;
       public          postgres    false    262    3208    258            �           2606    162112    visita visita_ci_visitante_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.visita
    ADD CONSTRAINT visita_ci_visitante_fkey FOREIGN KEY (ci_visitante) REFERENCES public.persona(cedula);
 I   ALTER TABLE ONLY public.visita DROP CONSTRAINT visita_ci_visitante_fkey;
       public          postgres    false    232    288    3176            �           2606    162117    visita visita_id_unidad_fkey    FK CONSTRAINT     ~   ALTER TABLE ONLY public.visita
    ADD CONSTRAINT visita_id_unidad_fkey FOREIGN KEY (id_unidad) REFERENCES public.unidad(id);
 F   ALTER TABLE ONLY public.visita DROP CONSTRAINT visita_id_unidad_fkey;
       public          postgres    false    288    3216    260            �   Z  x���MN�0��=��
�$���3-#9N���[��HH�`͑z1Ƥ�.ɼ�>�L�Ƒ���W���?=�l����q{��\�W0\W���P-�Ѣby���[%K��:�^�����c����N���P��d�d
���U;�'���QHG{_���ͺ���G�6�F��bCK�`C� �ۑ��OQ�G�&b#�e��&���Q��E�bSd�>�)oY�A�ם�Y�<gb[�����6��*�a�p�5��U�"��FѰyX��������V�N���mx�:��[�(,sF+T�Z�<��&a{�<Yә�'hM[�� O�/gi�!k� ���=%� ��b�%      �   �   x���M
�0F�=��P��/��t�0�$-�����=���b�
��d����S��zP�ܚ�|�G��R_��@�4�8$�%��"N�qo��M��	&=�)�ʐ�O���T$��|�LI$��0��#@'9�"���c�h�����n���т�j�b�<��:��^�^O���{t��������      �      x��MsI�%x�_��jD<����{�H�D� �2U�� ��``�V���a�os����ҷ�򏭙"����UD��d�"칻�=S}�vtr~xv�wtrq�������xy?�ps;�{79~{x���,�����˻�ۛ�����^9y{|���;�����/�>���ͮg�2���'��5@�4O�K���f/K�� ��_���r|z}z���W{/����g
�]@�],>���ͯ��.�W
����v��������~v���(|z	}z����}��`}`��{���<�[�5����B��T�Ц��?��~�����/����ާ����Ɠ�⟝'��뻟g���\�?;K�/����_����^�����ؖv��ϳ���j|n���e�⯳�2S���ȵ�S}�z������c�Ơ��G�7�o>]^_���V�peU7m���������/�ۏ_��z?I�ҥ�i����fW�7����������>�|li��ni��0���rs{9�ezw�o�o��͞����o�����Y\:�������]��/�W}���[��ݗO�A9�r���Ar[[�d�1\p���˯�y���2͛.���v�A�������U$��a���t���d���_�c���/�m+K�m��v[�\r;�<]^�����*Ү� ��v�G�m�*�������qZm��o#,��a�~}�����ӏ�&�w����t�t������ק�kL._��}��do���d�Nw{��r���v�SuP0��$���WI.�֮s��HCڃoH���c~���Vɛɫ������m]o��_nI��vI��>ȁ�7���~�x����q��B�Vm�[Z�$w�_���n�o�Ï���+�=%����������������;I�_M.N��|q�ny�"��-�%~�9�G�\�	{ڿ����tY��3kx�x7�������m~�E�Q�;lL��?ʁ����bm�
m��b?)��Td�X�1SliR�L��B���v�Q�_mi��'֢��5�ޗ�~�6�h��W[�U����4�%�/�>t����&ڨ� ������(?+z��{��?�V�5�@��/�6��ᎍ�`K3����7�S?;�n?��6ڸ��H�ڃ���5E�uu2���K߈��ܸ��Wlid�_�ĖF6ɇ�'�)�:��o���^��p����k�Y�A/&�'g/8^ON.O�^�w�Z��7�B^ݭ)/������62xߘ6�\�6�y��ӏC�j����.h��B��L+��5�����˧����5�jo�;��~Ɵ���a�{4����$(�ӓ��.���ɋ�7A�<h}���'{�)���[2t��L:Y�2.Vo7��3���%CV9Δ�嫷zeM�5k�h���� �`��������l��4�嵮|���]����<��te(�ﰿ��Ö��Q�ڣ^�%L� ����?N^Nư����/��ہ���?�-7X�x�pz�|�뻣WGǓ�G��Q��rn`�]�-+A2�&d['��~quz2��k���W��;����x9�7(��C'r/���?�|����������%ת��i��7ڠ�KeW��L~39���C�~?�6݅��,��ϱ�78�mm@�.yst���dh�z��
C7�p�*�6��o2*�����E�_�p*8=�y�V��+B����dr������l�I�_���X=�y�+����K��2!yszvqz2��t�XC��Ëh�<ZR¢'_=g��c�p�~T.nI)��k��~�V9~�P=�5�㣷h����C�H)ۤ���Q�>ޓ8k���h�"�6��.?3��.�	��ٖ'�*�/���Q|������?a�������/���u�)��Q�vx���D
2��0=�%㿉43猿�HA�ј��p��fW_�ׇ���7�zM�����tVm6��wQ�~�(��h��A
+�
�śmQ�Q�M������ﰥ���3*VĢ^��g(ܨ�eX�ο��_�Y�X>�|�|s<iw+���F+rG˃NUW��z�l<^��x�������w�GZ!L�����.�4���4���bN�=k7Z|u������p�ޅ����4�Y�6����A�3���y���l����_o��?���݂��+#-/9�
��C�{�����W�?���uݕ_����󋣋�ï\N�Zo	�����d?M�f[K�|�݇���G:�Sԟ�c�$�N��r��8ǭ̵����6�%#xSm�]�g>O��yz5���A�{[������7�������c�C�&�gz��/'��|W0ۺ?�D?9O\����G>4�Xy�A�C��/��^�=9�~.����y�s]�����~z�\�����7��e�e������e�/n���Y���V�f/����������G���։��	�f���G�+ֺ?BE?�I���i��_��\0V�u��~n�4i�5����-.8��?Z�G�4i������t�c�J���Ϸ7�/g������kʬ.�*�>(��|9?:yux��~�ӑ�Q겼����k����_���Ӌד��?�8}=�V?�ë��?�mik�
פ٢�/���~2Y�����]ho�ʺi��L����no��=Mt���<m�����K?B�<<�W�_Z�����4��K�]�6m3�Nx��xr
��=�`����֭�v��zU�������ً×�����_&g�yyv����_/u�'�_���q���J���?oki]�M>{r�g9/~LNB�_6��2m\�\��x�]��4��|k���-��3������K����?���V��.M���|O�8?���?liq�]��'?��v��翳S?��.���(d�o�O�7���T��'�mW��uE���o���o��ӳ�A"��"���޼���u�G�?�l}|g���6��l����Jk_?�846��Y�L&��P���t7�?Emml���_�����'?���=��Ƨ�p����4+���������÷��l��fongw���Ů�d�������
΁0�=��L�#���=����,/&{�w�'G/'{�'g!4u||��5{���!��2�(��,������g1�x?���xx�zrĺ��}.K�<y����G��~�B�����������sA+�0r��Q;073�sy�{I�Q헧gsG�2C�=�Y���I�'�S�Oo��n��cI;03����MH����,�=S�!=��kj���7����ʣ��EH�6���TՑ[P36g��g��+J���ï���5�G���e�?�ʵ�)�e�Qq~v��	/:V^����B��ځ4vB�m�<X�������9?o�����~ٴx��������_�+7�����ɋ���#nk&�-�2�|~^M�.&�,͋4s���ϳ|�����a��G�T����d[;0	G���5^���!�~q�i0_�N����������')d��D�90��/x�X~��?:ywxv~��g�w^2.�� ��d����Ư>Q/&g��-F�I"Y���>U�^>j�;Q1�=�����N�n���?y�qr�����qq�"a����J��cں{����/��֑����ܟ����B��Oþ���o���so�������Ƽs;��� ��V��V|���\�����w��k�s�)���(�����6�9���N�}�<�����q���:M�T������g{݋��/�	9����o�&���6�B�0��?�j��{�~�jov����^Mo�����[r����oǓ�!�9#Đ��Iq���CC���\}��_�mZ���B�������O�����pc��,K�T�i-��������п˻�Z��/�~Fؽ��Ó`&}�����������y^��l/�e'o�r<O�tou����	do~�q�M����;���gв�;��M�iE܁%kߚ�}��@o�W���F<��� ��n&�6�����|3=0��|y=�
AT?���ez�q�7/��s��t��<��ryu��βq������_�\����Kv���}��A+�N�������W�OX�>\�ǿ��ic �L    �N˫�i��R�]��u�ٝ�i�k�ts=����vײ�����[9&����}�rrq�j\L��u�J���L�H�(��|����N�X��!oZWU��ڳ̫�H���~����0�Ƿ�m<![7����y���ws���������v�"��ꜱ�(K[b�<}s8�yg?x�|���K?n�z;9{9�Ƴ�G'���o�d������_?��x;9�2ۏ|�&��W��8��b�&��Qqe�ة��l�6M�Mɬw���J�[�w� ���PV�Yշt��\��u=���������X�׹o��M������[��d�)<ҕ`ڪ�5��|�@8���pҙb^�a�Uյv��[��p_`�U����&Wo�x�z���H�w����gg��٦\/>��w�
�,q�i+���J:+��o

m���g�|X��$.NΉYt��O���Xw;Bx���Ut�U��?3����=*�);glr�6
.���������Ə�{7�og!0k6�L�ţ�?~}��5��R�ȱ��~B��_���C�|��\*}t�0�f���ۙ;6?��&l��]�M�on/o��ek�j��*ۨ�8xQ���?��>���9�6w
��L�]���s���k�&/M˨O�T@ܸi~�ysxr����dDCIF�������?u��e¯���Ұ�L���K��8XXg���~�)r�������_4.�5��H�CMs���Dq���#�?�:-�&/ʼu~̫���,�<F#/8��aI�b�q��R��ƍ��D��?-�3j>V�c�{�m����4�f;e�gf�[�?Y����D>3�37"�Y���W���n�������w��`��1��e]!J�{�G��<A�ysCʨ�� �Ȍ?���o�����&փ8���A�3�IC��]�<mc��C8�62�3EO[���T��M�b�JF͎���<�DÁ�G�P#z�����#Lh���n`��Ѓ��y!��F)ӈD)��Zc�Ek�^k�N��R�F�����U�C
���VQR��]�3<���k�!%b�y�8ŉ|���o��ʍ�:��َ���������*�����ٸ����7�AnT��'<Ee�X�^kˎe%v�8���rLΫ�q+߇�7G�hFlP�V.o�z�����"���5S��CV�*-���vX1�Ӳ^��VY���Z�><��o� �7ظ09U�kW�+A%�Q����mȋEk�^k]ǲjZ�:O;��F�WZ4m�����<�D�@o��VY�4���᱒G�!�UǼU�6u���ւ<�Č�7��y���ep��&��~�[�e����ṂG��q��#ު߅���E���L0m�q�Z��O�0m�'�L�M��Yk�[��鵶�X6�M���g6Л�ƼU�TmY�yVmV���c�#�28Л�F�U��M^=�vElz�0&�ޜ6��796=r�ȕ���ƼU��LG�GaB ��ic�*�t+�ulz�&�ޜ6�\�rlz�&��L7�V����M����#gJ6.<뷲V�tk"��9S�ތ5�:��YM{�J�i�I��Vzs�ٴ�$L(+���l�e&���\i6�2	�Jo�4�v��	a�7W�M�L�қA�&c&�����[�we2&�K�h2ι�1c_PCh�ݘ�9�	���1�0!�vc2�&��nL��ڍɘC��[�1s+z���\̡���v��0j}6���Xc2.��1���k7&cᖐ[�1srk7&caBn��d�!Lȭݘ�9��S�r2�P�sN}ӹ�Cy����;g���Lƭ�yJa2v�ɘa]o	�����B��[��>p�yJȭ�P����!Lȭ�P�����L�]Qʛ�V���0ַj)�M%snrpA�<Փ[�P}prk7&caBn��d� �rk7&ca���r2�P��P�M'ce�-��p.�v��ЛA��d�=KWŜ��J�yFȭ�P�ڍ�'\t����2Tb������/7��ӕ�a&=?|��l~4���ӳ���J�?�x^���:����NP��{Y���J~>?��-T��z����qA����Pe���H����Y����Ѷ��L~��x���Е��������ލ�_�5����{�^�z9��8��J��׬��|k+����͵ߜ���&�_�Ӵwb��q�n��O9���p��o߲H��j�'�v�\[�ب���]�������X��͇�p��~��H5���o2ψ��n�l��M,�vEf3(��RjWd6�2�����!�����*�C� �z����l�l��Q�5Wu��<V�}����BjG&caŪj�t2fP�+��m'ce��2��d�.����r2f�sf~˹�A8'ԇ��L&c�n�����ܔ�p�!�խ�%��#Lȭݘ�y�	���1�2!�va2��+k��&ca��v�l2fv��څ��G8#ԇ��L&c�?(:RޯM�?�ˢ��Ю�d�<E�4<��SE�NH��\�����g�v�_1��a����4�^��G?0)��՗	i���_M�	Ƅ0��:��'&8|�,�2!_?Ӭ��a=��L���	����V%��6&8|#Q�L�ظ���/�Q��'�������;<3�S��1��P��wܗ�"(�\F�U��!�� c}Q.cުr�ÑU���
�)�1�Ug��<��x��UPT��y��wV>,�8��n+	�_�֎��ry�P�_z���������a 쏈[�:�����+f߸+�5ҕ�E_<+�U�1T�����#�o�[����0)��ň��VYD!�(��(�aY7��aI�#H$&��ݘ�ʛaiȣ���+�O��p�i�˪oT�|{��rv���C���j���y����ŏ�gG'�������˳I���{qvt~19�8LR��ҏ�4���?���Ӌד��?�8}=0-�f9.۫�I9&��E
_y�;W��_W.G�lC�u*o�w��6����f���^?B������b�{��^��k��?vӻ��W���z_�yz�����v.�>M��gח�.g��[���_3oX�]��N��� ��;�o��-|ƼW�{#�(�èo��-|ƼW�~K	%�(�ۿ��1�ջ�~�\D�(S�O(��1��q�H֙GY���9>�Z���XF�<�z��6T���؃E=�W_Ə���<	���z5�"�Q�vB����~�:�"�H���~7����EO��~{|1��-|�<�K�̮?�3K^~�����PKʃ7K�� �`K���,��Z��?=���w�M�Z�=ҝ�@6�XoR^���1.N���^��Ez��˴���x�E�z�r��t-a(⦿mx�%�zKܒ�b��㫃-��w	lJv�exS�����4�nO�yt���j�%�zK��G7ޞ� �w�6����Z�m��m�.�u��c�u����9<󘗇{!��?n����o�F&�K(�޼��|mU��(]ո"O��yqzvvtLY��Ŝ����Ǹ��Q|�M�K3ߠ2�·<��lS����g��?�G�S��Q���UfYx!�L~�:�K6�A�H�Fm���_Q���IK�U��t�Bo�D�����������&���n|ﾼi������o>��]��������/��o��nC�����Rrv����[���\]~�|9�{ ����������iW#�B'F�nn$�4'39����o�O��������ÿ�i��������ޟ��]���t{wx����d�x�����YW%�2�?��P�ȍ뇟����BaQ�~3�����g���x59���q;�u>�oaT��i7g��Q�o��gg�~�:��f����D��������_�d��c,c^�,曅�G��7�Wt���n�"��x�e(���y1�ː�/��G/�N���%��w����_�k����|�~�]EI��oH�m��%�/���NW������V6�햦q�����i�o���퍿8�M�c�0y>�s�בv:NQ��S�*����o��[��� c��bi�:����l�����=�zI)KO4��������n�����R��    ��TZʩ���[g����篲�k+�ͬ�Xir�zf��&.8���\~���#n�N�U������������_��*�=��*2��+�P�]H���_��>;�ֵ���W1_EF���Ns��m�쵃m��Ƌ��{m�"���_Ó�U�M\��_"h�/'��^���k��$7����O����k'���J�Q��D?i��[�����
}�W��{ͬ6����է�Zr\ﵶ�F$���{-l�����e�9+�p�Ӡ$��#�4��{�m�/?�޼��~z姠��/��;���,n��hp���I�z��4yw���U�ze�j!�|s�����ZMcN7e���^�����F�����ÜO�|�ͮf���f��-�Qikџ[~�P{~��ȳ��\y����'_�&����x�ۅ�/�(lџ^"�,�ؽ�2���Y��I:t���W�b���V).j���iU�<,��l����n&ۻv9|�R���H���nC����g߰˫�����k��p�{��R��Et�4�LO�t޲���^���MJ�,�q��ˑ����6�h|�����>{3xY�^�hp>xe냜ѻ�#v��u����_����|�"����mW���7�Œ�ܴ�������E��#�l��՗O�C��~C}㖿�7u�N�5�d4�?�G��&s��졩a�/Y=�үY��Y�f���V"�Ɩ��,\L��i���fv{�r��q����۽/׾�/������0Sv�����Q\,�^lZeʰ{�u)9a���^�o���eO�P��j��-����d�nv�����١x���cQ�͘�?O�WU�*�W�YQ6.�0��-Z�g�P�AQׅ?����X��l|l��'^Ō����������ٌ	縢�}�{�����+lʄs\��>��&[�rfy.ejG���}�{Uu��Ugfy6e�9�hp�^��W5`�gS&��z~�1o��M����<�1a,׳��x��_���j�H��K������JB���Y�ǼU�g.{6aJz��Ǿ_�j�2ڳ�G�W&�c�Fʣۦ�i�������ߜ�_L^��x��鋣�����P��[��S늪��XteI�7	�����������4����29>z���b���ܠ���gI9o�����i��p�W���Ci�M�����4g�"���=��p	��u?;��_sFD���k���;�G�9�ެ����ϒ7�7����f�lq>'U|�k��_�MK��̏�K�������'��OL�L��~Uԛg��]�"����7G�����>h�b1��u?�5�mY	�����*�=�n���HD���E��Qll�
.����"�9��Ǒ��Yp���`��օP�`����y�9d��\W�׳��p'K\�x|[���؉8���W�x��h�v�v{�;T�9��Ȧf����;��&�&bT�4|��Fؽ��{���8@�}H�_�D�t�O�ߑ���4��a���ݓ�S�nc吔MIN۞��}R%cgh��s�T��hB�dk��(��Q+�}�e��>�!
�c^��z����6��1)�����#�kt9��>,7}��������������Ĳ��-19�x��y�O����t?��d����e����q��S��Vv�cU�=��N����?O�&/��y���y�aY2y�^�ki������R:�ܸ�3I�W'�{TB`��uYN�}�C/���ʽ�}Z���6�!
�C�]f�y�ݴ�[[�N�bc���z��O��2��H�u�D��Kv�R��C�nm��ZWF��;�Z�Q$�f����(�:��8��w>���[`
�K���j��e��Ǆy���m���5�3�je��g�j�%��|=�8��,R�p&=�gmnh���x|���G/�(t��;zut<9yv���>Ylh_�$-{�eWv�\�^�a�\+Y�mE��*��rQMf��7D_غ�ے���U" ��s[+\��{k5aea&a8�#]��x���˻ɋE�����	F���=�xA�n����G�zN]�P�6�nG*����\o�	�n���_�5�'�����6vw����>LjwP�c�;�^d�AƸ�p���o���]��� 騼��!�[*D���x�"g�Xt)���M+��f�CO
l��g �M��C���6���i�����H�R XU��������'e��cl�s)��|���NO^nd�5Z����Bc_�<c�x�ѯ"[)���FH��Ug����.C�=��&'D�.*`�X�x3o�cD���9LC
fXu�~����A����ڕ�!#���j^�~�.��Q�e�D(V�����x�W�p��E�K��@�F�/�ۨ'3ĥ��?z�"e�u�|��?U7��o��	ڐ�5 wx���7C�yp���}`�Y׻z�M�36亍�8[��������P�����ዋy3�2�������勇�U(����\N�"�u3yuڕ�{����ÖW��&�ĺ����W�,&X�kwk�Y�Xu-������v���ټ� G�	2��c]I���Oķ|�8�"��2ö����W�?��4��|���>�w�ʃ��7
E
�E��r���sQ2*���*GC��m�E�'mS9�P@\	l�I"�UݸU���S��r=ܱ�6�*Q)��8��p��n� ���й��I�\O�;֨�Q�i���Z�1"��j��.WY��(��/�N&��}��ei8���zRC��Z�.��-֛�v�����Qrj��5��w)�ټ:(S��&�q0�P˛P����{�0��V�ҋ�Z�k~j��?�A��tյ����H^�8�ʓ)��і��p�8dGM�B��Y)Thc�t@&�0�K�ť�|��ۨ�5�%Gg�B6���׬q��"T�^�q�ڪ荿�Ո�B�?(�mT �T5g�P�r{\��Z&�!�ϡ$"�r[/��4{I�����"f��p5,����N���uH��Eۜ�����}i��iq���\V�㣼"�c�EVTeY��_������|��l����6������@�O8�?��g�0���{��/0�Cow�vd>oJ�n_��z8oJ���%�!�d�&���5�qTN 7�:L�O�8�!6���˫|1�-r@�D��f���h��ȫ��irh8Q���+ǚ�5��3)��^�cgp���A���Qvu�V5j����0�É����Q�u�Q�;�fL����8�9gղQ v�a㇆O��[�.�J�E�S��-u�z�͔%0�W-iH�j�ɵ9,F����z�l�~�(t��D�x���"�D�c�4B�7�5��X�����5|��N�ptgh���J�R�	k8K�
�	5+fQ*N��-ݮTB͋Yhv��q��� iP/c|ͣ����A(��~ v�~\ѓl.�l 	��d��9����B��X�]���y��0�� �4�8����ُ�]B��d��:8~�
OT��h�Cj�6A���ܜC+�1�L9k��hSp�P]*���/����W�d���=Ќ��nQ1�E�HZ�m�5 �j��y�r��DA��Ӈ/g��:�M3�f�NL��)�6E�k�CQF$�tY9�̊��lS�FS�T�Fӵ���C*h��H4~�	 ��V����Y�����7����Z񢕜�*ڹ̾�a�ZV�80"]H�ζ��`������a��F*s����.���C*t����f�Y}���	��?��|D��c���u�9��ԏ���,a����L�W�̲q�Wìh�Q�s�P3�F �o,��M�1dRҳm�`�n�I�N�!�%?pxT�!�e����?�=�o��������&=��.Z�8��5�����1�-��4t��(&gG�RR��.T�8��İ}�O߸�_TS5M7���햢6K��x���	.<F6�%��S9C�w"��7[e�#<�����jx�+�8q���p�B��b��W6a�=�Ѭ��)�*�6q�����V���)�+̪x����l�����cY[�^ہ^ل���NeU<�u�|W&a�
�NX�PV��]�t��t��d5:ޕ    M��]zg���&L).��X-�weS߬"9�u7$v�R���H3I�{ʔ:�x����ڍu�0!�vc�!LH�]YG0(g��ڍu�0!�vc�!LȮ�XGp�k��Dxk7��ڍu�0��vl��^���TBg��2#E$+6H�G��!�vk]� �j7��ڍu�0!�ve]��L���Xp2j7��ڍu�0!�va]��K��vc]�!L���XpS�k���Ŧ׋�.Yv%t�<�� l�+�y�[kqBN���A��S;#��	A�#��A�T;"��	I�#��A��T;!�t	A�#�'��ՎHfaJa�dfP��ޟV13Hm��[�ֹ�H"��!�2�P·����I��*�C�L��
��M��9�.u�߄K�A����9t.u�߄K�C�7�R�P'����R��O��9�*B�d췒��FS�pyò�,N;��9�	A�'\9ʢ�e^�n�x�:�p \�����"���V����!L��]������!L�����1ϡN�㟍��"����B�|.�Ci�H׺�����h����=ciՆq�|YBg|���ߐ��G��4���y�	I��G��4�_���2f4:�0!qvA��S!����<�S��ht��PK�A����yht�|4:�ѳ>S�d���u>�F��ٝx�	I���C��4� Y9t	A���C��1�!Y�[J��d�P����F�rHQ�g!Y9�5�\$+����b�*	>^g~#�J�JE�3�;F�"����P�B�`�A�!L�]�8݊� ���C�)�!H9�)�c��C��i?A�!E9��� �"�=�E�r(j�yR!B�<=�!�y�^o�@A~+�YQո�H���<���TT���!�9�=�z�C�P#��79�	�z�C��';�79�%��<��䐢"7�BorZ��M%"J�<�&�!d���d�*^?��!�"Z ����
W?�����q��*R��3�����$��gy0	����`R��4=A�$%8#�%���3ОNP�(��8{*A�$4����LB�mLO'(��u�,�$�u��h�m$U��i��])��*��<2����b�-�bRߍ]C<RT���!9�va��!G��`��i�	#���y6��CJp"�S
F��gn=�^��yGLe\��%��r��[��Q�z�� f�-�`���'0IQ�����`�z�Ai��NO��Ɵ���z�A��-<=� %خ�z�Ai����Ӄ8��:��Ծe0zV�+&
�l1U�y(]��0Cp�Fu~&��_��I���E�q(�/���r�Ch��DO(�8������{RT���"�8���y2�ǡ3~���=!��D�<�v�NR,UЕ2nWrJ㝒O�W9�v�!�3�F���7r툿�A�*D�<�*��N�9�v���!E��������	����L���vZ�q�����U8�9�;wP�ad�4�sw<B;�Ed�"�{>q�#�^D��"���C���:�27m�ԕK�k]��bߠ��?����=�᡻<p-~v�Z�{��&�DZ�Gg�a1O�Uy���ɳѪ<Z�O(Uy��S�vM��T��'֪B��	}���y��e����pa�HD�qH}�����m��i��[�e^y�iӪJ߶tyY�鵮��eM�;AD�r��V����
��\�f~ʏHUI�rm��MZ�yVVM�׮�bځCj��+
�.+�"��.�p�xD�q�?UE��L�:ym��'*���ڝ��εU]xU��iǡ4������cF�UE�6U�7Qe�!D��6^�PF*E��Ō��+qN���4����xL��J;%�"���LS�qɋ��3EeǡC�4�LW�qH)��g�ʎA�*�9^�i*;!�f���LW�qH��8SvJ��vZFS�q�ψ�R�uB�i;)��b�O+�"��>���JXZ��M�*�]�z)�G��<J
ն��L^T�g4��x�����+#����M���c��W>��+���Ӭ�c^��bX:�H)�-���]Ve��E�yQQk;����3�AT��\����2"�x��o�w�bX��()l-�R?��M�d��j뺊P8��C�΄������O�.ݒ\=,�x��C�FK4jq��[Cb
m6B)���5UmR�,ۖyѬ|�`D��D�e�RL�r�a�ꄠ�˛��{L�rQ�A�91pӮqjcz�C�P�e'-���+����ׄ�D�wHt�!:At��������d��"ԃ@vBغ^�d�P_F���!���D(������f�T'�~�F����-ꌯ����(�������K��T=���f����m�2�kHB�p����UYfu��uL�qQ�J
W�*1R�B��ASW�AI����eT�q�a�F��wHt!� t�r��&ĩb�Ck�)�Dð�����wY�}L�1(U�x�� ��N��� �!�J�1�����SwV�Rڱۄ@nu��x��-5`$�PQ4���ݲB��ˌ@����(Ҏ�� ��U[Uy�g�k��O�G����?VMY�E���G��տCT�K�<ѥ�}UV�w��4���"��@�a�"-�z�F���(��fG< �?����1> Ԁ�F��8�s.���'���y��E�c���#�f����FD|jB���f�[}B�)"��Hp���]j�ʗ�:5��ծSSSU/�+3HfM��L��;T�u���!�+3��J뇓<�-B!*� �e �uY��ο���2VԅGk��ޔ0ð��\�Y���ڨ�cP"D�he�A���������PƆ��.�O1�P
�U�r�.�Ġ�-��9����tZ�\+�����Ur��?
�Me�"&�ѺB�)���y�������Y��,"V�^+�E�צ�* !j1.�0 �ɫ�i˶,�2��) ��US*����w�����8��9v����]��_Gi��Z�t
�]^מq�갱$6#qXQ���j�~����肶Ҁ�� �i�G��x/��꽨I�S�ƫ3h��}�ES3�������Z�P�Ƿ
ڧ x����ύ�M�GH�sTl���x�*0G䦢��G������E�*�8^q���x�4
0�fJM{���s�6���x��p�xͩ���o5�B��4��;�6�H�	V�E'V7E�>���}�����] USq��в�GH� �UQ��uP �GI\�Y⯳�G�l�5�YҨ�,s�aA+yf����6���dgA�9��hz�H!��ю��䱒o6��&�`$�u�D��`}VTUE��P;H�>H3���@[V ��"��x��� �!q!fQ�΀���(tg@��8<E�n��Ȥģ%��,���'B;����8vg@��6<E�N�'Q�cw���*�(h ؀u�@�AXNA<��~������U�V$�+�_�ҋ������d�kv�d�C�*�8^0b^�^%š��$$?�)F�Xe@H��!�l1 �`i�B6�R�4F�8]��ɫ%���IK���OȮ��DC/����l�B�FB*��hO��=���8^0�*W�p�T�C�lAJa7D�T�׀RD;d,}	�Ҫ�ԠTv����f������I��v�P���]گJy:8�
	D!P}B
c��!y��!j@H�`ad��Y���)
c�	��'b��w!�!y��!j@��H�.���IDp`��U�Y�>)�;�؀�B��'�O��\(�� ڠ?�*f,��Ҫ�9�(�U��(K��tq�
�LR�܆�18^�C����ɀ����v��@|Lb��` >1� �j0�816Z�h��LMͣ�7ո�<<^kCPT�����j0���)�:U�o�z��7B��x���,4N6����(�D�h�.A-�%�DkЈ��K7��joJ~�������Y�_�/EI��@P�F ��ׯ��'+�G�'�BKL����ںj�    ظ�>�6g2 �X��y�y����L�` ���0�)T*�V)&�Y^D�a,S,n��l~�X�X0 ���tn�����U�Ig �g��*4�~#Z��kၽڂ��9g�b���Ms�ث�D�R�`κ{�	��l�Z�8 �6�P�+�:�_�*B����+�EV2��C�f%�]�gҒ��K �[��CB��<~A����!P}B
u�b��!�:w�B
��b�	��'y��!j@H^�.F��(t�Iڢ'�a��	��'�Bw���Ҩ��U`ӧD��%�,mП�zw�U���E��BD[Њ舌�v^i�~t�y���b~q����A�m��t��$�.�����+y]���	A���S���u�c��!b��������~�R���z�:D�T}��+I����t�W�Ԁ&�������d	�:!�/$!��m�b�e$6 E��:�P�b�U$�6�N�@����(!YC�h}VT�:��D�ں5]��4j>�3�M��|A��*͑�ig��)_�.��5~k�<���*#�+yq��|�@�4�:wYQ��J8����b� �!yq�! jAH^�.F�Z�(N ��� �M�M ��6)Ԧ�����b� �!��tю�:�Bi��m��I�4]tl@��J��8!XJ�Q�.�݉��� ؂�!�bl����u16`E���,�A����t��Ҫ�`� O��ڼI��%�1Ĝ7xe�����
TL���X�M��������x��&�!j@Hn"�B���&�!j@H�D ���@������)V���B���&�!j@H�D�Hڠ#�M�ۄ@n��� :6@`R
&�'k@I�D�Nڠ;���� �+A���gEU�E,@�+jˁ$b�Xm�q 	b�hJ�&�<K����o�kѾ�>�C�)r��XKٓ�5@p��M�����ܵ��ǉR����D��a��N���T��HaDB��j@P}>��?>�A��3���U�C����3@���@Ѐ�������g@P}>D�`|8���r�P��C�Vˀ����2 X����ψ�� X�'Q�Aks�R�&� ��HQ�A� ��(S� ��HQ�A��V�z �ͯ��&���,��/������s��?w~IP�mڤi3De�5e�h�,���u]fmQ����O�岢��0 ք����a-!�4+˴h�x\�r��"$?77BA�
���@HB�ss#��!�ssc#���z���1��6ɏ͍B�����F!HB���:�5�H�Ss#�	AZ�&�Sscc�� �pjn�5�D2��݉�c8>.bMXQb|`Ě��4����5aE%Ƈf@�	+ʢ0>6bMXQ�A���)�<m�r/u",�z�+��Ҫ��)�~��_v��WUY�h2�Ĝ0t޶U�yM懱6r�	�Y�Ps�����|�	��m���'�I�-�HڍI����G��!b�uB����~|�	�Z�fzI�	C[�T�`t�	�Z�&"n0>�@-q��Q'jA��HbNڠ#Q�G���m��2�ūbc� E�A�	�ZP�������NT�@s���(!�9ahV���Ĝ0�+ʹ �9ahVTBs����X� ���:��۫�,Z��P%�(lBk[�#8x�Ҍ Z�������+:���!.��KFk��Gh+�Wv��*m����<��6��cR�ؼ8<��XO�k�:��L��!��J,V�#�0�	+��a!���z=ZT�i�(h#��#i�H��1�A�0�oc�0B��Ȫ��#� �bt�U5d�#�	A��'�f�#i�H��1�A�0����K֤/ɷ4F��4�O�c��5a���1B
��p����Q֤Gilm������R��� ք����+k�Jcwc��5a���1�
����� �6�P�E�AmA+�-���VNڂS}Sˤ��j��\[�v����p�3�BH 8+����ͻ��-#cl B�~��2LF��E�//�:�$���-x�͌1�a�̥E�6��iy����,Nr?c��5�$�4F9!XNrWc��5�al���b��[��
���+��1�	��p����	'�c�Oah�>EU_!�Ž"�/J� ڄ���1J��Ұ;�{���Y��8/m�K��煡-xi��0�/�c����a|�������^i�ɨ⌒P)6�U��2$�ȌB��@��+��=p��㌪3)���`��nۑ��/6ᄞI��N��&�ۺ���i�h�A�}At��_&5mݖm�*���$���<,���)j�E�>0yQ�F��&�Q#�BX�\��vM+SĤDM.㣾ւ!eA_k@�*C)��BXJT�D��cY�r|��Z�*"V"��BXJ��|!�%*B"���h�E�	A��Z�**8"	��hZ���{1�)*#	��h�nE֧��zA�	/JWHB� ڄ�+$�^mJ�HB� ڄ����zA�	/*f!	��h�XY��t�4�@�@�İA�	/*H!���h^m��GIAhR]�K$t\'���~�q����S�B�n}Ψ��p+�Wv���UP�NI�C[���MH�� �rk�F��f�}I�D��"����k���UleǢD�����Ԅ! Ƈ�!�	%b����&����$x�-��v���5��UT����kjB�����ԄC��A�I�"����55�UT�B��&�-!�^cXRT�B��&݊�pJ�� ڄ�+$�km���_)
^�h^T�B��&��T�$x�MxQ1I�CDbȢ��p6��`E�)$�lm��
YHB�ڂ���$�l��n@	=c�I��owָ����
���P�;Ƈ�A��+?~.�7��ʗ��6�5aE%,$�m]V.[��;Y�(M �l�hZ�$Ķ!l�7���ت�E���c�ւ!�mkA�P��6���D�$�mm1DPц�mkq�=!mCXJT�KAh�ZP����6�6�OT�KAd�Z�)*!�k�hZ����1�)*�!	k�h�^EmٔD�A�-JSH�� ڂ�)$1mmA�J`HB� ڀYAS����H���6�����%4��A�	+*u1>�bMXQ���mkJ]��i�XV[�j�ap��f�"�~0nW�i��C\6ZS2\�T�KQXE�E]4�Ye���z��T�$0��xQ/%�y��<3��*�,c�E��1� ؄!Ƈ�����EUWi��_[��Q`td��0"&��yj������	#*� ʃ`�၊*��#P�Eȉ�Qyj��ԀQN���D�A�Agʩ���c���FQ^A@��"�  aM8Q�5�xlҥ�� �MhQjB��&�(5!ǃ`ZT�B��&��� �-hQ&Ey�wɩ2���<���E�)�($�J3*I�����T�Q^ڂ�Jb"�C[�&������tE�&�+�V�Z�ݼ�+��,c�F']1|�@t���
-�lE��6�EՆ�Pt�a��䥒����������6����+s&%y�"F	��P�',b��	%y�"F	��PRIYD�m1F�s�[�@Mn�<i��@M(ɳ1JԂR����v(mС�ʒ���Vi$.��6��������&�TR�n��-��J�"�C[�RI^Dyah^*ً(/m�K%}兡�y�,bU�\�I�dMI.E<xTMQ.DĔ�J��T
���%��l��-h�fb� �-��L��������т���jW��
��������^i�~������+�?̢���J1ܚ��碊^JrC ؋Ҵl�t�[w�\d-��$7�Mh�T���.���m,^*�b�0�	/y}�X�®?���ENX������	'y��('k�I^�*�	��pR    �q' ��8!/r�W��^ɫ\E9!XNT�LA�pR�s�SڢOQ%3Y"kr�4*]�G
m�K��U�6a�R�*ڳ �I�R)v��Mx�T����&�T�]EyAh^*���� �/���(��Mx�T��e �EP���)I��`ZTC�\�&���]�Wk�(� 
A[���$A�Mn���QZ؄u�� A�MhQ{R	"lBkۡ⒤��Ԁg��o^|z.o��u�)�� k��E[���`�u���P��|I�D��������E�����6�E�,$�/��*j&/*� �|�h^�� ��38br�d����5�Dh A�p"�
�����D��e�@��8A������&������5�D�
A�p�v�H2_ ڤO�B����&���XH2_ ڄ�)$�/l�WH2_ ڤgQ�
I�D�*�ʚ���6�E�I�D��ܖ���6�E�#$�/m�^HR_ � *SPu6E�/m�cH�_ ڄ�6D	1��-�J����6�]��IFD[�"kmJRb ڄe����Ѝ��"r��Q����&���@Rj~|+��/߫�?%�Rc$�
�d�$Q���?�
-J He(:����P�@�C�*D�$�$����1���E�$�0m��� �d����b�!'����d�5�D���d�5�D��0k
1HRa(�`���k
�a��^�A���&�!!H�AXNԶI*E[�)BS�a��^Q)I*D[�lJra؂ur:�|歶��T�PQNEd�PINE[�d�$���-xQ2I��C��(�$���-xQ�INE[��0���ֈ'QeBEI<�B�J�H�v(Z�U?S����d�~�$M��U���D��C�*D��&�D�V!B�3$�7fAa*`"ɶ12"�N$�3r�+�F+��1������Ŧ*\�\ۚ]䬾uP�$A��׾"����TJ_��t���X��e�K'�Q)o� :�־�r��K��e��6�P�2����`<f��P�2�	��pR(o�`M8)���qB�&�T�[F�	m2N(����+kr��[�8!XN�-c��	'���>�-��Fy�ؽB�&�J��et���&�4�[�hA`V*�-�=B��,��Q^ڄ�Jy�(/m�K��e��6�R�2�B[��)o��Mx���,yY8�0�NA˒��3!�R²�e�L���Vn��bh�,U�o���@��`e���<b����_n@��F/ w���y�����we�ɝ��A��a��L
`*jk�����|^�"��������:'���l�!yI~	W����V{-�|��`E��%�&=g��s~m�s�hQ;�$�'mA��$�'�`�� �$-��d���P�/b�(H>A�>�X8�ŉJg�O>AXNT�BA�	p"�����5�D%�%�'m0NPu�'kr�������5�D�
A�	p��В����S��$� �ɽ�BВ��6�Eh
I�	�rd�BI�	E��,G�+���P�/J]HRO(ڂ�.$�'m���%'I=�h^T�[�zB����$���2�*W(�K�hZԖ9I�
D[Т�t�$��:�V�$o�-X�l��>����*���� �-��vQZڂ�ʶ�(-mAKe^����EhI2[��1���O��V�Z��VI�Z?Qȕ�����*V(IƂ��S��wVd�BA.�u�>~o6;�Z��bQ�-JHr� :-�	�������X�$�Mx*@�������1���2I���BXN��/��BXND�A����&��L�$�M�	�L?>a-�U�P����&�Y!��BXNT�B���}���'��BX�{E�.$�Xm��d,6aEy$$�Xmҳ(ߥ$�MxQ�B���&�(u!�łh^T1@Q.D���\,�6�EE/�Xl�!K
r�(؂���bQ�-*�!HƂ`�0n�� /�c�-XQ	A.[<��GB��E���-�\,
6�E�/�bQ�-BdHr�(؂�1$�Xl0R�%)Zl�*�0��i4��Ҫ�AJ ��:)B��+�2L���^Q�h�ë�:��$Ō�UxP��$���
=�`B��<2�VbBM��1���@9<���L1�V�ALނ�0��EGY�h��\0�U�@�˂�/�U�@���^��� ��h�~Me��r!�ʽ �oA�ªp fnA�ªp�����,���TA>A.�j����(�
�Uxs�$Պ�UXPnCIfD��� ɤ�h��-ɜ�h��-ɔ�hT~_��*<�|�$
�UxP�oI�D���#E�N�Ą�` Ip�h%&T�\��D�qC�Ң ���UxPywI�D+=Y�NI�D+1�jH�� Z�	]�$$A���?ID+1�v
Ҏ(Xc��!J�(X��$Q�
���>ϯ�II��z-s8�Q����(�y���kV,�Z�ձY���_�v�[����P1/)
�>k����[l�d��a^N|�j�D�W�XDW�,�
���^mB���)Q��=�Ec�
%U5��E^kB��v	Q�&��4#��ք�$C�Wt钬�gC�ך�	ʩ�'C�ךP �kF.y�	*�I�b�6��L�Ȅ"�5�TB���^mA�*��I�B/6!A%�9IP�������ʁb�6�A�ٜ(�jԜ�ɀb�6�A��9	P��&4�l6'���ڄ���?���ʌr����-�P�l^�|��v/�	�� >XR��x�O��&D(O9/�	���Ѣ�����-�P�l^�|�*��K}��� B��e>��[����'�r�Q��d�R���M�P�lV�|��v+%
�܄��~�,*�J3�i�m⿺^�6@F8;�*FkTN�\']4i[>~oTx���;<ƣ`��^|/�'&+��|c�0�+��|#+m�����^/ә�4�����'�F��tm�Ȇ�LB�c|c��>!����D25 $?�7F��8�7:2``���*7>�An����!j@H~jo�5 �qdo�#a`��$?�7v���m�8�7:6@`R
G��8AX}JT]8IR�w'�,�$Ǎ�Xi��e��Xi��e��Xi��e��Xi��e��X�����``�U��5���葵��lpgT�1VX�U�Nd �� U�N� �&�T\��<�*��+l�J�c��X��b�0�+gB�6`�bS����dTq-DyAh^*&�(/m����'2)�h^2��VRڄ��� �2��UDV�~�n���c�
���*Y'�
��-V�E*x0i�8"� �	-��`�7U�rY�U[Ǣ,Z:^�aZ؄���`0L!����)��!HFT�ўi�H�o0�A�0�1D�l1<P��F� �ɍR�3B�&�<Ì�	#�A�3A`�Τ�:�Q��F��"�5a��;&A-8Qe�$�lѥ��{� 6��c=�Ђ�&�t�Z؄��� B���qDhA`Z:��H�[�]��"W�6�Q�%�lr�tL	Z؀VEU�
P��SXQeE�m�KǕy!��c�cK�Ђ�&�t|	Z؄��1!B���q&���&�T�	ѡC[�*ք(/m�KŚ兡xQ%E�m�������`�&��w׭p�W��k�h��f�s\���04�W��
w�²��Z��٣��­ ^��]ZWYZ��_Au�*V,���輪˺�ZA�,�}a�Ia�B�	�vi��`XY�U�v�UQ�9A�����s��3��~T��0a��p��ɋ*},1��h^TE���Vy�e~Q4E��m5��ar�No=��&��؂�|aM8���p���	��'���x
�5�WTLa�p"d���aM8Q��	E[�)BS�(��^QuEFm�/
6aEY#$^mг�*�"3
���E��E[�ԅĎ��-xQ�K�E[��oH)(ڂ��8RP�~P��)2��h�� U:R�HA����* )r��hZ��    R@��SH��R@�	/� !q��h�ǐ2HH)(ڀ�&�8RP�-*M"q��hZ�?B�HA��(�!1��h����4)2��h^�=BbH�&�(�!1��h^�ԐR@�	��� �,�HahRAh ���ȫ�&wM� ��7bq)Fk} 2���"D1��)��^i���
����i�&�3i[Ů��
E�+8k�,��oe]�HD �XQ;5�l��*)����Z'��xQB%�m��
�-����0���2�.��rX��]�+ք�W �	'"� 0�@XNT�Cb[�&���o\��&���<�7�@XN��W �'�X�ȶ�-�T�X$���W��^Q6
�mD��"4�ķ��MXQ&
�mD��,�D!���h^����V@�	/J]Hl+ ڄeה�V@�	/j�Ķ�-xQ1%�l���b�\+(� .H�Ɣ�V0��ݢ��
6aE�ǔxVP��3Hm5�xVP�/�C!�``����P,+؄�8V0�	+*?"0�``VT�L�_����Į��FA�^�Ȯ��-xQ�	�]E[�T�Į��-xQ*CbWA��('�ı��-xEt��ă�\�WZYI�ꘈa�H\�k
?|���y\Ol5씜�R@d��E]6i�e��Y����WMV��Xn@t����^�7y�W����E�ڴ!�ܠ`� :��ܹ�J��9,ZT�A�A���x��s��s?�fu����^�Eby,^TnC�A��- p�@X�yQ�<N�,��bQ���M7V�R����A��2a��B?>4m݆c�F��:�
��!�&���x∐��>a-(Q9�wE�wT=N�{��*��x����D�#�w�ZP�*gH�C(ڢC�H`�����{H|C ڂ��$�!lA��zH\C(ڢ[Q^�kE[�t��5��xQ�>E�!m��ک"q�h^��T�B������6���JT�O�mD�6��p@x�Uؙ*�)�>�`�'�2w�O(؂�KE�}����!�>�hZT�O��	<�T�O��	[ТR:�
��EI
��	[Т$�����-hQ���	D[��TIq��	D[Т�lH�O ڂ�2$�'mA�R��6�EU�9�@���� mS[M>�b����D�T.qA�6�oE��l�RY�hu��
����Ӫ.��������pQ��^�h^*ǖ�K���k��(��dÝ��J�в����MU�����a>Vg��YAhV*G�E�� �jj7����n�`���K�Ȳ/m��*�9��A�Z�~�����~�2)Xa�@-)Wa�@-)Va�@-�U ����pTY�N!P�;�pPY��`�pLY��`�rHY�7Ah�ޤpHY�N!P�;EU�8�@�+��"� �'��ɢ}
B[�)�V����Mx�O��Mx�O��Mx�O��Mx�O��MxiO��@h��U�Sb{B��@�~��	���T�N�
D�?�TO�
D��*^|P(ؠgQ��
���NJlP ��	�� �6`E�A$&(m��R�6`E��
D볢jvJP(X$kv
�O(؀UOK`B��(m!p?�`V����P�+j������XE��8]^ah��UW�1N���
�����?H�� o��*FH�P :���yTgY���Ef�R)���h�e6n(�VY��:��"m��9�LZ*��5�]��,�ٕ�R)�a�a-X��Պ�NQt�^�T�~���H��K��V����PWk8�A��k�6�OoG.r���B]�%jBI�U�5��P�*B	��PR�E#0���P;Ǜ� ���j�b��]QԄ�B-�%jBI�U�Cah��P�*r��ɭR�E% �	-�ZTVք�J-�h����J�U����R�*�C�"k\J|Q(ڂ�J-�(/m�K�U����R�*�������*x)1F�`�``C��@�~趡�^
|Q(��T)Na�a-X�Ԧ��,lҳTjS�hA`ZT�K�3
�<�T�K�3
�Z�R�La�a-X����°�T�R���T�R�Al2����т�&�T�R�hA`Z*e�b� �	-��T1Z؂U�R��&��!�H�h��V����4����WZ�?�	�V%᫨�?���-��q
��s�[���SJ^(8l���?aESg*�������XQ@b�B�Y��m���I��T,^T�Ab�B���GjyL��xQ�1$&/m��:�\b�B�kOaݜ��E����P�/B|^vɦ#ˀ�(Qq��>/k@�2|^ր%.���0�%�&!1y�h�1�*$1��an[��°�E!�yaXmJyN�/���k'�b�g�^�İ���^����a�{U�S�XC��]$���`R��TbXC�݊ڒ"1��h^�F��P�/J#Ik(ڂe'��P�/�N*1��h^T�EbYC�q%���ȳ���TaO�g�G��Ҟp�x���!�ݡh��D��E[���� �Ď�{��-xQ���E[<�TbG�C��(a!q�h^T%O�E[�6�J\x(ڂUoKb�C��!Y�S��C��('�Ĉ��-xQzC��C��(�!��h^��y�P�/�Ԇ�����W_�����o%�O�+�x��!ɯx�����m���>w�V��Pq�=gU[�ef�&��ThQ��?�Тāğ�����C���u�����ŤE�"$�<]�e�Y޴�K�u��LZT�o�;D[Т��s�.k�����C7��̙���Ĝ�Mx�`�=�feل<fꊢ�#�M����hw5`D�o΃��(a1ڛA-Q�1$�<m1>P�<�[� �ŝ�b��yԂ!%�� �:�<'O׀"�k�>a�飊��\y �dd ��x_��G��C`���}� �_@��H�@ѱ�Tf��C;����?r-YXU�-��CKUWyA�	/J�I�� ڄ%�$�Bmr�J�� ڄ吕xA�	/*|$��h��XK�[Y1�Ah��ʭJ�� � ��R�V%vClA�*�*��h��E�Z�A�-��"1bh�!���*�bhZT�Jb5�!���8A�-�-�QZڂ�J�,JB[Тj�Il� ڂUM�2��#!n�1�	-�)+�bhZ�ʐX1�	-JeH�ڄUEb0��&��bk�!�XoQW%&ClB+�2�Kԗ�Ҍ@���2����cWxxʰd��!.���j�-UUd�D�yQ�+�5x�5Q%>Im���$
.�r�{lfѢ�	|�(���n�{Ld�hQt>IlA�
7H|�(�9��=�g���$���EH��VI�6M����%�Y��X�h�$�`D��[%!�#JZ��JBPFd�U�OE�T���VIjq����h�$�`DH��VIj��2GH��(ڢ7*b���Z�)�C*0�`V����0�'�C*��h�>EU&�X�P�/�2)^i� K�Jl�(���PfK��E[�̖[!���E�	��E[�\[!
6"Q�H%�Blɤ���|�(�b��̖c!���E��Q�A�j�J��(؂��Q���A�"�Q�-*�!0�`���J��(؂�3�BlA�r[
��(؂��C`,D��(���X��-FB�m)0�`ZTaR��[ТT��X��-hQ*C`,D���!1�`Z��R�,D�.�(��Z��-xEthL�J
C[�
*1+���z��t�$Ȭ�RFk���n�Ӻ-�2mʴ����E9%$vCm�����o��6-�6�\����,ZԖO��E���b�W�^�WmtK�eQ�/*!1��,ϛ���[/��TI�xQ	��E[�"�x�!̓_���p@A�+E��,JTb���ZP"�]�Ԃ�/F�1�%�8!1�h�1"�))�E�VK��}-U`u���<vT���&J�N)���bU��/7*���kѲ�[��0�p]���{К������Ď7�bP��2�Hl�(�@Qeb�;A1�ŭ�v���(؂!�VPkA��7/q��h�nE�c    %NPm��� Iܡ Z?���d�R�;E��ה,P*q��h^�gV�E��(�!q��h^��EbE��!?ϋ:�N���gO���!���h�a�2�J� ڄuЮ���-�e��DQ�/�F��!
���F��!
�-hQ�*�CE[<�T�JbE��(�!�h^�qVbE���:�(���EYg%6Qm1R)�MD[Т���(�6�E*��DA�-JjHl� ڂuf��&
�-hQ�Y�KD[���J��(�6�Eyg%FQm�k�w���4# �dK����7ugZ,��ɖ�5*>��uB�E�����R��Fyah^T�R���k_ulva����� @t��[?�x��dc� �	/��p�D�f���%9X�t|�^ڄ��Ov�<�`�Z�*b�%�l��5��ᓍP�&�4|�J ք��O66F@h�1�,Y:� �`-nU�T`E�&�4��J ք��13֡ �I��0fFn�5�U:���(��Mh�3#��	)cf�[Ah�n�č��&�T��ѐ�6YP�KE�Jmq��b�k%�6�č��&�t��1^ڄ��13c��1&����Z��B�T1S��E[�*��(/m�Kǘ�^ڤ{�3c� �/����Z�������Z��-h�3cO!�6y
u��1^ڄ��13�B���1f�xAh^:��/m�KŘ1��p�b̌����T��1Z؀Y�T`�D��T��1Z؂��13B[�R1fF�]�`�E5�X+Q�/cf����E�5$�Km�k�)�Ix���2K�S��k��ժD��B�A�i����n����\mV��Eu�Wi�8�U�Td{�СB��m�HM�BPq�I��"&~��C�𢪙K|�(:����u۔~������ �����W�VN��r��E$�Wm��
2H|�(ڭu�j0��E�*�h^D�a����G����)Y>h
�R�����Ԅ�(�;_!�%���x�+5�D�%$�Wm0FP�2�;_!�ɭ"d�x�+5�D(���WjB��bJ|�(ڢCbb�����*ʉ)�`Z��_1�	)jw�������UF�ǔ�^Q�/*f!�bh��EF�ǔ�^Q����\��+���E���^Q�/JfH|�(ڂ�}T�{E��1����)2��h�XgF��_1��8O���_1�	/�>������U Sd|E����������B�����-xQ9��E[<�T�Db}E��(�!���h^��Y_Q�/�S�b�@�/ʊ)�h��,�)1��h^�S�~E��(�!���h^�ސ�_Q�/ʎ)1��h^�Sb���&�X�L�}6�A�𢶙J�چߐ`1���� ���HAhR]N�R�'�;����\5x��Fk
���Q�3EFY��UنDq���-j���'��˴��\�ߥF�ȳâE�א�dQ�-B�\� �����QY�i���,ZT8Bb��+�*K�SY�xQ��ID����,�μnhku�P��X���W�,���E�#>Y[TM��*wY�"'����(�a-8C��Ű�(�1�*�a-8Q�
�QE�T-M�W�Z�+���x�,���D�
�[�Zp���,���S���e1�Ž���,�6�Eє�eA�+jS��.��zYBSb�E���؅�.���cTM�[E[�.ʻ)qˢh^�~S�[E[𢄆�-��-xQ�N%nYml�Jh�ܲ � �IU��eQ��(OU�yeQ�-����*�-:YASb��&��D��*�-*�!qʂhZT�Db��&O!�'�eA�	/JjH�� ڄU�[b������,�6�E�6%FYm0R54E>YmA�2mJl� ڂ%5$.YmA����
x����*�)���h�;C�3%6_mA��fJ\�(Z�H���|Q�>-�:��㋢hQ���EЊ(
���89�؃���^��oB��< {pu���P��_�6��\��qC`�E�i[���äE��|Q�-�,������*[��+&-*� 1���*d@�P!��E+q�
h��� �h��gҘ�(Ä���Mxq������as���o兰&�-!��BXN��o兰&�(�����M�	�!1��aM�Uib��p�N�o兰�r�������TNU�Xy!�ɽ��#/�6�Eh
�������#/�6�Y��Rb��&����ȋ��c9U:Sd��&���;*1�h^�^��D[�Jg��� ڄU:Sb�E�:��,�)0�`�xfNU˔�wQ���N˔�wQ�-�8�ļ���:e��vQ�*�!0�`���
TL�(؂����tQ�ғGU�sQ�J.H̸(Z��ICb�E�Z\(���t����PI��iTQK��[Т\��-
��E���[�"��|�|Gy��%Ϻ�[��n�kR`�E��(פ�|��V~dmL��[Т��-
��E��[lA�ڇ!�ߢ`Z�1w$��]��V3TW��$|U!������}��[��Y�h%$b��&��H�,z�Y���1�n���N����u�G��])r�hZ�vL��E����yβk�X�7,^T\�� F]?ʝ:�l�f��8���:�Q��t.��EWi�\�k8�P���h�8�Q�/"� �c؇A��.d.c�'���x1���D�	���Zp���x1�5�D��9�Q��8A��!ư���2��cXN����i;�$9r�n�>���2F���d�5f��o��b;A?�w�����Ѥ33 ~�8C��D&uJ�9AL��wJ�)�3ČM�W�� �t"��S8G�!�H�H:'�)��f���	bJr)A%^��Z>�2J�4��,JFi��t������t"��S8��)�ȥ�)�CДN�R�${AS"�F���)hJ�d���:��Ю�)�cА�R��SД|��t��4%YԪ�s�ҁ�A�&�sДN�R;��)���#^��NJ�#eƳNvR:�K��:G;)�ȥ�@�l'����s������h�:�I��ۥ9��NJ'r��s�ҁ�R�Y�;!���n��㝐N�R�U��NHb)�u�҉X��<�����_�^�=r\t�(����RǼ�ߏZ�^�>w�570|BxHu��8�I���?��W,50xR8K˜��>���5��ʥ��9�=)ݺ#�
�<��IOJ	�����NJ�gkmLt�Z��9�I�D.��`�D��1�l�v芤Ό??ۉ�D$1i0�v"6IM ���Dl"�ڔu�uR:1F��^�v"6�V�����:���zhϏu"6I��r�tR:��R<�x���e��go�t��R����M�N�R����M�N�R����M�N�R:<���$�ʅg�m�t`9bU^<�l��ڙ0�6Q8K-U8�(=��Dr�a H'�NJ*g�t$�*�;�(=䃧�D1�b+��QWV&Sla�� ��43)��0zHu��4�� �DIe��r��b��sZ҉\�g���t$��$8�� �%&	�i9�O_��(�"6�z��pV�҉Xb��|������/�K&�z���t"�Z�7z�2�qͶ.J�N\��e�9�H�!���J�+A�2�	�p"��l+����f[���5�6ۈ�D,1�p�Cxĕ�%��y0���9��9�|�+}���K��/嚏N=�?�W����sp���|S	��빔����f�[��y��c��y������hg.uYw.C:�Km 8�)]&�e�\���}}?�̥6�.�_��i����zos�z�8�Dm t\��	�6��˔�ι����ze�|{�ٙK�8�)��%��]f�\�)�Tn��s��~���IU]fh"��5<?���@$�v{~t���H�؟sp�ҁ1B��]fh�Rr��G���$�Ϗ.34I���˔N|����9���m��Y'�)�x��6�9�L�D.U+pN.S:�K�ެ�˔N�Rڷ�����w����\�t`=B9߬�ːN���f�]�t$�Z��:�=�R��    ޱ�	��;:��)���G�6��Tw��6���O)�a�_�Q���C���#A����6��H���u�z$��:��)Ĕ��:�M�D.U/taS:�KM�CؔN�R�{Na��P��称X�T�C�6���T�8��D(�[���t`�G��3ؔN�R�=���o=�Kħ��o��ɂs��ҁ��R#Z��)�ȥd�)rH'��8�:F�@�M��s䐎�Rg&��䐎�R}J�$9�#��w��(9���W��eM��пE ���P��`���ׯ��_�Z���/��=����F�� ���������g�gq�7��S6�J]���.W�e��~���\�B���t ��Z��)=-�h���֚pv�R��yJo߾`[kU�+��gp�S:�K�#�������j�t�R6�,=����q��_����IJx~���Hb�a��Gl"��^<?M��D$u��9J����]���x�����az�&"�u�����������N|�ԩF� =�7 J�h��t��RL�=��Ti�9F�D,ՙpN�C:K�wt��S:p�(m�ΙzJ-���:SO���l�֙zJ'r�E�=��/%xpN�S:�K�tN�S:1n��Ή{J'r�E:�)��*�s�҉\j��ϧt �CZ��)�ȥ4����N�R�M��>��RCZ��)�ȥ���}J'r���sx�҉\�������]h�"�� ��P��B7����t"��g8���4��a~H֠���:��D,�q��h?eC�RT��)�H���qJ.�J_i��t"�2N9��)X.T�J�?��ԡ�?��ԙO�?�����:�O�D.1�0��S6p�j	-yy����Hu�A��G�s���,��s-�U�O�[G�A�(�� ��r�Y嵾��!�T��)	@:�KM�� ��{��s�����ȍ�Xjv�t(��\RNE �宷sӶ���IjW.���T(]���V��ǲ[�ɧ}���ҪP:�KB�� ���:��־,��[�]��@¨P8K,D</	0����xXcg$u��qI���Hb��$��D$5�x\`h"�:�iT(�"���� C�z��� C����yI���HjGèP8�}RK�"@����g�4(�x�T��hP8K�A�� ��T�hP8K��t��+*����tb�B�.�� ���Jxi(��V,�~ ��.弴��N�R�3�~ ���r^Z� HGr��i8� J'>��d��(�ȥfN?�҉\���(�ȥV3�~ ���ڕ��@:0�ʍi� ɥ� N? ґ\j��� ɥ�c8H�-쓘o<�0t�R�.=�� ���ۢ�G�����5����Y�tק�����}��]q���zu�Eb�dT6 ���(��ؠ��5�]	E������R�����|�Vkґ\jr�6 ��)���ڀt$��8�J_�ݕU�*mP:K�Uu:��RE��A�@,1Ӱ�KF������f����
��H�:� ���c�ߓ�նmk���^a��케�+G�Uڠ����9$�Z:qJ�N�R�����.�˩�o������b�فQڀp$�z�Sڠt�~����/�9jW.�Q�6 ]��o��64�r�*�Sڀt"�҄Z�J�2����Rc-�+�:���6(��%�"��b������/�U��LJ�����H&1�0���dR3����F2�S�Nw�҉qB��<�o 6�^�#�����dR���MdR*P��A��wJ�@����"�j8(�x�T��ipP:�K�Z�
��T���pP:�K�5u:�N�:*���t`	C	A��#ü*�'b)%���t�ۥ��V�ґ\ꤩ��t`�PZP��A�D.uF��p@:�9T����H.5�p:���R����H.���t8 ɥ�-N��ҁ�P�A���T���pP:�K�7�������A��1e5j�M,�J˨S�t�R�'N�ґ�K�5�>�#����CP:���,�V!�ҁ\�2j"(5�e�*DP:�K�4�B�3��
�N�R5��Ă��:�Gb�s�F!X�%b" �%�N!X괆S��t��%�N'�҉\�����X X	9���g����}?�e���\?���Ռ����{������i�bt ֐BHc�����;si�4s1:�kL%��L����mԖ;s��4�((}|���Gg�!��f.Fr)U�U����_O��5����D����z#c����Zeg���V&�&2���2!6�i@%��	��Lc*!�q�щqb@%��^!6�^���2!6�i@%��	��3�j�:(=�;u(o�����{�Cy3�V��טG��r1:�k�3AZ���5� �\�N��T��#���;�Bi�:(=~�P"J��A��8�L�V��҉\C���~1z��k����?ʟ���v���_g��o��K˵�ݷ��_��M���1s�աt�V7�ҁ�O�4�n
�c��iZ�J'ry�I�s����pȳM����5��&�\�N��l�f.F'ry�I+���S��P:0����͖V.F'ry�I3���<ۤ��щ\C�m�<�����1��4�)�,�*9�UM�t���^	�o׈g��b18�j�CBZk���*5��L�t"אǄ4F�4�ҌUL�t ֐��4g��2����P:�k�CB�+����*Q��L�t"אǄ4s1:�k�sB����5�A!�\��R�N��B��/�촺)��jL6`�寙�Tg��2�?[]�vy��w������լ=�F�� �Y�B�u>�{]�-�2Wg��;a4n |^�tLw�wخy[��錥V���#��L�i�P�LT��$�y��r�ָ��X�NEm�����Ye����Rꔇ(=�-Z���C�.�r���yڦy���\��t�(���q�O�1Ogk�+�:��T�(��΅8�!H��9���t�������K�u�C�N��#�9���<���5�&���ܕH]����H$&JFk��Dj���3��@"e�r�B�NjS�ya���()�|^Bl �Zy^Bl �z��S�t�ˤ\����^'nx��Ӫ?Qz�ݔ�}Z�'H'>���㔟 ����z8�'H'b�i�S}�t"�rn8�'J���U�O�����R}Z�'J�����=Q:KI7���_.��1D�@,1Ͱ
C���b�a� ɥ�+Na�ҁ��j�8}!Jb���S���XJ�i��(���+NY�ҁX���t� �
�G��
A:�K5e���#��T��
A:�K$1�BN��)���B��u]�u�B��Qj��i
Az�����NQ���L�괄 XNS�P�$�D,�)7:BNJ �t� ��fNG҉م�Z!HGr�3NG���W?�JԪQ:K�˜����:�P�*Q:K�p�A��R�X�����T�T��H��<��\�Ȅ�H�:� ����~u^kb��y���rюx��ڒ��Z>��I���z�^����P^���w#&*V�	�e�6���:�u�Y�����KLT���{9�y-C౬w��K-�8&Jb���Q`��O�-˹M�N�u��%�F�Xj��)�Pz?��X��8W=Hݸ��ʥJ(F���|�kE�ry�kk'�+�:�a�~(����v�
�|M�"�kPl�_u�R'H�����<�q퇑��y���h�Z�J��t<��02�HL.�~�H��Ok?�$RR��C������k?�L�Q�����#�Ԋ���#��a���_&1��Z?�����N��))5J?N|U	�(�P8K�0J?Ē�Q��C�D,e�0J?��*ݨU��t`F�F���#�ԍ�
'b)g�Q��p�˥�b�~(����0�~(�3�S����T	�(�P8�1T�Q��C�D,5�0J?N�R;"F�X��b�~(���*(N�ҁ�P�L����T��)�P:�KM5��������C���j� ��������rZ�J�����_��:��D�Fq�����t=n.A4�Im��%
����).Q8    K�Y���C�:��4�(��-���3$e���K��R�O��D��
���:�%
'b)E�Q\�p"��1�KN�R�V��D�D,����D��W.e��K��j�3:jO�L�d��R{Z?꟫�n?���%��7~����h���U��|ݼ��y��^�����j;Q:K�N�����6�g��\����ǿ3��e'
'b�Y��v��~�G�\�].�󵾿^v�R�$���#���Sw�t�2�աm_��K����3�:%�ԝ ����^�_SI]U"o��:s�V��w�t$�Ru:�'J���]��{�❹�yL��D�@.%�4ZO�]�������u�����rg&uH�y�	��Lb�a4�ɤ�ϻO��dR�N��҉qBmg<�?!6�^�s�P��dR�+P��dR�E��wJ-U(
���Ӫ@A:q�%��N�ҁ��t:%(J'r���:-(J'r�)�S��t"��y8=(H'n�����AQz�ʌTt:=(HG�y��t�P���RE�	��_�}R>�5�+\��s��_v�(��g�^;>���NX����Y�ۻ��^O�Y�/�k��Ǵ�X��\J6j5� �.e�]�>�]�6j�(��^N�ґO��x9�.HGr�9�S�t$���q:]���R����H.u��)uQ:0�������X�jU�(���N��ҁXꀉQ���e�K�B�Rb+՗r�:�.
'�*%�rj^�~ �R�P���ȧPL2���#��.�S����e�K�C�����A��zQ80*�����p"�Z�p�^�?wR.Q��E�@,u�թzA:�F})�����t$�R�:e/HGr�= ���H.e�p�^���s��E���KYE����S���X#���<��Ŷ�ן��W�����1��e���x5ʧaT�(\� �c�3�mH,1=p*`N�RUW�����{�����ʥ��N	ґ\jv���(]nl��Vr,[}LG�"�Kq:`��R{F�����J=��ԩ�Q������֕K�\�
���
ԩ�QzY�O�1�wmV6�úr�ӨN�҉\b�a��[��3[k��+�:T���@$1�0*`�DR���0�"�-��E����8��;��R�O����@$������@$Umq�_�|���)A:qǨ\�V����o����~Q:�1T(����ԣҜ�������~Q:�KU[�����J�t�(X��:P��E��ԁ:�/Jb�J����t�˥*!Ne�҉\JfT�(�4T�֨LQ8Ky�����B�s*S�N�RS�2E�@.��*S�N�R��2E�D.u^ӨLQ80*�S��p"�zb�Q��p"��j�)
'b��Ng
҉�5�5ZS����t�Vg
ґ�J�����'��m���ˠ4`N���IJ0��� �]8�/J<�e�i}Q:�K��tj_�N��4j�� ɥtF�	��:�/
'b���9�/J�_���Q��E�@,�Kⴾ(��vI�����L��|Q:K	-���.��J_���jL4z*c�P��������t��ՃXG�3���ϥ�׫��W#&V����S�8\���v~@,���Ծ =>֭��V���>��6�?����DW.uX�i}Q:�KM������������h}Q8K�k8�/H���;��\��Ծ(�}���5�ʥ��N�҉\��S������t�{��zXW.u`ө}Q:�KL6��Zs��z]���Hʩ�����D$1�x^�bh"��^<.~14I�q8�/J���|^�bh�R�%����v6�����N�҉/�Z�pj_��2*��S��p��J�3���C%дj_�N�R]S��E�D.5�pj_�N�R���E����rhZ�/H'�d�C��}Q81�+�����p"��8�/J'�]�����(ȥ�V�҉Q���쬍�r!:�Ki�����C�6u�_�N�R���E�D.�S�4�(�ȥ�N�҉\�ĦS��td<T s�_���RVN���D.���_���R�2����lJ�������:�2rZ�/J'�*e�v�_���RVN��D�!!kmt18����F*�&B�yYk)�с�P��t
a��R�N�F��/M�N!�҉\cB֚":1)T�N��H�!�!k�]38�v�t�N%�XCB֊��D�!� k�bp"֐G�5bA8k�Ț�.F.]J�iU�(�ȥ�N+�҉\��ƫ(��d�7C��/+'�ĕ[��ŭ������KG�|5��c�Ou��K�i�Q�v��8��RKF��X�̦�j��r|�q��N��3��F�D.��pjm���i����\�7�:���� �ȥ\�V���������N��R�szm����ˏ��ho.u���Q:�K��pzm����돷�z��T1ĩ�A:KL6�bb�$�돷�彑T��y���Hb�a�����ϋm�MDRN�ҁ!B�3�^bi�6�&"���kCl"��8�6H'�Oj���Q:pè4�xQ�fj�B)3�b�7�J�i� ��*��N/҉Xj"��� ����V+҉Xj��)�Q:p#���V)�ҁ%%ʹZy�N��ʚi�� ɥ�N-�҉�Z�pjy�N�Re��G�ĸ��N-�҉\�\���(=�s�NJ�i��(�ȥ�N-�҉\jCĩ�Q:�K=]̩�Q:�Ki8�Z����%�RY8�<J'r�r�Sˣt"��o8�<J'r���N-����	K.1�0�y��R�NJ�i��(x���ө�Qx�*o���:f��(����K�^�_.�_b��%&V-���BK,�+uZy�N�Rg<�R�㻚b8�<J'r)�Sʣt`J��V)�҉\�cN+�㗮K.%�vjy���R[(N/ґ\j�)�A:�K=x�i�A:�KuJ�f��/�級y�N�R���G�D��|���v7�������I�~��q|�ڍ{`��x�k�o�;^�Z�p�z�.�P����c������K-E8}=J'r)͕�׃�^�:�{��r�ݏ�h}ӻr�G�:}=HGr)���ףt��*���O�qLuv; �:����(�ȥ6=����y��{)��*G[w�]������Az.��t��{9�$��YڕK�p�z�N�RFM��G�c/��^˼����b�ǅ}=
'b�����C??z�-{k�+�j�>.�14�H�0���H����z$R�FW��A�D��x�ԙ��e=�)���C�'R�L��G���I�2���w�J�i��(X���L��G�����e:�=
'�^� �Qޣp"��Y�=
'b���Qޣp"�Z�p�{�N��+_�Uޣt`uI�2���c��eZ�=J'r�J�Sރt��u�U���H.U	q�{�N����(�ȥ*�Nyґϡ�nX�=HGr���Sރt$��q�{�N�NN���H.��r�{�����i��(�ȥ*�Ny�҉\j���(�ȥ�k:�=H'����y}���������A:�N���Uޣt`�W9:�������h�Qx��Ky:��d�����Q8�*e�Fw�X꼧�݃tb|W�N���H.%�p�{�������Q:�Ki����+�J�iu�(ȥ�Vw�҉\j���Q:�Ki�����T����A:q�RO���H.5�p�{������G���dK����H+�7c�Ă��r��Y�y���]�����x5j��) R�|Ω��9�r��~�Y96�"���H�"���Z�yiW]��t�) R:�K�t
��^�̎�[Y�NkyE�iNW.%�p
��N�R*�"��MZo�G�D����]�ԁ
��H���眗i��kom�v�R*�"��ԁ
��H��H�5���ֲeW.���H�@.%�|�BDh��.�Tn
�x��{��I���$f�{��DR��ED�F"�b��C�tb�P͐�UD�F�*��񸋈�H$up�q��H�idN�҉/�Z�p����4*���E�t`�B�4�."�7�ʦi�)�~)���F�t"��`8uDJ'r�	��G�t"�Z�p�����+���G�t`�I�4�>"��:;��)=<�~�q]Y��|����\�����Ϳ��?���r�whU�/�YI��H�,�V��҉\���4+)�e�jVR:�K̜�f%�    �C�(W�YI�D.5sr���N�R�>N��҉\J�4+)�ȥ�N��ҁ�PYF�f%��T��iVR:�K�7�f%��ԩS�YI��J�r�>/W"4����V��҉�J8u���,Z+�(>�	~3�A�f�z(���i�
���ģFC���P�\�4D)X�V�Q�"J�D.5�p*��\��vԪ�R:�K�\u*��Lm�xԪ�R:�Kg��(��$J=jUD)�ȥ6��(���zԩ�R:�K5e��(��TSƩ�R:p�R�Q�"J�D.5�p*��N���"J��=eK=
���D�:� ���㸿CV��̝?�sV�P�6
飾I�����:�QHb)W�U�ty'��l`]���)�R:�K=��)�R�������lO.�tqJ��N�R�P�4
��:�/?[��]�ԑ
�3J��Z��\Z[�]�ԑ
�3J����'�/��tl׵l����<������e�!@�>�گ�^�����֊l�'O�x��+��ļ�(�2v��/?[�=����(�26IL��,c��L�y���H���_)#���(�26�V���X�"�9�Q�el �z@��~�t���`��+�w��oj�_!X��zS��J��ͯқZ�WJ�^Joj�_)�ȥ�N��҉\j~�_)�ȥVa��+��0Joj�_!X4k�M;���a�щa^
q���N�Rχs����Z�>�j�R:�K�Z��(�����Z�QH'b���:}QJ'>��E��E)�ȥ&N_�҉\j���R:�K�G��(��T���B:1��S�t �R�ZmQH'b���S�t"�:~�tE)=~�pQU�.���K׋�Z]QJ'�*u���Bz��\�V}҉X�?�G!���c8�QJ��}b�G!<>��Z�QJ�_�]�O�*�R:�K�1��(�.�S�ʣ�N�R'X��(�S]�Et���N�R�Z�:J��k񋲩Z�QJ'r���:J�D.U�u����RR�:J�D.՗q���\���Ԫ�R:�K�6��(���lê�B:pC��Vy҉X��Һ)������s�(�G��]����^��.��f�1��fHs��_���>J�����!��4g[����V���s����|�K�ޏ����4g[���5�9�~���.�}:�����~�֙kLs��ё\C���o�)|�W��Kg�8�ߠw�Ӝ}��N�o���~W�3֘�l+��ƴM�/�R���p}�ۙkL۴�҉\#ڦo�(�s~��d�x���I�B�7F��4�m�>B�F�M�GBh"Ҙ�ik�`t`�P���Q�&ުm�����4�m�>B�ƴM[_(F'�Pcڦ�;FH����R8�p!��N_҉F�����|����R:�kL۴��щ\cڦ�\�N��6m��3z�-~K	�W6m�318��t�)��FyDGF�1e�V.DGr�)���]���R~Q�-J�ѱ�+PSyrUm�� =���(Q�S{�p`�S�T��J�D�1���׉сQbLg��сXc*��X��Әm�bt ֘�l#����e[#!�#ᐾl+���[�i�R8kH_����Xc����2��|*����+C���1j5^)�x���e[��,R+٨�x�p"֐�l+����e��N�C���S16J�F��+���R6�4^)��5�/ۺp1:p�R�Q��J�D�!}��T�����r�:�W
'b��˶���N��Q��
�H�1}�V.DGr��˶r!:�kU�Q��
�H�1}��Ջ��^���Z�WJ'r��˶r1:�kH_�uC���7����:�W
'b�U�K�D��d�U��Y� uVAz��������^_��W��ͫٷ�:^���W~�����\���*��_�>"��~ZudJ��]��e��}/יw��X�oՑ)����N��]�6ʘV��k��_{s����F�t$���[mdJ�\5�������Ϊ{s�E��L�D.u�ԩ#S��j��{ۗs=*3 ���ud
��6-��Og��2_xwd�7�Xdp��N�RGL�:2��jZ^C�RF�2��BޙK@�:2�3��d�h$v��i��s�5t��|�$&F#���Hb�a4�	����Ʉ�D3����������L��[��a>o$6IL(�F2a#��dª#3:�R�O����-�|Z}dJ�_�P~O��L����{ZudFg�^��ԑaq*�K�/�:2�3���©#3:�K�\ud
n�B��#S:�Ф�V�ҁa^ID�>2���l��#S8��RQ��L�D,1ٰj���R!��x)�ȥz�F�����=^
'b�����p"��$1z�N�R�R��K�@,e�����J%j5y)�ȥ�N��҉\j��ty)�ȥ�N�҉eCe5꼄M�\K����t�R�R��K��+��.�y)����N����c)��U�etb�PnQ�͋�H(%u������J����et&��c8]^H'.\J,juy!ɥN}:e^J�R-�y)�ȥ��N��ҁ�x��ڼ��RnQ��K�D.1ٰڼ�N�R-��K�D.�2qڼ�N\����j�B:�K�7�6/�#�T�ԩ�Rz�-��rZu^Jb�u��K�@��dv���	��3�����|��c��R��k����z��Z�*��U���<�}�m)��z;$��8�_�W�\,S���έ�NW*19p:�N�RS��K���r�O�N�ܚ�Ю\jj�T~)�ȥ4WN���v��y��]��jN��r����K�D.u�ө�RzY�����N��l�%��\���t~)=MK��A�<�}��:^ѓKI5��/���9N��K��,�|ƻ[K�]��ևS��t"��m<��2t��,����ﳵK�I=�q헡�Hb�����D$5�x\�eh"�zƓS��tb�P��ǵ_�&�*uh�q헡�#mR������D$e�vJ����ڔ3�*�Rz�M㦜�N���.6e̴:��˸)e����t�ۥ�N�҉\jz�t~)�ȥ�N�҉\j��)�Rz�-��L�V��㗚6��J������i�~)�ȥm�~)��~����K�D.1߰j��N��ԦS��t"���:�_J'>����)�ȥ�N�ҁ\��iU)�ȥ��N��҉\���t)�����R:�KI/��/���|���R:�K�Q��/���J���������x���7C��6����˔|ܤ���/C8�X-��F}Tj��h/C8�J�N��2���2v�e�&B����L��"��u:�eJ'r�ɄU^�t⪥��Ny�҉\�@�S^�t`�.}�Ny�҉\j��)/S:�����Vy�҉\b�a��)�ȥg8�eJ'r�^�S^�t"�Z�p�˔\����*/S:�K�7��2���M�(/C8pG���NwTjMè.C8��1���=����D�:� ��2F��2�_��-{����GǫS���2=�e��_?��R�:7��>�ٳQ��¨+SxT5p*ʔ޾|���I�BٕKM ��2����ʩ(S���/�ϟ�	vO.�Ӵ*ʔN�R�%��2����`~��Q�b��8eHO�|~�~��t�R�3��2�#���L��L��뗫v��R�NC�҉\b�a�����UB7���2����[ʌMd�����D&5�x�Sfl �RhZ-eJ�	��4�ʌM�W� ��2c��:�yU���L��NQ�҉�Z�p�ʔ�:Jm��T��U�ʴ�ɔ�-*W��N�t�+��)�u�i��N�t"��V8�dJ'r�e�������oZ�dJ�_eR�M��L��0��V9�҉\���N9ґ��Z�p�ɐ��R�M��L����e:�dJ��%ݛN5҉O�to:�dHGr�ɆSM�t$��#q�ɐ��R�R���H.U(u�ɔ��_�4�)�%�V1�ҁXj����)��Z�N-����
we�4�Ɍ�^�+-��U�t�`ݮ��VW�҉Ϡ�ree
�Y�ޕ��i(SxT�;bԒ)<*�*�:]dJ':� 1���D*�7┑)=~MzW�M��L�@.�۴�Ȕ\��o�*#S:�K�p�Ȕ>Cߕn��"S:Km�8UdJ��BؕmӪ"S:�K=7ĩ"S:�K��p�ȔN�R���L�D.�`�T�)�z)ۦUE�t"��m8UdJ'r)5��E���H%�t
�E�S�c
��"&Nۘ£�4�?+״�~3�B�Rd    ����Q��a�*S�_��.��f�1��F�-��4���8�u?�ǪNF�Rn�ގ4%�5e[�嘦r�z5*�}Y�岷$M�Du	wJҔ����>�|�Z�z{	�̥���4��Ԋ�S���4�R�t�]�\�O�;s�%�$M�D.u��(ICx��i]����97Lu���YJ�#M�rW�!ϥ>N�o�K��t:ҔN�R��p:Ҕ.��c;˽����>5 �ڞp:Ҕ�R�K�%����\�l�>]�Y�̷[d���I��-i�F2�Y�ђFl$��a<oI#6�I�A��4��2L<oI#6�^����[҈�dR"��-i�F2�#NG�҉�Z�p:Ҕ�9*�%^���ZE���ޢ7%+/-WegM�u����ﮞ���)���*zS:�K�!��7���J��M�D.�F��)X�PRL����J�Tb:=oJFy��tzޔN�R�Nϛҁo�tb:=oJ'r)����p`�PFL���D*1ӰZޔN|�n���t"��i8-oJ'r����M�D.��pZޔ�R~L����h��N�T��at�!�H�fF�Tb�a5�)X�T�L����j��cZoJVt�,�jxS:�s��7%+�J����D ��bv��)�ȢD�N�҉�N�0��7�#�Ծ�S�t`=Zy0��7����B��7�W&���JޔN�Rn*����]Y0��7��Ԯ�S�t`�@Y0��7��ԓɝ�7�����M�D.�D��M�D.�b�T�)�v)�U�t"��k8oJ'r)�UoǛ��H%��.yS"�E�T���)1>�!-��5oJ$�4��$�ץKF�_�<^jKR/���z��by�ٖ�?���׫���W#.��U��|���9�T�6�s+#l���a���o5���<[��ג��dK�Kݕk̃�[���5����^�SQ��t����5i��5��\��������+��>j���q�ӓK9*�R;�#��<u������kZ]��<u�q~�ҵ}�%\��MW�!Oo�bt"ט����y�t�}�~�wkߢ+ט��7rA:�k�S��z�=�
[{�]�<u��	��L�:�ʄ�D�OoeBl ��RZ�vJ�	%�4z�M�W�:�ʄ�D�OoeBl"Ә����S�N|��<u�q���ĭcK^�;�]qb���EmO8�wJVf��*�C:qG��V�ҁaC�2��;����)�S:�KL3��;����Sz�t`	CI3��;�+iʙi��!��5�j�C:�K�b8�wJ'�^�'��)�ȥz�F�aCI3��;������S:�)T�L��N�D.5�pz�N�R�%N�҉\�����)�ȥ<�F��P�<��;����ʨ�S8KM5��;���K��C:����F����5y�ٴ���ƫ4�V�ґ��zʗS��t`�Zi6�J<���)P�O�D.1ϰ��N���a��!�H�vP�z<�+�J�i��)�ȥ;���!��z)ͦU��t$�`�x
��ʳ��)���6P��<�J�i�!ɥ�S��!ɥ�k8yHGr��;yH'r)ѦU��t��T�VAґ\j���!ɥZ��)��T�M�8O�D.����)�ȥ��:�zJ'r5�=u��z(�ǯ������_���oI�~�ۿ|����_׎W#fNǞ��|�erQa{-5���NǞX�bN��eҰ�K��+J����+�i:{HGr���cO�s���,7�]�ޚ�t�Rz+�cO�D.��t�)�_�U�E��uo����\j=���S:�K��pJ��.��D���[�9��źr��Nɞ��}n�R׻�8�ӕK�6��=���N�*�S��������֥�j�~t�R��dO�D.1�0j���21<����ؕI�|^�gl"��g5{�&2�9��=c��#L��=��:[�f���{�p>��36�I�s<��3v|�Si5��=���Ζb���ߺw���{�sR�7��=��/9�J�i��!X�9���*�Sz�-�$�Vɞ҉aCM1��=����)�S:�KL3��=����S����%�SI<��=��/��J�i��)���j�S:�K-c8-{J'�_����)�ȥZ�N͞҉qC�R��=������S:�9T[&NϞ҉\j����)ȥ��VϞ҉\J���)�ȥ̞Nўҁ�P�=��=���r˩�S:�K�7��=���Ȝ�=�ˢJ�i��X�WzO�kO��R��{���7S����P:�5R&O� ��2�2yZ� HGr�m� �H.%w|��J�� �H�6M_ ���J�i�(�ȥ�|��(��z���/�ҁ\���(�Q*O�@�D.�i�(�4Q*O�@�D.uH�1P:�K�u��N�R��1�҉\�I��1�҉뗚o8� J'r���c�t ��yZ� H'�*���2@:�K�n8� HGr�g�;� HGr5�=��ƪ.�+�/�'���k��Q^t�C���/[:�l{ǫQ�
G ��<��ن�R��3 ґ\���8(}���?[��KL,e ���RN�@��۟�5��ʥ�X�1�҉\j=�1Pz�ίZ�K]��z�c�t"�:T�(�_���źb��K@��_��uf�+��lX� J'r�3��0���im�\�C/r�S}�^��{Z�t/�t�?�����c嚯S)E-����G%��9����MړI�D�c�Ĕ��06�IM�����$�J���ҁqB)D�c�:{�\��D&�e�\��D&u<đP:�R�1���ҁ�`)!u��N,�)�e?���U&e!�����+�%?�t`�PRK~@�D.5�p��N�R
G~@�D.u{��(X��RG~@��JBj�(���l�rP:�KJH��_/%!���N�R�Z�}@��Æ�Z�Jb)�c>�t�S��~����d�1P:�K��8�J'r)-�c>�t"�z��c>�����RvRK|@�@,e�p���RSG{@�@,�x�z@��롗r��Ǝ_������@:��{)/��B�t$���8*J'�[j�Q!Pz�������	���c)+�%B�t �z���A�t`�WRRG� �D*��x(=~=�RJR˃@�D.1հ<�\����� P:�K�8J��;QFRK�@�@,�}�X(=~��RBR˂@�D.uZñ P:�Ku,�N�R���҉\꙱��ҁ���ZJ'r�نcA�t"��mXJ���TNRK�@�@,���8(=>�ҔZ
Jb���eA�tb1�e)�酠�� uRA$�G�3כ�{��������J ���ը�G�@�}������ߚ���\j���8P:�KL���y)7���뿵F��Xj&`h(<<�.g�`s�ʔ��?�c��;��c�,G���d�����TK�ۯ�v���]<�'s���R:TKHA��޿�X[��]���#��t"�:b)(<���2G��߮�
eW,�9GH�����[�i���ZGɺr�#����љ\��#���uw������ڇ�ʥ���ґ\b�dh{�u�}/�������ʤ�\��H&1�04�MdRTC��H&uđ8@:1N(�)^l ����U�SCE����MY̞�(ɤva��(ɤ���ґqA��8"
Jn�+�QP:1�=CDA��򟒥Z"
J��,�Q@:1l(Y�%��t$��b8"
HGr�㥎�ґ\j��Q0:��l�����@%K�D�N��x�#��t"�z�#�`t��%%����љ\�2k�((6�k�QP8K�8"
Fg>�jo�Q0:�KM6�3�F��۹��;�KuY�3����QP81*;�!��p ��:"

'b���!��p"��jX"
J�C�w�PQ 6�&������ҁ5^��D�N�R-GDA��wK��"

��s�QP8K��"

b)�%��tb�W�Q�D��H*��( �X�W�QKD�H.U�uD�\��q�QP:�K�"

�N�p�QP8Km�8"
J�O�o�QPz|�[	G-��T��QP:�K-j8"
J'r)=�#�����׭�����҉\j��((�ȥ:������o)o�uDN�R����X��m���X�:j�((=~1�niG��⯡�U'Dmq�?��    �Q[?��ը=GNA�����~�ڗ}H.����)(��%������]F����(����!�3��8z
J'r)-�#u��<M�z׼,�95�s����:P:�K-G8RJOSݜ;j�i��-��K�B������ �|˧u*3�2�o����\b9²:P�\��-��+���\Vg.u�ӱ:P:�K��t����庶s~��әK=�ձ:P:�K�7�c��\���h/w� .�7L;3�G�=�:06�I�3�c���ׁ��LJjY('�!�1=P:p��D�>��M|x"Z���4��ʄ�D�!���X���X1�Ѹ'�t��Xi--��c�ODk͉с5'��tT���+���z�t`�PZKK�@�D�!��f.F'rE4s1:�k�(��6���ڌ�ZZ�H'����r=P:1Ώ1E�r1:�k�)���bt������҉\cL�qщqCy.-��#�F�"ڟCF'>�#\�\��k[T'��s��,�T������?֫�=�h�G�N|�Fx/ڹ��5����D�1ދ�؎���>F|�ʅ�D.%��������h�Bt$��E���k�J�i�+�gPBO�^A����zZ�
J'r�q_��[�N|�Ƹ/Z���3(��寠t"��E+�����XP:0�+��c��p"��Es��с]e���N���h]��z)��%��t"��E�щ;e�����#�h�
1:�+����ҁ\��i),(��5F�����D�1�F.H'r�`��_�\����RXP:�k� ���щ\c��JF�*��ӑXP:�k����щ\c�\��RrOKcA���hK��#�h�bt"�`�Id�Sk�W��:K�����j֥�Ո)~�7_��^.N�֩�ZM�|ɠ6;���f���t"��8*H����r����êLi�]��t�Qq@:�K	/��{Z�e��X��G��jLK�r�逥���\�$������U�'�2�Z�s����,ϵo-3�k:P�2^�P��_����1O�+�<�� ~��M���n�y��I�/�k��Ǵ��׎7G��8>H�sJ.u���P�ܗ��s��oi��v�R'k����,��u/3����a��X�`���t �:���D(]'J��Mwk��+��;6J'r�)��a�ϑ�s�h�^we�%�'��D&1U2|"�dR�P�'��D&�vl"����]X6J��K�"�4��5��TO��'���[��&2�s��=)�Mds
˒B���veK
���;jYR(�wԲ�@z�r`ɥV0K
�+�;jYR(7�wԲ�P:�K�1K
���wԱ�P:�K�iK
��/9)��%I�t`�S�G-I
�#ü:t�HR �ȥ4��$���^�Bj9R(���KE
�����Z�J'r��G�B���P�8�Jb���#�t ���;NJb)q���t ��v8FJ�B�X��"�N�R��(B�D.5�p�"�N�R��(��z�r�N���_�2�P:�ƫ���Q�҉\��m�Qґ��Cq�"�N��+��e�t"��ZFHGr�s�Q�ҁq^�U�����c�t`E^�U-���T��1�@:q�RFR�(�H.���E(�CQFR�(B�D.���E ��BQFR�(�H.ub�1�@:�K�6,��#��ʆc�t$��v8FH'�_�JjE ɥ��Qґ\���E ����VR�(�H.���E �ȥ���Qґ\�ɱ�Q�ҁUі���G�
��D(q��ޮo���Ǿu�RK��ґ\��ey= ɥ.^�׃�g�`��ِ3u�R/��A�@.%�����+�_~��v�/��A�D.u��x=(}����������Ľ�eĠt �z��#Ġ�~-_~��;s�������^����zu�R!��ԁCG�A�zi���x�AԙK�5,!���\�Pb ��˽��A�eRr�r]�CӷB��Lᮯ����@��kf|�뗟�/�ˠJϵ���/b>ah=ɤ&ϵ��dR���ԃҁ�N�1����ʎiI= ɥ�ϵ��|�Ts����Lʊ�\��@�Y1-��Ǐ���IZRJ�_���LҒz@:0�J&iI=(=~-pV6IK�A��0��IZNJ'�e�t��N�RS��A�D.�\�8=(��%��Ӄ��W�f%�����v;+�������Q^�%-������0zP8��R"��A�D,%�t��N��Q��у҉\jg�0zP8�1T�j��A�D,5�0��R�I��A�D,%b0�N�R��A��P����у҉\��c��t"��j8FJ'r���c��t`1T	&�b�J.i= �X�UrI���D.%����|��]�2zP:� ����у҉\j�1zP:�K�p��N���/�(=I��O�����/i=(�ȥ`�=(��z���уҁ\�0�=(�CQ�I��A�D.���=(=~E	&-����a��A�@,1հt��R��̓ҁXJ0��<(��t���#�t"��j82JrI��#�t��R	&-����#�t"�z�#�t"��Y;2H'D[��H+�#��\�?�����������y�>+w����oK��u����|����j����jԳ����k�����o�3���p�"�N�R{�Z�ҁ\�
i�E(��������ܙKM�����R�Pz?9�L�<��L��c��5CB�?Ɔ�w���Ԛ���p"�:���C(�m`�wr�C��?���3��4YguRӑ�PzTu<��Pz����}��\��h�B(��%f�*����~O�3��5X�J�8���TՏ���&�1�0�!�MdRӇ���&2���0�҉1O��t�!���*��%�t"��S���[J�i(C�Ȥt�ϕ!�Mds	KB���\��0��C�#�^�R�P:0�)����t`MO�5E�-ʯi)B(�(���Q�P:�KM*E���c�R�P:�Ky7G�-�)ߦ��t`QV:7/�C��n:^
'b)�#���o��v;6J�ʢ��@(��a�1�P:�Kmy8
J���-ʮiy?(=*��18�J��"f��ң�(Ʉ�����,J,�<(=~L[�.�RyP:�K�pT�N�RsG�A�D.��pT��L�(A���`����E�1-y��/�.ʎi�;(�ȥ�S:�J�6)#�������E)1-]���f���t"�:"��:(���c�_���^�������E91-]�����uPz��Jy0-A��$Q{���ҁ;�����N�R������7/e�t�N�R�#%���t�QrP8K�NJ
'b)A�������t]:J�I�&�v��c�(�#ڠt�VP�,���Ԓ�#ڠt"�z�#ڠt"�z�#ڠt`�R--������~�9�oN�ji�KWI�"�ǵ~|=j���_�"��_��L�W~����^���g�o�+�*b:�J��u��?��ǻ+�z��#9�t"��<9�J'r�˽#9�����e�+�ځp$'�N�RR�>�	��u:���g��יDy$�$'��Iĺ�e9��r-�����0ЕK,X�Jr)s��9�t��m_~��~�r����J|�R-��v]Y�	�^�	%Y���ќP�뷨��k��u�R��p4'�N�sCt�������
�$�ݖJn��]��06�����9al ��<<��0v|$���'��wJ'i)N(��U:IKqB�D.1�0$'�|�T��ㄱ�Hba(N���?:~J'@u���oB?��ܒ�߄҉!O�&,�	��y�3i	N(XbQ�IKpB��H�\����҉\jJ�N(�ȥ�(�	���̡WpB����NZ�J�c�w�2�P:1���GqB�D.%v�U�P"�R��n�	%Y�\�R�P:0>(פ�8�t"����U�Pb�go�&x��>?��C���	}ޒO�3G����3������w��:�B�҉ό{-������RHP:�K�ɎB�҉\�2ߧ���X	Rr>C"���ˏJ�g$(X�Rf>� A�D.uV�� A?�eRĎA�ҁ�G���N�R�ŎA���s���g$(=|`_���1H@8J-    ;�J�_z\����GP:�K�.:����_�Ve���G��O$QKÎ?���o3V����N�RKÎ@��㗆We���RF?K!A�D.1���N�R��D�҉\�q�}	���+�2�uJ$��'��YD�D��~"��EX	J���ϑHP:�K�J8	J'r)'�#��t ���Y	J�_�\��ϒHP:��1��
�5�1�	��$~DKQ��m?du�./�:���7�f�1M?ֳ�ՈK�%�����!�TΑMP���˛�A.e�qd�N�R�G6A�D.5-pd����7���\j�MP:�K���������D.��sD�N��������Y�,.��R�_GDA�D.ՙsD�����f�?�:��H)(���7G	�c�g:~
Jb�6����������R�p���s��z
�~���6{w")t<��u)A�sSC_<U04�H�,{*H��r�����=e���+�娠t"��T<�T04��Rōǒ
���<vT0t|"���?�)-�e��t`�B)-[����Z�
J��.вUP:��t����ҁaC�~Y�����qUP:K�W8�
Jb�N�c����E3e���,�*��%��t`�W&AKZA�D.U�w�|��L�rYP:KĠ�\�o��5�B��qP:1�i���t"��WXjJ�Jj^Q^b��,3�r�t�e>3]<���R:��e(~�=���bt ���>�z�w��Vgq�Y����@,% �>�:H/����@,1��,3���%hYf(��%��e�҉\j��Xf(�ȥ��8g(X�U^������PPFAK9C��
��Z�J'r������ҁo�2ZJv�i��P:�K=���P:�K�
��/U/}.��l ��%q�3�������}�ҁX�(����tລ왖��҉\ʞ�i(�3Q�LKLC�D.u���P:��������҉\b�a�i(��%f���҉\jE��P:�KL7,M��/5�p�5��kSzMKaC�D.u�Q�Pz�����҉\j]�Q�P:�K	����T��Q�Pz�z����҉\��F� �Ud���5�˽Id8�����&�uҰ��E2�W���FM���{�׳|_�;����K3-�����T�W�~�S]mo}%x��Rv�|��=���}燏��b���M�?-1�ǿC%���8bHGr�Ɏ#��r�{�[k�ϳ5)�ʥ6q1�#����@z����������u�n��r���8bHGr)׸#��to{,�u����>[�+]��k��@:�K=
��0z��}Z^o�2_w��i,���R�PG�����r���i��2�l�v슥ΦbGb�ن#��y�|�Ӵ��>/��ag,��C��H,�}��A�~/�z_��F�BW$Uvq�<�N�@*��s9B#o��a<�� 4IM.�y����9�C���ZrH'n��eԒ�@:�K=�����o��>� 4I=�䱡��H����pd�S�O?���+j�y ������@:�,�̢��҉��u�<NJ/��y ��f��Xj����@8Ky:?�kg�6j�yY�U�Q�����vH?�#������@8��R����D,e��=�N,x*��Ӛ�p�ڥ�Vk
҉�.e�ZS���R��5���EY�G���3��d�iMA:qQV�Q�5�H.�c⴦ ɥ�5�������jMA:�K9<����/� �ZS���R��5�H.u��iMA:�Ϋ$�Vk
ґ\j�iMA:�K��8�)HGr)[�Ӛ�tbH�I�������*NA:���ܤ�n~3�A�H�2�#���D�h��ɥ�M�2�+�JD�h�!��N|ZeGb��ZeGb��ZeGb�V��Uftd(T*RK���L.�s�ʌ��RSG���L.���h�!�X�P*��fe�&�*��U�t�KyH-�2�#����*C:��R'A�2�+3�Fjy�!�ȥl��Wґ\ꀆ!V�pb�W2RC���H��4�e.r��N��yYH���,3�����!����qQ��t��;u�C�>����u_�m��ewD.1;��C�>���s��E����3���p�=�N�R����҉\jv�{(]��22��2�����*ڕkW�PK�C�D.u���P�6H���gߝ��y
G�C�D.�*w�=�~��G���z:s)W�#���\�����~g*S�����}wK��~����ʂj��(�{�������ھq�C��2,#��~G�3�ڿq�C�N�R�G>D�?Ɖ�wI����ÑQz|,�S}�b쯑������3�:B�c�o��w%��I�N�R��Pbl��&&F�B���H���\���@$1��J��j���'Qz�*Ů䢖?�҉\j�\�����,�5J�i���r�z�����}���5���_C�����v������	��G���P�Qc�6%qDP�?�+/�偢t`5L�Q-�㸲�Z(JV����@Q:�z����ҁaC=O�AQ:K͒���RK͖�ҁX��(X�T�TKE����ʖjy�(�2��@Q:�K�r�_/��㘠(��%��	�ҁ�[%N�TP�\�Գt�w^ʛj��(�ȥ�9�	����J�j��(��&��ҁ��2�Z(J'r���E�D.���x�(�ȥ�9��҉\b�ay�(��z�نぢt ���Z(J'r�ن偢t`�W�S-���>�ぢt"��Gq<P�N�R]`�E������Z(J'r���E��↲�Zn(J'r)�ㆢ���J%O��P��R;)��ҁ%Q�N��P�N�R�Y9����̱CQ:�K5d=���l��CQ:0�Ɇe��t �2�9r(Jb���ㆢ��Xʛj��(X�P�T����gC�F�RCQ:pӥ4���҉\�!���҉��:ꨡ(X�Q"UKE�D.1ϰ�P�N�R'67�ü2�r(���v���Gk=�h�ˡJ�Ru��=������2X[k-��[ǫQ�ZGE��.o�z�{��ڦ�_W.1;��P�ޗ�̔��~�f�19芥v<3��Ԇ�#��t ��8^(J�Ǵ^e:W���>�.�]�����BQ:�K��p�P��פּ��ܽLޗ�5��ʥ�W8^(Jr)��兢��\�*#�q�e��9��\b��BQ:�KuG���c����u��r��ºR��G�D��.���R����~ޕK�w82%J'r��!S��Y�F�k/�%��xn�Wt�R.C�D�D,u��N���깞s!��l��vER�*���\R���)=~Zx(��U�����$�N����G�C9T�7���4�)pS8K�2�7���$�)pSz���P�Q��M��S�CYG��6�#��iX�mJ'r����ߦt�ۥ[V�҉\J>���)=~�{(!��ߦp��|�V����%%��۔N�R'8��6��_���ԩoS8�JM5��6��d�&��۔N�S��M�@.%(��۔N�RvO��M�D.�d��M���K9>-+;�SC��|�eg��u�C�=�{��������MDRRO��N��=��zZVvJ?"t(��%e���XR��������J	=�[������m�MDR�$�˜�Oi<-�9��?��\�bZa)�(�x��X�QQ:�K=��QQ:prAi<-%�����RQ:�K�O%��T�QQz�0�<����ҁXb�a	�(X�QOKHD�D.u&�Qx�F��x:>"
R���::"Jv�����Q:�K)<-���T��Q:�KUL���T��Qx�h�����T�8�!#�p ��e."
R�GED����Rw>�14����������ﶔ��2Q:K��pDD�|����Q:�D������҉\j��Q:�KL2����v&"�&B�#���Mɖ��eg��"𛩅��������"�������ښ�Rt������rjZ2%J/�&���!�T�Ð)Q��?[k��K�i2%
'b�=C�D�D,5pdJ�^���?6�]��Uӑ)Q:�K��pdJ��>ޭۇ�\j���)Q:�K�?����a��l��ʥ��L�    ҁ\-�f������oG�K�Kmk86%J�A�iBc��+�zV�cS�t"�rg9:%J�rUeĀ\�j���(�ȥ�P<W*1���F��+��jXB%J��*Q:05T�NK�D��%YL5,��c��tZJ%J'r)}��T���\���.l�{*�����}+���~����!��p�P�N|�Ԭ��CQ:0T�Q�E��M��Z~(J.X�8j��(��%&N��҉��:{���(��%&N����'��Z�(J��|��;j	�(=~�T�QKE�D.u��0DQx�e�T�QGE�D,5�pQ�U>�y�RDQ:�K	�E���2����t"�z�����t �r�Z�(J�^�=�(�(�*��a�b����S�GMc��4�'���L�𩣉�t��D)GM��~:�s��DQ8K=���)���o�z^�sUc��j�pE16�Im�8�(JF@��TQ���f�QEQ80*˨���t��KE�D.UoqTQ�&�T�QKE�D.%sTQ�N�R]ZGE�@.�uTQ��H����p"�z�����t`iFIH-U�����E������:�(
'b���%������SIH-Y����GE�D.�sdQ��RRKE�D.%:7lQ��A��(���g�(
'b���!��p"�Z�p�Q��k(��bl`�W	Hc�7]�@��(����e8�(J�YJ@j�(X�QR�E�D.����(�ȥ��(�(啂ԑFA8�J�p�Q�lO*	�咢t`e��!��Ң�)� uVTZ��Q^d���Yj�έ��׫Y�W�!���ӵ�9Ĵ-�^fK�\�jٰ(=o���!ᘧu����+���ptX�N�R�0ǇE�D.%u|X�^��^��2?Z�2�jLr�r�ɀ�ât"�Zvp|X�^��h*#J�{Y�r�ظ9�ʥ,a��҉\����(]����2ɫ;�r�N��ât"�:���(�^�q��1��6�j-W��RJRK�E�o�����ѕKi�!��T'�bQz��s=��^��*7��۾�\j��bQ:�K=i����u�8��,w������ЕI)�!��^�Hj	�(�*#�%Ģt�������҉1Ci�!�����bQ:�K5E�����M�K��8/��ϻ��\������26�Iy.�wc;<�~���h?i��A����یZ�O]�S)U��/�c�:�T|)X�UJU��K�D.5Wz��el`�S:U����D&e{��el"���:_J�@%�:����+��U�t`T�Q��K�����~��/��T��)�R:�Τ�Vɗ҉\b�a�|)=>ץ�Vɗ҉\ꬉ����q�R�Q��K�D.U�uj����t)��U�t"�j�:=_J�����*�R:�K�i��/���_�?j})�ȥ�Nїҁ\�?j})�ȥ�Nї҉\�O�4})��Ԫ�R:�K5j��/���|�)�R:�K�o8e_J�_߸���yݗ���z/e"�ھ��{)�U��t �4�:u_J�[�Jj=ڋҁ����Z���t`�WVR��^���RZR��^�N�s��^�N|��*�y����\�z��klJKj=ۋ����/�%���E��uYiI�g{Q:�K�m8��tຬĤ�ӽ(�ȥ��ӽ(�.+1��t/J'r�3��ӽ(�ȥ���<݋҉\b�a=݋҉\b�a=݋҉�:���(8�Ԥ��҉\CM����D.uV��cQ:�.�䤎Tb�a�(��RrRK�E��ݲ��Z�,J'r�M�E[�7c�4l�(/�\f�Ļ.��m�����}�x5c�a��� �^���KD-������gmm�t�#k�bt$�iX+�#��H��O�(]&_��&o]��H�Z���5F�������YZ7}]��H�Z���5F�~���s��i>��+�iX+���H��/Szٿ�i-2��R�RK�E�?Μ�6�r����r1:�k�4��)��o���]��H�� ��5B�~Y��(�?{kI�+�iX��щ{/%(��_������~Q:pMV�RK�E�Ę1F����@.%(��_�N�#k�bt"�iXk�Gtb�W�RC����5Y�I�b#�FH���4F��+�+�ȶZ레N��*1��˂t$��V�E��߭],c���v]����s�Vo�ҿ�6u)�.�W5�_�M�|J�j���4F��͕V�Q:��Ԫ��҉�\�U-����mX+���h�Z+M��4)5�%��t"�mX+�����Q:�k�6�5�#:1�+M�%��t$�mXk�	щ�&�)��_����k�3:��4����҉\c�a��pFvÕ��Q:�k�6�����s�JSj��(��5F���D�1ڰ�x�����4����҉\c�a�\�N��k�bt"�mXk}����7n�)5�_����JQj�� ������A:�K)J-���-�(��_��5���Q:0�+E�%�����w�R�Z�/J'r�ц��_�N|��h�Z���5F�ZcCt`��V�RK�E��{˷ҔZ�/J��RSꈿ(��5Fֺ.3:p]V�RK�E�D�1ڰ�u�с�Ԕ:�/J'r�ц�r1:�k�6���щ\c�a�\�N��k]���~�ц��n0z��[iJ-����h�Z���5F�:s��ĺ�Ǡ�b!8�j�6�u����ݗ��Z�/H'��A:�K�6,�#����:4��P�D��|�����*����+�<�{=동��ne�x�w_��v�tקc�)齍�!.�����ǹ�-���������ҙK�i5��c��k��cٶ�.[g,q���l��REG�F�@,q���l�.w����;�~nݙK�;/�#��Z��e��k��|T�{���v��Rk��ґ\b���Qz���e�w��&���P_.e%��l�N�R{������\�^&*g��!���%��Qz�������r�e>�v��3�2w8^6J'r���e��r/�|,�1��<��W:s����e�t"�Zmxnfc�~���Xn巺��~ū3�:G�x�(��RFR�����PI-/��de$��l���Hjy�(�ȥ�5/������Q:�KuR/�㼲�f6����Hj���Ȥl���l�MdRg5/�c��8^6J�_U"RK�F�@,5�x�ecl�����͌��Lbfa���Ȥ�K8.3JF@� �\f�N�T+��2�t`T&��ґ�Km�8*3HGr�Ù��҉�%�Tf���R�3��#��X�Q�A:�K�pTf�?�K��c2�t �:���(X�QOKdF�D.1۰Df�l+��%2�t"��j9"3J������Q:�K�.�����GdF�D.��rDf�N�RZ-GdF��x(5��Ȍ҉\J���(�ȥ��Ȍ҉\ju��A:���4��ʌ��z�I)<-��G�z�X��x�(�%f����Y%�:�h�(=|�Qr����1�����R�GcF���J.%�p4f�N�R�pGcF���K	�����L�ҘQz�
�>)���1���m�K=�јA:q]VOKc�H.���h�(�.K���1�t"��o83J��J�ii�(�ȥ�:3J'r����1�t"��x:3JrI���1�t���$������7�\b�ai� ɥ�Z��ґ\꘨�1�t`UTI<��������w_J�ii�(�[V
OKcF�D.1۰4f��j)<�����U_=��w�4�Oӹ�OR]��ݪ��mŢ��z����a�`e�0�u�b?�DS�Mulg�.������2a]�}\�#ԕKUT���)ݥ,��8�KL���T�İ�Q8K=�ݱ�Q��9��QfSyS�\ʇ���(�ȥ�$���s���=?��@�֭{O.%��lg�N�K���u��6���j�z�k-!u�R�qlg���R[ ����}���t\K�\極UЕK����˕ﾷcަ2K�[;�]��Ñ�Q:K=��q�Qz��u��t�,wgkE�+��lX�3Jb���3Ʈ�r�gu�c.�l�5��H꤅#:�t��K)>-���B���Dg��\�����Qz������ҁXj��ќQ:K�=���T_Ց�Q:1ƫS��5g�9Vv    O�r��@$%�|.9c��H����(=~�PJOGpF��ʧ2z:�3
'b���s�c�+Uyn8cl ��R�3�"�c�݌ҁ�Om�8r3J���ӑ�Q80�)�%7�t��R�KKnF�D.u�ё�Q:� �엖܌҉\�Zl��(�ȥN-8r3J'r�c�܌a^\�����N�#7�t`IF	0-���� Ӓ�A:�[����ґ\JI���(=~�X�/-���ԙGmF�@,uf�1�Q:K��������A:2*���5�t$��jX^3H'r)���5�t$�Z�p�f�,l(��a6c��^%�t�f�t)北5�p"��bp�f�N|���HGkF���i�t�f������X�9�����Ռщ\�2_ZV3J�z��|iI�(�%f�ӌ���fe���f���<+�4���k�ė�Ҍ҉\jM�Q�A:pQ����R�A:�KM6��3e5�p�f���R�KKi��L.U�p�f���R�KGi��L.��RGiF���K�/-��ǟj����R�Q:�K�7,���T��Q�Qz��謼���Pb�a	�(=��K9/-��w��yi��(�ȥ�V�ό҉\��F���щPu�Alhe�Z?�X���ڶv�1?�lf�����-ny��r�8&�jm:>3J����d��}T;m�#ԕK�*���G�l�坿�Զ��K�,����3�����j�*;mh�gД��̌�s-ѥL1��\J����(�ȥ�#����LX�2����*wp����\j=��Q:�K=���Q�,׮�X�2G���h�u�R�p|f�N�R��ό��6���}�Ǳ�G�4�	�r)E��3��oV����npW,��/�g�H,�@s�gFᩞqz���{n�H��R�K�gF�D,� ��h��y;γ�%g���pkI�+�:e���(��R�K�gF���P�.-���ce�t|fN��a��(���6=����$��Q8KUT��c�2^>7�14p9V���F3�&")��c�C��N�gF��8���Ќ��W>����Q:KM-���^���c�C�Ĕ�ь��H���3�p`�S�K�gF��´t\:B3J����<����O�+ϥ�j�tⓨ*"���҉\�Ȧ�j�t`�Ii/-U�����Q�Q:�K�pTm�N�R'2W��_����r�Q:Km�8�6JV����R�Q:�K=�Q�Q:��t����҉\ʱe�� ��	W6OG��H,u�P�A8K�0Tm��R�-C��D,��tTm������(��%����҉\j���(�ȥ6U�J��\�����RyZ�6J���R*O��F�@,�{��(��b�yFG���nl�Z�;���%%s�\����R�Q:pxP�;-����%�P�A8��R+�rX���(�(X T�NG9G��~��wZ�9J���i)�(=>ע읖r���/ʋ�wZ�9J'r�Ɇ����������r�҉\�Y�(�(�ȥ
��r�҉\b�a)�(��%��r�҉�2j9�9J�?��(�����t �xZ�9J'r����������E�;�d�T��P�Qx��עܝ�r�����s�N�SK9G�D��T�GX�
��D�:� º���p�ώm�@�?��4��n�;^�����s�߮�*��z��z��!٤y�q�Qz:����|
��g�+�:�i8�(<���kk;�+�zp�ᜣp"�zx�ᜣp"�2|;�9J���������d��X�-�(�(���#����ѝ�s�~���]��r�c��t"�z��c���~��5��:�B����r��8�9Jr)�e���9OW�q��\����&�ʥ�^�(�(}����� hk�w�ROcw�s��J=���A���Gs��k�ϫ�ѕK�4,��#��z�s�b�(��>^v�ƒXW&u��Q�Q:p˥���r��㧅��i�(��+	����tbȐ�N�9�H.���H� �%&�uґ\����Rz�p���ֶ �������tb������ �#�ԁNgcґ1C�5��AJ�����lR:�K�;��AJ'r)���7H�D.e�pL��N�R��e��M����i�`ɤNr>��"6�IY<,��b��tl��I*��c��p"�Z�x.�El⛥|����Lbfa(aɤV0#,�#��xZFXJ6����1�R80*��)��|䘚yv$��ˡ�b8j[J'�R���m)�ȥ�!�ږ��W;���2�R:K=I��R:K�t����R�>�-��ae�t��N�R'1�-�Kg��iim)�ȥ�D�hm)8m����֖҉\�9��ז����)o������T�ħc����T�ħ#����T���8m)=>�R�;F[JFA�봌��N�R�jw���N�R��hK�D.���m)X�P�NCj����Rx:J[
n����Q�R8K�2,�-��,e�4%����ZK��㹥��9��xZ�[J�]��iYn)(,(��e��t"�z������o�Z�p,���jU
O�qK�񫅫RxZ�[H�0�J�iIn)=~��*��%��t"�Z�p$��M^��ӑ�R:�K�5�-��_�W��$��N�ReVGrK�D.��p$���R
OKrK�D.uԑ�R:p�j9<_>>�pK���4֗����rK]�F�_�t�/�]c5b�1s=�ܛ�N�e���[���)�~]c��S�P�壷��������q7�/:s�S�Q���|�uk���{���KuD���TG�1�Q:K�4�z.#E�-׺�U�Nߎ�}�����Q8KM���iږzd�_+3 �Z�p�z�N�ROq�z�޶e:ʭ�^.��"�v��K=T���Q:Km~8:=J��Ե�y)LcA�3�z�s�e��V���Śz{��ܙJ=���N���Tj����Q�5�-7��q��i{���L�Q������P�1�\�rS���z�s9��̤L�P҉[.%�t�zL����Qz��X
<��#C�k9B=JG�)�cԣt$��k9J=JG���N=
'FD��a8�(�%=��S�ҁ���x:R='R)��ԣtb�POK����Py<-��#��Ñ�A:�K0��#��lÒ�A:�K-n<��161ȫ�=��16�I)<�c��iNG�G���X�;-���oL*}��գt �Z�x��cl⫥�M�{��Ȥ|�ܫ��D&���X�(�"��գt`�X	<-��Ǐ���iJ�08�v��Ʋ�մ�����LX�����c9:�%�;����O)TvRKH����줖4�҉\�+�4��\e'u��N�R�W1��N�R[i ����V�H��$C͝k ���R�RK��ҠҔZ�@HGr���%�t�L��Z�@J'r)��si e�
��ԐR6�J�k}.�l"�:��\H�D*�(}.�l"��dX�@JFA�(����N��KH�D.5�p���N�R��4�ҁ��*5����.(M�e���.e)�����R]q���N|��<�Tb>�j�D��4���9�R�Z�@J�]�UjI)=���\��3�ҁX�i�ϕ��M|��j�se e���QB:�V�$��2�҉��Rj9)�l(K���t"�Z�p���Iޔ��rR:�KM5g ��_�7%*�����Rm]�H�@,%q������H�@,u���Rz��kS�R�H��46�4�|�_�%`ZΩ��2���5:n-?d�߯1!�t�$W�r�9�R�'r���a�p��ne�)�˵�e6�X9슥֮C�#���a�p$�:��(� =���V'�r,�qn��+��G�#��-�����/U�u��~�w��K�QZ�>J���4������t,Ǵ����t�&�]����a�p"��%w}�ގ���U�(�r-G���+�Z�v}�>歞l��a(7�kk��+�Z�v,}�N�R��,K���s����7���ەK�_[�>�r)�sKck�缧�:�e_Z�5�"�i���t��KY&-G��B%�t}\��g�s�Q|��![�����\b���(ȥ�����\�`�� ժ�c�t$�248�>J��mHɤa�p �Z[~>��3�c���Q:05T�IK�G�D.1װ�|�N�Rw�|�N�R�IG�G�D    .���\����C��K>��16I=�󹞏��Hbv��(�+����pbGR�%5�#��R�s9c���Y�p�1���w6�mY��)XZ�U@�G;DfR��D��\S��rŎ�y*vcV�Hy�i�-��i�{2'5e�B���/���H���j>�5DBs�������JJZ>��d�Ē����-������Ԑ^R4�Ѽ%Z����X:�*C�IIe�҆X�{2�I;�=��Qrّ�%h7$�I[r�5��͎�-��"P�fG�	�	[b�u�͎�3i��(��Xڑ�V���Xڰ�9%�K;r�nC�ٱ�a�r2JF;�v�B�@�K;r�u��Վ����f(^;�v���ciG=���ciG.�fT�v,�ȅ��k�҆\��(y�X:~r������#/�b�#aǍ�2*V;��}�d�ci�u���SS�Ѽc��%�KZ(�g��v,��@��h�X��23*Z;6�BjFIl�҆��%�K;r!����ci��!�3jj;�_��َ���g��v,m���5�K�ddg��v,�ȅz�k�A��׎��c���(x�X��4�;b�/��v,숅��*^;��Z�f��v$mX���܌����l���r���E�<*T⑼aZ���3n����˯�|d����8�����>���}��ϴ*���s>^�
���x�X�|��(���h�MF߃GdC�;55"�[��^A�#�t[M�����t=i��aI�
����Y:�6���<u��t���.ʅ�(zD�v�B�A?"K;r�������s,�I��i��en`-ʅŏ�Ҏ\hfB�#�pjw�4P,�v�n�\Wɜ?";b��	E����|�Tղ��?�7�����\hbB1$��#Zo�Y��I�e{f"�$�|J�D�N�uڕԌ���B��ア\�1�bHdiG.��S$��l^�1oѶ�I� ���(z
"�Y��0945����Jg�J���e?E��T)~D�6�v!���GdiC[��� ��2�|*~DvTd��,l��������C�#��#zeU�#���"ŧ$GdiG.���,lh5��s��d��H\p#���d��U7"K�B���܈,���ɍ�҆\��)�Yڑ}I����]�S;d���,��|����-�j���s��C�@G1��ȡ�H���,l�'��Sr<���*zJ�G�v�B��5�j����s��C�@1\�ȡ�H��H�#��y*�G6<�FBOI��҆򇄞���-;�z��G��dm�"yda�e��iU�<��#�4E��҆�[d��$�,�ȅ���䑥�ВOE��Ҏ\�}�XY�0:C���ydiG.�C�<��a29=%�#K;r!�ydi�"B$��4�,���I��҆E�H�)iYڑ-�T4�,�ȅ}*�G�v����ydiG.�oH�G�6�C(�T4�,�ȅ��摥�P��hYڑMo�G6Lo ��p�#�f��S�<�����<�#K;r!�� zdaÕ������S���)�Y��D!��$zdi������鑥/d ���zdiG.�lH�G�v\_hrCQ=��!{J�G�6L"��bzda�B��TL�,l�8��S1=��#��PL�,m���S2=��#j6�#Ke��T\�,�ȅ��쑥���S�=�t|�2{J�G�v�BE�#�_3���t�,�pc�s{�"��$o�ܘ��=Y�r�J��;�����'`�������yj�G�o��I�����u�.��lh��&{dyO6�z��{d��5#ɦ��¢\��TE���m���Rūr��E�УE��҆\H�)�Yڑ��Tt�,=[Nv��*7��B��b{diC,49��9z���q&1���B�9��9ړ�N(�G��Lg���+��/ʅf'�#K;r�u��yz&�f��r�G!�����+�Ƞ(z��Yڐ�=�#K�O��g�<3(ʅ�(�G�v�Br���G���C�V e��d|diÝR{J�G��o��S>��aHFzO���Ҏ�ZI��Ҏ\H�8Yڑy2�#Kr!��$}d��r������4Cq>���ـ�O��HTH�XY�Q3�뫊����!R|J�G�v�Bߔ�XYڑ}K�b}diG.���<�,oy��<��	����|
2H�5�_��)� 9֑	t��c�P��� Y��g �d�di�CW���l�,�ȅ�4�!9�qm!E�p#$�:2��BPBr�!�~JFH�6�@d����my4������5�?E!$�[zw$��,�Ɇ��UY��҆�'H*���hO� �������'x� T\���K��v��-�"��J�U���B���]e��KI@%�*Kb�G(�u����T����!��P��,mh�Tr���#zEq���a�@%�*K;r��}W��,mXɋ��s�����Ź�҆��� �8WYڑ}m��\eiG.$�R��,�ȅ�\�s����Tq�����7Q�*K;r��)�s���P��8WYڐy@%�*G[�6�t�w�c���T������I@%�*K;r��)���]ۼ.~J�X�������,���@!�cY��"駤�ei�8�<\�>���'��S�ǲ�#��P��,m����S�ǲ�#z�U�ǲ�ay?%,K�E!�$��hKρ���A��=��|�b�eiø���A���P��dY:~\�#�d�eiG.�oHY�v�����LI�ҎP}�A�1S/��VIҎ�Of;�f"4�%ͧ�(uP��1ِ�S�[Ҽ%zaU�[�t��	�~f�2�0Zm��-Y���뇟���
S�^A�[�t|*d�Tܖ,�
�>�%�Z�,^vV-�̖,숅��D1[��<����ό��0�}*fK�v���d�$�Ų��f��>���B.�lIҖ\h��b�d骚4����oqC�G �֒��岞?�l�eC�O�k�Җ`H���-Yz��n��gux2�,�}JbK�v�݆����zٯb���/�(̄T��ؒ��\H���-Y��"ۧ$�$iǈ�t��ؒ�%�>�%K;r!5�"�diG.��TĖ,��ZEl�rm��ؒ���W\[����@�O�l���T�ՐĖ,m�H�)�-Y��Bݧ"�diG.��S[��#�}*bK�v�B�F��R�m����g�$��$��U�6�}!���P̰��8D��İ�L��L&��d�|�:&�6tLA��ܳc�v��̥���Tr���Z���g&�Z2E�=3�֑)Hm�!r���}�6<��{�* G�W� �g�k'yG����g#yK��g�G;���=�8�Q=bԞ�Ij6LR�=��[.��g�T�hé�����hG��g��`�%�����`G��g&;bŨ=�"aG��g������7H�K���b����j�6LVi=s�8ڑ+F�[���������P*F�[��юE�AF�\0���Qz�q�%X��3��-�b���`$m	c��UD���1J�\(���̅���P12�\(��b��Oep�a*#��y�Ű��]A&���G��ly<s�8:>�n�|yZ��Ӻ!f�|��hG͈1{�?3��|f1f�\��ю�0H��9:|T��z��O�hǳ� �g.E[r�x=sWG;�� �g.G[�Ř=sS�m�
2{��Dq�aMT��3�sp���1{�sq�#W��37,st����̄"��P1N�ܘLц1y����hK��g.E[r8=s�(��vz��y����v��e��0{#X��jJ����ۛ�Y��#m�����4h�A���|P�jB��t��.
��I7��lv�(rpw��lHd�l�,�-�T�,=�-f+J�VT*�O��I�\��哥g�;��$``���,��2�'Kg��I� /�;Y:&	��l�d�ܽnQ
�����4���,��������#� ѥ����,eQd�R��4�	-��69v�[1Q���+bM���%A�JI���!�F)B+���H�'J2X�tH$�R�U,�J�8�X:$�UK�bf���IS�|P�VdT,q�!ϓ���ؐ1����Ƥ@F��)�� �  I��ӊS��#�_hkn�bِ9G�g�Q,�Y���86��@��CqlH
�]|P�ݫ+�'���Uȫ$�X:d����ˆT+�MҜN4��"S�hq���4hŝbnb�9ydD�\M,s݃�]�3�t��R�:&���V��HQ0�t���F�t��c���^�,�tȵF�Z��c���yŦ��1I��H(�tLt?\�Ĳ!�$�	�$��ɁV�)Z$���6E�!Ƀ��A�ah���E#�t ��p����@s�ڈ�#�s@c�$3��(�$�h<$
�5a��DA IQD�!Qв��R")^���"I�&�k�X4"���hH
t����X:�vJ{�˄86�a	����l�M��� ��Ɂ��5=��L3"�b阫���@4��������#-d�.�aшa�s�K�<�B�����1IН�d��Iq4_��DAߺ�zX:b��o$%MG,S��E���!�<��H���I����vX4dXD
��fH���E���C�*jyK�$����a�$���@�����11�q��ӻ��|����[�·���|zHR�/����j��ƛ���y�]o�{�[۝�O�7W]�A�{2���W�v�������ͻ��o�����ߜ���7��a�pц�����jY�Z��r^8Z���9��v�׫���d�}wy�g�w>�����.G����|<���|v�e���|�����b�]�/7�e1���8n�Z��j�q[k���e[��娞Og�UUp��छ���>�~۽�
RW�~'�������Sї������>;zu��[<;z�������ͮ�M�G鏬�	H���f����������"�R5�QUO��jZ���Оz�~�-m��?�����_w�����6��7o>�v�_P{��ūT�_����n;N�t<�RC����[�^�8�f{�L"�Q5=����w�+��/�n�}��d�?�\������f�:���*������95>Z]^�F?l�_oFW���j���f�C:�N��>k������n;Z������nF?]�Fi�����t��t��8��N�^����˫��:_��.�i�U����_9�7w�>_oF���[.�\u�w���uw��G���PFӡ�r`�N�o)�}�O;9��ۇ�������a��A��ߡ��㑷7�������]�D�P�>�����/�z��-�]!�f
�,�ɢn���'�tM�̪�p!l��y��N�:��@����U���up6�H�zۍA��x����.��]]t�)�iw9:MG�����t�p՝�7��Y:�W���MҠ����Pi�-<��|�����_��݅}^R����]�b�x��z9�]�Կ��jxU�M���wZt+���y�N�i�}ӕ�����b�J�ft֥�T�nKR�5��N��s�w�>�'�jo;�*����.��=k�g{�}�f{�:����E�/�ee��+��^-s�t�GU��pT%Uf�_e�L3^�3E�-���������${6��"S�y4/�E:�/O��~p"l�h�6{�߹��U%n����i�ָw<t�������E;�w5�iל�*�-m����(:��m�7��3�����sc�bLg��:�����ͫ�Y�M���eX�]�w�#�]�Fi,<B�|��z�&P!,<4E�)f}�U=�L�5�T��͂���/���@����Mq!,:7�s��I��&e��d�oM�=���/�wO���������|Զ�c�{����)\(��w����      �     x����N�0E��
�
B�b5r�h�����2T��T��M?�;~'?�h�.pw����k#9c�B��V/���tT7��|1�'����
��q���D
 o4�?��or��;��Q�r�X��2��Ǖ �)�����b�m1�-��g'%��b�]9��F�%����ֳe�B@0,����d֓�)��F��` �㷞L=?�4W��&�)��+�E���Q�CwPв֦�ґͺ-�z�
>�n�DR&W��&�ϖ����N+vV�Ѓ��P�R      �   
   x���          �     x��X�n1��)����&����l���`� $D��ȁ��c�N��N�in�������癨�I[e��L����O���o>_��r{��Ûo�7Y��.{p��Q6�
(+Y�BI�����Z�-,�������0���Ttx�(������gG�}��#� V��Iʦak>��$�HW�P�����$>��?���º��v!]L>�rh�R����%��-J'���p�gIh�*ӟ��q�)Ȫ�K� �ߡ�Cx��'d�M���b������2��{l3�I���d�Y�"���8]-����i[�m���,F��n��,��
�s��~��*�*��!��	���ݨ\i(�����L��T��0w#�Xeu1��M&o�W�JU���S�M�>!J�\���>�e��ZX$���ը�#|�禘���y\⫘X�b�`I1��9韤7	ȭ��8t�4v�Jar�2ϣ��9=�C�C�j�u�U����o�q��ID'��C�4��[�������\p�5�-�s�X�����(H)�6ք���M:����v��?I��b"��i��v��K2"�0�Q��^{#|e�W�D�h >��D��fKi���U�9�a�zu �ڋ�nH�n�0E�`1Z�N�~��"�����Q�KM�]7�o�n埃����KM��)�-��
�Kۤ�F��?�tO�#�x���H&�|�]U��Ŵ��D�,R�%�|M�����j�Z�P���k�l/�p�b�J�i��j�8V,��ե��~b�.������~��Ibg9p��Ҵ� ~���X�W���:n9�]��4ܿ�f$N�5A@��7sag;�!��>\q������N���)����r�r����s����,s������$aD�5@�8&�6�{;n8��$�OA��*D�2��������y#e��9�4�;�2y�'�M(��+�l��!���Z��te��ģ��/����O��}S?�=��B�:ZĞ���Gc׆�@��7P��|�FXGG ��T      �   u   x���v
Q���W((M��L�K��K������Ws�	uV�P7426153��T�QPr�Sp�Q�rr9��20251 )20��0t�I{�9x���:z��9���J�JS5���� #� 5      �   �   x���M�0��~EoS���I��4�`at���;""��7�=��B�C��P��Q>4��ͧ�y��x�z��E�j��Ag�2&��р:NT|(�ʻ�8YP�n�E���<����A��>�6h���Tf� `��}%ɏ��2�傡]���&���� c�      �   �   x����j�@�{�bo�efvf��S�"��5^%J)�""�I�H}1�xR�& {��]>��2�'��+�������hs���4�]���ݲ���ܽ`�� ����2N�XX)`G�!�!�����*fVź�2G�c��<9 �a<���kRvX�4��/�E�� yO �,^�z
�M=�3�rUa/��M���o�C����!�H;c�x� @|�?�9�"t	���0&��ۿ'      �   
   x���          �   �  x�Ŕ�N�0��{
�҆��'�d��4.M�G�IH����#��pڑv	��к��Ͽ/N�:]x �V�7{��w��O�DSj;�BK�A[8a�~Y����'�d�̆�(�i�5��*O�jH9c��ّ����2\�6�bN(�՝�2�gd�?��5�&ճ��qu%�����}ͅ*(9_��%hN)T��E���
I��1��D��d�er���B��|�;X����.%�"dM��r���m�ϹE&-ќ�$�^�VYV�Z"�<�̺!����yR�ӵS[�0�9J�?M��ՠ�A)fI
�(�9l��B �E� .�r�$��P�7�1�u%ϥN�)��b:���H;��0J6�AW����֯�.��Ve�ae�� �#K�������������:l ��p&�����<�8      �   �   x��ҽ
�0�Oq�
E���ګjR�4�$UT���'�#��Luq����s�;.4*\	e}z���kQ=�c��
�,�PC?𡗲��]�X��|xU�e���_|�QL���3j��D����FR��a�14ܒ���p���r�}Y��D�!���(��r�{�{^}��Y�=���8<�!c��      �   5  x����J1��>EnUq[�-�Z�eA�t���&c	���d=��fR����1��4�v��T��ޔ��շ�Ӗ��/^w�V]�7j��p�qt�T5��q6Kp���'y�3$<P���IK�3%��'�L>����uVz�)�]!x�Qy
JS ���p�y�/|=�����pe�+�!'�t^
8kt��jۋ�Ș�b��8@?]�Qi\�!�9%�ĵ�nzv������e{QKfEDO.B�Qq%�GeQ�Ɯ��z��0RY���ۘ�+����m�<90���|���_�eƚB���-7��      �   }  x�͛�n�8����eVJW`�C܎+�3&D3���T��V3+��c��j�/��	4�`����&��p8��a���l�bK�����ϯ�����߽�+\z�so�F���l��?�lE
�'�� L`�T���d�"�<�����?�{E���׷3y�����l������o?�g�'K����!6��r6�F��+����[���S��8���'m��B������W�d�!�i�C0�y�Ƽ�ۑ{��b���.1	3��8��p��?t@#�8�z�/�&�)#�3��>���-��aT� �暯���1�rh�j�����!��P�e$�� 4��8�� �ZDN:�YN-��RҾF��'5sb=mb��׌�]T�w���>p^� ��!l`/��n�і���*�B�����ތh�2PG�&}l�@(�e���0R�
���U�B��m_~fU�oHn�;�������_R����P���JT�ޭafՇQ�ﴭ�
_0�(����В�=���y٩;�>,�I��,C+��g\�!��7c�ׇ5�2�XOF*�~����~}�1c�vG��B� LB#
B�+��tH���"���X5��l;����4�Q�t��Y(���1�	�Ң���6�uAkTv)�� -�I}\�\n����qר������f���t�r���=�W��0<H��A��-%Ԉ��cY��n*CحY�
��k�$���_g�'����Z��.�,�ܼ�@[�-q
E�u	��,Qs�
d�LԠv+(5�-���Kj8�=8(D@3�>u�Ϧ�:l"����_��R�;�fk�@����AOȦO�d�-n���D	ZcB˸��tCӴWSQ`�^��&5����KS�Z�O�Ԝ�z�Q[�hf�'Pe�Qt�O���	�t^��*�ӀT�a�(}��/O��k����I�)g��Z͗X����I�ɤU(�@(C����aK��d �7w�-Ȩ��E�D䞹���f�'Qәlvg��45s�7�4�6��-5���I��������x�'C՝"&���뱸��0Xms%@�	^]{b�J:e*���ו��"g�L>&���`8����D���ĎR�8�_� 䌩�w��\]��9��| ۟@�&њ{ǐȆAGQ<ޥeO�Z�"�5fp��쎟m����[�EA��pW��V.�@��l�Wana�s���ܢ�9�K�'���ċ�'` �jHg`�8��H0��	��� �D�'��E^����%��Wo)0$��ߌ{H��4t�^5��ѡ�I�2�ד<��q0`u��41����n����5�W���
ɫ����ƕ���F�v����ġe�V�5bK���7�����5���:�I:���;u*�Ks���;�O�Umqu�M_��U���n�������j<Wr���g��g�hg`f�?��.�\��B�eB���h�!y�,Lu�!m�Hm�Uj���n*���#{�3�0���o؜��C�K����yh*y�γ��V��-���jO��Z��2�KŨxM��8�-���������5g�{k���P@,����U������1m������&I8X���>Rʔ��T� ۿIJ�䔈y9�:rR�}y�n��+�>�����/K      �   e   x���v
Q���W((M��L���+I-J-Vs�	uV�0�QP��r���W�Q0�Q()*M�����[X�kZsy6�����7��/n�!vӸ� Io)�      �   
   x���          �   �  x����n�0E��
�M R���#����a%�.-�(P�A���P+M��2 k(i8�w.)�8d�6{|����כǇ�_?�gGP�p���x�O���l��&�n@�-���G�o?�����j�����ÇO+�_ukN*ޔa�V�� Dh]�;i�"V��^�w9#�*I�IJB�7;;h������ɼ~'�p�40/��:N��nJ�cb����u]��4��5z��
~�%���(�\��E�7�T1�W`�0�U��#����w��K=��(�f�pS��E UA�z��֯}؅�	�E��e�׌3_�e��Vk���[s�xK`���r�%gޣi�h���/�aE�j?��Pb��88���g���aX�D�	X�'�1Y�}
m�u�PJBS�Ao����{���
-��_[�f �D[FKlK �yZ
��gD]�����x�@��XN��B�۷����9���@iĹp.~���3�S'���)��}7�V �֔Y      �   �   x����
�0E�|E�*��%�%/89tH[��t��;;����=�����:u�M�����S�s���y����h{�k�#��9襮�����(�C6 A�a�`I�"q�"e�e&+c}�D��Ft�Y���LyK �
��*����<      �   �  x��U�n� }�W�Mj+��M����PaH���=n�äI��u���}Sl���I�'E�8�s�E۠|C�m������������헻��wҁiU of7��(+1;'3��{�5Ļ q,c�2�x�����kj��R�:���=�h�@��^ Q��H0F*Ȇ�9B~<<n߾;�Mn�-����o��	�Y)_�ua`X	�i���34���C�,Q�����)v�d�,x��jΓ�2�T68�s�S�h��"!!�Y޴`��b�R;������^5���[�A#.*�(;�����X(	�R�{��he5I�\�ནA=�rP�4��Va'S�+��4��y�z/�hj����T̲�Y�GE��Nd���v�9�UǞ]+�?��u X�T����R~h�t�/J��<��:��[zり_�ze�7��9�w��R��J.�ĕ`M�W�ҍiű���-S�k�)t�<tZ�eX#T!����Ieh[����Z�{�'�Ň.z�)Vz�Z[??5Z����b�Nô@�z�I��K)?YP|𗬔hc7h(P�y)���%���O�F�!��-�bdT�"��ZlN���Mb�<���ί�Q�ٳ�i�Y~4y���i���eQ�ɋ��H�]i����~8y����0:���7\6>      �   +  x���;k\1�޿�vN�	i�R�XĎ[�[,8�����R�f�́�?��s�j������ݶ���������>�������ǧ������|:��/����뷟׷�������S2z�����?��V-,}h
k�V{���xa:�q+Lbes�T(�i`�R(�Ms�z�V%c�����1ܢ��{�Qq���.�B�g��� �����(�SvM��lA
��4@�Hc��F����� :E���ZB�g��k������Zi��Ge� G ��@��Bˏ��]��:{ �x���D���ԥN�5� g�x-0��m�@a�0� ӣu� Y���ei�3���\]$��Z �̱���%���W ��YC���c�V�p�*)��[%� �R���C�� �-�\� ɕف�J��c��Jw��� kZ�� YSZ�G-�5m�����5� YSu�5���SR�� w���V\��h-�*��Ŵ��fmi��/�7�3.8�� �3;� ��Cdn�� ���l��Y�����8������      �   
   x���          �   �  x��Y�jA��+���vg�IN9� �N�&"�%�����Y}@��6>u�55������������e���������v~��_~��{���.����v������iz���P�)-�y��p�_�  |P2�6O�B��P �<E�@�?�q�����<�C%��^�ov��^�*���}B� ����D�Ą%#I���  �[F1�ej��r�Y��oz�(m[���R)`!��*�Q2��\H��ʲ�(�@�d�!�ad�UK�)��f���4f&�-$zv�jrHr�V��e�nd��Hݯ���*;A#�v9.�ĭr	�f*����-�o	����*���4jr�QHϴ_1�IKъ�z�luN,U�+G�*˾�!�� ��P�d}��]X��P�i]�4�usG�ȫ?Й�E���r����kcD�|[��ir9�ց��R�!"=%-CDRt���j��qx��ҳ[p���E�B�HӴWWG���C��eݲ_~�Cu����d�o��^xbƎ(�����i��܋&�4�e���,�!�>���&s���j�)�e��u�4�ǀ����6�^�5c�۟4����؄- j��� ϲ��/Ȣ܅U�mAK�-��/U�k@��>�p/�6
2�Y�
�/�BE�����ٖ�
�V[f+�[f+7��n2
��]�TxW���[ǎb�KA�瓆���Ѽ!�f3�������f�mC�d�'`�mcۮ�A��Ƈ�2ޣ����ΰ��$p�]A�����3������      �   
   x���          �   
   x���          �   �   x����
�@���<�Y\�)��V-\�BZ[1u1�P��z�����wq\Q���K�����n�C�ͯ���&߷=^��3��������LC����i�Q�4�$`z0����D��ê���8<`�N���Lh��N      �   �   x��ս
�`��W�
"��'��`�k�R� m�~�/$�A82�SRVuqm\Y57��k����ǥo�a�ڧ�a��t���`�l�������Ek��y�H�/k0�&�`����4��s^��1�b!j�q��b`d@4C�����(FD;0< ��#D=bz��k�gC�#�G�z���/=A��v      �   �  x���;k\W�{������獫.B���'V!�P����H3k5!�Rq?�c�^�q����|�]\}�}w����7�z�p�����Ï��߾���y{s}�����?�/�]~��q�6���|9�-F[�ͻ��߹�v����\}��<��������g��L�R���&�)LnsΑm���p�3�����U�Ӟ8��-��m�?s�Z%��3�q���j�?u0������Բ�;�z޶�5�õ^'�gPԶ��=8�� =��8���HH�(҄��q�B4U��d!��\@�C�. m��Z�:��HrS�KH2T�2����@d�KH ��%$��mA��]�(!}ȡJ��>�T%JHr��AQ\ (R��H�J��b������m�����Q�n�G���4%`` �/
�%I�v�b@�c�HՎ�"5[dVj�5Q�a7�Eu��Q�e�9�����d�Z�(�[�S6W��
y��
A��>Y!�׬B���� ��U 0�1�8eh�݊�	���1Q�&�
��ޥ܁����v��� FZ�$��i#�m�Gښ(R�c�����y��
����;�4��Q�c~�k!�<� N�/���(�� 0�� 0�%��Q�@*���#M�y�i=���@`$+@4��/�/0RQo��_&�*2���a ks6��/+Qb�ek��H6kcp�05��i��#Y��Q�1��!8R�����u�Qa(S�N�n6��L+:5�3��
��v��ȡtn�#�\D�f8C#8��\S�m�d}�$���lZ���,��P:?�)�����P��W�f��P��e��s��6C� v��R�$6F*V��W*Z��H���U*V��P�J]G�76�^�I�������.��0���reU]G��Ǡ���]r(mzp$���+;^�:*5��0�ң�H�^���<_�:*e���
�T��(���J��f�e՛K�2��H�j��
�I��G��cRV����P&��݆�9�iŤ�f�W�8���5)8�¡,�؇�Vp(��Ĥl�i,�E�1��eN*�{{�C]���ns(��^TT<�f�|�C���E�ʦ�
�dߥZT�?�g���C�`ŢB���#��XT��j*8�����K��H�,*�/S
�d�Ǣ�jr(���¾�dJ��lkQ�އ59�I��T%��M�Dm�+�s�v)�2� Y�0Y�1Q�Y�	Yj/����_�fp      �   
   x���          �   @   x���v
Q���W((M��L�+J-.��+NL�IUs�	uV�P�5�u����TMk... d��      �   �   x���v
Q���W((M��L�+N�K���Ss�	uV�0�QP��	qT�Q0�Q0202�Q0
��R�R2S�JRA�Ó}��5��<	�k��\C�j������0�-0�f��7��pj����F�����&��k�=<(7؂Fa��\c�E ��@�A@�����1a�l ��:      �   �   x���A
�0E�=��Tb�j��@���IM�.܈Z�"�1z*/f�rk���|��k$����>�۴k�׹6���
E��c������3dG�w�l#��0w���2���A�����p~�xߑF�D0�ؕ��Pf����}ߖ�
��������J[.�	V�N�'���	���9J�_;8�iR?<��dV��      �   M   x���v
Q���W((M��L�+�,ȏ/-.M,��Ws�	uV�0�QPwt����	rt�R�Q()*Mմ��� <�      �     x��Y��7��W�mXLK�*��i��aaq��|t�!�����+uO�����3�?���^���_�>|<=������_���ۻ�?�~���������黰���}X�{� J1E���%�������)���������n	I�W��p��M����uQ��� ��~�L�]�@ԡ<!���^���� ړ�EE�HYh=@;߄���������a6�%{�Q!^0�xǖd5�d/"!��������m؈[<n1X�7**�%�y�7kI���=;���K��۰7���h��[�����n�J0��|�V}8�m؈��q�ھ;EG�|�$�#�9K:b?��M�G�Qf���[G۰�:[0�6l�;z�K�a�ju"�A'q�Xv'٦-�[,�pv����C���
���%_�>���r2NR=j��`g�^�ng(/Ј1�3�8�2B���E���2�'t!�.�JZ�W��	E�t��8�7BI-�t��nl�$h��c�>&``{���3�-��ܕ���6e���+Y�3Hd6���TƱ����ߛ�\&����Gm���u}�|�	`��6s��#��x9?�'��z�PJI
�Pw��@�|2�4�bmI�����`r'e�$ӌ���T��$bG���Q�,��fd8�B�Ȁ�,y����)#������2� �5)W��Vz���E�Ǒ�aV�l"�2������|��sH��;�D*'�4����:hPHv.o�Ʊ}�w�>��x�A��|8�qdx/�c��	������lͰ��ug"%�ls�;�e4M�c�ә�c�B
���ɴ&t�,��,�O�8�RMIui&f�����9ל[b4��g޸�^k��K-��	<Aܩ�{�S�TRs^�pl�I�ת!��R-��m˴b1i��ޜ�U�e]"�Ty����u: �J0�Xj�u��8{VV�Xd�	:R�����`������]��bgtO�cS�&�����~p1�d/�[����G�ڙA� +�)z��[�EEK�d�a��^W���m�NXF'��W�	���ud��;t��+��u��������#��5�>�ڡ��_n��s䄕L.�Zt��w�ꪮq�0c#��"�,��\X��=-���F�N&`���zZ嬺��
u'��@S��	�h�$kFڟqh�T�
X�a��I�f�6�U�Xꕈ��N�֠�߸�F-��m:� ���e�"�kAU`�K��:�d�?�QX��l�o��)~
��uߝ?�b5�����YPwIW-��Ì�#�2���0RDs WI�n�f�<��&�KL�Ԕ	�9�\���a&c���e�}�%n�7��D�a尷�Ŏ��۞���K	�tG�����=���ǱeR�zC��7OՎ��[A�wp����k�ˣ�н�<���q�e�X��i'��9Gu��9:�1c�J���ޟ1Y���3.;�@n`[����<n2):G�3�h$�K�	M���K�q1�f4<��k~#A�\�ؗ	����m�[�;�o���ݿ���7      �   �   x���v
Q���W((M��L�+-.M,��Ws�	uV�0�QP��K/J-N,R�H��LLM-�M�͓,�L�M�̒�,�-�ӌ���S@j
�R�K�JAl����N�� y@J�JS5���� Z(�      �   
   x���         
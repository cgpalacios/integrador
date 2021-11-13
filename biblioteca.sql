-- Generado por Oracle SQL Developer Data Modeler 21.2.0.183.1957
--   en:        2021-10-23 14:00:34 ART
--   sitio:      Oracle Database 11g
--   tipo:      Oracle Database 11g



--CREATE DISKGROUP DATA ;

--CREATE SMALLFILE TABLESPACE tbs_biblioteca_data
 --   DATAFILE '+DATA' BLOCKSIZE 512
--LOGGING ONLINE
  --  EXTENT MANAGEMENT LOCAL AUTOALLOCATE
--FLASHBACK ON;

--CREATE SMALLFILE TABLESPACE tbs_biblioteca_indx 
--  WARNING: Tablespace has no data files defined 
 --BLOCKSIZE 512 LOGGING ONLINE
  --  EXTENT MANAGEMENT LOCAL AUTOALLOCATE
--FLASHBACK ON;

--CREATE USER cristian IDENTIFIED BY oracle_4u
   -- DEFAULT TABLESPACE tbs_biblioteca_data
   -- ACCOUNT UNLOCK;

-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE cristian.autor (
    id_autor         NUMBER(10) NOT NULL,
    nombre           VARCHAR2(30) NOT NULL,
    apellido         VARCHAR2(20) NOT NULL,
    dni              NUMBER(10) NOT NULL,
    fecha_nacimiento DATE,
    nacionalidad     VARCHAR2(20) NOT NULL
)
TABLESPACE tbs_biblioteca_data LOGGING;

CREATE INDEX cristian.idx_aut_id_autor ON
    cristian.autor (
        id_autor
    ASC )
        TABLESPACE tbs_biblioteca_indx LOGGING;

CREATE INDEX cristian.idx_aut_nombre ON
    cristian.autor (
        nombre
    ASC )
        TABLESPACE tbs_biblioteca_indx LOGGING;

CREATE INDEX cristian.idx_aut_apellido ON
    cristian.autor (
        apellido
    ASC )
        TABLESPACE tbs_biblioteca_indx LOGGING;

CREATE INDEX cristian.idx_aut_dni ON
    cristian.autor (
        dni
    ASC )
        TABLESPACE tbs_biblioteca_indx LOGGING;

CREATE INDEX cristian.idx_aut_fecha_nacimiento ON
    cristian.autor (
        fecha_nacimiento
    ASC )
        TABLESPACE tbs_biblioteca_indx LOGGING;

CREATE INDEX cristian.idx_aut_nacionalidadv1 ON
    cristian.autor (
        nacionalidad
    ASC )
        TABLESPACE tbs_biblioteca_indx LOGGING;

ALTER TABLE cristian.autor
    ADD CONSTRAINT pk_aut_id_autor PRIMARY KEY ( id_autor )
        USING INDEX biblioteca.idx_aut_id_autor;

CREATE TABLE cristian.clientes (
    id_cliente       NUMBER(10) NOT NULL,
    nombre           VARCHAR2(30) NOT NULL,
    apellido         VARCHAR2(20) NOT NULL,
    dni              NUMBER(10) NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    direccion        VARCHAR2(30) NOT NULL,
    celular          VARCHAR2(15) NOT NULL,
    email            VARCHAR2(30)
)
TABLESPACE tbs_biblioteca_data LOGGING;

CREATE INDEX cristian.idx_cli_id_cliente ON
    cristian.clientes (
        id_cliente
    ASC )
        TABLESPACE tbs_biblioteca_indx LOGGING;

CREATE INDEX cristian.idx_cli_nombre ON
    cristian.clientes (
        nombre
    ASC )
        TABLESPACE tbs_biblioteca_indx LOGGING;

CREATE INDEX cristian.idx_cli_apellido ON
    cristian.clientes (
        apellido
    ASC )
        TABLESPACE tbs_biblioteca_indx LOGGING;

CREATE INDEX cristian.idx_cli_dni ON
    cristian.clientes (
        dni
    ASC )
        TABLESPACE tbs_biblioteca_indx LOGGING;

CREATE INDEX cristian.idx_cli_fecha_nacimiento ON
    cristian.clientes (
        fecha_nacimiento
    ASC )
        TABLESPACE tbs_biblioteca_indx LOGGING;

CREATE INDEX cristian.idx_cli_direccion ON
    cristian.clientes (
        direccion
    ASC )
        TABLESPACE tbs_biblioteca_indx LOGGING;

CREATE INDEX cristian.idx_cli_celular ON
    cristian.clientes (
        celular
    ASC )
        TABLESPACE tbs_biblioteca_indx LOGGING;

CREATE INDEX cristian.idx_cli_email ON
    cristian.clientes (
        email
    ASC )
        TABLESPACE tbs_biblioteca_indx LOGGING;

ALTER TABLE cristian.clientes
    ADD CONSTRAINT pk_cli_id_cliente PRIMARY KEY ( id_cliente )
        USING INDEX biblioteca.idx_cli_id_cliente;

CREATE TABLE cristian.copia (
    id_copia     NUMBER(10) NOT NULL,
    codigo_copia NUMBER(15) NOT NULL,
    estado       CHAR(1) NOT NULL,
    id_libro     NUMBER(10) NOT NULL
)
TABLESPACE tbs_biblioteca_data LOGGING;

CREATE INDEX cristian.idx_cop_id_copia ON
    cristian.copia (
        id_copia
    ASC )
        TABLESPACE tbs_biblioteca_indx LOGGING;

CREATE INDEX cristian.idx_cop_codigo_copia ON
    cristian.copia (
        codigo_copia
    ASC )
        TABLESPACE tbs_biblioteca_indx LOGGING;

CREATE INDEX cristian.idx_cop_estado ON
    cristian.copia (
        estado
    ASC )
        TABLESPACE tbs_biblioteca_indx LOGGING;

CREATE INDEX cristian.idx_cop_id_libro ON
    cristian.copia (
        id_libro
    ASC )
        TABLESPACE tbs_biblioteca_indx LOGGING;

ALTER TABLE cristian.copia
    ADD CONSTRAINT pk_cop_id_copia PRIMARY KEY ( id_copia )
        USING INDEX biblioteca.idx_cop_id_copia;

CREATE TABLE cristian.copia_por_prestamo (
    id_copia        NUMBER(10) NOT NULL,
    id_prestamo     NUMBER(10) NOT NULL,
    cantidad_copias NUMBER(5) NOT NULL,
    descripcion     VARCHAR2(30)
)
TABLESPACE tbs_biblioteca_data LOGGING;

CREATE INDEX cristian.idx_cpp_id_copia_id_prestamo ON
    cristian.copia_por_prestamo (
        id_copia
    ASC,
        id_prestamo
    ASC )
        TABLESPACE tbs_biblioteca_indx LOGGING;

CREATE INDEX cristian.idx_cpp_cantidad_copias ON
    cristian.copia_por_prestamo (
        cantidad_copias
    ASC )
        TABLESPACE tbs_biblioteca_indx LOGGING;

CREATE INDEX cristian.idx_cpp_descripcion ON
    cristian.copia_por_prestamo (
        descripcion
    ASC )
        TABLESPACE tbs_biblioteca_indx LOGGING;

ALTER TABLE cristian.copia_por_prestamo
    ADD CONSTRAINT pk_cpp_id_copia_id_prestamo PRIMARY KEY ( id_copia,
                                                             id_prestamo )
        USING INDEX biblioteca.idx_cpp_id_copia_id_prestamo;

CREATE TABLE cristian.libros (
    id_libro         NUMBER(10) NOT NULL,
    titulo           VARCHAR2(30) NOT NULL,
    anio_publicacion DATE NOT NULL,
    editorial        VARCHAR2(20) NOT NULL,
    genero           VARCHAR2(20) NOT NULL,
    catidad_paginas  NUMBER(5),
    id_autor         NUMBER(10) NOT NULL
)
TABLESPACE tbs_biblioteca_data LOGGING;

CREATE INDEX cristian.idx_lib_id_libro ON
    cristian.libros (
        id_libro
    ASC )
        TABLESPACE tbs_biblioteca_indx LOGGING;

CREATE INDEX cristian.idx_lib_titulo ON
    cristian.libros (
        titulo
    ASC )
        TABLESPACE tbs_biblioteca_indx LOGGING;

CREATE INDEX cristian.idx_lib_anio_publicacion ON
    cristian.libros (
        anio_publicacion
    ASC )
        TABLESPACE tbs_biblioteca_indx LOGGING;

CREATE INDEX cristian.idx_lib_editorial ON
    cristian.libros (
        editorial
    ASC )
        TABLESPACE tbs_biblioteca_indx LOGGING;

CREATE INDEX cristian.idx_lib_genero ON
    cristian.libros (
        genero
    ASC )
        TABLESPACE tbs_biblioteca_indx LOGGING;

CREATE INDEX cristian.idx_lib_cantidad_paginas ON
    cristian.libros (
        catidad_paginas
    ASC )
        TABLESPACE tbs_biblioteca_indx LOGGING;

CREATE INDEX cristian.idx_lib_id_autor ON
    cristian.libros (
        id_autor
    ASC )
        TABLESPACE tbs_biblioteca_indx LOGGING;

ALTER TABLE cristian.libros
    ADD CONSTRAINT pk_lib_id_libro PRIMARY KEY ( id_libro )
        USING INDEX biblioteca.idx_lib_id_libro;

CREATE TABLE cristian.prestamo (
    id_prestamo           NUMBER(10) NOT NULL,
    fecha_inicio_prestamo DATE NOT NULL,
    fecha_fin_prestamo    DATE,
    descripcion           VARCHAR2(40),
    estado                CHAR(1) NOT NULL,
    id_cliente            NUMBER(10) NOT NULL
)
TABLESPACE tbs_biblioteca_data LOGGING;

CREATE INDEX cristian.idx_pre_id_prestamo ON
    cristian.prestamo (
        id_prestamo
    ASC )
        TABLESPACE tbs_biblioteca_indx LOGGING;

CREATE INDEX cristian.idx_pre_fecha_inicio_prestamo ON
    cristian.prestamo (
        fecha_inicio_prestamo
    ASC )
        TABLESPACE tbs_biblioteca_indx LOGGING;

CREATE INDEX cristian.idx_pre_fecha_fin_prestamo ON
    cristian.prestamo (
        fecha_fin_prestamo
    ASC )
        TABLESPACE tbs_biblioteca_indx LOGGING;

CREATE INDEX cristian.idx_pre_descripcion ON
    cristian.prestamo (
        descripcion
    ASC )
        TABLESPACE tbs_biblioteca_indx LOGGING;

CREATE INDEX cristian.idx_pre_estado ON
    cristian.prestamo (
        estado
    ASC )
        TABLESPACE tbs_biblioteca_indx LOGGING;

CREATE INDEX cristian.idx_pre_id_cliente ON
    cristian.prestamo (
        id_cliente
    ASC )
        TABLESPACE tbs_biblioteca_indx LOGGING;

ALTER TABLE cristian.prestamo
    ADD CONSTRAINT pk_pre_id_prestamo PRIMARY KEY ( id_prestamo )
        USING INDEX biblioteca.idx_pre_id_prestamo;

ALTER TABLE cristian.copia
    ADD CONSTRAINT fk_cop_id_libro FOREIGN KEY ( id_libro )
        REFERENCES cristian.libros ( id_libro )
    NOT DEFERRABLE;

ALTER TABLE cristian.copia_por_prestamo
    ADD CONSTRAINT fk_cpp_id_copia FOREIGN KEY ( id_copia )
        REFERENCES cristian.copia ( id_copia )
    NOT DEFERRABLE;

ALTER TABLE cristian.copia_por_prestamo
    ADD CONSTRAINT fk_cpp_id_prestamo FOREIGN KEY ( id_prestamo )
        REFERENCES cristian.prestamo ( id_prestamo )
    NOT DEFERRABLE;

ALTER TABLE cristian.libros
    ADD CONSTRAINT fk_lib_id_autor FOREIGN KEY ( id_autor )
        REFERENCES cristian.autor ( id_autor )
    NOT DEFERRABLE;

ALTER TABLE cristian.prestamo
    ADD CONSTRAINT fk_pre_id_cliente FOREIGN KEY ( id_cliente )
        REFERENCES cristian.clientes ( id_cliente )
    NOT DEFERRABLE;



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                             6
-- CREATE INDEX                            34
-- ALTER TABLE                             11
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        1
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        2
-- CREATE USER                              1
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 1

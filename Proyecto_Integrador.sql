USE master;
GO

IF DB_ID('Gestion_Matriculas') IS NULL
    CREATE DATABASE Gestion_Matriculas;
GO

USE Gestion_Matriculas;
GO


CREATE TABLE dbo.ESTUDIANTE (
    id_estudiante  INT IDENTITY(1,1)  NOT NULL,
    documento      VARCHAR(20)        NOT NULL UNIQUE, 
    nombres        VARCHAR(60)        NOT NULL,
    apellidos      VARCHAR(60)        NOT NULL,
    correo         VARCHAR(100)       NULL,
    estado         VARCHAR(10)        NOT NULL CONSTRAINT DF_ESTUDIANTE_estado DEFAULT 'Activo',
    CONSTRAINT PK_ESTUDIANTE PRIMARY KEY (id_estudiante),                         
    CONSTRAINT CK_ESTUDIANTE_correo CHECK (correo IS NULL OR correo LIKE '%_@_%._%'), 
    CONSTRAINT CK_ESTUDIANTE_estado CHECK (estado IN ('Activo', 'Inactivo', 'Egresado'))
);
GO

CREATE TABLE dbo.PROGRAMA (
    id_programa  INT IDENTITY(1,1)  NOT NULL,
    codigo       VARCHAR(10)        NOT NULL UNIQUE,
    nombre       VARCHAR(100)       NOT NULL UNIQUE,
    CONSTRAINT PK_PROGRAMA PRIMARY KEY (id_programa),   
);
GO                         
    
CREATE TABLE dbo.DOCENTE (
    id_docente  INT IDENTITY(1,1)  NOT NULL,
    documento   VARCHAR(20)        NULL UNIQUE,            
    nombres     VARCHAR(60)        NOT NULL,
    apellidos   VARCHAR(60)        NOT NULL,
    CONSTRAINT PK_DOCENTE PRIMARY KEY (id_docente),                             
);
GO

CREATE UNIQUE INDEX UX_DOCENTE_documento
    ON dbo.DOCENTE(documento)
    WHERE documento IS NOT NULL;
GO

CREATE TABLE dbo.PERIODO_ACADEMICO (
    id_periodo    INT IDENTITY(1,1)  NOT NULL,
    nombre        VARCHAR(20)        NOT NULL UNIQUE,         
    fecha_inicio  DATE               NOT NULL,
    fecha_fin     DATE               NOT NULL,
    CONSTRAINT PK_PERIODO_ACADEMICO PRIMARY KEY (id_periodo),                    
    CONSTRAINT CK_PERIODO_fechas CHECK (fecha_fin >= fecha_inicio)               
);
GO

CREATE TABLE dbo.ASIGNATURA (
    id_asignatura  INT IDENTITY(1,1)  NOT NULL,
    nombre         VARCHAR(100)       NOT NULL UNIQUE,
    id_programa    INT                NOT NULL,      
    id_docente     INT                NOT NULL,      
    CONSTRAINT PK_ASIGNATURA PRIMARY KEY (id_asignatura),
    CONSTRAINT FK_ASIGNATURA_PROGRAMA FOREIGN KEY (id_programa)
        REFERENCES dbo.PROGRAMA(id_programa),                                    
    CONSTRAINT FK_ASIGNATURA_DOCENTE FOREIGN KEY (id_docente)
        REFERENCES dbo.DOCENTE(id_docente)                                       
);
GO

CREATE TABLE dbo.MATRICULA (
    id_matricula     INT IDENTITY(1,1)  NOT NULL,
    id_estudiante    INT                NOT NULL,      
    id_programa      INT                NOT NULL,      
    id_periodo       INT                NOT NULL,     
    fecha_matricula  DATE               NOT NULL, 
    estado           VARCHAR(12)        NOT NULL,
    CONSTRAINT PK_MATRICULA PRIMARY KEY (id_matricula),                          
    CONSTRAINT CK_MATRICULA_estado CHECK (estado IN ('Activa', 'Cancelada', 'Finalizada')),
    CONSTRAINT FK_MATRICULA_ESTUDIANTE FOREIGN KEY (id_estudiante)
        REFERENCES dbo.ESTUDIANTE(id_estudiante),                                
    CONSTRAINT FK_MATRICULA_PROGRAMA FOREIGN KEY (id_programa)
        REFERENCES dbo.PROGRAMA(id_programa),                                    
    CONSTRAINT FK_MATRICULA_PERIODO FOREIGN KEY (id_periodo)
        REFERENCES dbo.PERIODO_ACADEMICO(id_periodo)                             
);
GO


INSERT INTO dbo.ESTUDIANTE
    (documento, nombres, apellidos, correo, estado)
VALUES
    ('1001234567', 'Ana María',   'Ruiz Patiño',      'ana.ruiz@gmail.com',        'Activo'),
    ('1002345678', 'Luis Felipe', 'Gómez Arango',     'luis.gomez@gmail.com',      'Activo'),
    ('1003456789', 'Sara',        'López Cano',       'sara.lopez@hotmail.com',    'Activo'),
    ('1004567890', 'Mariana',     'Castaño Duque',    'mariana.castano@gmail.com', 'Activo'),
    ('1005678901', 'Juan David',  'Pérez Londoño',    NULL,                        'Activo'),
    ('1006789012', 'Valentina',   'Agudelo Mesa',     'vale.agudelo@outlook.com',  'Egresado'),
    ('1007890123', 'Santiago',    'Hoyos Betancur',   'santi.hoyos@gmail.com',     'Activo'),
    ('1008901234', 'Marcela',     'Quintero Salazar', 'marce.quintero@gmail.com',  'Inactivo'),
    ('1009012345', 'Andrés',      'Muñoz Toro',       'andres.munoz@gmail.com',    'Activo'),
    ('0012345678', 'Laura',       'Gómez Rendón',     'laura@gmail.com',           'Activo'),  
    ('1011234567', 'Camilo',      'Vargas Ochoa',     NULL,                        'Activo'),
    ('1012345678', 'Daniela',     'Ramírez Úsuga',    'dani.ramirez@gmail.com',    'Activo');
GO

INSERT INTO dbo.PROGRAMA
    (codigo, nombre)
VALUES
    ('TDS', 'Técnico en Desarrollo de Software'),
    ('TSI', 'Técnico en Sistemas Informáticos'),
    ('TAE', 'Técnico en Diseño Gráfico Digital'),
    ('TDG', 'Técnico en Asistencia Administrativa');
GO

INSERT INTO dbo.DOCENTE
    (documento, nombres, apellidos)
VALUES
    ('43123456', 'Marta Lucía',  'Restrepo Gil'),
    ('71234567', 'Jorge Andrés', 'Zapata Mejía'),
    ('32987654', 'Diana',        'Ospina Vélez'),
    ( NULL,      'Carlos',       'Montoya Ríos'),
    ('42782400', 'Paula Andrea', 'Henao Cardona');
GO

INSERT INTO dbo.PERIODO_ACADEMICO
    (nombre, fecha_inicio, fecha_fin)
VALUES
    ('2025-1', '2025-01-20', '2025-06-13'),
    ('2025-2', '2025-07-21', '2025-12-05'),
    ('2026-1', '2026-01-19', '2026-06-12'),
    ('2026-2', '2026-07-20', '2026-12-04');
GO

INSERT INTO dbo.MATRICULA
    (id_estudiante, id_programa, id_periodo, fecha_matricula, estado)
VALUES
    (1, 1, 1, '2025-01-10', 'Finalizada'),
    (1, 1, 2, '2025-07-10', 'Finalizada'),
    (1, 1, 3, '2026-01-12', 'Activa'),
    (2, 1, 3, '2026-01-13', 'Activa'),
    (3, 2, 3, '2026-01-14', 'Activa'),
    (4, 1, 2, '2025-07-12', 'Cancelada'),
    (4, 3, 3, '2026-01-15', 'Activa'),      
    (5, 2, 2, '2025-07-14', 'Finalizada'),
    (5, 2, 3, '2026-01-16', 'Activa'),
    (6, 3, 1, '2025-01-12', 'Finalizada'),
    (6, 3, 2, '2025-07-15', 'Finalizada'),
    (7, 1, 4, '2026-07-08', 'Activa'),
    (8, 2, 1, '2025-01-14', 'Cancelada'),
    (9, 1, 4, '2026-07-09', 'Activa'),
    (10, 1, 4, '2026-07-10', 'Activa'),
    (10, 2, 4, '2026-07-10', 'Activa');
GO

INSERT INTO dbo.ASIGNATURA
    (nombre, id_programa, id_docente)
VALUES
    ('Lógica de Programación',           1, 2),
    ('Gestión de Bases de Datos',        1, 1),
    ('Desarrollo Web Front-End',         1, 2),
    ('Programación Orientada a Objetos', 1, 4),
    ('Mantenimiento de Equipos',         2, 4),
    ('Redes y Conectividad',             2, 4),
    ('Sistemas Operativos',              2, 1),
    ('Ofimática Empresarial',            3, 3),
    ('Gestión Documental',               3, 3),
    ('Fundamentos del Diseño',           4, 5);
GO
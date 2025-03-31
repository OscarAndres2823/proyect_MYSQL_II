--creacion de base de datos, tabla y relaciones

CREATE DATABASE academic_campus;
USE academic_campus;


-- 1. Estados_Camper
CREATE TABLE Estados_Camper (
    id_estado INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL UNIQUE,
    descripcion VARCHAR(255)
);

-- 2. Niveles_Riesgo
CREATE TABLE Niveles_Riesgo (
    id_nivel_riesgo INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL UNIQUE,
    descripcion VARCHAR(255)
);

-- 3. Tipos_Documento
CREATE TABLE Tipos_Documento (
    id_tipo_documento INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(20) NOT NULL UNIQUE
);

-- 4. Ciudades
CREATE TABLE Ciudades (
    id_ciudad INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    departamento VARCHAR(50) NOT NULL,
    UNIQUE(nombre, departamento)
);

-- 5. Usuarios (Movido antes para resolver referencias)
CREATE TABLE Usuarios (
    id_usuario INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    rol ENUM('Administrador', 'Gestor', 'Trainer', 'Otro') DEFAULT 'Otro',
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    activo BOOLEAN DEFAULT TRUE,
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 6. Campers
CREATE TABLE Campers (
    id_camper INT PRIMARY KEY AUTO_INCREMENT,
    numero_identificacion VARCHAR(20) UNIQUE NOT NULL,
    id_tipo_documento INT NOT NULL,
    nombres VARCHAR(100) NOT NULL,
    apellidos VARCHAR(100) NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    id_ciudad INT NOT NULL,
    fecha_registro DATE NOT NULL DEFAULT CURRENT_DATE,
    id_estado INT NOT NULL,
    id_nivel_riesgo INT NOT NULL,
    FOREIGN KEY (id_tipo_documento) REFERENCES Tipos_Documento(id_tipo_documento),
    FOREIGN KEY (id_ciudad) REFERENCES Ciudades(id_ciudad),
    FOREIGN KEY (id_estado) REFERENCES Estados_Camper(id_estado),
    FOREIGN KEY (id_nivel_riesgo) REFERENCES Niveles_Riesgo(id_nivel_riesgo),
    CHECK (fecha_nacimiento <= CURRENT_DATE)
);

-- 7. Camper_Telefonos
CREATE TABLE Camper_Telefonos (
    id_telefono INT PRIMARY KEY AUTO_INCREMENT,
    id_camper INT NOT NULL,
    telefono VARCHAR(15) NOT NULL,
    tipo ENUM('Personal', 'Acudiente') DEFAULT 'Personal',
    FOREIGN KEY (id_camper) REFERENCES Campers(id_camper) ON DELETE CASCADE
);

-- 8. Historial_Estado_Camper
CREATE TABLE Historial_Estado_Camper (
    id_historial INT PRIMARY KEY AUTO_INCREMENT,
    id_camper INT NOT NULL,
    id_estado INT NOT NULL,
    fecha_cambio TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    observaciones TEXT,
    id_usuario INT NOT NULL,
    FOREIGN KEY (id_camper) REFERENCES Campers(id_camper),
    FOREIGN KEY (id_estado) REFERENCES Estados_Camper(id_estado),
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario)
);

-- 9. Gestores_DB
CREATE TABLE Gestores_DB (
    id_gestor INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL UNIQUE,
    version VARCHAR(20),
    descripcion VARCHAR(255)
);

-- 10. Modulos (Movido antes para resolver referencias)
CREATE TABLE Modulos (
    id_modulo INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL UNIQUE,
    descripcion TEXT,
    duracion_dias INT NOT NULL CHECK (duracion_dias > 0),
    requisitos TEXT
);

-- 11. Tipos_Evaluacion (Movido antes para resolver referencias)
CREATE TABLE Tipos_Evaluacion (
    id_tipo_evaluacion INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL UNIQUE,
    descripcion VARCHAR(255),
    porcentaje DECIMAL(5,2) NOT NULL CHECK (porcentaje > 0 AND porcentaje <= 100)
);

-- 12. Modulo_Evaluacion
CREATE TABLE Modulo_Evaluacion (
    id_modulo INT NOT NULL,
    id_tipo_evaluacion INT NOT NULL,
    porcentaje DECIMAL(5,2) NOT NULL CHECK (porcentaje > 0 AND porcentaje <= 100),
    PRIMARY KEY (id_modulo, id_tipo_evaluacion),
    FOREIGN KEY (id_modulo) REFERENCES Modulos(id_modulo),
    FOREIGN KEY (id_tipo_evaluacion) REFERENCES Tipos_Evaluacion(id_tipo_evaluacion)
);

-- 13. Rutas
CREATE TABLE Rutas (
    id_ruta INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL UNIQUE,
    descripcion TEXT,
    duracion_semanas INT NOT NULL CHECK (duracion_semanas > 0),
    fecha_inicio DATE,
    fecha_fin DATE,
    gestor_principal INT NOT NULL,
    gestor_alternativo INT NOT NULL,
    activa BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (gestor_principal) REFERENCES Gestores_DB(id_gestor),
    FOREIGN KEY (gestor_alternativo) REFERENCES Gestores_DB(id_gestor),
    CHECK (fecha_fin IS NULL OR fecha_fin > fecha_inicio)
);

-- 14. Ruta_Modulo
CREATE TABLE Ruta_Modulo (
    id_ruta INT NOT NULL,
    id_modulo INT NOT NULL,
    orden INT NOT NULL CHECK (orden > 0),
    PRIMARY KEY (id_ruta, id_modulo),
    FOREIGN KEY (id_ruta) REFERENCES Rutas(id_ruta),
    FOREIGN KEY (id_modulo) REFERENCES Modulos(id_modulo)
);

-- 15. Areas_Entrenamiento
CREATE TABLE Areas_Entrenamiento (
    id_area INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL UNIQUE,
    capacidad_maxima INT DEFAULT 33 CHECK (capacidad_maxima > 0),
    ubicacion VARCHAR(100),
    descripcion TEXT,
    activa BOOLEAN DEFAULT TRUE
);

-- 16. Horarios
CREATE TABLE Horarios (
    id_horario INT PRIMARY KEY AUTO_INCREMENT,
    hora_inicio TIME NOT NULL,
    hora_fin TIME NOT NULL,
    jornada ENUM('Mañana', 'Tarde', 'Noche') NOT NULL,
    CHECK (hora_fin > hora_inicio)
);

-- 17. Area_Horario
CREATE TABLE Area_Horario (
    id_area INT NOT NULL,
    id_horario INT NOT NULL,
    disponible BOOLEAN DEFAULT TRUE,
    PRIMARY KEY (id_area, id_horario),
    FOREIGN KEY (id_area) REFERENCES Areas_Entrenamiento(id_area),
    FOREIGN KEY (id_horario) REFERENCES Horarios(id_horario)
);

-- 18. Trainers
CREATE TABLE Trainers (
    id_trainer INT PRIMARY KEY AUTO_INCREMENT,
    id_usuario INT UNIQUE,
    numero_identificacion VARCHAR(20) UNIQUE NOT NULL,
    id_tipo_documento INT NOT NULL,
    nombres VARCHAR(100) NOT NULL,
    apellidos VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    fecha_contratacion DATE NOT NULL,
    activo BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (id_tipo_documento) REFERENCES Tipos_Documento(id_tipo_documento),
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario)
);

-- 19. Trainer_Telefonos
CREATE TABLE Trainer_Telefonos (
    id_telefono INT PRIMARY KEY AUTO_INCREMENT,
    id_trainer INT NOT NULL,
    telefono VARCHAR(15) NOT NULL,
    tipo ENUM('Personal', 'Oficina') DEFAULT 'Personal',
    FOREIGN KEY (id_trainer) REFERENCES Trainers(id_trainer) ON DELETE CASCADE
);

-- 20. Trainer_Ruta
CREATE TABLE Trainer_Ruta (
    id_trainer INT NOT NULL,
    id_ruta INT NOT NULL,
    PRIMARY KEY (id_trainer, id_ruta),
    FOREIGN KEY (id_trainer) REFERENCES Trainers(id_trainer),
    FOREIGN KEY (id_ruta) REFERENCES Rutas(id_ruta)
);

-- 21. Trainer_Horario
CREATE TABLE Trainer_Horario (
    id_trainer INT NOT NULL,
    id_horario INT NOT NULL,
    PRIMARY KEY (id_trainer, id_horario),
    FOREIGN KEY (id_trainer) REFERENCES Trainers(id_trainer),
    FOREIGN KEY (id_horario) REFERENCES Horarios(id_horario)
);

-- 22. Trainer_Area
CREATE TABLE Trainer_Area (
    id_trainer INT NOT NULL,
    id_area INT NOT NULL,
    PRIMARY KEY (id_trainer, id_area),
    FOREIGN KEY (id_trainer) REFERENCES Trainers(id_trainer),
    FOREIGN KEY (id_area) REFERENCES Areas_Entrenamiento(id_area)
);

-- 23. Trainer_Modulos
CREATE TABLE Trainer_Modulos (
    id_trainer INT NOT NULL,
    id_modulo INT NOT NULL,
    PRIMARY KEY (id_trainer, id_modulo),
    FOREIGN KEY (id_trainer) REFERENCES Trainers(id_trainer),
    FOREIGN KEY (id_modulo) REFERENCES Modulos(id_modulo)
);

-- 24. Disponibilidad_Trainer
CREATE TABLE Disponibilidad_Trainer (
    id_trainer INT NOT NULL,
    dia_semana ENUM('Lunes','Martes','Miércoles','Jueves','Viernes','Sábado','Domingo') NOT NULL,
    hora_inicio TIME NOT NULL,
    hora_fin TIME NOT NULL,
    PRIMARY KEY (id_trainer, dia_semana, hora_inicio),
    FOREIGN KEY (id_trainer) REFERENCES Trainers(id_trainer),
    CHECK (hora_fin > hora_inicio)
);

-- 25. Estados_Matricula
CREATE TABLE Estados_Matricula (
    id_estado_matricula INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL UNIQUE,
    descripcion VARCHAR(255)
);

-- 26. Matriculas
CREATE TABLE Matriculas (
    id_matricula INT PRIMARY KEY AUTO_INCREMENT,
    id_camper INT NOT NULL,
    id_ruta INT NOT NULL,
    id_area INT NOT NULL,
    id_horario INT NOT NULL,
    id_estado_matricula INT NOT NULL,
    fecha_matricula DATE NOT NULL DEFAULT CURRENT_DATE,
    fecha_finalizacion DATE,
    FOREIGN KEY (id_camper) REFERENCES Campers(id_camper),
    FOREIGN KEY (id_ruta) REFERENCES Rutas(id_ruta),
    FOREIGN KEY (id_area) REFERENCES Areas_Entrenamiento(id_area),
    FOREIGN KEY (id_horario) REFERENCES Horarios(id_horario),
    FOREIGN KEY (id_estado_matricula) REFERENCES Estados_Matricula(id_estado_matricula),
    UNIQUE (id_camper, id_ruta),
    CHECK (fecha_finalizacion IS NULL OR fecha_finalizacion >= fecha_matricula)
);

-- 27. Evaluaciones
CREATE TABLE Evaluaciones (
    id_evaluacion INT PRIMARY KEY AUTO_INCREMENT,
    id_matricula INT NOT NULL,
    id_modulo INT NOT NULL,
    id_tipo_evaluacion INT NOT NULL,
    nota DECIMAL(5,2) NOT NULL CHECK (nota >= 0 AND nota <= 100),
    fecha_evaluacion DATE NOT NULL DEFAULT CURRENT_DATE,
    observaciones TEXT,
    id_trainer INT NOT NULL,
    FOREIGN KEY (id_matricula) REFERENCES Matriculas(id_matricula),
    FOREIGN KEY (id_modulo) REFERENCES Modulos(id_modulo),
    FOREIGN KEY (id_tipo_evaluacion) REFERENCES Tipos_Evaluacion(id_tipo_evaluacion),
    FOREIGN KEY (id_trainer) REFERENCES Trainers(id_trainer)
);

-- 28. Notas_Finales_Modulo
CREATE TABLE Notas_Finales_Modulo (
    id_matricula INT NOT NULL,
    id_modulo INT NOT NULL,
    nota_final DECIMAL(5,2) NOT NULL CHECK (nota_final >= 0 AND nota_final <= 100),
    aprobado BOOLEAN NOT NULL,
    fecha_calculo DATE NOT NULL DEFAULT CURRENT_DATE,
    observaciones TEXT,
    PRIMARY KEY (id_matricula, id_modulo),
    FOREIGN KEY (id_matricula) REFERENCES Matriculas(id_matricula),
    FOREIGN KEY (id_modulo) REFERENCES Modulos(id_modulo)
);

-- 29. Graduacion
CREATE TABLE Graduacion (
    id_graduacion INT PRIMARY KEY AUTO_INCREMENT,
    id_camper INT NOT NULL,
    id_ruta INT NOT NULL,
    fecha_graduacion DATE NOT NULL DEFAULT CURRENT_DATE,
    certificado_emitido BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (id_camper) REFERENCES Campers(id_camper),
    FOREIGN KEY (id_ruta) REFERENCES Rutas(id_ruta),
    UNIQUE (id_camper, id_ruta)
);

-- 30. Asistencia_Clases
CREATE TABLE Asistencia_Clases (
    id_asistencia INT PRIMARY KEY AUTO_INCREMENT,
    id_camper INT NOT NULL,
    id_area INT NOT NULL,
    id_horario INT NOT NULL,
    fecha DATE NOT NULL,
    asistencia ENUM('Presente', 'Ausente', 'Tarde') DEFAULT 'Presente',
    observaciones TEXT,
    id_trainer INT NOT NULL,
    FOREIGN KEY (id_camper) REFERENCES Campers(id_camper),
    FOREIGN KEY (id_area) REFERENCES Areas_Entrenamiento(id_area),
    FOREIGN KEY (id_horario) REFERENCES Horarios(id_horario),
    FOREIGN KEY (id_trainer) REFERENCES Trainers(id_trainer),
    UNIQUE (id_camper, id_area, id_horario, fecha)
);

-- 31. Reasignacion_Ruta
CREATE TABLE Reasignacion_Ruta (
    id_reasignacion INT PRIMARY KEY AUTO_INCREMENT,
    id_camper INT NOT NULL,
    id_ruta_origen INT NOT NULL,
    id_ruta_destino INT NOT NULL,
    fecha_reasignacion DATE NOT NULL DEFAULT CURRENT_DATE,
    motivo TEXT NOT NULL,
    id_usuario INT NOT NULL,
    FOREIGN KEY (id_camper) REFERENCES Campers(id_camper),
    FOREIGN KEY (id_ruta_origen) REFERENCES Rutas(id_ruta),
    FOREIGN KEY (id_ruta_destino) REFERENCES Rutas(id_ruta),
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario),
    CHECK (id_ruta_origen != id_ruta_destino)
);

-- 32. Log_Acciones
CREATE TABLE Log_Acciones (
    id_log INT PRIMARY KEY AUTO_INCREMENT,
    id_usuario INT,
    accion VARCHAR(255) NOT NULL,
    tabla_afectada VARCHAR(50),
    id_registro INT,
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    detalle TEXT,
    ip_address VARCHAR(45),
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario)
);
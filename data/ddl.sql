--creacion de base de datos, tabla y relaciones

CREATE DATABASE academic_campus;
USE academic_campus;


CREATE TABLE Estados_Camper (
    id_estado INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL UNIQUE,
    descripcion VARCHAR(255)
);

CREATE TABLE Niveles_Riesgo (
    id_nivel_riesgo INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL UNIQUE,
    descripcion VARCHAR(255),
    color VARCHAR(7) NOT NULL
);

CREATE TABLE Tipos_Documento (
    id_tipo_documento INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(20) NOT NULL UNIQUE,
    descripcion VARCHAR(255),
    formato_validacion VARCHAR(50)
);

CREATE TABLE Tipos_Evaluacion (
    id_tipo_evaluacion INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL UNIQUE,
    descripcion VARCHAR(255),
    porcentaje DECIMAL(5,2) NOT NULL CHECK (porcentaje > 0 AND porcentaje <= 100)
);

CREATE TABLE Estados_Matricula (
    id_estado_matricula INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL UNIQUE,
    descripcion VARCHAR(255)
);

CREATE TABLE Tipos_Area (
    id_tipo_area INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL UNIQUE,
    descripcion VARCHAR(255),
    requisitos_equipamiento TEXT
);

CREATE TABLE Tipos_Material (
    id_tipo_material INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL UNIQUE,
    descripcion VARCHAR(255),
    formato_aceptado VARCHAR(50)
);


CREATE TABLE Paises (
    id_pais INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL UNIQUE,
    codigo_iso VARCHAR(2) NOT NULL UNIQUE
);

CREATE TABLE Departamentos (
    id_departamento INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    id_pais INT NOT NULL,
    FOREIGN KEY (id_pais) REFERENCES Paises(id_pais),
    UNIQUE(nombre, id_pais)
);

CREATE TABLE Ciudades (
    id_ciudad INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    id_departamento INT NOT NULL,
    codigo_postal VARCHAR(10),
    FOREIGN KEY (id_departamento) REFERENCES Departamentos(id_departamento),
    UNIQUE(nombre, id_departamento)
);


CREATE TABLE Roles (
    id_rol INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL UNIQUE,
    descripcion VARCHAR(255),
    permisos JSON
);

CREATE TABLE Usuarios (
    id_usuario INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    id_rol INT NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    activo BOOLEAN DEFAULT TRUE,
    ultimo_acceso TIMESTAMP NULL,
    intentos_fallidos INT DEFAULT 0,
    fecha_bloqueo TIMESTAMP NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (id_rol) REFERENCES Roles(id_rol),
    INDEX idx_email (email),
    INDEX idx_username (username)
);


CREATE TABLE Campers (
    id_camper INT PRIMARY KEY AUTO_INCREMENT,
    numero_identificacion VARCHAR(20) UNIQUE NOT NULL,
    id_tipo_documento INT NOT NULL,
    nombres VARCHAR(100) NOT NULL,
    apellidos VARCHAR(100) NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    id_ciudad INT NOT NULL,
    direccion TEXT,
    genero ENUM('M', 'F', 'O') NOT NULL,
    fecha_registro DATE NOT NULL DEFAULT CURRENT_DATE,
    id_estado INT NOT NULL,
    id_nivel_riesgo INT NOT NULL,
    foto_perfil VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (id_tipo_documento) REFERENCES Tipos_Documento(id_tipo_documento),
    FOREIGN KEY (id_ciudad) REFERENCES Ciudades(id_ciudad),
    FOREIGN KEY (id_estado) REFERENCES Estados_Camper(id_estado),
    FOREIGN KEY (id_nivel_riesgo) REFERENCES Niveles_Riesgo(id_nivel_riesgo),
    CHECK (fecha_nacimiento <= CURRENT_DATE),
    INDEX idx_numero_identificacion (numero_identificacion),
    INDEX idx_email (email)
);

CREATE TABLE Telefonos_Camper (
    id_telefono INT PRIMARY KEY AUTO_INCREMENT,
    id_camper INT NOT NULL,
    telefono VARCHAR(15) NOT NULL,
    tipo ENUM('Personal', 'Acudiente') NOT NULL,
    principal BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (id_camper) REFERENCES Campers(id_camper) ON DELETE CASCADE,
    UNIQUE(id_camper, telefono)
);

CREATE TABLE Acudientes (
    id_acudiente INT PRIMARY KEY AUTO_INCREMENT,
    id_camper INT NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    relacion ENUM('Padre', 'Madre', 'Tutor Legal', 'Otro') NOT NULL,
    telefono VARCHAR(15) NOT NULL,
    email VARCHAR(100),
    direccion TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (id_camper) REFERENCES Campers(id_camper) ON DELETE CASCADE
)


CREATE TABLE Modulos (
    id_modulo INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL UNIQUE,
    descripcion TEXT,
    duracion_dias INT NOT NULL CHECK (duracion_dias > 0),
    requisitos TEXT,
    objetivos TEXT,
    contenido_programatico TEXT,
    proyecto_requerido BOOLEAN DEFAULT FALSE,
    peso_proyecto DECIMAL(5,2)
);

CREATE TABLE Materiales_Modulo (
    id_material INT PRIMARY KEY AUTO_INCREMENT,
    id_modulo INT NOT NULL,
    titulo VARCHAR(255) NOT NULL,
    descripcion TEXT,
    id_tipo_material INT NOT NULL,
    url VARCHAR(255),
    orden INT NOT NULL CHECK (orden > 0),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (id_modulo) REFERENCES Modulos(id_modulo) ON DELETE CASCADE,
    FOREIGN KEY (id_tipo_material) REFERENCES Tipos_Material(id_tipo_material)
);

CREATE TABLE Rutas (
    id_ruta INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL UNIQUE,
    descripcion TEXT,
    duracion_semanas INT NOT NULL CHECK (duracion_semanas > 0),
    fecha_inicio DATE,
    fecha_fin DATE,
    gestor_db VARCHAR(50),
    version_gestor VARCHAR(20),
    activa BOOLEAN DEFAULT TRUE,
    cupo_maximo INT DEFAULT 30 CHECK (cupo_maximo > 0),
    CHECK (fecha_fin IS NULL OR fecha_fin > fecha_inicio)
);

CREATE TABLE Ruta_Modulo (
    id_ruta INT NOT NULL,
    id_modulo INT NOT NULL,
    orden INT NOT NULL CHECK (orden > 0),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (id_ruta, id_modulo),
    FOREIGN KEY (id_ruta) REFERENCES Rutas(id_ruta) ON DELETE CASCADE,
    FOREIGN KEY (id_modulo) REFERENCES Modulos(id_modulo)
);

CREATE TABLE Areas_Entrenamiento (
    id_area INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL UNIQUE,
    id_tipo_area INT NOT NULL,
    capacidad_maxima INT DEFAULT 33 CHECK (capacidad_maxima > 0),
    ubicacion VARCHAR(100),
    descripcion TEXT,
    activa BOOLEAN DEFAULT TRUE,
    equipamiento TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (id_tipo_area) REFERENCES Tipos_Area(id_tipo_area)
);

CREATE TABLE Horarios (
    id_horario INT PRIMARY KEY AUTO_INCREMENT,
    hora_inicio TIME NOT NULL,
    hora_fin TIME NOT NULL,
    jornada ENUM('Mañana', 'Tarde', 'Noche') NOT NULL,
    CHECK (hora_fin > hora_inicio)
);

CREATE TABLE Area_Horario (
    id_area INT NOT NULL,
    id_horario INT NOT NULL,
    disponible BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (id_area, id_horario),
    FOREIGN KEY (id_area) REFERENCES Areas_Entrenamiento(id_area) ON DELETE CASCADE,
    FOREIGN KEY (id_horario) REFERENCES Horarios(id_horario)
);


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
    especialidad VARCHAR(100),
    nivel_educacion VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (id_tipo_documento) REFERENCES Tipos_Documento(id_tipo_documento),
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario),
    INDEX idx_email (email),
    INDEX idx_numero_identificacion (numero_identificacion)
);

CREATE TABLE Telefonos_Trainer (
    id_telefono INT PRIMARY KEY AUTO_INCREMENT,
    id_trainer INT NOT NULL,
    telefono VARCHAR(15) NOT NULL,
    tipo ENUM('Personal', 'Oficina') NOT NULL,
    FOREIGN KEY (id_trainer) REFERENCES Trainers(id_trainer) ON DELETE CASCADE,
    UNIQUE(id_trainer, telefono)
);

CREATE TABLE Disponibilidad_Trainer (
    id_trainer INT NOT NULL,
    dia_semana ENUM('Lunes','Martes','Miércoles','Jueves','Viernes','Sábado','Domingo') NOT NULL,
    hora_inicio TIME NOT NULL,
    hora_fin TIME NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (id_trainer, dia_semana, hora_inicio),
    FOREIGN KEY (id_trainer) REFERENCES Trainers(id_trainer) ON DELETE CASCADE,
    CHECK (hora_fin > hora_inicio)
);

CREATE TABLE Trainer_Modulo (
    id_trainer INT NOT NULL,
    id_modulo INT NOT NULL,
    nivel_experiencia ENUM('Principiante', 'Intermedio', 'Avanzado', 'Experto') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (id_trainer, id_modulo),
    FOREIGN KEY (id_trainer) REFERENCES Trainers(id_trainer) ON DELETE CASCADE,
    FOREIGN KEY (id_modulo) REFERENCES Modulos(id_modulo)
);


CREATE TABLE Matriculas (
    id_matricula INT PRIMARY KEY AUTO_INCREMENT,
    id_camper INT NOT NULL,
    id_ruta INT NOT NULL,
    id_area INT NOT NULL,
    id_horario INT NOT NULL,
    id_estado_matricula INT NOT NULL,
    fecha_matricula DATE NOT NULL DEFAULT CURRENT_DATE,
    fecha_finalizacion DATE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (id_camper) REFERENCES Campers(id_camper) ON DELETE CASCADE,
    FOREIGN KEY (id_ruta) REFERENCES Rutas(id_ruta) ON DELETE CASCADE,
    FOREIGN KEY (id_area) REFERENCES Areas_Entrenamiento(id_area),
    FOREIGN KEY (id_horario) REFERENCES Horarios(id_horario),
    FOREIGN KEY (id_estado_matricula) REFERENCES Estados_Matricula(id_estado_matricula),
    UNIQUE (id_camper, id_ruta),
    CHECK (fecha_finalizacion IS NULL OR fecha_finalizacion >= fecha_matricula)
);

CREATE TABLE Reasignaciones_Ruta (
    id_reasignacion INT PRIMARY KEY AUTO_INCREMENT,
    id_matricula INT NOT NULL,
    id_ruta_origen INT NOT NULL,
    id_ruta_destino INT NOT NULL,
    fecha_reasignacion DATE NOT NULL DEFAULT CURRENT_DATE,
    motivo TEXT NOT NULL,
    id_usuario INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (id_matricula) REFERENCES Matriculas(id_matricula) ON DELETE CASCADE,
    FOREIGN KEY (id_ruta_origen) REFERENCES Rutas(id_ruta),
    FOREIGN KEY (id_ruta_destino) REFERENCES Rutas(id_ruta),
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario),
    CHECK (id_ruta_origen != id_ruta_destino)
);

CREATE TABLE Evaluaciones (
    id_evaluacion INT PRIMARY KEY AUTO_INCREMENT,
    id_matricula INT NOT NULL,
    id_modulo INT NOT NULL,
    id_tipo_evaluacion INT NOT NULL,
    nota DECIMAL(5,2) NOT NULL CHECK (nota >= 0 AND nota <= 100),
    fecha_evaluacion DATE NOT NULL DEFAULT CURRENT_DATE,
    observaciones TEXT,
    id_trainer INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (id_matricula) REFERENCES Matriculas(id_matricula) ON DELETE CASCADE,
    FOREIGN KEY (id_modulo) REFERENCES Modulos(id_modulo),
    FOREIGN KEY (id_tipo_evaluacion) REFERENCES Tipos_Evaluacion(id_tipo_evaluacion),
    FOREIGN KEY (id_trainer) REFERENCES Trainers(id_trainer)
);

CREATE TABLE Proyectos (
    id_proyecto INT PRIMARY KEY AUTO_INCREMENT,
    id_modulo INT NOT NULL,
    nombre VARCHAR(255) NOT NULL,
    descripcion TEXT,
    fecha_inicio DATE NOT NULL,
    fecha_entrega DATE NOT NULL,
    peso_evaluacion DECIMAL(5,2) NOT NULL CHECK (peso_evaluacion > 0 AND peso_evaluacion <= 100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (id_modulo) REFERENCES Modulos(id_modulo) ON DELETE CASCADE,
    CHECK (fecha_entrega > fecha_inicio)
);

CREATE TABLE Entregas_Proyecto (
    id_entrega INT PRIMARY KEY AUTO_INCREMENT,
    id_proyecto INT NOT NULL,
    id_matricula INT NOT NULL,
    fecha_entrega TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    url_entrega VARCHAR(255),
    calificacion DECIMAL(5,2),
    observaciones TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (id_proyecto) REFERENCES Proyectos(id_proyecto) ON DELETE CASCADE,
    FOREIGN KEY (id_matricula) REFERENCES Matriculas(id_matricula) ON DELETE CASCADE
);

CREATE TABLE Asistencia_Clases (
    id_asistencia INT PRIMARY KEY AUTO_INCREMENT,
    id_matricula INT NOT NULL,
    id_area INT NOT NULL,
    id_horario INT NOT NULL,
    fecha DATE NOT NULL,
    asistencia ENUM('Presente', 'Ausente', 'Tarde', 'Justificado') DEFAULT 'Presente',
    observaciones TEXT,
    id_trainer INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (id_matricula) REFERENCES Matriculas(id_matricula) ON DELETE CASCADE,
    FOREIGN KEY (id_area) REFERENCES Areas_Entrenamiento(id_area),
    FOREIGN KEY (id_horario) REFERENCES Horarios(id_horario),
    FOREIGN KEY (id_trainer) REFERENCES Trainers(id_trainer),
    UNIQUE (id_matricula, id_area, id_horario, fecha)
);

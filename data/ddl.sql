--creacion de base de datos, tabla y relaciones

CREATE DATABASE academic_campus;
USE academic_campus;


-- Tabla de Campers (Estudiantes)
CREATE TABLE campers (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    apellidos VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    edad INT,
    telefono VARCHAR(20),
    acudiente_nombre VARCHAR(100),
    acudiente_telefono VARCHAR(20),
    estado ENUM('Inscrito', 'Cursando', 'Graduado', 'Expulsado', 'Retirado', 'Aprobado', 'En proceso') NOT NULL,
    nivel_riesgo ENUM('Bajo', 'Medio', 'Alto') NOT NULL,
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabla de Teléfonos Adicionales de Campers
CREATE TABLE telefonos_campers (
    id INT PRIMARY KEY AUTO_INCREMENT,
    camper_id INT,
    telefono VARCHAR(20) NOT NULL,
    FOREIGN KEY (camper_id) REFERENCES campers(id)
);

-- Tabla de Rutas (Carreras)
CREATE TABLE rutas (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    duracion_meses INT,
    sgdb_principal VARCHAR(50),
    sgdb_alternativo VARCHAR(50),
    area_id INT,
    FOREIGN KEY (area_id) REFERENCES areas(id)
);

-- Tabla de Módulos
CREATE TABLE modulos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    ruta_id INT,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    duracion_horas INT,
    peso_teorico DECIMAL(5,2),
    peso_practico DECIMAL(5,2),
    peso_quiz DECIMAL(5,2),
    FOREIGN KEY (ruta_id) REFERENCES rutas(id)
);

-- Tabla de Trainers (Profesores)
CREATE TABLE trainers (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    telefono VARCHAR(20) NOT NULL,
    especialidad VARCHAR(50) NOT NULL,
    fecha_inicio TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    area_id INT NOT NULL,
    FOREIGN KEY (area_id) REFERENCES areas(id)
);

-- Tabla de Evaluaciones
CREATE TABLE evaluaciones (
    id INT PRIMARY KEY AUTO_INCREMENT,
    camper_id INT,
    modulo_id INT,
    trainer_id INT,
    nota_teorica DECIMAL(5,2),
    nota_practica DECIMAL(5,2),
    nota_quiz DECIMAL(5,2),
    nota_final DECIMAL(5,2),
    fecha_evaluacion DATE,
    FOREIGN KEY (camper_id) REFERENCES campers(id),
    FOREIGN KEY (modulo_id) REFERENCES modulos(id),
    FOREIGN KEY (trainer_id) REFERENCES trainers(id)
);

-- Tabla de Asignaciones (Relación entre campers y rutas)
CREATE TABLE asignaciones (
    id INT PRIMARY KEY AUTO_INCREMENT,
    camper_id INT,
    ruta_id INT,
    trainer_id INT,
    fecha_inicio TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    fecha_fin TIMESTAMP NULL,
    estado ENUM('Activa', 'Inactiva') DEFAULT 'Activa',
    FOREIGN KEY (camper_id) REFERENCES campers(id),
    FOREIGN KEY (ruta_id) REFERENCES rutas(id),
    FOREIGN KEY (trainer_id) REFERENCES trainers(id)
);

-- Tabla de áreas de entrenamiento
CREATE TABLE areas (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    capacidad_maxima INT NOT NULL,
    horario_inicio TIME,
    horario_fin TIME,
    estado ENUM('Activa', 'Inactiva') DEFAULT 'Activa'
);

-- Tabla para registrar cambios de estado de campers
CREATE TABLE log_cambios_estado (
    id INT PRIMARY KEY AUTO_INCREMENT,
    camper_id INT NOT NULL,
    estado_anterior ENUM('Inscrito', 'Cursando', 'Graduado', 'Expulsado', 'Retirado') NOT NULL,
    estado_nuevo ENUM('Inscrito', 'Cursando', 'Graduado', 'Expulsado', 'Retirado') NOT NULL,
    fecha_cambio DATETIME NOT NULL,
    FOREIGN KEY (camper_id) REFERENCES campers(id)
);

-- Tabla para registrar graduaciones
CREATE TABLE log_graduaciones (
    id INT PRIMARY KEY AUTO_INCREMENT,
    camper_id INT NOT NULL,
    fecha_graduacion DATETIME NOT NULL,
    promedio_final DECIMAL(5,2) NOT NULL,
    FOREIGN KEY (camper_id) REFERENCES campers(id)
);

-- Tabla para registrar retiros
CREATE TABLE log_retiros (
    id INT PRIMARY KEY AUTO_INCREMENT,
    camper_id INT NOT NULL,
    motivo TEXT NOT NULL,
    fecha_retiro DATETIME NOT NULL,
    FOREIGN KEY (camper_id) REFERENCES campers(id)
);

-- Tabla para registrar cambios de horario de trainers
CREATE TABLE log_cambios_horario (
    id INT PRIMARY KEY AUTO_INCREMENT,
    trainer_id INT NOT NULL,
    area_anterior INT NOT NULL,
    area_nueva INT NOT NULL,
    fecha_cambio DATETIME NOT NULL,
    FOREIGN KEY (trainer_id) REFERENCES trainers(id),
    FOREIGN KEY (area_anterior) REFERENCES areas(id),
    FOREIGN KEY (area_nueva) REFERENCES areas(id)
);

-- Tabla para registrar asistencias
CREATE TABLE asistencias (
    id INT PRIMARY KEY AUTO_INCREMENT,
    area_id INT NOT NULL,
    fecha DATE NOT NULL,
    camper_id INT NOT NULL,
    asistio BOOLEAN NOT NULL,
    FOREIGN KEY (area_id) REFERENCES areas(id),
    FOREIGN KEY (camper_id) REFERENCES campers(id)
);

-- Tabla para salones
CREATE TABLE salones (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    capacidad INT NOT NULL,
    descripcion TEXT,
    estado ENUM('Activo', 'Inactivo', 'Mantenimiento') NOT NULL DEFAULT 'Activo'
);

-- Tabla para egresados
CREATE TABLE egresados (
    id INT PRIMARY KEY AUTO_INCREMENT,
    camper_id INT NOT NULL,
    fecha_egreso DATETIME NOT NULL,
    promedio_final DECIMAL(5,2) NOT NULL,
    ruta_id INT NOT NULL,
    FOREIGN KEY (camper_id) REFERENCES campers(id),
    FOREIGN KEY (ruta_id) REFERENCES rutas(id)
);

-- Tabla para notificaciones a trainers
CREATE TABLE notificaciones_trainers (
    id INT PRIMARY KEY AUTO_INCREMENT,
    trainer_id INT NOT NULL,
    mensaje TEXT NOT NULL,
    fecha_notificacion DATETIME NOT NULL,
    leida BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (trainer_id) REFERENCES trainers(id)
);

-- Tabla para plantillas de rutas
CREATE TABLE plantillas_rutas (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    sgdb_principal VARCHAR(50) NOT NULL,
    sgdb_alternativo VARCHAR(50),
    duracion_meses INT NOT NULL
);

-- Tabla para módulos de plantillas
CREATE TABLE modulos_plantilla (
    id INT PRIMARY KEY AUTO_INCREMENT,
    plantilla_id INT NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    duracion_horas INT NOT NULL,
    peso_teorico DECIMAL(5,2) NOT NULL,
    peso_practico DECIMAL(5,2) NOT NULL,
    peso_quiz DECIMAL(5,2) NOT NULL,
    FOREIGN KEY (plantilla_id) REFERENCES plantillas_rutas(id)
);

-- Tabla para conocimientos de trainers
CREATE TABLE conocimientos_trainers (
    id INT PRIMARY KEY AUTO_INCREMENT,
    trainer_id INT NOT NULL,
    modulo_id INT NOT NULL,
    nivel ENUM('Básico', 'Intermedio', 'Avanzado') NOT NULL,
    FOREIGN KEY (trainer_id) REFERENCES trainers(id),
    FOREIGN KEY (modulo_id) REFERENCES modulos(id)
);

-- Tabla para gestión de recursos
CREATE TABLE recursos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    tipo ENUM('Equipo', 'Software', 'Documentación', 'Otro') NOT NULL,
    descripcion TEXT,
    estado ENUM('Disponible', 'En uso', 'Mantenimiento', 'Obsoleto') NOT NULL DEFAULT 'Disponible',
    fecha_adquisicion DATE,
    valor DECIMAL(10,2),
    area_id INT,
    FOREIGN KEY (area_id) REFERENCES areas(id)
);

-- Tabla para seguimiento de proyectos
CREATE TABLE proyectos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    fecha_inicio DATE NOT NULL,
    fecha_fin_estimada DATE,
    estado ENUM('Planificado', 'En progreso', 'Completado', 'Cancelado') NOT NULL DEFAULT 'Planificado',
    ruta_id INT,
    trainer_id INT,
    FOREIGN KEY (ruta_id) REFERENCES rutas(id),
    FOREIGN KEY (trainer_id) REFERENCES trainers(id)
);

-- Tabla para gestión de eventos
CREATE TABLE eventos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(100) NOT NULL,
    descripcion TEXT,
    fecha_inicio DATETIME NOT NULL,
    fecha_fin DATETIME NOT NULL,
    tipo ENUM('Taller', 'Conferencia', 'Hackathon', 'Networking', 'Otro') NOT NULL,
    capacidad_maxima INT,
    area_id INT,
    FOREIGN KEY (area_id) REFERENCES areas(id)
);

-- Tabla para sistema de notificaciones
CREATE TABLE notificaciones_sistema (
    id INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(100) NOT NULL,
    mensaje TEXT NOT NULL,
    tipo ENUM('Información', 'Advertencia', 'Error', 'Éxito') NOT NULL,
    fecha_creacion DATETIME NOT NULL,
    fecha_envio DATETIME,
    estado ENUM('Pendiente', 'Enviada', 'Leída') NOT NULL DEFAULT 'Pendiente',
    destinatario_tipo ENUM('Todos', 'Trainers', 'Campers', 'Área específica') NOT NULL,
    area_id INT,
    FOREIGN KEY (area_id) REFERENCES areas(id)
);

-- Tabla para gestión de materiales
CREATE TABLE materiales (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    tipo ENUM('Documento', 'Video', 'Presentación', 'Código', 'Otro') NOT NULL,
    url VARCHAR(255),
    fecha_creacion DATETIME NOT NULL,
    modulo_id INT,
    trainer_id INT,
    FOREIGN KEY (modulo_id) REFERENCES modulos(id),
    FOREIGN KEY (trainer_id) REFERENCES trainers(id)
);

-- Tabla para sistema de encuestas
CREATE TABLE encuestas (
    id INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(100) NOT NULL,
    descripcion TEXT,
    fecha_inicio DATETIME NOT NULL,
    fecha_fin DATETIME NOT NULL,
    tipo ENUM('Satisfacción', 'Evaluación', 'Retroalimentación') NOT NULL,
    estado ENUM('Activa', 'Inactiva', 'Finalizada') NOT NULL DEFAULT 'Activa',
    modulo_id INT,
    trainer_id INT,
    FOREIGN KEY (modulo_id) REFERENCES modulos(id),
    FOREIGN KEY (trainer_id) REFERENCES trainers(id)
);

-- Tabla para gestión de certificados
CREATE TABLE certificados (
    id INT PRIMARY KEY AUTO_INCREMENT,
    camper_id INT NOT NULL,
    ruta_id INT NOT NULL,
    fecha_emision DATE NOT NULL,
    fecha_vencimiento DATE NOT NULL,
    codigo_unico VARCHAR(20) UNIQUE NOT NULL,
    estado VARCHAR(20) CHECK (estado IN ('Vigente', 'Vencido', 'Revocado')),
    FOREIGN KEY (camper_id) REFERENCES campers(id),
    FOREIGN KEY (ruta_id) REFERENCES rutas(id)
);

-- Tabla para gestionar mentorías
CREATE TABLE mentorias (
    id INT PRIMARY KEY AUTO_INCREMENT,
    mentor_id INT NOT NULL,
    camper_id INT NOT NULL,
    modulo_id INT NOT NULL,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE NOT NULL,
    estado ENUM('Activa', 'Finalizada', 'Cancelada') NOT NULL DEFAULT 'Activa',
    tipo ENUM('Individual', 'Grupal') NOT NULL,
    descripcion TEXT,
    FOREIGN KEY (mentor_id) REFERENCES trainers(id),
    FOREIGN KEY (camper_id) REFERENCES campers(id),
    FOREIGN KEY (modulo_id) REFERENCES modulos(id)
);

-- Tabla para gestionar horarios de clases
CREATE TABLE horarios_clases (
    id INT PRIMARY KEY AUTO_INCREMENT,
    modulo_id INT NOT NULL,
    trainer_id INT NOT NULL,
    salon_id INT NOT NULL,
    dia_semana ENUM('Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado') NOT NULL,
    hora_inicio TIME NOT NULL,
    hora_fin TIME NOT NULL,
    estado ENUM('Activo', 'Inactivo', 'Suspendido') NOT NULL DEFAULT 'Activo',
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE,
    FOREIGN KEY (modulo_id) REFERENCES modulos(id),
    FOREIGN KEY (trainer_id) REFERENCES trainers(id),
    FOREIGN KEY (salon_id) REFERENCES salones(id)
);

-- Tabla para gestionar tareas y proyectos
CREATE TABLE tareas_proyectos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    modulo_id INT NOT NULL,
    trainer_id INT NOT NULL,
    titulo VARCHAR(100) NOT NULL,
    descripcion TEXT,
    fecha_asignacion DATE NOT NULL,
    fecha_entrega DATE NOT NULL,
    tipo ENUM('Tarea', 'Proyecto', 'Evaluación') NOT NULL,
    peso DECIMAL(5,2) NOT NULL,
    estado ENUM('Activa', 'Finalizada', 'Cancelada') NOT NULL DEFAULT 'Activa',
    FOREIGN KEY (modulo_id) REFERENCES modulos(id),
    FOREIGN KEY (trainer_id) REFERENCES trainers(id)
);

-- Tabla para gestionar feedback de los campers
CREATE TABLE feedback_campers (
    id INT PRIMARY KEY AUTO_INCREMENT,
    camper_id INT NOT NULL,
    modulo_id INT NOT NULL,
    trainer_id INT NOT NULL,
    calificacion INT CHECK (calificacion BETWEEN 1 AND 5),
    comentario TEXT,
    fecha_feedback DATETIME NOT NULL,
    tipo ENUM('Módulo', 'Trainer', 'General') NOT NULL,
    estado ENUM('Pendiente', 'Revisado', 'Archivado') NOT NULL DEFAULT 'Pendiente',
    FOREIGN KEY (camper_id) REFERENCES campers(id),
    FOREIGN KEY (modulo_id) REFERENCES modulos(id),
    FOREIGN KEY (trainer_id) REFERENCES trainers(id)
);


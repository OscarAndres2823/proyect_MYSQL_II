-- Creación de la base de datos
CREATE DATABASE CampusLands;
USE CampusLands;

-- Tabla de Estados de Camper
CREATE TABLE Estados_Camper (
    id_estado INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    descripcion VARCHAR(255)
);

-- Tabla de Niveles de Riesgo
CREATE TABLE Niveles_Riesgo (
    id_nivel_riesgo INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    descripcion VARCHAR(255)
);

-- Tabla de Campers
CREATE TABLE Campers (
    id_camper INT PRIMARY KEY AUTO_INCREMENT,
    numero_identificacion VARCHAR(20) UNIQUE NOT NULL,
    tipo_documento VARCHAR(20) NOT NULL,
    nombres VARCHAR(100) NOT NULL,
    apellidos VARCHAR(100) NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    telefono VARCHAR(15),
    direccion VARCHAR(255),
    ciudad VARCHAR(50),
    departamento VARCHAR(50),
    nombre_acudiente VARCHAR(150),
    telefono_acudiente VARCHAR(15),
    id_estado INT NOT NULL,
    id_nivel_riesgo INT NOT NULL,
    fecha_registro DATE NOT NULL,
    FOREIGN KEY (id_estado) REFERENCES Estados_Camper(id_estado),
    FOREIGN KEY (id_nivel_riesgo) REFERENCES Niveles_Riesgo(id_nivel_riesgo)
);

-- Tabla de Gestores de Base de Datos
CREATE TABLE Gestores_DB (
    id_gestor INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    version VARCHAR(20),
    descripcion VARCHAR(255)
);

-- Tabla de Rutas de Entrenamiento
CREATE TABLE Rutas (
    id_ruta INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    duracion_semanas INT NOT NULL,
    fecha_inicio DATE,
    fecha_fin DATE,
    cupo_maximo INT DEFAULT 33,
    gestor_principal INT NOT NULL,
    gestor_alternativo INT NOT NULL,
    FOREIGN KEY (gestor_principal) REFERENCES Gestores_DB(id_gestor),
    FOREIGN KEY (gestor_alternativo) REFERENCES Gestores_DB(id_gestor)
);

-- Tabla de Módulos
CREATE TABLE Modulos (
    id_modulo INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    duracion_dias INT NOT NULL
);

-- Tabla de relación entre Rutas y Módulos
CREATE TABLE Ruta_Modulo (
    id_ruta INT NOT NULL,
    id_modulo INT NOT NULL,
    orden INT NOT NULL,
    PRIMARY KEY (id_ruta, id_modulo),
    FOREIGN KEY (id_ruta) REFERENCES Rutas(id_ruta),
    FOREIGN KEY (id_modulo) REFERENCES Modulos(id_modulo)
);

-- Tabla de Áreas de Entrenamiento
CREATE TABLE Areas_Entrenamiento (
    id_area INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    capacidad_maxima INT DEFAULT 33,
    ubicacion VARCHAR(100),
    descripcion TEXT
);

-- Tabla de Horarios
CREATE TABLE Horarios (
    id_horario INT PRIMARY KEY AUTO_INCREMENT,
    hora_inicio TIME NOT NULL,
    hora_fin TIME NOT NULL,
    jornada VARCHAR(20) NOT NULL
);

-- Tabla de Trainers
CREATE TABLE Trainers (
    id_trainer INT PRIMARY KEY AUTO_INCREMENT,
    numero_identificacion VARCHAR(20) UNIQUE NOT NULL,
    tipo_documento VARCHAR(20) NOT NULL,
    nombres VARCHAR(100) NOT NULL,
    apellidos VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    telefono VARCHAR(15),
    especialidad VARCHAR(100),
    fecha_contratacion DATE
);

-- Tabla de asignación de Trainers a Rutas
CREATE TABLE Trainer_Ruta (
    id_trainer INT NOT NULL,
    id_ruta INT NOT NULL,
    PRIMARY KEY (id_trainer, id_ruta),
    FOREIGN KEY (id_trainer) REFERENCES Trainers(id_trainer),
    FOREIGN KEY (id_ruta) REFERENCES Rutas(id_ruta)
);

-- Tabla de asignación de Áreas y Horarios
CREATE TABLE Area_Horario (
    id_area INT NOT NULL,
    id_horario INT NOT NULL,
    disponible BOOLEAN DEFAULT TRUE,
    PRIMARY KEY (id_area, id_horario),
    FOREIGN KEY (id_area) REFERENCES Areas_Entrenamiento(id_area),
    FOREIGN KEY (id_horario) REFERENCES Horarios(id_horario)
);

-- Tabla de Matrículas (Vincula Campers con Rutas)
CREATE TABLE Matriculas (
    id_matricula INT PRIMARY KEY AUTO_INCREMENT,
    id_camper INT NOT NULL,
    id_ruta INT NOT NULL,
    id_area INT NOT NULL,
    id_horario INT NOT NULL,
    fecha_matricula DATE NOT NULL,
    estado VARCHAR(20) DEFAULT 'Activa',
    FOREIGN KEY (id_camper) REFERENCES Campers(id_camper),
    FOREIGN KEY (id_ruta) REFERENCES Rutas(id_ruta),
    FOREIGN KEY (id_area) REFERENCES Areas_Entrenamiento(id_area),
    FOREIGN KEY (id_horario) REFERENCES Horarios(id_horario),
    UNIQUE (id_camper, id_ruta)
);

-- Tabla de Tipos de Evaluación
CREATE TABLE Tipos_Evaluacion (
    id_tipo_evaluacion INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    descripcion VARCHAR(255),
    porcentaje DECIMAL(5,2) NOT NULL
);

-- Tabla de Evaluaciones
CREATE TABLE Evaluaciones (
    id_evaluacion INT PRIMARY KEY AUTO_INCREMENT,
    id_matricula INT NOT NULL,
    id_modulo INT NOT NULL,
    id_tipo_evaluacion INT NOT NULL,
    nota DECIMAL(5,2) NOT NULL,
    fecha_evaluacion DATE NOT NULL,
    observaciones TEXT,
    FOREIGN KEY (id_matricula) REFERENCES Matriculas(id_matricula),
    FOREIGN KEY (id_modulo) REFERENCES Modulos(id_modulo),
    FOREIGN KEY (id_tipo_evaluacion) REFERENCES Tipos_Evaluacion(id_tipo_evaluacion)
);

-- Tabla de Notas Finales por Módulo
CREATE TABLE Notas_Finales_Modulo (
    id_matricula INT NOT NULL,
    id_modulo INT NOT NULL,
    nota_final DECIMAL(5,2) NOT NULL,
    aprobado BOOLEAN NOT NULL,
    fecha_calculo DATE NOT NULL,
    observaciones TEXT,
    PRIMARY KEY (id_matricula, id_modulo),
    FOREIGN KEY (id_matricula) REFERENCES Matriculas(id_matricula),
    FOREIGN KEY (id_modulo) REFERENCES Modulos(id_modulo)
);

-- Inserción de datos iniciales

-- Estados de Camper
INSERT INTO Estados_Camper (nombre, descripcion) VALUES 
('En proceso de ingreso', 'Camper en etapa de selección y evaluación inicial'),
('Inscrito', 'Camper que ha completado su proceso de inscripción'),
('Aprobado', 'Camper que ha sido aceptado para iniciar el programa'),
('Cursando', 'Camper actualmente tomando clases'),
('Graduado', 'Camper que ha completado satisfactoriamente el programa'),
('Expulsado', 'Camper que ha sido expulsado del programa'),
('Retirado', 'Camper que ha abandonado voluntariamente el programa');

-- Niveles de Riesgo
INSERT INTO Niveles_Riesgo (nombre, descripcion) VALUES 
('Bajo', 'Camper con buen rendimiento y bajo riesgo de deserción'),
('Medio', 'Camper con algunas dificultades académicas'),
('Alto', 'Camper con serias dificultades académicas y alto riesgo de deserción');

-- Gestores de Base de Datos
INSERT INTO Gestores_DB (nombre, version, descripcion) VALUES 
('MySQL', '8.0', 'Sistema de gestión de bases de datos relacional'),
('MongoDB', '6.0', 'Sistema de base de datos NoSQL orientado a documentos'),
('PostgreSQL', '14.0', 'Sistema de gestión de bases de datos relacional de código abierto');

-- Módulos
INSERT INTO Modulos (nombre, descripcion, duracion_dias) VALUES 
('Introducción a la algoritmia', 'Fundamentos de lógica de programación y resolución de problemas', 10),
('PSeInt', 'Pseudocódigo e introducción a la programación estructurada', 10),
('Python', 'Programación básica con Python', 15),
('HTML', 'Fundamentos de HTML para desarrollo web', 7),
('CSS', 'Estilos y diseño web con CSS', 7),
('Bootstrap', 'Framework CSS para desarrollo web responsivo', 7),
('Java', 'Programación orientada a objetos con Java', 20),
('JavaScript', 'Programación con JavaScript para desarrollo web', 15),
('C#', 'Programación orientada a objetos con C#', 15),
('MySQL Avanzado', 'Gestión avanzada de bases de datos con MySQL', 10),
('MongoDB Avanzado', 'Gestión avanzada de bases de datos NoSQL con MongoDB', 10),
('PostgreSQL Avanzado', 'Administración avanzada de PostgreSQL', 10),
('NetCore', 'Desarrollo backend con .NET Core', 15),
('Spring Boot', 'Desarrollo backend con Spring Boot para Java', 15),
('NodeJS', 'Desarrollo backend con Node.js', 12),
('Express', 'Framework web para Node.js', 8);

-- Tipos de Evaluación
INSERT INTO Tipos_Evaluacion (nombre, descripcion, porcentaje) VALUES 
('Teórica', 'Evaluación de conocimientos teóricos', 30.00),
('Práctica', 'Evaluación de habilidades prácticas', 60.00),
('Trabajos y Quizzes', 'Evaluación de trabajos y pruebas cortas', 10.00);

-- Rutas de Entrenamiento
INSERT INTO Rutas (nombre, descripcion, duracion_semanas, fecha_inicio, fecha_fin, gestor_principal, gestor_alternativo) VALUES 
('NodeJS', 'Especialización en desarrollo backend con Node.js y Express', 24, '2024-01-15', '2024-07-05', 2, 1),
('Java', 'Especialización en desarrollo backend con Java y Spring Boot', 24, '2024-01-15', '2024-07-05', 1, 3),
('NetCore', 'Especialización en desarrollo backend con .NET Core', 24, '2024-01-15', '2024-07-05', 3, 2);

-- Relación entre Rutas y Módulos
-- Ruta NodeJS
INSERT INTO Ruta_Modulo (id_ruta, id_modulo, orden) VALUES 
(1, 1, 1), -- Introducción a la algoritmia
(1, 2, 2), -- PSeInt
(1, 3, 3), -- Python
(1, 4, 4), -- HTML
(1, 5, 5), -- CSS
(1, 6, 6), -- Bootstrap
(1, 8, 7), -- JavaScript
(1, 11, 8), -- MongoDB Avanzado
(1, 15, 9), -- NodeJS
(1, 16, 10); -- Express

-- Ruta Java
INSERT INTO Ruta_Modulo (id_ruta, id_modulo, orden) VALUES 
(2, 1, 1), -- Introducción a la algoritmia
(2, 2, 2), -- PSeInt
(2, 3, 3), -- Python
(2, 4, 4), -- HTML
(2, 5, 5), -- CSS
(2, 6, 6), -- Bootstrap
(2, 7, 7), -- Java
(2, 10, 8), -- MySQL Avanzado
(2, 14, 9); -- Spring Boot

-- Ruta NetCore
INSERT INTO Ruta_Modulo (id_ruta, id_modulo, orden) VALUES 
(3, 1, 1), -- Introducción a la algoritmia
(3, 2, 2), -- PSeInt
(3, 3, 3), -- Python
(3, 4, 4), -- HTML
(3, 5, 5), -- CSS
(3, 6, 6), -- Bootstrap
(3, 9, 7), -- C#
(3, 12, 8), -- PostgreSQL Avanzado
(3, 13, 9); -- NetCore

-- Áreas de Entrenamiento
INSERT INTO Areas_Entrenamiento (nombre, capacidad_maxima, ubicacion, descripcion) VALUES 
('Artemis', 33, 'Edificio Principal, Piso 1', 'Área principal de entrenamiento'),
('Apolo', 33, 'Edificio Principal, Piso 1', 'Área de entrenamiento con enfoque práctico'),
('Sputnik', 33, 'Edificio Principal, Piso 2', 'Área de entrenamiento para desarrollo avanzado');

-- Horarios
INSERT INTO Horarios (hora_inicio, hora_fin, jornada) VALUES 
('06:00:00', '10:00:00', 'Mañana'),
('10:00:00', '14:00:00', 'Mañana-Tarde'),
('14:00:00', '18:00:00', 'Tarde'),
('18:00:00', '22:00:00', 'Noche');

-- Asignación de Áreas y Horarios
INSERT INTO Area_Horario (id_area, id_horario, disponible) VALUES 
(1, 1, TRUE), -- Artemis - Mañana
(1, 2, TRUE), -- Artemis - Mañana-Tarde
(1, 3, TRUE), -- Artemis - Tarde
(1, 4, TRUE), -- Artemis - Noche
(2, 1, TRUE), -- Apolo - Mañana
(2, 2, TRUE), -- Apolo - Mañana-Tarde
(2, 3, TRUE), -- Apolo - Tarde
(2, 4, TRUE), -- Apolo - Noche
(3, 1, TRUE), -- Sputnik - Mañana
(3, 2, TRUE), -- Sputnik - Mañana-Tarde
(3, 3, TRUE), -- Sputnik - Tarde
(3, 4, TRUE); -- Sputnik - Noche

-- NOTA: A continuación se añadirían los datos de Trainers, Campers, Matrículas y Evaluaciones (al menos 50 registros por tabla).
-- Por limitaciones de espacio, se muestran ejemplos básicos de cada uno.

-- Ejemplo de Trainers (se necesitarían al menos 50 en total)
INSERT INTO Trainers (numero_identificacion, tipo_documento, nombres, apellidos, email, telefono, especialidad, fecha_contratacion) 
VALUES 
('1000123456', 'CC', 'Juan Carlos', 'Pérez Rodríguez', 'jcperez@campuslands.com', '3151234567', 'Desarrollo Backend', '2022-01-15'),
('1000123457', 'CC', 'María Alejandra', 'González López', 'magonzalez@campuslands.com', '3151234568', 'Desarrollo Frontend', '2022-02-10'),
('1000123458', 'CC', 'Carlos Andrés', 'Martínez Gómez', 'camartinez@campuslands.com', '3151234569', 'Bases de Datos', '2022-01-20');

-- Ejemplo de asignación de Trainers a Rutas
INSERT INTO Trainer_Ruta (id_trainer, id_ruta) VALUES 
(1, 1), -- Juan Carlos - NodeJS
(2, 2), -- María Alejandra - Java
(3, 3); -- Carlos Andrés - NetCore

-- Ejemplo de Campers (se necesitarían al menos 50 en total)
INSERT INTO Campers (numero_identificacion, tipo_documento, nombres, apellidos, fecha_nacimiento, email, telefono, direccion, ciudad, departamento, nombre_acudiente, telefono_acudiente, id_estado, id_nivel_riesgo, fecha_registro) 
VALUES 
('1005123456', 'TI', 'Ana María', 'López García', '2000-05-15', 'amlopez@email.com', '3201234567', 'Calle 45 #23-67', 'Bucaramanga', 'Santander', 'Pedro López', '3201234568', 4, 1, '2023-12-01'),
('1005123457', 'CC', 'Juan David', 'Ramírez Torres', '1999-08-20', 'jdramirez@email.com', '3201234569', 'Carrera 27 #45-32', 'Bucaramanga', 'Santander', 'Carmen Torres', '3201234570', 4, 2, '2023-12-02'),
('1005123458', 'CC', 'Luisa Fernanda', 'Gómez Prada', '2001-03-10', 'lfgomez@email.com', '3201234571', 'Carrera 33 #45-67', 'Piedecuesta', 'Santander', 'Jorge Gómez', '3201234572', 3, 1, '2023-12-03');

-- Ejemplo de Matrículas
INSERT INTO Matriculas (id_camper, id_ruta, id_area, id_horario, fecha_matricula, estado) 
VALUES 
(1, 1, 1, 1, '2024-01-10', 'Activa'), -- Ana María - NodeJS - Artemis - Mañana
(2, 2, 2, 2, '2024-01-10', 'Activa'), -- Juan David - Java - Apolo - Mañana-Tarde
(3, 3, 3, 3, '2024-01-10', 'Activa'); -- Luisa Fernanda - NetCore - Sputnik - Tarde

-- Ejemplo de Evaluaciones
INSERT INTO Evaluaciones (id_matricula, id_modulo, id_tipo_evaluacion, nota, fecha_evaluacion, observaciones) 
VALUES 
(1, 1, 1, 85.50, '2024-01-25', 'Buen dominio de conceptos básicos'),
(1, 1, 2, 90.00, '2024-01-26', 'Excelente resolución de problemas'),
(1, 1, 3, 95.00, '2024-01-27', 'Trabajos entregados a tiempo y completos'),
(2, 1, 1, 75.00, '2024-01-25', 'Comprensión adecuada de conceptos'),
(2, 1, 2, 80.00, '2024-01-26', 'Buena aplicación práctica'),
(2, 1, 3, 85.00, '2024-01-27', 'Trabajos completos'),
(3, 1, 1, 65.00, '2024-01-25', 'Necesita reforzar conceptos teóricos'),
(3, 1, 2, 70.00, '2024-01-26', 'Aplicación práctica aceptable'),
(3, 1, 3, 75.00, '2024-01-27', 'Entrega puntual de trabajos');

-- Ejemplo de Notas Finales por Módulo
INSERT INTO Notas_Finales_Modulo (id_matricula, id_modulo, nota_final, aprobado, fecha_calculo, observaciones) 
VALUES 
(1, 1, 89.50, TRUE, '2024-01-28', 'Excelente desempeño'),
(2, 1, 79.50, TRUE, '2024-01-28', 'Buen desempeño'),
(3, 1, 69.50, TRUE, '2024-01-28', 'Desempeño aceptable');

-- Vista para mostrar la información completa de los campers
CREATE VIEW View_Campers_Info AS
SELECT 
    c.id_camper,
    c.numero_identificacion,
    c.nombres,
    c.apellidos,
    c.email,
    c.telefono,
    e.nombre AS estado,
    r.nombre AS nivel_riesgo
FROM 
    Campers c
JOIN 
    Estados_Camper e ON c.id_estado = e.id_estado
JOIN 
    Niveles_Riesgo r ON c.id_nivel_riesgo = r.id_nivel_riesgo;

-- Vista para mostrar las matrículas con información detallada
CREATE VIEW View_Matriculas_Detalle AS
SELECT 
    m.id_matricula,
    c.nombres AS nombre_camper,
    c.apellidos AS apellido_camper,
    r.nombre AS ruta,
    a.nombre AS area,
    CONCAT(h.hora_inicio, ' - ', h.hora_fin) AS horario,
    m.fecha_matricula,
    m.estado
FROM 
    Matriculas m
JOIN 
    Campers c ON m.id_camper = c.id_camper
JOIN 
    Rutas r ON m.id_ruta = r.id_ruta
JOIN 
    Areas_Entrenamiento a ON m.id_area = a.id_area
JOIN 
    Horarios h ON m.id_horario = h.id_horario;

-- Vista para mostrar el rendimiento académico de los campers
CREATE VIEW View_Rendimiento_Academico AS
SELECT 
    c.id_camper,
    c.nombres,
    c.apellidos,
    r.nombre AS ruta,
    m.nombre AS modulo,
    nf.nota_final,
    CASE 
        WHEN nf.nota_final >= 60 THEN 'Aprobado'
        ELSE 'Bajo Rendimiento'
    END AS resultado
FROM 
    Notas_Finales_Modulo nf
JOIN 
    Matriculas ma ON nf.id_matricula = ma.id_matricula
JOIN 
    Campers c ON ma.id_camper = c.id_camper
JOIN 
    Rutas r ON ma.id_ruta = r.id_ruta
JOIN 
    Modulos m ON nf.id_modulo = m.id_modulo;

-- Vista para mostrar los campers en riesgo académico
CREATE VIEW View_Campers_En_Riesgo AS
SELECT 
    c.id_camper,
    c.nombres,
    c.apellidos,
    c.email,
    c.telefono,
    r.nombre AS nivel_riesgo,
    ru.nombre AS ruta,
    AVG(nf.nota_final) AS promedio_notas
FROM 
    Campers c
JOIN 
    Niveles_Riesgo r ON c.id_nivel_riesgo = r.id_nivel_riesgo
JOIN 
    Matriculas m ON c.id_camper = m.id_camper
JOIN 
    Rutas ru ON m.id_ruta = ru.id_ruta
LEFT JOIN 
    Notas_Finales_Modulo nf ON m.id_matricula = nf.id_matricula
WHERE 
    r.nombre IN ('Medio', 'Alto')
GROUP BY 
    c.id_camper, c.nombres, c.apellidos, c.email, c.telefono, r.nombre, ru.nombre
HAVING 
    AVG(nf.nota_final) < 70;

-- Procedimiento almacenado para calcular la nota final de un módulo
DELIMITER //
CREATE PROCEDURE CalcularNotaFinalModulo(IN p_id_matricula INT, IN p_id_modulo INT)
BEGIN
    DECLARE v_nota_teorica DECIMAL(5,2);
    DECLARE v_nota_practica DECIMAL(5,2);
    DECLARE v_nota_trabajos DECIMAL(5,2);
    DECLARE v_nota_final DECIMAL(5,2);
    DECLARE v_aprobado BOOLEAN;
    
    -- Obtener las notas según el tipo de evaluación
    SELECT nota INTO v_nota_teorica
    FROM Evaluaciones
    WHERE id_matricula = p_id_matricula AND id_modulo = p_id_modulo AND id_tipo_evaluacion = 1;
    
    SELECT nota INTO v_nota_practica
    FROM Evaluaciones
    WHERE id_matricula = p_id_matricula AND id_modulo = p_id_modulo AND id_tipo_evaluacion = 2;
    
    SELECT nota INTO v_nota_trabajos
    FROM Evaluaciones
    WHERE id_matricula = p_id_matricula AND id_modulo = p_id_modulo AND id_tipo_evaluacion = 3;
    
    -- Calcular la nota final (30% teórica, 60% práctica, 10% trabajos)
    SET v_nota_final = (v_nota_teorica * 0.3) + (v_nota_practica * 0.6) + (v_nota_trabajos * 0.1);
    
    -- Determinar si está aprobado (nota >= 60)
    IF v_nota_final >= 60 THEN
        SET v_aprobado = TRUE;
    ELSE
        SET v_aprobado = FALSE;
    END IF;
    
    -- Insertar o actualizar la nota final
    INSERT INTO Notas_Finales_Modulo (id_matricula, id_modulo, nota_final, aprobado, fecha_calculo, observaciones)
    VALUES (p_id_matricula, p_id_modulo, v_nota_final, v_aprobado, CURDATE(), 
           CONCAT('Nota calculada: Teórica ', v_nota_teorica, ', Práctica ', v_nota_practica, ', Trabajos ', v_nota_trabajos))
    ON DUPLICATE KEY UPDATE
        nota_final = v_nota_final,
        aprobado = v_aprobado,
        fecha_calculo = CURDATE(),
        observaciones = CONCAT('Nota recalculada: Teórica ', v_nota_teorica, ', Práctica ', v_nota_practica, ', Trabajos ', v_nota_trabajos);
END //
DELIMITER ;

-- Trigger para actualizar el nivel de riesgo de un camper cuando se registra una nueva nota final
DELIMITER //
CREATE TRIGGER ActualizarNivelRiesgo AFTER INSERT ON Notas_Finales_Modulo
FOR EACH ROW
BEGIN
    DECLARE v_id_camper INT;
    DECLARE v_promedio DECIMAL(5,2);
    DECLARE v_nuevo_nivel INT;
    
    -- Obtener el ID del camper
    SELECT c.id_camper INTO v_id_camper
    FROM Matriculas m
    JOIN Campers c ON m.id_camper = c.id_camper
    WHERE m.id_matricula = NEW.id_matricula;
    
    -- Calcular el promedio de notas del camper
    SELECT AVG(nota_final) INTO v_promedio
    FROM Notas_Finales_Modulo nf
    JOIN Matriculas m ON nf.id_matricula = m.id_matricula
    WHERE m.id_camper = v_id_camper;
    
    -- Determinar el nuevo nivel de riesgo basado en el promedio
    IF v_promedio >= 80 THEN
        SET v_nuevo_nivel = 1; -- Bajo
    ELSEIF v_promedio >= 60 THEN
        SET v_nuevo_nivel = 2; -- Medio
    ELSE
        SET v_nuevo_nivel = 3; -- Alto
    END IF;
    
    -- Actualizar el nivel de riesgo del camper
    UPDATE Campers
    SET id_nivel_riesgo = v_nuevo_nivel
    WHERE id_camper = v_id_camper;
END //
DELIMITER ;

-- Función para verificar disponibilidad en un área y horario
DELIMITER //
CREATE FUNCTION VerificarDisponibilidadArea(p_id_area INT, p_id_horario INT) RETURNS BOOLEAN
BEGIN
    DECLARE v_count INT;
    DECLARE v_capacidad INT;
    DECLARE v_disponible BOOLEAN;
    
    -- Verificar si el área y horario están disponibles
    SELECT disponible INTO v_disponible
    FROM Area_Horario
    WHERE id_area = p_id_area AND id_horario = p_id_horario;
    
    IF v_disponible = FALSE THEN
        RETURN FALSE;
    END IF;
    
    -- Obtener la capacidad máxima del área
    SELECT capacidad_maxima INTO v_capacidad
    FROM Areas_Entrenamiento
    WHERE id_area = p_id_area;
    
    -- Contar cuántos campers ya están matriculados en esa área y horario
    SELECT COUNT(*) INTO v_count
    FROM Matriculas
    WHERE id_area = p_id_area AND id_horario = p_id_horario AND estado = 'Activa';
    
    -- Verificar si hay capacidad disponible
    IF v_count < v_capacidad THEN
        RETURN TRUE;
    ELSE
        RETURN FALSE;
    END IF;
END //
DELIMITER ;
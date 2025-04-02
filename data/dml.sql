--insercciones de datos

-- Insertamos las áreas de entrenamiento
INSERT INTO areas (id, nombre, descripcion, capacidad_maxima, horario_inicio, horario_fin) VALUES
(1, 'Frontend', 'Área de desarrollo frontend', 30, '08:00:00', '18:00:00'),
(2, 'Backend', 'Área de desarrollo backend', 40, '08:00:00', '18:00:00'),
(3, 'Móvil', 'Área de desarrollo móvil', 25, '08:00:00', '18:00:00'),
(4, 'DevOps', 'Área de operaciones y desarrollo', 20, '08:00:00', '18:00:00'),
(5, 'Data Science', 'Área de ciencia de datos', 25, '08:00:00', '18:00:00');

-- Insertamos rutas de entrenamiento
INSERT INTO rutas (id, nombre, descripcion, duracion_meses, sgdb_principal, sgdb_alternativo, area_id) VALUES
(1, 'NodeJS', 'Ruta de desarrollo backend con NodeJS', 6, 'MongoDB', 'PostgreSQL', 2),
(2, 'Java', 'Ruta de desarrollo backend con Java', 7, 'MySQL', 'Oracle', 2),
(3, 'Python', 'Ruta de desarrollo backend con Python', 6, 'PostgreSQL', 'MongoDB', 2),
(4, 'React', 'Ruta de desarrollo frontend con React', 5, NULL, NULL, 1),
(5, 'Angular', 'Ruta de desarrollo frontend con Angular', 5, NULL, NULL, 1),
(6, 'VueJS', 'Ruta de desarrollo frontend con Vue.js', 5, NULL, NULL, 1),
(7, 'PHP', 'Ruta de desarrollo backend con PHP', 6, 'MySQL', 'PostgreSQL', 2),
(8, 'Ruby on Rails', 'Ruta de desarrollo backend con Ruby on Rails', 7, 'PostgreSQL', 'MySQL', 2),
(9, 'Go', 'Ruta de desarrollo backend con Go', 6, 'PostgreSQL', 'MongoDB', 2),
(10, 'Flutter', 'Ruta de desarrollo móvil con Flutter', 8, 'SQLite', 'Firebase', 3),
(11, 'DevOps', 'Ruta de operaciones y desarrollo', 7, NULL, NULL, 4),
(12, 'Data Science', 'Ruta de ciencia de datos con Python', 8, 'PostgreSQL', 'MongoDB', 5),
(13, 'UI/UX Design', 'Ruta de diseño de interfaces y experiencia de usuario', 6, NULL, NULL, 1),
(14, 'Cybersecurity', 'Ruta de seguridad informática', 7, NULL, NULL, 4),
(15, 'Cloud Computing', 'Ruta de computación en la nube', 6, NULL, NULL, 4);

-- Insertamos módulos para las rutas
INSERT INTO modulos (id, nombre, descripcion, duracion_horas, ruta_id) VALUES
(1, 'HTML y CSS', 'Fundamentos de HTML y CSS', 40, 4),
(2, 'JavaScript Básico', 'Fundamentos de JavaScript', 40, 4),
(3, 'React Básico', 'Introducción a React', 40, 4),
(4, 'Node.js Básico', 'Fundamentos de Node.js', 40, 1),
(5, 'Express.js', 'Framework web para Node.js', 40, 1),
(6, 'MongoDB', 'Base de datos NoSQL', 40, 1),
(7, 'Java Básico', 'Fundamentos de Java', 40, 2),
(8, 'Spring Boot', 'Framework para Java', 40, 2),
(9, 'MySQL', 'Base de datos relacional', 40, 2),
(10, 'Python Básico', 'Fundamentos de Python', 40, 3),
(11, 'Django', 'Framework web para Python', 40, 3),
(12, 'PostgreSQL', 'Base de datos relacional', 40, 3),
(13, 'Flutter Básico', 'Fundamentos de Flutter', 40, 10),
(14, 'Dart', 'Lenguaje de programación Dart', 40, 10),
(15, 'Firebase', 'Servicios en la nube', 40, 10);

-- Insertamos trainers con sus áreas asignadas
INSERT INTO trainers (id, nombre, email, telefono, especialidad, fecha_inicio, area_id) VALUES
(1, 'Miguel Ángel', 'miguel.angel@campuslands.com', '3001234567', 'Backend Development', '2023-01-01', 2),
(2, 'Cristian Buitrago', 'cristian.buitrago@campuslands.com', '3112345678', 'Backend Development', '2023-01-01', 2),
(3, 'Jholver', 'jholver@campuslands.com', '3223456789', 'Backend Development', '2023-01-01', 2),
(4, 'Ricardo Manjarres', 'ricardo.manjarres@campuslands.com', '3334567890', 'Frontend Development', '2023-01-01', 1),
(5, 'Carlos Rodríguez', 'carlos.rodriguez@campuslands.com', '3445678901', 'Frontend Development', '2023-01-01', 1),
(6, 'Ana Martínez', 'ana.martinez@campuslands.com', '3556789012', 'Frontend Development', '2023-01-01', 1),
(7, 'Luis González', 'luis.gonzalez@campuslands.com', '3667890123', 'Mobile Development', '2023-01-01', 3),
(8, 'María Sánchez', 'maria.sanchez@campuslands.com', '3778901234', 'DevOps Engineering', '2023-01-01', 4),
(9, 'Laura Torres', 'laura.torres@campuslands.com', '3889012345', 'DevOps Engineering', '2023-01-01', 4),
(10, 'Pedro López', 'pedro.lopez@campuslands.com', '3990123456', 'Data Science', '2023-01-01', 5);

-- Insertamos 50 campers con datos variados
INSERT INTO campers (id, nombre, apellidos, email, edad, telefono, acudiente_nombre, acudiente_telefono, estado, nivel_riesgo) VALUES
(1, 'Juan', 'Pérez González', 'juan.perez@email.com', 18, '3001234567', 'María González', '3009876543', 'Inscrito', 'Bajo'),
(2, 'Ana', 'Martínez Ruiz', 'ana.martinez@email.com', 19, '3002345678', 'Carlos Ruiz', '3008765432', 'Cursando', 'Medio'),
(3, 'Carlos', 'López Silva', 'carlos.lopez@email.com', 20, '3003456789', 'Laura Silva', '3007654321', 'Aprobado', 'Bajo'),
(4, 'María', 'García Torres', 'maria.garcia@email.com', 18, '3004567890', 'Pedro Torres', '3006543210', 'Inscrito', 'Medio'),
(5, 'Diego', 'Rodríguez Mora', 'diego.rodriguez@email.com', 19, '3005678901', 'Sofia Mora', '3005432109', 'Cursando', 'Alto'),
(6, 'Laura', 'Sánchez Vargas', 'laura.sanchez@email.com', 20, '3006789012', 'Juan Vargas', '3004321098', 'Graduado', 'Bajo'),
(7, 'Pedro', 'Ramírez Ortiz', 'pedro.ramirez@email.com', 18, '3007890123', 'Ana Ortiz', '3003210987', 'Expulsado', 'Alto'),
(8, 'Sofia', 'Torres Medina', 'sofia.torres@email.com', 19, '3008901234', 'Diego Medina', '3002109876', 'Retirado', 'Medio'),
(9, 'Daniel', 'Herrera Cruz', 'daniel.herrera@email.com', 20, '3009012345', 'Carmen Cruz', '3001098765', 'Cursando', 'Bajo'),
(10, 'Valentina', 'Castro Ruiz', 'valentina.castro@email.com', 18, '3000123456', 'Roberto Ruiz', '3000987654', 'Inscrito', 'Bajo'),
(11, 'Santiago', 'Morales Ruiz', 'santiago.morales@email.com', 19, '3001234567', 'Laura Ruiz', '3009876543', 'Aprobado', 'Medio'),
(12, 'Isabella', 'Ramírez López', 'isabella.ramirez@email.com', 20, '3002345678', 'Carlos López', '3008765432', 'Graduado', 'Bajo'),
(13, 'Matías', 'González Silva', 'matias.gonzalez@email.com', 18, '3003456789', 'Ana Silva', '3007654321', 'Expulsado', 'Alto'),
(14, 'Camila', 'Torres Vargas', 'camila.torres@email.com', 19, '3004567890', 'Pedro Vargas', '3006543210', 'Retirado', 'Medio'),
(15, 'Lucas', 'Martínez Cruz', 'lucas.martinez@email.com', 20, '3005678901', 'Sofia Cruz', '3005432109', 'Cursando', 'Alto'),
(16, 'Emma', 'Sánchez Ruiz', 'emma.sanchez@email.com', 18, '3006789012', 'Juan Ruiz', '3004321098', 'Inscrito', 'Bajo'),
(17, 'Nicolás', 'Pérez Medina', 'nicolas.perez.medina@email.com', 19, '3007890123', 'Ana Medina', '3003210987', 'Cursando', 'Medio'),
(18, 'Valeria', 'López Ortiz', 'valeria.lopez@email.com', 20, '3008901234', 'Diego Ortiz', '3002109876', 'Aprobado', 'Bajo'),
(19, 'Sebastián', 'Ramírez Silva', 'sebastian.ramirez@email.com', 18, '3009012345', 'Carmen Silva', '3001098765', 'Graduado', 'Medio'),
(20, 'Lucía', 'Torres Cruz', 'lucia.torres@email.com', 19, '3000123456', 'Roberto Cruz', '3000987654', 'Expulsado', 'Alto'),
(21, 'Tomás', 'Martínez Ruiz', 'tomas.martinez@email.com', 20, '3001234567', 'Laura Ruiz', '3009876543', 'Retirado', 'Medio'),
(22, 'Sofía', 'González Vargas', 'sofia.gonzalez@email.com', 18, '3002345678', 'Carlos Vargas', '3008765432', 'Cursando', 'Bajo'),
(23, 'Benjamín', 'Sánchez López', 'benjamin.sanchez@email.com', 19, '3003456789', 'Ana López', '3007654321', 'Inscrito', 'Alto'),
(24, 'Victoria', 'Pérez Silva', 'victoria.perez@email.com', 20, '3004567890', 'Pedro Silva', '3006543210', 'Cursando', 'Medio'),
(25, 'Martín', 'López Ruiz', 'martin.lopez@email.com', 18, '3005678901', 'Sofia Ruiz', '3005432109', 'Aprobado', 'Bajo'),
(26, 'Catalina', 'Ramírez Medina', 'catalina.ramirez@email.com', 19, '3006789012', 'Juan Medina', '3004321098', 'Graduado', 'Medio'),
(27, 'Agustín', 'Torres Ortiz', 'agustin.torres@email.com', 20, '3007890123', 'Ana Ortiz', '3003210987', 'Expulsado', 'Alto'),
(28, 'Isabella', 'Martínez Cruz', 'isabella.martinez@email.com', 18, '3008901234', 'Diego Cruz', '3002109876', 'Retirado', 'Medio'),
(29, 'Lucas', 'Sánchez Silva', 'lucas.sanchez@email.com', 19, '3009012345', 'Carmen Silva', '3001098765', 'Cursando', 'Bajo'),
(30, 'Emma', 'González Ruiz', 'emma.gonzalez@email.com', 20, '3000123456', 'Roberto Ruiz', '3000987654', 'Inscrito', 'Alto'),
(31, 'Nicolás', 'Pérez Vargas', 'nicolas.perez.vargas@email.com', 18, '3001234567', 'Laura Vargas', '3009876543', 'Cursando', 'Medio'),
(32, 'Valeria', 'López Medina', 'valeria.lopez.medina@email.com', 19, '3002345678', 'Carlos Medina', '3008765432', 'Aprobado', 'Bajo'),
(33, 'Sebastián', 'Ramírez Ortiz', 'sebastian.ramirez.ortiz@email.com', 20, '3003456789', 'Ana Ortiz', '3007654321', 'Graduado', 'Medio'),
(34, 'Lucía', 'Torres Silva', 'lucia.torres.silva@email.com', 18, '3004567890', 'Pedro Silva', '3006543210', 'Expulsado', 'Alto'),
(35, 'Tomás', 'Martínez Cruz', 'tomas.martinez.cruz@email.com', 19, '3005678901', 'Sofia Cruz', '3005432109', 'Retirado', 'Medio'),
(36, 'Sofía', 'González Ruiz', 'sofia.gonzalez.ruiz@email.com', 20, '3006789012', 'Juan Ruiz', '3004321098', 'Cursando', 'Bajo'),
(37, 'Benjamín', 'Sánchez Vargas', 'benjamin.sanchez.vargas@email.com', 18, '3007890123', 'Ana Vargas', '3003210987', 'Inscrito', 'Alto'),
(38, 'Victoria', 'Pérez Medina', 'victoria.perez.medina@email.com', 19, '3008901234', 'Diego Medina', '3002109876', 'Cursando', 'Medio'),
(39, 'Martín', 'López Ortiz', 'martin.lopez.ortiz@email.com', 20, '3009012345', 'Carmen Ortiz', '3001098765', 'Aprobado', 'Bajo'),
(40, 'Catalina', 'Ramírez Silva', 'catalina.ramirez.silva@email.com', 18, '3000123456', 'Roberto Silva', '3000987654', 'Graduado', 'Medio'),
(41, 'Agustín', 'Torres Cruz', 'agustin.torres.cruz@email.com', 19, '3001234567', 'Laura Cruz', '3009876543', 'Expulsado', 'Alto'),
(42, 'Isabella', 'Martínez Ruiz', 'isabella.martinez.ruiz@email.com', 20, '3002345678', 'Carlos Ruiz', '3008765432', 'Retirado', 'Medio'),
(43, 'Lucas', 'Sánchez Medina', 'lucas.sanchez.medina@email.com', 18, '3003456789', 'Ana Medina', '3007654321', 'Cursando', 'Bajo'),
(44, 'Emma', 'González Ortiz', 'emma.gonzalez.ortiz@email.com', 19, '3004567890', 'Pedro Ortiz', '3006543210', 'Inscrito', 'Alto'),
(45, 'Nicolás', 'Pérez Silva', 'nicolas.perez.silva@email.com', 20, '3005678901', 'Sofia Silva', '3005432109', 'Cursando', 'Medio'),
(46, 'Valeria', 'López Cruz', 'valeria.lopez.cruz@email.com', 18, '3006789012', 'Juan Cruz', '3004321098', 'Aprobado', 'Bajo'),
(47, 'Sebastián', 'Ramírez Ruiz', 'sebastian.ramirez.ruiz@email.com', 19, '3007890123', 'Ana Ruiz', '3003210987', 'Graduado', 'Medio'),
(48, 'Lucía', 'Torres Vargas', 'lucia.torres.vargas@email.com', 20, '3008901234', 'Diego Vargas', '3002109876', 'Expulsado', 'Alto'),
(49, 'Tomás', 'Martínez Medina', 'tomas.martinez.medina@email.com', 18, '3009012345', 'Carmen Medina', '3001098765', 'Retirado', 'Medio'),
(50, 'Sofía', 'González Silva', 'sofia.gonzalez.silva@email.com', 19, '3000123456', 'Roberto Silva', '3000987654', 'Cursando', 'Bajo');

-- Insertamos teléfonos adicionales para los campers
INSERT INTO telefonos_campers (id, camper_id, telefono) VALUES
(1, 1, '3001111111'),
(2, 1, '3001111112'),
(3, 2, '3112222222'),
(4, 2, '3112222223'),
(5, 3, '3223333333'),
(6, 3, '3223333334'),
(7, 4, '3334444444'),
(8, 5, '3445555555'),
(9, 5, '3445555556'),
(10, 6, '3556666666'),
(11, 7, '3667777777'),
(12, 7, '3667777778'),
(13, 8, '3778888888'),
(14, 9, '3889999999'),
(15, 10, '3990000000'),
(16, 11, '3101111111'),
(17, 12, '3212222222'),
(18, 13, '3323333333'),
(19, 13, '3323333334'),
(20, 14, '3434444444'),
(21, 15, '3545555555'),
(22, 16, '3656666666'),
(23, 17, '3767777777'),
(24, 17, '3767777778'),
(25, 18, '3878888888'),
(26, 19, '3989999999'),
(27, 20, '3090000000'),
(28, 21, '3101111111'),
(29, 21, '3101111112'),
(30, 22, '3212222222'),
(31, 23, '3323333333'),
(32, 24, '3434444444'),
(33, 25, '3545555555'),
(34, 25, '3545555556'),
(35, 26, '3656666666'),
(36, 27, '3767777777'),
(37, 28, '3878888888'),
(38, 29, '3989999999'),
(39, 30, '3090000000'),
(40, 31, '3101111111');

-- Insertar en la tabla asignaciones
INSERT INTO asignaciones (id, camper_id, ruta_id, trainer_id, fecha_inicio, fecha_fin, estado) VALUES
(1, 1, 1, 1, '2024-01-01', '2024-06-30', 'Activa'),
(2, 2, 1, 1, '2024-01-01', '2024-06-30', 'Activa'),
(3, 3, 2, 2, '2024-01-01', '2024-07-31', 'Activa'),
(4, 4, 2, 2, '2024-01-01', '2024-07-31', 'Activa'),
(5, 5, 3, 3, '2024-01-01', '2024-06-30', 'Activa'),
(6, 6, 3, 3, '2024-01-01', '2024-06-30', 'Activa'),
(7, 7, 4, 4, '2024-01-01', '2024-05-31', 'Activa'),
(8, 8, 4, 4, '2024-01-01', '2024-05-31', 'Activa'),
(9, 9, 5, 5, '2024-01-01', '2024-05-31', 'Activa'),
(10, 10, 5, 5, '2024-01-01', '2024-05-31', 'Activa'),
(11, 11, 6, 6, '2024-01-01', '2024-05-31', 'Activa'),
(12, 12, 7, 1, '2024-01-01', '2024-06-30', 'Activa'),
(13, 13, 8, 2, '2024-01-01', '2024-07-31', 'Activa'),
(14, 14, 9, 3, '2024-01-01', '2024-06-30', 'Activa'),
(15, 15, 10, 7, '2024-01-01', '2024-08-31', 'Activa'),
(16, 16, 1, 8, '2024-01-01', '2024-07-31', 'Activa'),
(17, 17, 2, 9, '2024-01-01', '2024-08-31', 'Activa'),
(18, 18, 3, 4, '2024-01-01', '2024-06-30', 'Activa'),
(19, 19, 4, 5, '2024-01-01', '2024-07-31', 'Activa'),
(20, 20, 5, 6, '2024-01-01', '2024-06-30', 'Activa'),
(21, 21, 1, 1, '2024-01-01', '2024-06-30', 'Activa'),
(22, 22, 2, 2, '2024-01-01', '2024-07-31', 'Activa'),
(23, 23, 3, 3, '2024-01-01', '2024-06-30', 'Activa'),
(24, 24, 4, 4, '2024-01-01', '2024-05-31', 'Activa'),
(25, 25, 5, 5, '2024-01-01', '2024-05-31', 'Activa'),
(26, 26, 6, 6, '2024-01-01', '2024-05-31', 'Activa'),
(27, 27, 7, 1, '2024-01-01', '2024-06-30', 'Activa'),
(28, 28, 8, 2, '2024-01-01', '2024-07-31', 'Activa'),
(29, 29, 9, 3, '2024-01-01', '2024-06-30', 'Activa'),
(30, 30, 10, 7, '2024-01-01', '2024-08-31', 'Activa'),
(31, 31, 1, 8, '2024-01-01', '2024-07-31', 'Activa'),
(32, 32, 2, 9, '2024-01-01', '2024-08-31', 'Activa'),
(33, 33, 3, 4, '2024-01-01', '2024-06-30', 'Activa'),
(34, 34, 4, 5, '2024-01-01', '2024-07-31', 'Activa'),
(35, 35, 5, 6, '2024-01-01', '2024-06-30', 'Activa'),
(36, 36, 1, 1, '2024-01-01', '2024-06-30', 'Activa'),
(37, 37, 2, 2, '2024-01-01', '2024-07-31', 'Activa'),
(38, 38, 3, 3, '2024-01-01', '2024-06-30', 'Activa'),
(39, 39, 4, 4, '2024-01-01', '2024-05-31', 'Activa'),
(40, 40, 5, 5, '2024-01-01', '2024-05-31', 'Activa'),
(41, 41, 6, 6, '2024-01-01', '2024-05-31', 'Activa'),
(42, 42, 7, 1, '2024-01-01', '2024-06-30', 'Activa'),
(43, 43, 8, 2, '2024-01-01', '2024-07-31', 'Activa'),
(44, 44, 9, 3, '2024-01-01', '2024-06-30', 'Activa'),
(45, 45, 10, 7, '2024-01-01', '2024-08-31', 'Activa'),
(46, 46, 1, 8, '2024-01-01', '2024-07-31', 'Activa'),
(47, 47, 2, 9, '2024-01-01', '2024-08-31', 'Activa'),
(48, 48, 3, 4, '2024-01-01', '2024-06-30', 'Activa'),
(49, 49, 4, 5, '2024-01-01', '2024-07-31', 'Activa'),
(50, 50, 5, 6, '2024-01-01', '2024-06-30', 'Activa');

-- Insertar en la tabla evaluaciones
INSERT INTO evaluaciones (id, camper_id, modulo_id, trainer_id, nota_teorica, nota_practica, nota_quiz, nota_final, fecha_evaluacion) VALUES
(1, 1, 1, 1, 85.0, 90.0, 80.0, 85.5, '2024-01-15'),
(2, 1, 2, 1, 90.0, 95.0, 85.0, 90.0, '2024-02-15'),
(3, 2, 1, 1, 75.0, 80.0, 80.0, 78.5, '2024-01-15'),
(4, 2, 2, 1, 80.0, 85.0, 85.0, 83.5, '2024-02-15'),
(5, 3, 3, 2, 90.0, 95.0, 90.0, 92.0, '2024-01-15'),
(6, 3, 4, 2, 85.0, 90.0, 90.0, 88.5, '2024-02-15'),
(7, 4, 3, 2, 95.0, 95.0, 95.0, 95.0, '2024-01-15'),
(8, 4, 4, 2, 90.0, 95.0, 90.0, 91.5, '2024-02-15'),
(9, 5, 5, 3, 70.0, 80.0, 80.0, 77.0, '2024-01-15'),
(10, 5, 6, 3, 75.0, 85.0, 85.0, 82.0, '2024-02-15'),
(11, 6, 5, 3, 85.0, 90.0, 95.0, 89.5, '2024-01-15'),
(12, 6, 6, 3, 90.0, 95.0, 90.0, 91.5, '2024-02-15'),
(13, 7, 7, 4, 50.0, 55.0, 60.0, 55.0, '2024-01-15'),
(14, 7, 8, 4, 45.0, 50.0, 55.0, 50.0, '2024-02-15'),
(15, 8, 7, 4, 40.0, 45.0, 50.0, 45.5, '2024-01-15'),
(16, 8, 8, 4, 35.0, 40.0, 45.0, 40.0, '2024-02-15'),
(17, 9, 9, 5, 90.0, 95.0, 90.0, 91.0, '2024-01-15'),
(18, 9, 10, 5, 85.0, 90.0, 90.0, 88.5, '2024-02-15'),
(19, 10, 9, 5, 80.0, 85.0, 85.0, 82.5, '2024-01-15'),
(20, 10, 10, 5, 75.0, 80.0, 80.0, 78.5, '2024-02-15');

-- Insertar datos en la tabla conocimientos_trainers
INSERT INTO conocimientos_trainers (trainer_id, modulo_id, nivel) VALUES
(1, 1, 'Avanzado'),
(1, 2, 'Avanzado'),
(2, 3, 'Avanzado'),
(3, 4, 'Avanzado');

-- Insertar datos en la tabla recursos
INSERT INTO recursos (nombre, tipo, descripcion, estado, fecha_adquisicion, valor, area_id) VALUES
('Laptop HP', 'Equipo', 'Laptop para desarrollo', 'Disponible', '2024-01-01', 1200.00, 1),
('Visual Studio Code', 'Software', 'Editor de código', 'Disponible', '2024-01-01', 0.00, 1),
('Documentación React', 'Documentación', 'Guías de React', 'Disponible', '2024-01-01', 0.00, 1),
('Servidor Dell', 'Equipo', 'Servidor para desarrollo', 'En uso', '2024-01-01', 2500.00, 2);

-- Insertar datos en la tabla proyectos
INSERT INTO proyectos (nombre, descripcion, fecha_inicio, fecha_fin_estimada, estado, ruta_id, trainer_id) VALUES
('E-commerce Web App', 'Desarrollo de tienda en línea', '2024-03-01', '2024-06-30', 'En progreso', 1, 1),
('Sistema de Gestión DB', 'Administración de bases de datos', '2024-03-15', '2024-05-15', 'Planificado', 2, 2),
('App de Seguridad', 'Aplicación de seguridad informática', '2024-04-01', '2024-07-31', 'Planificado', 3, 3);

-- Insertar datos en la tabla eventos
INSERT INTO eventos (titulo, descripcion, fecha_inicio, fecha_fin, tipo, capacidad_maxima, area_id) VALUES
('Taller de React', 'Taller práctico de React', '2024-04-01 09:00:00', '2024-04-01 17:00:00', 'Taller', 20, 1),
('Hackathon 2024', 'Competencia de desarrollo', '2024-05-15 08:00:00', '2024-05-17 18:00:00', 'Hackathon', 50, 1),
('Conferencia DB', 'Conferencia sobre bases de datos', '2024-06-01 10:00:00', '2024-06-01 18:00:00', 'Conferencia', 30, 2);

-- Insertar datos en la tabla notificaciones_sistema
INSERT INTO notificaciones_sistema (titulo, mensaje, tipo, fecha_creacion, fecha_envio, estado, destinatario_tipo, area_id) VALUES
('Nuevo módulo disponible', 'El módulo de React está disponible', 'Información', '2024-03-15 08:00:00', '2024-03-15 08:00:00', 'Enviada', 'Campers', 1),
('Mantenimiento programado', 'Sistema en mantenimiento', 'Advertencia', '2024-03-20 18:00:00', '2024-03-20 18:00:00', 'Pendiente', 'Todos', NULL),
('Actualización exitosa', 'Sistema actualizado correctamente', 'Éxito', '2024-03-21 10:00:00', '2024-03-21 10:00:00', 'Enviada', 'Todos', NULL);

-- Insertar datos de la tabla materiales
INSERT INTO materiales (nombre, descripcion, tipo, url, fecha_creacion, modulo_id, trainer_id) VALUES
('Guía HTML', 'Documentación HTML', 'Documento', 'https://ejemplo.com/html', '2024-03-01 09:00:00', 1, 1),
('Video CSS', 'Tutorial CSS', 'Video', 'https://ejemplo.com/css', '2024-03-01 09:00:00', 1, 1),
('Presentación JS', 'Slides JavaScript', 'Presentación', 'https://ejemplo.com/js', '2024-03-01 09:00:00', 2, 1),
('Código SQL', 'Ejemplos SQL', 'Código', 'https://ejemplo.com/sql', '2024-03-01 09:00:00', 3, 2);

-- Insertar datos de la tabla encuestas
INSERT INTO encuestas (titulo, descripcion, fecha_inicio, fecha_fin, tipo, estado, modulo_id, trainer_id) VALUES
('Satisfacción HTML', 'Encuesta de satisfacción HTML', '2024-03-15 09:00:00', '2024-03-22 17:00:00', 'Satisfacción', 'Activa', 1, 1),
('Evaluación CSS', 'Evaluación del módulo CSS', '2024-03-20 09:00:00', '2024-03-27 17:00:00', 'Evaluación', 'Activa', 1, 1),
('Retroalimentación JS', 'Retroalimentación JavaScript', '2024-03-25 09:00:00', '2024-04-01 17:00:00', 'Retroalimentación', 'Activa', 2, 1);

-- Insertar datos de la tabla certificados
INSERT INTO certificados (camper_id, ruta_id, fecha_emision, fecha_vencimiento, codigo_unico, estado) VALUES
(3, 2, '2024-03-17', '2025-03-17', 'CERT-2024-001', 'Vigente'),
(1, 1, '2024-06-30', '2025-06-30', 'CERT-2024-002', 'Vigente'),
(2, 1, '2024-06-30', '2025-06-30', 'CERT-2024-003', 'Vigente');

-- Insertar datos de la tabla mentorias
INSERT INTO mentorias (mentor_id, camper_id, modulo_id, fecha_inicio, fecha_fin, tipo, descripcion) VALUES
(1, 1, 1, '2024-03-01', '2024-03-31', 'Individual', 'Mentoría personalizada en HTML y CSS'),
(2, 2, 3, '2024-03-01', '2024-03-31', 'Grupal', 'Mentoría grupal en SQL'),
(3, 3, 4, '2024-03-01', '2024-03-31', 'Individual', 'Mentoría personalizada en Seguridad');

-- Insertar datos de la tabla salones
INSERT INTO salones (id, nombre, capacidad, descripcion, estado) VALUES
(1, 'Sala Apolo', 30, 'Sala principal para clases teóricas de frontend', 'Activo'),
(2, 'Sala Artemis', 25, 'Sala equipada para prácticas de backend', 'Activo'),
(3, 'Sala Sputnik', 20, 'Sala especializada para desarrollo móvil', 'Activo'),
(4, 'Sala Skylab', 30, 'Laboratorio de DevOps y cloud computing', 'Activo'),
(5, 'Sala Hubble', 25, 'Sala para análisis de datos y machine learning', 'Activo');

-- Insertar datos de la tabla horarios_clases
INSERT INTO horarios_clases (modulo_id, trainer_id, salon_id, dia_semana, hora_inicio, hora_fin, fecha_inicio, fecha_fin) VALUES
(1, 1, 1, 'Lunes', '08:00:00', '12:00:00', '2024-03-01', '2024-03-31'),
(2, 1, 1, 'Martes', '08:00:00', '12:00:00', '2024-03-01', '2024-03-31'),
(3, 2, 2, 'Miércoles', '09:00:00', '13:00:00', '2024-03-01', '2024-03-31'),
(4, 3, 3, 'Jueves', '10:00:00', '14:00:00', '2024-03-01', '2024-03-31'),
(5, 4, 4, 'Viernes', '08:00:00', '12:00:00', '2024-03-01', '2024-03-31');

-- Insertar datos de la tabla tareas_proyectos
INSERT INTO tareas_proyectos (modulo_id, trainer_id, titulo, descripcion, fecha_asignacion, fecha_entrega, tipo, peso) VALUES
(1, 1, 'Proyecto HTML', 'Crear una página web responsive', '2024-03-01', '2024-03-15', 'Proyecto', 30.00),
(2, 1, 'Tarea JavaScript', 'Ejercicios de arrays y objetos', '2024-03-01', '2024-03-08', 'Tarea', 20.00),
(3, 2, 'Evaluación SQL', 'Examen práctico de SQL', '2024-03-15', '2024-03-15', 'Evaluación', 40.00),
(4, 3, 'Proyecto Seguridad', 'Análisis de vulnerabilidades', '2024-03-01', '2024-03-20', 'Proyecto', 35.00);

-- Insertar datos de la tabla feedback_campers
INSERT INTO feedback_campers (camper_id, modulo_id, trainer_id, calificacion, comentario, fecha_feedback, tipo) VALUES
(1, 1, 1, 5, 'Excelente explicación del módulo', '2024-03-15 10:00:00', 'Módulo'),
(2, 2, 1, 4, 'Buen contenido, pero podría ser más práctico', '2024-03-15 11:00:00', 'Módulo'),
(3, 3, 2, 5, 'Muy buen trainer, explica muy bien', '2024-03-15 12:00:00', 'Trainer'),
(1, 1, 1, 4, 'Sugerencias para mejorar el curso', '2024-03-15 13:00:00', 'General');

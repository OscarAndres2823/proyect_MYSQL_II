--insercciones de datos


-- Inserts para Campers
INSERT INTO Campers (numero_identificacion, id_tipo_documento, nombres, apellidos, fecha_nacimiento, email, id_ciudad, direccion, genero, fecha_registro, id_estado, id_nivel_riesgo, foto_perfil) VALUES
-- Campers Activos con Riesgo Bajo
('CC1001', 1, 'Juan', 'Pérez', '2005-01-15', 'juan.perez@example.com', 1, 'Calle 123 #45-67', 'M', '2024-01-01', 1, 1, 'fotos/perfil/juan_perez.jpg'),
('CC1002', 1, 'María', 'López', '2004-03-20', 'maria.lopez@example.com', 2, 'Avenida 89 #12-34', 'F', '2024-01-02', 1, 1, 'fotos/perfil/maria_lopez.jpg'),
('CC1003', 1, 'Carlos', 'Gómez', '2003-05-10', 'carlos.gomez@example.com', 3, 'Carrera 56 #78-90', 'M', '2024-01-03', 2, 3, 'fotos/perfil/carlos_gomez.jpg'),
('CC1004', 1, 'Ana', 'Martínez', '2002-07-25', 'ana.martinez@example.com', 4, 'Diagonal 34 #56-78', 'F', '2024-01-04', 1, 1, 'fotos/perfil/ana_martinez.jpg'),
('CC1005', 1, 'Pedro', 'Sánchez', '2001-09-30', 'pedro.sanchez@example.com', 5, 'Transversal 12 #34-56', 'M', '2024-01-05', 1, 2, 'fotos/perfil/pedro_sanchez.jpg'),
-- Campers Activos con Riesgo Medio
('CC1006', 1, 'Sofía', 'Ramírez', '2000-11-15', 'sofia.ramirez@example.com', 6, 'Calle 45 #67-89', 'F', '2024-01-06', 2, 3, 'fotos/perfil/sofia_ramirez.jpg'),
('CC1007', 1, 'Luis', 'Torres', '1999-12-20', 'luis.torres@example.com', 7, 'Avenida 23 #45-67', 'M', '2024-01-07', 1, 1, 'fotos/perfil/luis_torres.jpg'),
('CC1008', 1, 'Elena', 'Vargas', '1998-02-28', 'elena.vargas@example.com', 8, 'Carrera 78 #90-12', 'F', '2024-01-08', 1, 2, 'fotos/perfil/elena_vargas.jpg'),
('CC1009', 1, 'Andrés', 'Hernández', '1997-04-05', 'andres.hernandez@example.com', 9, 'Diagonal 67 #89-01', 'M', '2024-01-09', 2, 3, 'fotos/perfil/andres_hernandez.jpg'),
('CC1010', 1, 'Diana', 'Castro', '1996-06-12', 'diana.castro@example.com', 10, 'Transversal 34 #56-78', 'F', '2024-01-10', 1, 1, 'fotos/perfil/diana_castro.jpg'),
-- Campers Activos con Riesgo Alto
('CC1011', 1, 'Jorge', 'Ortiz', '1995-08-18', 'jorge.ortiz@example.com', 11, 'Calle 89 #01-23', 'M', '2024-01-11', 1, 2, 'fotos/perfil/jorge_ortiz.jpg'),
('CC1012', 1, 'Valeria', 'Gutiérrez', '1994-10-22', 'valeria.gutierrez@example.com', 12, 'Avenida 45 #67-89', 'F', '2024-01-12', 2, 3, 'fotos/perfil/valeria_gutierrez.jpg'),
('CC1013', 1, 'Miguel', 'Flores', '1993-12-30', 'miguel.flores@example.com', 13, 'Carrera 12 #34-56', 'M', '2024-01-13', 1, 1, 'fotos/perfil/miguel_flores.jpg'),
('CC1014', 1, 'Carolina', 'Jiménez', '1992-01-15', 'carolina.jimenez@example.com', 14, 'Diagonal 89 #01-23', 'F', '2024-01-14', 1, 2, 'fotos/perfil/carolina_jimenez.jpg'),
('CC1015', 1, 'Ricardo', 'Morales', '1991-03-20', 'ricardo.morales@example.com', 15, 'Transversal 56 #78-90', 'M', '2024-01-15', 2, 3, 'fotos/perfil/ricardo_morales.jpg'),
-- Campers Graduados
('CC1016', 1, 'Gabriela', 'Rojas', '1990-05-25', 'gabriela.rojas@example.com', 16, 'Calle 34 #56-78', 'F', '2024-01-16', 3, 1, 'fotos/perfil/gabriela_rojas.jpg'),
('CC1017', 1, 'Fernando', 'Navarro', '1989-07-30', 'fernando.navarro@example.com', 17, 'Avenida 67 #89-01', 'M', '2024-01-17', 1, 2, 'fotos/perfil/fernando_navarro.jpg'),
('CC1018', 1, 'Isabela', 'Peña', '1988-09-05', 'isabela.pena@example.com', 18, 'Carrera 45 #67-89', 'F', '2024-01-18', 1, 1, 'fotos/perfil/isabela_pena.jpg'),
('CC1019', 1, 'Héctor', 'Cruz', '1987-11-12', 'hector.cruz@example.com', 19, 'Diagonal 12 #34-56', 'M', '2024-01-19', 1, 2, 'fotos/perfil/hector_cruz.jpg'),
('CC1020', 1, 'Mónica', 'Mendoza', '1986-12-18', 'monica.mendoza@example.com', 20, 'Transversal 78 #90-12', 'F', '2024-01-20', 1, 1, 'fotos/perfil/monica_mendoza.jpg'),
-- Campers en Pausa
('CC1021', 1, 'Esteban', 'Silva', '1985-02-22', 'esteban.silva@example.com', 21, 'Calle 56 #78-90', 'M', '2024-01-21', 4, 3, 'fotos/perfil/esteban_silva.jpg'),
('CC1022', 1, 'Lucía', 'Delgado', '1984-04-28', 'lucia.delgado@example.com', 22, 'Avenida 23 #45-67', 'F', '2024-01-22', 1, 1, 'fotos/perfil/lucia_delgado.jpg'),
('CC1023', 1, 'Alejandro', 'Mejía', '1983-06-15', 'alejandro.mejia@example.com', 23, 'Carrera 89 #01-23', 'M', '2024-01-23', 1, 2, 'fotos/perfil/alejandro_mejia.jpg'),
('CC1024', 1, 'Natalia', 'Paredes', '1982-08-20', 'natalia.paredes@example.com', 24, 'Diagonal 45 #67-89', 'F', '2024-01-24', 4, 3, 'fotos/perfil/natalia_paredes.jpg'),
('CC1025', 1, 'Cristian', 'Arroyo', '1981-10-25', 'cristian.arroyo@example.com', 25, 'Transversal 12 #34-56', 'M', '2024-01-25', 1, 1, 'fotos/perfil/cristian_arroyo.jpg'),
-- Campers en Proceso
('CC1026', 1, 'Andrea', 'Velásquez', '1980-12-30', 'andrea.velasquez@example.com', 26, 'Calle 78 #90-12', 'F', '2024-01-26', 1, 2, 'fotos/perfil/andrea_velasquez.jpg'),
('CC1027', 1, 'Sebastián', 'Carrillo', '1979-01-05', 'sebastian.carrillo@example.com', 27, 'Avenida 34 #56-78', 'M', '2024-01-27', 4, 3, 'fotos/perfil/sebastian_carrillo.jpg'),
('CC1028', 1, 'Paula', 'Espinosa', '1978-03-10', 'paula.espinosa@example.com', 28, 'Carrera 67 #89-01', 'F', '2024-01-28', 1, 1, 'fotos/perfil/paula_espinosa.jpg'),
('CC1029', 1, 'Rodrigo', 'Herrera', '1977-05-15', 'rodrigo.herrera@example.com', 29, 'Diagonal 23 #45-67', 'M', '2024-01-29', 1, 2, 'fotos/perfil/rodrigo_herrera.jpg'),
('CC1030', 1, 'Mariana', 'Acosta', '1976-07-20', 'mariana.acosta@example.com', 30, 'Transversal 89 #01-23', 'F', '2024-01-30', 4, 3, 'fotos/perfil/mariana_acosta.jpg'),
-- Campers en Certificación
('CC1031', 1, 'Daniel', 'Barrera', '1975-09-25', 'daniel.barrera@example.com', 31, 'Calle 45 #67-89', 'M', '2024-01-31', 1, 1, 'fotos/perfil/daniel_barrera.jpg'),
('CC1032', 1, 'Clara', 'González', '1974-11-30', 'clara.gonzalez@example.com', 32, 'Avenida 12 #34-56', 'F', '2024-02-01', 1, 2, 'fotos/perfil/clara_gonzalez.jpg'),
('CC1033', 1, 'Álvaro', 'Salazar', '1973-12-05', 'alvaro.salazar@example.com', 33, 'Carrera 78 #90-12', 'M', '2024-02-02', 4, 3, 'fotos/perfil/alvaro_salazar.jpg'),
('CC1034', 1, 'Liliana', 'Padilla', '1972-02-10', 'liliana.padilla@example.com', 34, 'Diagonal 34 #56-78', 'F', '2024-02-03', 1, 1, 'fotos/perfil/liliana_padilla.jpg'),
('CC1035', 1, 'Tomás', 'Suárez', '1971-04-15', 'tomas.suarez@example.com', 35, 'Transversal 67 #89-01', 'M', '2024-02-04', 1, 2, 'fotos/perfil/tomas_suarez.jpg'),
-- Campers en Networking
('CC1036', 1, 'Rafael', 'Ibáñez', '1970-06-20', 'rafael.ibanez@example.com', 36, 'Calle 23 #45-67', 'M', '2024-02-05', 1, 3, 'fotos/perfil/rafael_ibanez.jpg'),
('CC1037', 1, 'Beatriz', 'Rosales', '1969-08-25', 'beatriz.rosales@example.com', 37, 'Avenida 89 #01-23', 'F', '2024-02-06', 1, 1, 'fotos/perfil/beatriz_rosales.jpg'),
('CC1038', 1, 'Manuel', 'Castellanos', '1968-10-30', 'manuel.castellanos@example.com', 38, 'Carrera 45 #67-89', 'M', '2024-02-07', 1, 2, 'fotos/perfil/manuel_castellanos.jpg'),
('CC1039', 1, 'Verónica', 'Montoya', '1967-12-05', 'veronica.montoya@example.com', 39, 'Diagonal 12 #34-56', 'F', '2024-02-08', 4, 3, 'fotos/perfil/veronica_montoya.jpg'),
('CC1040', 1, 'Fabián', 'Villanueva', '1966-01-10', 'fabian.villanueva@example.com', 40, 'Transversal 78 #90-12', 'M', '2024-02-09', 1, 1, 'fotos/perfil/fabian_villanueva.jpg'),
-- Campers en Proyecto Final
('CC1041', 1, 'Raúl', 'Cortés', '1965-03-15', 'raul.cortes@example.com', 41, 'Calle 67 #89-01', 'M', '2024-02-10', 1, 2, 'fotos/perfil/raul_cortes.jpg'),
('CC1042', 1, 'Cecilia', 'Valenzuela', '1964-05-20', 'cecilia.valenzuela@example.com', 42, 'Avenida 34 #56-78', 'F', '2024-02-11', 4, 3, 'fotos/perfil/cecilia_valenzuela.jpg'),
('CC1043', 1, 'Patricio', 'Esquivel', '1963-07-25', 'patricio.esquivel@example.com', 43, 'Carrera 23 #45-67', 'M', '2024-02-12', 1, 1, 'fotos/perfil/patricio_esquivel.jpg'),
('CC1044', 1, 'Estefanía', 'Franco', '1962-09-30', 'estefania.franco@example.com', 44, 'Diagonal 89 #01-23', 'F', '2024-02-13', 1, 2, 'fotos/perfil/estefania_franco.jpg'),
('CC1045', 1, 'Martín', 'León', '1961-11-05', 'martin.leon@example.com', 45, 'Transversal 45 #67-89', 'M', '2024-02-14', 4, 3, 'fotos/perfil/martin_leon.jpg'),
-- Campers en Prácticas
('CC1046', 1, 'Angélica', 'Fuentes', '1960-12-10', 'angelica.fuentes@example.com', 46, 'Calle 12 #34-56', 'F', '2024-02-15', 1, 1, 'fotos/perfil/angelica_fuentes.jpg'),
('CC1047', 1, 'Germán', 'Maldonado', '1959-02-15', 'german.maldonado@example.com', 47, 'Avenida 78 #90-12', 'M', '2024-02-16', 1, 2, 'fotos/perfil/german_maldonado.jpg'),
('CC1048', 1, 'Silvia', 'Peralta', '1958-04-20', 'silvia.peralta@example.com', 48, 'Carrera 67 #89-01', 'F', '2024-02-17', 4, 3, 'fotos/perfil/silvia_peralta.jpg'),
('CC1049', 1, 'Julián', 'Soto', '1957-06-25', 'julian.soto@example.com', 49, 'Diagonal 34 #56-78', 'M', '2024-02-18', 1, 1, 'fotos/perfil/julian_soto.jpg'),
('CC1050', 1, 'Rosa', 'Ávila', '1956-08-30', 'rosa.avila@example.com', 50, 'Transversal 23 #45-67', 'F', '2024-02-19', 1, 2, 'fotos/perfil/rosa_avila.jpg');

-- Estados del Camper (50 registros)
INSERT INTO Estados_Camper (nombre, descripcion) VALUES
('Activo', 'Camper activo en el programa'),
('Inactivo', 'Camper temporalmente inactivo'),
('Graduado', 'Camper que ha completado el programa'),
('Desertor', 'Camper que ha abandonado el programa'),
('Suspendido', 'Camper suspendido temporalmente'),
('En Riesgo', 'Camper que requiere atención especial'),
('En Proceso', 'Camper en proceso de admisión'),
('Rechazado', 'Camper no admitido al programa'),
('En Espera', 'Camper en lista de espera'),
('Transferido', 'Camper transferido a otro programa'),
('En Pausa', 'Camper que ha solicitado pausa temporal'),
('En Recuperación', 'Camper en proceso de recuperación académica'),
('En Prácticas', 'Camper realizando prácticas profesionales'),
('En Proyecto Final', 'Camper trabajando en proyecto final'),
('En Evaluación', 'Camper en proceso de evaluación'),
('En Revisión', 'Camper en revisión de documentación'),
('En Entrevista', 'Camper en proceso de entrevista'),
('En Pruebas', 'Camper realizando pruebas de admisión'),
('En Orientación', 'Camper en proceso de orientación'),
('En Inducción', 'Camper en proceso de inducción'),
('En Capacitación', 'Camper en capacitación inicial'),
('En Acompañamiento', 'Camper en proceso de acompañamiento'),
('En Seguimiento', 'Camper en seguimiento académico'),
('En Apoyo', 'Camper recibiendo apoyo académico'),
('En Tutoría', 'Camper en proceso de tutoría'),
('En Mentoría', 'Camper en proceso de mentoría'),
('En Coaching', 'Camper en proceso de coaching'),
('En Asesoría', 'Camper en proceso de asesoría'),
('En Consulta', 'Camper en consulta académica'),
('En Reunión', 'Camper en reunión programada'),
('En Taller', 'Camper participando en taller'),
('En Seminario', 'Camper participando en seminario'),
('En Conferencia', 'Camper participando en conferencia'),
('En Workshop', 'Camper participando en workshop'),
('En Hackathon', 'Camper participando en hackathon'),
('En Competencia', 'Camper participando en competencia'),
('En Proyecto', 'Camper trabajando en proyecto'),
('En Investigación', 'Camper realizando investigación'),
('En Desarrollo', 'Camper en desarrollo de habilidades'),
('En Práctica', 'Camper en práctica de habilidades'),
('En Evaluación Continua', 'Camper en evaluación continua'),
('En Seguimiento Personal', 'Camper en seguimiento personal'),
('En Desarrollo Personal', 'Camper en desarrollo personal'),
('En Formación', 'Camper en proceso de formación'),
('En Preparación', 'Camper en preparación académica'),
('En Transición', 'Camper en proceso de transición'),
('En Adaptación', 'Camper en proceso de adaptación'),
('En Integración', 'Camper en proceso de integración'),
('En Socialización', 'Camper en proceso de socialización'),
('En Networking', 'Camper en proceso de networking');

-- Niveles de Riesgo (50 registros)
INSERT INTO Niveles_Riesgo (nombre, descripcion, color) VALUES
('Bajo', 'Riesgo mínimo, seguimiento normal', '#00FF00'),
('Medio', 'Riesgo moderado, requiere atención', '#FFFF00'),
('Alto', 'Riesgo alto, necesita intervención', '#FF0000'),
('Crítico', 'Riesgo crítico, acción inmediata', '#800000'),
('Emergencia', 'Situación de emergencia', '#FF00FF'),
('Normal', 'Sin riesgos identificados', '#00FFFF'),
('Observación', 'En observación por posibles riesgos', '#FFA500'),
('Prevención', 'Requiere medidas preventivas', '#008000'),
('Control', 'Riesgo bajo control', '#0000FF'),
('Monitoreo', 'En monitoreo constante', '#800080'),
('Bajo Control', 'Riesgo controlado y estable', '#00FF00'),
('En Evaluación', 'Riesgo en proceso de evaluación', '#FFD700'),
('Requiere Seguimiento', 'Necesita seguimiento cercano', '#FF4500'),
('Estable', 'Situación estable y controlada', '#32CD32'),
('En Mejora', 'Riesgo en proceso de mejora', '#98FB98'),
('Requiere Apoyo', 'Necesita apoyo adicional', '#FF69B4'),
('En Recuperación', 'Riesgo en proceso de recuperación', '#87CEEB'),
('Requiere Intervención', 'Necesita intervención inmediata', '#FF6347'),
('En Tratamiento', 'Riesgo en proceso de tratamiento', '#9370DB'),
('Requiere Supervisión', 'Necesita supervisión constante', '#FF8C00'),
('En Proceso', 'Riesgo en proceso de evaluación', '#20B2AA'),
('Requiere Atención', 'Necesita atención especial', '#FF1493'),
('En Seguimiento', 'Riesgo en seguimiento regular', '#00CED1'),
('Requiere Cuidado', 'Necesita cuidado especial', '#FF4500'),
('En Desarrollo', 'Riesgo en desarrollo', '#98FB98'),
('Requiere Vigilancia', 'Necesita vigilancia constante', '#FF69B4'),
('En Estudio', 'Riesgo en proceso de estudio', '#87CEEB'),
('Requiere Monitoreo', 'Necesita monitoreo regular', '#FF6347'),
('En Análisis', 'Riesgo en proceso de análisis', '#9370DB'),
('Requiere Evaluación', 'Necesita evaluación continua', '#FF8C00'),
('En Revisión', 'Riesgo en proceso de revisión', '#20B2AA'),
('Requiere Seguimiento Especial', 'Necesita seguimiento especial', '#FF1493'),
('En Tratamiento Especial', 'Riesgo en tratamiento especial', '#00CED1'),
('Requiere Intervención Especial', 'Necesita intervención especial', '#FF4500'),
('En Proceso de Mejora', 'Riesgo en proceso de mejora', '#98FB98'),
('Requiere Apoyo Especial', 'Necesita apoyo especial', '#FF69B4'),
('En Recuperación Avanzada', 'Riesgo en recuperación avanzada', '#87CEEB'),
('Requiere Supervisión Especial', 'Necesita supervisión especial', '#FF6347'),
('En Tratamiento Intensivo', 'Riesgo en tratamiento intensivo', '#9370DB'),
('Requiere Vigilancia Especial', 'Necesita vigilancia especial', '#FF8C00'),
('En Proceso de Evaluación', 'Riesgo en evaluación continua', '#20B2AA'),
('Requiere Monitoreo Especial', 'Necesita monitoreo especial', '#FF1493'),
('En Análisis Profundo', 'Riesgo en análisis profundo', '#00CED1'),
('Requiere Seguimiento Intensivo', 'Necesita seguimiento intensivo', '#FF4500'),
('En Tratamiento Avanzado', 'Riesgo en tratamiento avanzado', '#98FB98'),
('Requiere Intervención Intensiva', 'Necesita intervención intensiva', '#FF69B4'),
('En Proceso de Recuperación', 'Riesgo en recuperación', '#87CEEB'),
('Requiere Apoyo Intensivo', 'Necesita apoyo intensivo', '#FF6347'),
('En Seguimiento Avanzado', 'Riesgo en seguimiento avanzado', '#9370DB'),
('Requiere Supervisión Intensiva', 'Necesita supervisión intensiva', '#FF8C00');

-- Tipos de Documento (50 registros)
INSERT INTO Tipos_Documento (nombre, descripcion, formato_validacion) VALUES
('Cédula de Ciudadanía', 'Documento de identidad colombiano', '^[0-9]{8}$'),
('Tarjeta de Identidad', 'Documento de identidad para menores', '^[0-9]{10}$'),
('Cédula de Extranjería', 'Documento para extranjeros', '^[0-9]{10}$'),
('Pasaporte', 'Documento de viaje internacional', '^[A-Z0-9]{9}$'),
('Documento Nacional de Identidad', 'DNI para extranjeros', '^[0-9]{12}$'),
('Registro Civil', 'Documento de nacimiento', '^[0-9]{10}$'),
('Licencia de Conducción', 'Documento para conducir', '^[A-Z0-9]{10}$'),
('RUT', 'Registro Único Tributario', '^[0-9]{9}$'),
('NIT', 'Número de Identificación Tributaria', '^[0-9]{10}$'),
('Carné Estudiantil', 'Documento de identificación estudiantil', '^[A-Z0-9]{8}$'),
('Cédula de Residencia', 'Documento para residentes extranjeros', '^[0-9]{12}$'),
('Permiso de Trabajo', 'Documento para trabajo temporal', '^[A-Z0-9]{8}$'),
('Visa de Estudiante', 'Documento para estudiantes extranjeros', '^[A-Z0-9]{10}$'),
('Carné de Extranjería', 'Documento para residentes permanentes', '^[0-9]{11}$'),
('Documento de Identidad Militar', 'Documento para personal militar', '^[A-Z0-9]{9}$'),
('Carné de Discapacidad', 'Documento para personas con discapacidad', '^[0-9]{8}$'),
('Documento de Identidad Diplomático', 'Documento para personal diplomático', '^[A-Z0-9]{10}$'),
('Carné de Asilo', 'Documento para refugiados', '^[0-9]{9}$'),
('Documento de Identidad Consular', 'Documento para personal consular', '^[A-Z0-9]{8}$'),
('Carné de Protección', 'Documento para personas en protección', '^[0-9]{10}$'),
('Documento de Identidad Temporal', 'Documento temporal de identificación', '^[A-Z0-9]{7}$'),
('Carné de Residente', 'Documento para residentes permanentes', '^[0-9]{11}$'),
('Documento de Identidad Especial', 'Documento para casos especiales', '^[A-Z0-9]{9}$'),
('Carné de Identidad', 'Documento básico de identificación', '^[0-9]{8}$'),
('Documento de Identidad Provisional', 'Documento provisional de identificación', '^[A-Z0-9]{8}$'),
('Carné de Trabajador', 'Documento para trabajadores', '^[0-9]{9}$'),
('Documento de Identidad Temporal', 'Documento temporal de identificación', '^[A-Z0-9]{7}$'),
('Carné de Estudiante', 'Documento para estudiantes', '^[0-9]{8}$'),
('Documento de Identidad Especial', 'Documento para casos especiales', '^[A-Z0-9]{9}$'),
('Carné de Identidad', 'Documento básico de identificación', '^[0-9]{8}$'),
('Documento de Identidad Provisional', 'Documento provisional de identificación', '^[A-Z0-9]{8}$'),
('Carné de Trabajador', 'Documento para trabajadores', '^[0-9]{9}$'),
('Documento de Identidad Temporal', 'Documento temporal de identificación', '^[A-Z0-9]{7}$'),
('Carné de Estudiante', 'Documento para estudiantes', '^[0-9]{8}$'),
('Documento de Identidad Especial', 'Documento para casos especiales', '^[A-Z0-9]{9}$'),
('Carné de Identidad', 'Documento básico de identificación', '^[0-9]{8}$'),
('Documento de Identidad Provisional', 'Documento provisional de identificación', '^[A-Z0-9]{8}$'),
('Carné de Trabajador', 'Documento para trabajadores', '^[0-9]{9}$'),
('Documento de Identidad Temporal', 'Documento temporal de identificación', '^[A-Z0-9]{7}$'),
('Carné de Estudiante', 'Documento para estudiantes', '^[0-9]{8}$'),
('Documento de Identidad Especial', 'Documento para casos especiales', '^[A-Z0-9]{9}$');

-- Tipos de Evaluación (50 registros)
INSERT INTO Tipos_Evaluacion (nombre, descripcion, porcentaje) VALUES
('Quiz', 'Evaluación rápida de conocimientos básicos', 10.00),
('Taller', 'Ejercicio práctico individual', 15.00),
('Proyecto', 'Trabajo práctico grupal', 25.00),
('Examen', 'Evaluación formal de conocimientos', 30.00),
('Presentación', 'Exposición de temas', 20.00),
('Tarea', 'Ejercicio de práctica', 10.00),
('Participación', 'Involucramiento en clase', 5.00),
('Trabajo en Equipo', 'Evaluación grupal', 15.00),
('Portafolio', 'Recopilación de trabajos', 20.00),
('Autoevaluación', 'Evaluación personal', 5.00),
('Práctica de Laboratorio', 'Evaluación de habilidades prácticas', 20.00),
('Examen Parcial', 'Evaluación de mitad de módulo', 25.00),
('Examen Final', 'Evaluación final del módulo', 35.00),
('Proyecto Final', 'Trabajo final del módulo', 40.00),
('Trabajo de Investigación', 'Investigación y análisis', 30.00),
('Práctica de Campo', 'Evaluación en entorno real', 25.00),
('Simulación', 'Evaluación mediante simulación', 20.00),
('Debate', 'Participación en debates', 15.00),
('Resolución de Casos', 'Análisis y resolución de casos', 25.00),
('Evaluación Oral', 'Evaluación mediante exposición oral', 20.00),
('Trabajo Colaborativo', 'Trabajo en grupo', 20.00),
('Evaluación Continua', 'Seguimiento del progreso', 15.00),
('Práctica de Programación', 'Evaluación de código', 30.00),
('Revisión de Código', 'Evaluación de calidad de código', 20.00),
('Prueba de Concepto', 'Demostración de conceptos', 15.00),
('Evaluación de Documentación', 'Revisión de documentación', 10.00),
('Práctica de Diseño', 'Evaluación de diseño', 25.00),
('Evaluación de Arquitectura', 'Revisión de arquitectura', 30.00),
('Prueba de Rendimiento', 'Evaluación de rendimiento', 20.00),
('Evaluación de Seguridad', 'Revisión de seguridad', 25.00),
('Práctica de Testing', 'Evaluación de pruebas', 20.00),
('Evaluación de UX/UI', 'Revisión de experiencia de usuario', 25.00),
('Práctica de DevOps', 'Evaluación de prácticas DevOps', 30.00),
('Evaluación de Base de Datos', 'Revisión de bases de datos', 25.00),
('Práctica de Cloud', 'Evaluación de servicios cloud', 30.00),
('Evaluación de APIs', 'Revisión de APIs', 25.00),
('Práctica de Microservicios', 'Evaluación de microservicios', 30.00),
('Evaluación de Frontend', 'Revisión de desarrollo frontend', 25.00),
('Práctica de Backend', 'Evaluación de desarrollo backend', 30.00),
('Evaluación de Móvil', 'Revisión de desarrollo móvil', 25.00),
('Práctica de IA/ML', 'Evaluación de IA/ML', 35.00),
('Evaluación de Blockchain', 'Revisión de blockchain', 30.00),
('Práctica de IoT', 'Evaluación de IoT', 25.00),
('Evaluación de Ciberseguridad', 'Revisión de ciberseguridad', 30.00),
('Práctica de Big Data', 'Evaluación de big data', 35.00),
('Evaluación de Cloud Native', 'Revisión de cloud native', 30.00),
('Práctica de Serverless', 'Evaluación de serverless', 25.00),
('Evaluación de CI/CD', 'Revisión de CI/CD', 20.00),
('Práctica de GitOps', 'Evaluación de GitOps', 25.00),
('Evaluación de SRE', 'Revisión de SRE', 30.00);


-- Estados de Matrícula (50 registros)
INSERT INTO Estados_Matricula (nombre, descripcion) VALUES
('Activa', 'Matrícula vigente y activa'),
('Pendiente', 'Matrícula en proceso de validación'),
('Cancelada', 'Matrícula cancelada por el estudiante'),
('Rechazada', 'Matrícula no aprobada'),
('Completada', 'Matrícula finalizada exitosamente'),
('Suspendida', 'Matrícula temporalmente suspendida'),
('En Proceso', 'Matrícula en trámite'),
('Aprobada', 'Matrícula validada y aprobada'),
('En Espera', 'Matrícula en lista de espera'),
('Transferida', 'Matrícula transferida a otro programa'),
('En Revisión', 'Matrícula en proceso de revisión'),
('En Validación', 'Matrícula en proceso de validación'),
('En Trámite', 'Matrícula en proceso de trámite'),
('En Evaluación', 'Matrícula en proceso de evaluación'),
('En Aprobación', 'Matrícula en proceso de aprobación'),
('En Verificación', 'Matrícula en proceso de verificación'),
('En Confirmación', 'Matrícula en proceso de confirmación'),
('En Registro', 'Matrícula en proceso de registro'),
('En Actualización', 'Matrícula en proceso de actualización'),
('En Modificación', 'Matrícula en proceso de modificación'),
('En Corrección', 'Matrícula en proceso de corrección'),
('En Completamiento', 'Matrícula en proceso de completamiento'),
('En Finalización', 'Matrícula en proceso de finalización'),
('En Cierre', 'Matrícula en proceso de cierre'),
('En Archivado', 'Matrícula en proceso de archivado'),
('En Historial', 'Matrícula en historial'),
('En Respaldo', 'Matrícula en respaldo'),
('En Restauración', 'Matrícula en proceso de restauración'),
('En Recuperación', 'Matrícula en proceso de recuperación'),
('En Reingreso', 'Matrícula en proceso de reingreso'),
('En Reincorporación', 'Matrícula en proceso de reincorporación'),
('En Revalidación', 'Matrícula en proceso de revalidación'),
('En Reconocimiento', 'Matrícula en proceso de reconocimiento'),
('En Homologación', 'Matrícula en proceso de homologación'),
('En Convalidación', 'Matrícula en proceso de convalidación'),
('En Equivalencia', 'Matrícula en proceso de equivalencia'),
('En Certificación', 'Matrícula en proceso de certificación'),
('En Graduación', 'Matrícula en proceso de graduación'),
('En Titulación', 'Matrícula en proceso de titulación'),
('En Diplomado', 'Matrícula en proceso de diplomado'),
('En Especialización', 'Matrícula en proceso de especialización'),
('En Maestría', 'Matrícula en proceso de maestría'),
('En Doctorado', 'Matrícula en proceso de doctorado'),
('En Postgrado', 'Matrícula en proceso de postgrado'),
('En Extensión', 'Matrícula en proceso de extensión'),
('En Continuación', 'Matrícula en proceso de continuación'),
('En Prolongación', 'Matrícula en proceso de prolongación'),
('En Prórroga', 'Matrícula en proceso de prórroga'),
('En Suspensión Temporal', 'Matrícula temporalmente suspendida'),
('En Suspensión Definitiva', 'Matrícula definitivamente suspendida');

-- Tipos de Área (50 registros)
INSERT INTO Tipos_Area (nombre, descripcion, requisitos_equipamiento) VALUES
('Aula', 'Sala de clase tradicional', '{"pizarra": true, "proyector": true, "computadores": 30, "sillas": 30, "mesas": 15}'),
('Laboratorio', 'Sala para prácticas', '{"computadores": 25, "servidor": true, "red": true, "impresora": true, "escáner": true}'),
('Sala de Estudio', 'Área para estudio individual', '{"mesas": 20, "sillas": 40, "wifi": true, "enchufes": 40, "iluminación": true}'),
('Área Común', 'Espacio para actividades grupales', '{"mesas": 10, "sillas": 40, "pantalla": true, "sonido": true, "cafetera": true}'),
('Oficina', 'Espacio administrativo', '{"escritorios": 5, "computadores": 5, "impresora": true, "teléfono": true, "archivador": true}'),
('Sala de Reuniones', 'Área para reuniones', '{"mesa": 1, "sillas": 10, "proyector": true, "pantalla": true, "teléfono": true}'),
('Cafetería', 'Área de descanso y alimentación', '{"mesas": 15, "sillas": 60, "cafetera": true, "refrigerador": true, "microondas": true}'),
('Biblioteca', 'Área de recursos bibliográficos', '{"estantes": 20, "mesas": 10, "computadores": 5, "impresora": true, "escáner": true}'),
('Auditorio', 'Sala para presentaciones', '{"asientos": 100, "escenario": true, "sonido": true, "proyector": true, "pantalla": true}'),
('Gimnasio', 'Área deportiva', '{"equipos": 10, "espejos": true, "vestieres": true, "duchas": true, "baños": true}'),
('Sala de Conferencias', 'Área para conferencias', '{"asientos": 50, "pantalla": true, "sonido": true, "proyector": true, "micrófonos": true}'),
('Sala de Proyección', 'Área para proyecciones', '{"asientos": 30, "pantalla": true, "proyector": true, "sonido": true, "oscuridad": true}'),
('Sala de Música', 'Área para práctica musical', '{"instrumentos": true, "amplificadores": true, "sillas": 20, "mesas": 10, "sonido": true}'),
('Sala de Arte', 'Área para actividades artísticas', '{"mesas": 15, "sillas": 30, "iluminación": true, "ventilación": true, "materiales": true}'),
('Sala de Idiomas', 'Área para clases de idiomas', '{"computadores": 20, "audífonos": 20, "pantalla": true, "proyector": true, "mesas": 10}'),
('Sala de Química', 'Laboratorio de química', '{"mesas": 10, "sillas": 20, "ventilación": true, "agua": true, "materiales": true}'),
('Sala de Física', 'Laboratorio de física', '{"mesas": 10, "sillas": 20, "equipos": true, "instrumentos": true, "materiales": true}'),
('Sala de Biología', 'Laboratorio de biología', '{"microscopios": true, "mesas": 10, "sillas": 20, "ventilación": true, "materiales": true}'),
('Sala de Informática', 'Laboratorio de computación', '{"computadores": 25, "servidor": true, "red": true, "impresora": true, "proyector": true}'),
('Sala de Robótica', 'Área para robótica', '{"mesas": 10, "sillas": 20, "equipos": true, "herramientas": true, "materiales": true}'),
('Sala de Diseño', 'Área para diseño', '{"computadores": 15, "mesas": 10, "sillas": 20, "impresora": true, "escáner": true}'),
('Sala de Fotografía', 'Área para fotografía', '{"cámaras": true, "iluminación": true, "fondos": true, "computadores": 5, "impresora": true}'),
('Sala de Video', 'Área para producción de video', '{"cámaras": true, "iluminación": true, "computadores": 5, "software": true, "equipos": true}'),
('Sala de Radio', 'Área para producción de radio', '{"micrófonos": true, "consola": true, "computadores": 2, "software": true, "equipos": true}'),
('Sala de Danza', 'Área para danza', '{"espejos": true, "barras": true, "piso": true, "sonido": true, "iluminación": true}'),
('Sala de Teatro', 'Área para teatro', '{"escenario": true, "iluminación": true, "sonido": true, "vestuario": true, "utilería": true}'),
('Sala de Meditación', 'Área para meditación', '{"colchonetas": true, "almohadas": true, "iluminación": true, "sonido": true, "ventilación": true}'),
('Sala de Yoga', 'Área para yoga', '{"colchonetas": true, "bloques": true, "cintas": true, "iluminación": true, "ventilación": true}'),
('Sala de Pilates', 'Área para pilates', '{"colchonetas": true, "equipos": true, "espejos": true, "iluminación": true, "ventilación": true}'),
('Sala de Karate', 'Área para artes marciales', '{"tatami": true, "espejos": true, "equipos": true, "iluminación": true, "ventilación": true}'),
('Sala de Boxeo', 'Área para boxeo', '{"ring": true, "guantes": true, "equipos": true, "iluminación": true, "ventilación": true}'),
('Sala de Gimnasia', 'Área para gimnasia', '{"equipos": true, "colchonetas": true, "espejos": true, "iluminación": true, "ventilación": true}'),
('Sala de Natación', 'Área para natación', '{"piscina": true, "vestieres": true, "duchas": true, "baños": true, "equipos": true}'),
('Sala de Tenis', 'Área para tenis', '{"cancha": true, "raquetas": true, "pelotas": true, "red": true, "iluminación": true}'),
('Sala de Básquetbol', 'Área para básquetbol', '{"cancha": true, "aros": true, "pelotas": true, "iluminación": true, "vestieres": true}'),
('Sala de Fútbol', 'Área para fútbol', '{"cancha": true, "porterías": true, "pelotas": true, "iluminación": true, "vestieres": true}'),
('Sala de Voleibol', 'Área para voleibol', '{"cancha": true, "red": true, "pelotas": true, "iluminación": true, "vestieres": true}'),
('Sala de Ajedrez', 'Área para ajedrez', '{"mesas": 10, "sillas": 20, "tableros": true, "piezas": true, "relojes": true}'),
('Sala de Juegos', 'Área para juegos', '{"mesas": 5, "sillas": 20, "juegos": true, "iluminación": true, "ventilación": true}'),
('Sala de Lectura', 'Área para lectura', '{"mesas": 10, "sillas": 20, "estantes": true, "iluminación": true, "silencio": true}'),
('Sala de Estudio Grupal', 'Área para estudio en grupo', '{"mesas": 5, "sillas": 20, "pizarra": true, "proyector": true, "wifi": true}'),
('Sala de Tutorías', 'Área para tutorías', '{"mesas": 5, "sillas": 10, "pizarra": true, "computador": true, "proyector": true}'),
('Sala de Asesorías', 'Área para asesorías', '{"mesas": 5, "sillas": 10, "computador": true, "impresora": true, "teléfono": true}'),
('Sala de Orientación', 'Área para orientación', '{"mesas": 3, "sillas": 6, "computador": true, "impresora": true, "privacidad": true}'),
('Sala de Psicología', 'Área para psicología', '{"sillones": 2, "mesa": 1, "computador": true, "privacidad": true, "ventilación": true}'),
('Sala de Enfermería', 'Área para enfermería', '{"cama": true, "botiquín": true, "computador": true, "privacidad": true, "ventilación": true}'),
('Sala de Descanso', 'Área para descanso', '{"sofás": true, "sillas": 10, "mesas": 5, "cafetera": true, "ventilación": true}'),
('Sala de Espera', 'Área para espera', '{"sillas": 20, "mesas": 5, "revistas": true, "televisión": true, "ventilación": true}'),
('Sala de Recepción', 'Área de recepción', '{"escritorio": true, "sillas": 2, "computador": true, "teléfono": true, "impresora": true}'),
('Sala de Archivo', 'Área para archivo', '{"estantes": true, "cajas": true, "mesa": true, "sillas": 2, "ventilación": true}'),
('Sala de Servidores', 'Área para servidores', '{"racks": true, "aire": true, "seguridad": true, "energía": true, "red": true}'),
('Sala de Mantenimiento', 'Área para mantenimiento', '{"herramientas": true, "mesa": true, "sillas": 2, "ventilación": true, "iluminación": true}'),
('Sala de Limpieza', 'Área para limpieza', '{"productos": true, "equipos": true, "mesa": true, "ventilación": true, "agua": true}'),
('Sala de Seguridad', 'Área para seguridad', '{"cámaras": true, "monitores": true, "mesa": true, "sillas": 2, "comunicación": true}'),
('Sala de Emergencias', 'Área para emergencias', '{"extintores": true, "botiquín": true, "radio": true, "iluminación": true, "ventilación": true}');

-- Tipos de Material (50 registros)
INSERT INTO Tipos_Material (nombre, descripcion, formato_aceptado) VALUES
('Video', 'Contenido audiovisual', 'mp4,avi,mov,wmv,flv'),
('Documento', 'Archivos de texto', 'pdf,doc,docx,txt,rtf'),
('Presentación', 'Diapositivas', 'ppt,pptx,key,odp'),
('Imagen', 'Archivos gráficos', 'jpg,jpeg,png,gif,svg'),
('Audio', 'Archivos de sonido', 'mp3,wav,ogg,m4a,aac'),
('Código', 'Archivos de programación', 'java,py,js,php,html,css'),
('Hoja de Cálculo', 'Datos tabulares', 'xls,xlsx,csv,ods'),
('Enlace', 'Referencias web', 'url,html,htm'),
('JSON', 'Datos estructurados', 'json'),
('XML', 'Datos estructurados extensibles', 'xml'),
('Markdown', 'Documentos con formato', 'md,markdown'),
('PDF', 'Documentos portátiles', 'pdf'),
('ZIP', 'Archivos comprimidos', 'zip,rar,7z'),
('HTML', 'Contenido web', 'html,htm'),
('CSS', 'Estilos web', 'css'),
('JavaScript', 'Scripts web', 'js'),
('Python', 'Scripts Python', 'py'),
('Java', 'Código Java', 'java'),
('PHP', 'Scripts PHP', 'php'),
('SQL', 'Consultas SQL', 'sql'),
('YAML', 'Datos estructurados', 'yml,yaml'),
('CSV', 'Datos separados por comas', 'csv'),
('TXT', 'Archivos de texto plano', 'txt'),
('RTF', 'Documentos enriquecidos', 'rtf'),
('ODT', 'Documentos OpenDocument', 'odt'),
('ODS', 'Hojas de cálculo OpenDocument', 'ods'),
('ODP', 'Presentaciones OpenDocument', 'odp'),
('SVG', 'Gráficos vectoriales', 'svg'),
('EPS', 'Imágenes vectoriales', 'eps'),
('AI', 'Archivos de Illustrator', 'ai'),
('PSD', 'Archivos de Photoshop', 'psd'),
('SKETCH', 'Archivos de Sketch', 'sketch'),
('Figma', 'Archivos de Figma', 'fig'),
('InDesign', 'Archivos de InDesign', 'indd'),
('Premiere', 'Archivos de Premiere', 'prproj'),
('After Effects', 'Archivos de After Effects', 'aep'),
('Audition', 'Archivos de Audition', 'sesx'),
('Lightroom', 'Archivos de Lightroom', 'lrcat'),
('Illustrator', 'Archivos de Illustrator', 'ai'),
('Photoshop', 'Archivos de Photoshop', 'psd'),
('AutoCAD', 'Archivos de AutoCAD', 'dwg'),
('Revit', 'Archivos de Revit', 'rvt'),
('3DS Max', 'Archivos de 3DS Max', 'max'),
('Maya', 'Archivos de Maya', 'ma'),
('Blender', 'Archivos de Blender', 'blend'),
('Unity', 'Archivos de Unity', 'unity'),
('Unreal', 'Archivos de Unreal', 'uproject'),
('Godot', 'Archivos de Godot', 'godot'),
('LaTeX', 'Documentos LaTeX', 'tex');

-- Países (50 registros)
INSERT INTO Paises (nombre, codigo_iso) VALUES
('Colombia', 'CO'),
('México', 'MX'),
('Argentina', 'AR'),
('Chile', 'CL'),
('Perú', 'PE'),
('Brasil', 'BR'),
('Ecuador', 'EC'),
('Uruguay', 'UY'),
('Paraguay', 'PY'),
('Bolivia', 'BO'),
('Venezuela', 'VE'),
('Panamá', 'PA'),
('Costa Rica', 'CR'),
('Nicaragua', 'NI'),
('Honduras', 'HN'),
('El Salvador', 'SV'),
('Guatemala', 'GT'),
('Belice', 'BZ'),
('Cuba', 'CU'),
('República Dominicana', 'DO'),
('Puerto Rico', 'PR'),
('Haití', 'HT'),
('Jamaica', 'JM'),
('Trinidad y Tobago', 'TT'),
('Bahamas', 'BS'),
('Barbados', 'BB'),
('Surinam', 'SR'),
('Guyana', 'GY'),
('Guayana Francesa', 'GF'),
('Islas Malvinas', 'FK'),
('España', 'ES'),
('Francia', 'FR'),
('Alemania', 'DE'),
('Italia', 'IT'),
('Portugal', 'PT'),
('Reino Unido', 'GB'),
('Países Bajos', 'NL'),
('Bélgica', 'BE'),
('Suiza', 'CH'),
('Austria', 'AT'),
('Suecia', 'SE'),
('Noruega', 'NO'),
('Dinamarca', 'DK'),
('Finlandia', 'FI'),
('Polonia', 'PL'),
('Rusia', 'RU'),
('China', 'CN'),
('Japón', 'JP'),
('Corea del Sur', 'KR'),
('India', 'IN');

-- Departamentos (50 registros)
INSERT INTO Departamentos (nombre, id_pais) VALUES
-- Colombia
('Cundinamarca', 1),
('Antioquia', 1),
('Valle del Cauca', 1),
('Atlántico', 1),
('Santander', 1),
('Bolívar', 1),
('Boyacá', 1),
('Caldas', 1),
('Cauca', 1),
('Córdoba', 1),
-- México
('Ciudad de México', 2),
('Jalisco', 2),
('Nuevo León', 2),
('Puebla', 2),
('Guanajuato', 2),
-- Argentina
('Buenos Aires', 3),
('Córdoba', 3),
('Santa Fe', 3),
('Mendoza', 3),
('Tucumán', 3),
-- Chile
('Santiago', 4),
('Valparaíso', 4),
('Concepción', 4),
('La Serena', 4),
('Antofagasta', 4),
-- Perú
('Lima', 5),
('Arequipa', 5),
('Cusco', 5),
('Trujillo', 5),
('Chiclayo', 5),
-- Brasil
('São Paulo', 6),
('Río de Janeiro', 6),
('Minas Gerais', 6),
('Bahía', 6),
('Paraná', 6),
-- Ecuador
('Guayas', 7),
('Pichincha', 7),
('Azuay', 7),
('Manabí', 7),
('El Oro', 7),
-- Uruguay
('Montevideo', 8),
('Canelones', 8),
('Maldonado', 8),
('Salto', 8),
('Paysandú', 8),
-- Paraguay
('Asunción', 9),
('Central', 9),
('Alto Paraná', 9),
('Itapúa', 9),
('Cordillera', 9),
-- Bolivia
('La Paz', 10),
('Santa Cruz', 10),
('Cochabamba', 10),
('Oruro', 10),
('Potosí', 10);


-- Ciudades (50 registros)
INSERT INTO Ciudades (nombre, id_departamento, codigo_postal) VALUES
-- Colombia - Cundinamarca
('Bogotá', 1, '11001'),
('Soacha', 1, '25001'),
('Zipaquirá', 1, '25001'),
('Chía', 1, '25001'),
('Cajicá', 1, '25001'),
-- Colombia - Antioquia
('Medellín', 2, '05001'),
('Envigado', 2, '05541'),
('Bello', 2, '05101'),
('Itagüí', 2, '05541'),
('Rionegro', 2, '05400'),
-- Colombia - Valle del Cauca
('Cali', 3, '76001'),
('Palmira', 3, '76520'),
('Yumbo', 3, '76050'),
('Jamundí', 3, '76400'),
('Buenaventura', 3, '76450'),
-- Colombia - Atlántico
('Barranquilla', 4, '08001'),
('Soledad', 4, '08301'),
('Malambo', 4, '08350'),
('Puerto Colombia', 4, '08400'),
('Galapa', 4, '08450'),
-- Colombia - Santander
('Bucaramanga', 5, '68001'),
('Floridablanca', 5, '68101'),
('Girón', 5, '68150'),
('Piedecuesta', 5, '68151'),
('San Gil', 5, '68201'),
-- México - Ciudad de México
('Ciudad de México', 6, '06000'),
('Iztapalapa', 6, '09000'),
('Gustavo A. Madero', 6, '07000'),
('Álvaro Obregón', 6, '01000'),
('Coyoacán', 6, '04000'),
-- México - Jalisco
('Guadalajara', 7, '44100'),
('Zapopan', 7, '45100'),
('Tlaquepaque', 7, '45500'),
('Tonalá', 7, '45400'),
('Tlajomulco', 7, '45600'),
-- México - Nuevo León
('Monterrey', 8, '64000'),
('San Pedro Garza García', 8, '66200'),
('Guadalupe', 8, '67100'),
('San Nicolás', 8, '66400'),
('Escobedo', 8, '66000'),
-- México - Puebla
('Puebla', 9, '72000'),
('San Andrés Cholula', 9, '72760'),
('San Pedro Cholula', 9, '72750'),
('Cuautlancingo', 9, '72700'),
('San Martín Texmelucan', 9, '74000'),
-- México - Guanajuato
('León', 10, '37000'),
('Irapuato', 10, '36500'),
('Celaya', 10, '38000'),
('Salamanca', 10, '36700'),
('Silao', 10, '36100');

-- Inserts para Roles
INSERT INTO Roles (nombre, descripcion, permisos) VALUES
-- Roles Administrativos
('Administrador General', 'Acceso total al sistema', '{"todos": true}'),
('Administrador de Usuarios', 'Gestión de usuarios y roles', '{"usuarios": true, "roles": true}'),
('Administrador de Sistema', 'Gestión de configuración del sistema', '{"sistema": true, "configuracion": true}'),
('Administrador de Seguridad', 'Gestión de seguridad y auditoría', '{"seguridad": true, "auditoria": true}'),
('Administrador de Base de Datos', 'Gestión de bases de datos', '{"bases_datos": true, "backup": true}'),
-- Roles Académicos
('Trainer Principal', 'Gestión completa de módulos y evaluaciones', '{"modulos": true, "evaluaciones": true, "reportes": true}'),
('Trainer Asistente', 'Gestión básica de módulos y evaluaciones', '{"modulos": true, "evaluaciones": true}'),
('Coordinador Académico', 'Gestión de rutas y matrículas', '{"rutas": true, "matriculas": true, "reportes": true}'),
('Coordinador de Módulos', 'Gestión de módulos y contenido', '{"modulos": true, "contenido": true}'),
('Coordinador de Evaluaciones', 'Gestión de evaluaciones y calificaciones', '{"evaluaciones": true, "calificaciones": true}'),
-- Roles de Soporte
('Soporte Técnico', 'Soporte técnico y mantenimiento', '{"soporte": true, "mantenimiento": true}'),
('Soporte Académico', 'Soporte en contenido y materiales', '{"contenido": true, "materiales": true}'),
('Soporte de Usuarios', 'Atención a usuarios y campers', '{"usuarios": true, "campers": true}'),
('Soporte de Plataforma', 'Soporte de plataforma educativa', '{"plataforma": true, "tecnico": true}'),
('Soporte de Red', 'Gestión de red y conectividad', '{"red": true, "conectividad": true}'),
-- Roles de Desarrollo
('Desarrollador Frontend', 'Desarrollo de interfaz de usuario', '{"frontend": true, "ui": true}'),
('Desarrollador Backend', 'Desarrollo de servidores y APIs', '{"backend": true, "apis": true}'),
('Desarrollador Full Stack', 'Desarrollo completo de aplicaciones', '{"frontend": true, "backend": true}'),
('Desarrollador Móvil', 'Desarrollo de aplicaciones móviles', '{"movil": true, "apps": true}'),
('Desarrollador DevOps', 'Gestión de infraestructura y despliegue', '{"devops": true, "infraestructura": true}'),
-- Roles de Diseño
('Diseñador UI', 'Diseño de interfaz de usuario', '{"ui": true, "diseño": true}'),
('Diseñador UX', 'Diseño de experiencia de usuario', '{"ux": true, "experiencia": true}'),
('Diseñador Gráfico', 'Diseño de elementos gráficos', '{"grafico": true, "elementos": true}'),
('Diseñador de Materiales', 'Diseño de materiales educativos', '{"materiales": true, "educativos": true}'),
('Diseñador de Contenido', 'Diseño de contenido digital', '{"contenido": true, "digital": true}'),
-- Roles de Contenido
('Creador de Contenido', 'Creación de contenido educativo', '{"contenido": true, "creacion": true}'),
('Editor de Contenido', 'Edición y revisión de contenido', '{"contenido": true, "edicion": true}'),
('Revisor de Contenido', 'Revisión de calidad de contenido', '{"contenido": true, "revision": true}'),
('Gestor de Recursos', 'Gestión de recursos educativos', '{"recursos": true, "educativos": true}'),
('Coordinador de Contenido', 'Coordinación de contenido educativo', '{"contenido": true, "coordinacion": true}'),
-- Roles de Evaluación
('Evaluador Principal', 'Gestión completa de evaluaciones', '{"evaluaciones": true, "reportes": true}'),
('Evaluador Asistente', 'Gestión básica de evaluaciones', '{"evaluaciones": true}'),
('Revisor de Calificaciones', 'Revisión de calificaciones', '{"calificaciones": true, "revision": true}'),
('Gestor de Proyectos', 'Gestión de proyectos finales', '{"proyectos": true, "finales": true}'),
('Coordinador de Evaluaciones', 'Coordinación de evaluaciones', '{"evaluaciones": true, "coordinacion": true}'),
-- Roles de Gestión
('Gestor de Matrículas', 'Gestión de matrículas y registros', '{"matriculas": true, "registros": true}'),
('Gestor de Rutas', 'Gestión de rutas de aprendizaje', '{"rutas": true, "aprendizaje": true}'),
('Gestor de Horarios', 'Gestión de horarios y disponibilidad', '{"horarios": true, "disponibilidad": true}'),
('Gestor de Áreas', 'Gestión de áreas de entrenamiento', '{"areas": true, "entrenamiento": true}'),
('Gestor de Recursos', 'Gestión de recursos del campus', '{"recursos": true, "campus": true}'),
-- Roles de Monitoreo
('Monitor de Progreso', 'Monitoreo de progreso académico', '{"progreso": true, "academico": true}'),
('Monitor de Asistencia', 'Monitoreo de asistencia', '{"asistencia": true, "control": true}'),
('Monitor de Rendimiento', 'Monitoreo de rendimiento', '{"rendimiento": true, "seguimiento": true}'),
('Monitor de Riesgos', 'Monitoreo de riesgos académicos', '{"riesgos": true, "academicos": true}'),
('Monitor de Calidad', 'Monitoreo de calidad educativa', '{"calidad": true, "educativa": true}'),
-- Roles de Reportes
('Generador de Reportes', 'Generación de reportes', '{"reportes": true, "generacion": true}'),
('Analista de Datos', 'Análisis de datos académicos', '{"datos": true, "analisis": true}'),
('Gestor de Métricas', 'Gestión de métricas y KPIs', '{"metricas": true, "kpis": true}'),
('Coordinador de Reportes', 'Coordinación de reportes', '{"reportes": true, "coordinacion": true}'),
('Visualizador de Datos', 'Visualización de datos y estadísticas', '{"datos": true, "visualizacion": true}'),
-- Roles de Comunicación
('Gestor de Comunicaciones', 'Gestión de comunicaciones internas', '{"comunicaciones": true, "internas": true}'),
('Coordinador de Eventos', 'Coordinación de eventos académicos', '{"eventos": true, "academicos": true}'),
('Gestor de Notificaciones', 'Gestión de notificaciones', '{"notificaciones": true, "envio": true}'),
('Coordinador de Redes', 'Coordinación de redes sociales', '{"redes": true, "sociales": true}'),
('Gestor de Contenido Web', 'Gestión de contenido web', '{"web": true, "contenido": true}'),
-- Roles de Innovación
('Innovador Educativo', 'Desarrollo de innovaciones educativas', '{"innovacion": true, "educativa": true}'),
('Investigador Pedagógico', 'Investigación en pedagogía', '{"investigacion": true, "pedagogia": true}'),
('Desarrollador de Metodologías', 'Desarrollo de metodologías de enseñanza', '{"metodologias": true, "enseñanza": true}'),
('Experto en Tecnología Educativa', 'Especialista en tecnología educativa', '{"tecnologia": true, "educativa": true}'),
('Consultor de Innovación', 'Consultoría en innovación educativa', '{"innovacion": true, "consultoria": true}');

-- Inserts para Usuarios
INSERT INTO Usuarios (username, password_hash, id_rol, nombre, apellido, email, activo, ultimo_acceso, intentos_fallidos, fecha_bloqueo) VALUES
-- Administradores
('admin.sistema', '$2a$10$XOPbrlUPQdwdJUpSrIF6X.LbE14qsMmKGhM1A8W9iq.7ZxZxZxZxZ', 1, 'Juan', 'Sistema', 'admin.sistema@campus.com', true, '2024-02-20 08:00:00', 0, NULL),
('admin.usuarios', '$2a$10$XOPbrlUPQdwdJUpSrIF6X.LbE14qsMmKGhM1A8W9iq.7ZxZxZxZxZ', 2, 'María', 'Usuarios', 'admin.usuarios@campus.com', true, '2024-02-20 08:30:00', 0, NULL),
('admin.seguridad', '$2a$10$XOPbrlUPQdwdJUpSrIF6X.LbE14qsMmKGhM1A8W9iq.7ZxZxZxZxZ', 4, 'Carlos', 'Seguridad', 'admin.seguridad@campus.com', true, '2024-02-20 09:00:00', 0, NULL),
('admin.bd', '$2a$10$XOPbrlUPQdwdJUpSrIF6X.LbE14qsMmKGhM1A8W9iq.7ZxZxZxZxZ', 5, 'Ana', 'BaseDatos', 'admin.bd@campus.com', true, '2024-02-20 09:30:00', 0, NULL),
('admin.config', '$2a$10$XOPbrlUPQdwdJUpSrIF6X.LbE14qsMmKGhM1A8W9iq.7ZxZxZxZxZ', 3, 'Pedro', 'Config', 'admin.config@campus.com', true, '2024-02-20 10:00:00', 0, NULL),
-- Trainers
('trainer.juan', '$2a$10$XOPbrlUPQdwdJUpSrIF6X.LbE14qsMmKGhM1A8W9iq.7ZxZxZxZxZ', 6, 'Juan', 'Pérez', 'trainer.juan@campus.com', true, '2024-02-20 10:30:00', 0, NULL),
('trainer.maria', '$2a$10$XOPbrlUPQdwdJUpSrIF6X.LbE14qsMmKGhM1A8W9iq.7ZxZxZxZxZ', 7, 'María', 'González', 'trainer.maria@campus.com', true, '2024-02-20 11:00:00', 0, NULL),
('trainer.carlos', '$2a$10$XOPbrlUPQdwdJUpSrIF6X.LbE14qsMmKGhM1A8W9iq.7ZxZxZxZxZ', 6, 'Carlos', 'Rodríguez', 'trainer.carlos@campus.com', true, '2024-02-20 11:30:00', 0, NULL),
('trainer.ana', '$2a$10$XOPbrlUPQdwdJUpSrIF6X.LbE14qsMmKGhM1A8W9iq.7ZxZxZxZxZ', 7, 'Ana', 'Martínez', 'trainer.ana@campus.com', true, '2024-02-20 12:00:00', 0, NULL),
('trainer.pedro', '$2a$10$XOPbrlUPQdwdJUpSrIF6X.LbE14qsMmKGhM1A8W9iq.7ZxZxZxZxZ', 6, 'Pedro', 'Sánchez', 'trainer.pedro@campus.com', true, '2024-02-20 12:30:00', 0, NULL),
-- Coordinadores
('coord.academico', '$2a$10$XOPbrlUPQdwdJUpSrIF6X.LbE14qsMmKGhM1A8W9iq.7ZxZxZxZxZ', 8, 'Laura', 'Académico', 'coord.academico@campus.com', true, '2024-02-20 13:00:00', 0, NULL),
('coord.modulos', '$2a$10$XOPbrlUPQdwdJUpSrIF6X.LbE14qsMmKGhM1A8W9iq.7ZxZxZxZxZ', 9, 'Roberto', 'Módulos', 'coord.modulos@campus.com', true, '2024-02-20 13:30:00', 0, NULL),
('coord.evaluaciones', '$2a$10$XOPbrlUPQdwdJUpSrIF6X.LbE14qsMmKGhM1A8W9iq.7ZxZxZxZxZ', 10, 'Carmen', 'Evaluaciones', 'coord.evaluaciones@campus.com', true, '2024-02-20 14:00:00', 0, NULL),
-- Soporte
('soporte.tecnico', '$2a$10$XOPbrlUPQdwdJUpSrIF6X.LbE14qsMmKGhM1A8W9iq.7ZxZxZxZxZ', 11, 'David', 'Técnico', 'soporte.tecnico@campus.com', true, '2024-02-20 14:30:00', 0, NULL),
('soporte.academico', '$2a$10$XOPbrlUPQdwdJUpSrIF6X.LbE14qsMmKGhM1A8W9iq.7ZxZxZxZxZ', 12, 'Elena', 'Académico', 'soporte.academico@campus.com', true, '2024-02-20 15:00:00', 0, NULL),
('soporte.usuarios', '$2a$10$XOPbrlUPQdwdJUpSrIF6X.LbE14qsMmKGhM1A8W9iq.7ZxZxZxZxZ', 13, 'Francisco', 'Usuarios', 'soporte.usuarios@campus.com', true, '2024-02-20 15:30:00', 0, NULL),
-- Desarrollo
('dev.frontend', '$2a$10$XOPbrlUPQdwdJUpSrIF6X.LbE14qsMmKGhM1A8W9iq.7ZxZxZxZxZ', 16, 'Gabriel', 'Frontend', 'dev.frontend@campus.com', true, '2024-02-20 16:00:00', 0, NULL),
('dev.backend', '$2a$10$XOPbrlUPQdwdJUpSrIF6X.LbE14qsMmKGhM1A8W9iq.7ZxZxZxZxZ', 17, 'Héctor', 'Backend', 'dev.backend@campus.com', true, '2024-02-20 16:30:00', 0, NULL),
('dev.fullstack', '$2a$10$XOPbrlUPQdwdJUpSrIF6X.LbE14qsMmKGhM1A8W9iq.7ZxZxZxZxZ', 18, 'Isabel', 'Fullstack', 'dev.fullstack@campus.com', true, '2024-02-20 17:00:00', 0, NULL),
-- Diseño
('disenador.ui', '$2a$10$XOPbrlUPQdwdJUpSrIF6X.LbE14qsMmKGhM1A8W9iq.7ZxZxZxZxZ', 21, 'Javier', 'UI', 'disenador.ui@campus.com', true, '2024-02-20 17:30:00', 0, NULL),
('disenador.ux', '$2a$10$XOPbrlUPQdwdJUpSrIF6X.LbE14qsMmKGhM1A8W9iq.7ZxZxZxZxZ', 22, 'Karla', 'UX', 'disenador.ux@campus.com', true, '2024-02-20 18:00:00', 0, NULL),
('disenador.grafico', '$2a$10$XOPbrlUPQdwdJUpSrIF6X.LbE14qsMmKGhM1A8W9iq.7ZxZxZxZxZ', 23, 'Luis', 'Gráfico', 'disenador.grafico@campus.com', true, '2024-02-20 18:30:00', 0, NULL),
-- Contenido
('creador.contenido', '$2a$10$XOPbrlUPQdwdJUpSrIF6X.LbE14qsMmKGhM1A8W9iq.7ZxZxZxZxZ', 26, 'Marta', 'Contenido', 'creador.contenido@campus.com', true, '2024-02-20 19:00:00', 0, NULL),
('editor.contenido', '$2a$10$XOPbrlUPQdwdJUpSrIF6X.LbE14qsMmKGhM1A8W9iq.7ZxZxZxZxZ', 27, 'Nicolás', 'Editor', 'editor.contenido@campus.com', true, '2024-02-20 19:30:00', 0, NULL),
('revisor.contenido', '$2a$10$XOPbrlUPQdwdJUpSrIF6X.LbE14qsMmKGhM1A8W9iq.7ZxZxZxZxZ', 28, 'Olga', 'Revisor', 'revisor.contenido@campus.com', true, '2024-02-20 20:00:00', 0, NULL),
-- Evaluación
('evaluador.principal', '$2a$10$XOPbrlUPQdwdJUpSrIF6X.LbE14qsMmKGhM1A8W9iq.7ZxZxZxZxZ', 31, 'Pablo', 'Principal', 'evaluador.principal@campus.com', true, '2024-02-20 20:30:00', 0, NULL),
('evaluador.asistente', '$2a$10$XOPbrlUPQdwdJUpSrIF6X.LbE14qsMmKGhM1A8W9iq.7ZxZxZxZxZ', 32, 'Querubín', 'Asistente', 'evaluador.asistente@campus.com', true, '2024-02-20 21:00:00', 0, NULL),
('revisor.calificaciones', '$2a$10$XOPbrlUPQdwdJUpSrIF6X.LbE14qsMmKGhM1A8W9iq.7ZxZxZxZxZ', 33, 'Rosa', 'Calificaciones', 'revisor.calificaciones@campus.com', true, '2024-02-20 21:30:00', 0, NULL),
-- Gestión
('gestor.matriculas', '$2a$10$XOPbrlUPQdwdJUpSrIF6X.LbE14qsMmKGhM1A8W9iq.7ZxZxZxZxZ', 36, 'Samuel', 'Matrículas', 'gestor.matriculas@campus.com', true, '2024-02-20 22:00:00', 0, NULL),
('gestor.rutas', '$2a$10$XOPbrlUPQdwdJUpSrIF6X.LbE14qsMmKGhM1A8W9iq.7ZxZxZxZxZ', 37, 'Teresa', 'Rutas', 'gestor.rutas@campus.com', true, '2024-02-20 22:30:00', 0, NULL),
('gestor.horarios', '$2a$10$XOPbrlUPQdwdJUpSrIF6X.LbE14qsMmKGhM1A8W9iq.7ZxZxZxZxZ', 38, 'Ulises', 'Horarios', 'gestor.horarios@campus.com', true, '2024-02-20 23:00:00', 0, NULL),
-- Monitoreo
('monitor.progreso', '$2a$10$XOPbrlUPQdwdJUpSrIF6X.LbE14qsMmKGhM1A8W9iq.7ZxZxZxZxZ', 41, 'Victoria', 'Progreso', 'monitor.progreso@campus.com', true, '2024-02-20 23:30:00', 0, NULL),
('monitor.asistencia', '$2a$10$XOPbrlUPQdwdJUpSrIF6X.LbE14qsMmKGhM1A8W9iq.7ZxZxZxZxZ', 42, 'Walter', 'Asistencia', 'monitor.asistencia@campus.com', true, '2024-02-21 00:00:00', 0, NULL),
('monitor.rendimiento', '$2a$10$XOPbrlUPQdwdJUpSrIF6X.LbE14qsMmKGhM1A8W9iq.7ZxZxZxZxZ', 43, 'Ximena', 'Rendimiento', 'monitor.rendimiento@campus.com', true, '2024-02-21 00:30:00', 0, NULL),
-- Reportes
('generador.reportes', '$2a$10$XOPbrlUPQdwdJUpSrIF6X.LbE14qsMmKGhM1A8W9iq.7ZxZxZxZxZ', 46, 'Yolanda', 'Reportes', 'generador.reportes@campus.com', true, '2024-02-21 01:00:00', 0, NULL),
('analista.datos', '$2a$10$XOPbrlUPQdwdJUpSrIF6X.LbE14qsMmKGhM1A8W9iq.7ZxZxZxZxZ', 47, 'Zacarías', 'Datos', 'analista.datos@campus.com', true, '2024-02-21 01:30:00', 0, NULL),
('gestor.metricas', '$2a$10$XOPbrlUPQdwdJUpSrIF6X.LbE14qsMmKGhM1A8W9iq.7ZxZxZxZxZ', 48, 'Adriana', 'Métricas', 'gestor.metricas@campus.com', true, '2024-02-21 02:00:00', 0, NULL),
-- Comunicación
('gestor.comunicaciones', '$2a$10$XOPbrlUPQdwdJUpSrIF6X.LbE14qsMmKGhM1A8W9iq.7ZxZxZxZxZ', 51, 'Bruno', 'Comunicaciones', 'gestor.comunicaciones@campus.com', true, '2024-02-21 02:30:00', 0, NULL),
('coord.eventos', '$2a$10$XOPbrlUPQdwdJUpSrIF6X.LbE14qsMmKGhM1A8W9iq.7ZxZxZxZxZ', 52, 'Cecilia', 'Eventos', 'coord.eventos@campus.com', true, '2024-02-21 03:00:00', 0, NULL),
('gestor.notificaciones', '$2a$10$XOPbrlUPQdwdJUpSrIF6X.LbE14qsMmKGhM1A8W9iq.7ZxZxZxZxZ', 53, 'Daniel', 'Notificaciones', 'gestor.notificaciones@campus.com', true, '2024-02-21 03:30:00', 0, NULL),
-- Innovación
('innovador.educativo', '$2a$10$XOPbrlUPQdwdJUpSrIF6X.LbE14qsMmKGhM1A8W9iq.7ZxZxZxZxZ', 56, 'Elena', 'Innovador', 'innovador.educativo@campus.com', true, '2024-02-21 04:00:00', 0, NULL),
('investigador.pedagogico', '$2a$10$XOPbrlUPQdwdJUpSrIF6X.LbE14qsMmKGhM1A8W9iq.7ZxZxZxZxZ', 57, 'Felipe', 'Investigador', 'investigador.pedagogico@campus.com', true, '2024-02-21 04:30:00', 0, NULL),
('desarrollador.metodologias', '$2a$10$XOPbrlUPQdwdJUpSrIF6X.LbE14qsMmKGhM1A8W9iq.7ZxZxZxZxZ', 58, 'Gloria', 'Metodologías', 'desarrollador.metodologias@campus.com', true, '2024-02-21 05:00:00', 0, NULL),
-- Usuarios Inactivos
('usuario.bloqueado', '$2a$10$XOPbrlUPQdwdJUpSrIF6X.LbE14qsMmKGhM1A8W9iq.7ZxZxZxZxZ', 1, 'Hugo', 'Bloqueado', 'usuario.bloqueado@campus.com', false, '2024-02-20 05:00:00', 5, '2024-02-20 05:30:00'),
('usuario.intentos', '$2a$10$XOPbrlUPQdwdJUpSrIF6X.LbE14qsMmKGhM1A8W9iq.7ZxZxZxZxZ', 2, 'Irene', 'Intentos', 'usuario.intentos@campus.com', true, '2024-02-20 06:00:00', 3, NULL),
('usuario.ultimo', '$2a$10$XOPbrlUPQdwdJUpSrIF6X.LbE14qsMmKGhM1A8W9iq.7ZxZxZxZxZ', 3, 'Jorge', 'Último', 'usuario.ultimo@campus.com', true, '2024-02-19 07:00:00', 0, NULL);

-- Inserts para Telefonos_Camper
INSERT INTO Telefonos_Camper (id_camper, telefono, tipo, principal) VALUES
-- Teléfonos para Camper 1
(1, '3001234567', 'Personal', true),
(1, '3109876543', 'Acudiente', false),
(1, '3204567890', 'Acudiente', false),
-- Teléfonos para Camper 2
(2, '3112345678', 'Personal', true),
(2, '3218765432', 'Acudiente', false),
(2, '3312345678', 'Acudiente', false),
-- Teléfonos para Camper 3
(3, '3123456789', 'Personal', true),
(3, '3227654321', 'Acudiente', false),
(3, '3323456789', 'Acudiente', false),
-- Teléfonos para Camper 4
(4, '3134567890', 'Personal', true),
(4, '3236543210', 'Acudiente', false),
(4, '3334567890', 'Acudiente', false),
-- Teléfonos para Camper 5
(5, '3145678901', 'Personal', true),
(5, '3245432109', 'Acudiente', false),
(5, '3345678901', 'Acudiente', false),
-- Teléfonos para Camper 6
(6, '3156789012', 'Personal', true),
(6, '3254321098', 'Acudiente', false),
(6, '3356789012', 'Acudiente', false),
-- Teléfonos para Camper 7
(7, '3167890123', 'Personal', true),
(7, '3263210987', 'Acudiente', false),
(7, '3367890123', 'Acudiente', false),
-- Teléfonos para Camper 8
(8, '3178901234', 'Personal', true),
(8, '3272109876', 'Acudiente', false),
(8, '3378901234', 'Acudiente', false),
-- Teléfonos para Camper 9
(9, '3189012345', 'Personal', true),
(9, '3281098765', 'Acudiente', false),
(9, '3389012345', 'Acudiente', false),
-- Teléfonos para Camper 10
(10, '3190123456', 'Personal', true),
(10, '3290987654', 'Acudiente', false),
(10, '3390123456', 'Acudiente', false),
-- Teléfonos para Camper 11
(11, '3201234567', 'Personal', true),
(11, '3309876543', 'Acudiente', false),
(11, '3401234567', 'Acudiente', false),
-- Teléfonos para Camper 12
(12, '3212345678', 'Personal', true),
(12, '3318765432', 'Acudiente', false),
(12, '3412345678', 'Acudiente', false),
-- Teléfonos para Camper 13
(13, '3223456789', 'Personal', true),
(13, '3327654321', 'Acudiente', false),
(13, '3423456789', 'Acudiente', false),
-- Teléfonos para Camper 14
(14, '3234567890', 'Personal', true),
(14, '3336543210', 'Acudiente', false),
(14, '3434567890', 'Acudiente', false),
-- Teléfonos para Camper 15
(15, '3245678901', 'Personal', true),
(15, '3345432109', 'Acudiente', false),
(15, '3445678901', 'Acudiente', false),
-- Teléfonos para Camper 16
(16, '3256789012', 'Personal', true),
(16, '3354321098', 'Acudiente', false),
(16, '3456789012', 'Acudiente', false),
-- Teléfonos para Camper 17
(17, '3267890123', 'Personal', true),
(17, '3363210987', 'Acudiente', false),
(17, '3467890123', 'Acudiente', false),
-- Teléfonos para Camper 18
(18, '3278901234', 'Personal', true),
(18, '3372109876', 'Acudiente', false),
(18, '3478901234', 'Acudiente', false),
-- Teléfonos para Camper 19
(19, '3289012345', 'Personal', true),
(19, '3381098765', 'Acudiente', false),
(19, '3489012345', 'Acudiente', false),
-- Teléfonos para Camper 20
(20, '3290123456', 'Personal', true),
(20, '3390987654', 'Acudiente', false),
(20, '3490123456', 'Acudiente', false),
-- Teléfonos para Camper 21
(21, '3301234567', 'Personal', true),
(21, '3409876543', 'Acudiente', false),
(21, '3501234567', 'Acudiente', false),
-- Teléfonos para Camper 22
(22, '3312345678', 'Personal', true),
(22, '3418765432', 'Acudiente', false),
(22, '3512345678', 'Acudiente', false),
-- Teléfonos para Camper 23
(23, '3323456789', 'Personal', true),
(23, '3427654321', 'Acudiente', false),
(23, '3523456789', 'Acudiente', false),
-- Teléfonos para Camper 24
(24, '3334567890', 'Personal', true),
(24, '3436543210', 'Acudiente', false),
(24, '3534567890', 'Acudiente', false),
-- Teléfonos para Camper 25
(25, '3345678901', 'Personal', true),
(25, '3445432109', 'Acudiente', false),
(25, '3545678901', 'Acudiente', false),
-- Teléfonos para Camper 26
(26, '3356789012', 'Personal', true),
(26, '3454321098', 'Acudiente', false),
(26, '3556789012', 'Acudiente', false),
-- Teléfonos para Camper 27
(27, '3367890123', 'Personal', true),
(27, '3463210987', 'Acudiente', false),
(27, '3567890123', 'Acudiente', false),
-- Teléfonos para Camper 28
(28, '3378901234', 'Personal', true),
(28, '3472109876', 'Acudiente', false),
(28, '3578901234', 'Acudiente', false),
-- Teléfonos para Camper 29
(29, '3389012345', 'Personal', true),
(29, '3481098765', 'Acudiente', false),
(29, '3589012345', 'Acudiente', false),
-- Teléfonos para Camper 30
(30, '3390123456', 'Personal', true),
(30, '3490987654', 'Acudiente', false),
(30, '3590123456', 'Acudiente', false),
-- Teléfonos para Camper 31
(31, '3401234567', 'Personal', true),
(31, '3509876543', 'Acudiente', false),
(31, '3601234567', 'Acudiente', false),
-- Teléfonos para Camper 32
(32, '3412345678', 'Personal', true),
(32, '3518765432', 'Acudiente', false),
(32, '3612345678', 'Acudiente', false),
-- Teléfonos para Camper 33
(33, '3423456789', 'Personal', true),
(33, '3527654321', 'Acudiente', false),
(33, '3623456789', 'Acudiente', false),
-- Teléfonos para Camper 34
(34, '3434567890', 'Personal', true),
(34, '3536543210', 'Acudiente', false),
(34, '3634567890', 'Acudiente', false),
-- Teléfonos para Camper 35
(35, '3445678901', 'Personal', true),
(35, '3545432109', 'Acudiente', false),
(35, '3645678901', 'Acudiente', false),
-- Teléfonos para Camper 36
(36, '3456789012', 'Personal', true),
(36, '3554321098', 'Acudiente', false),
(36, '3656789012', 'Acudiente', false),
-- Teléfonos para Camper 37
(37, '3467890123', 'Personal', true),
(37, '3563210987', 'Acudiente', false),
(37, '3667890123', 'Acudiente', false),
-- Teléfonos para Camper 38
(38, '3478901234', 'Personal', true),
(38, '3572109876', 'Acudiente', false),
(38, '3678901234', 'Acudiente', false),
-- Teléfonos para Camper 39
(39, '3489012345', 'Personal', true),
(39, '3581098765', 'Acudiente', false),
(39, '3689012345', 'Acudiente', false),
-- Teléfonos para Camper 40
(40, '3490123456', 'Personal', true),
(40, '3590987654', 'Acudiente', false),
(40, '3690123456', 'Acudiente', false),
-- Teléfonos para Camper 41
(41, '3501234567', 'Personal', true),
(41, '3609876543', 'Acudiente', false),
(41, '3701234567', 'Acudiente', false),
-- Teléfonos para Camper 42
(42, '3512345678', 'Personal', true),
(42, '3618765432', 'Acudiente', false),
(42, '3712345678', 'Acudiente', false),
-- Teléfonos para Camper 43
(43, '3523456789', 'Personal', true),
(43, '3627654321', 'Acudiente', false),
(43, '3723456789', 'Acudiente', false),
-- Teléfonos para Camper 44
(44, '3534567890', 'Personal', true),
(44, '3636543210', 'Acudiente', false),
(44, '3734567890', 'Acudiente', false),
-- Teléfonos para Camper 45
(45, '3545678901', 'Personal', true),
(45, '3645432109', 'Acudiente', false),
(45, '3745678901', 'Acudiente', false),
-- Teléfonos para Camper 46
(46, '3556789012', 'Personal', true),
(46, '3654321098', 'Acudiente', false),
(46, '3756789012', 'Acudiente', false),
-- Teléfonos para Camper 47
(47, '3567890123', 'Personal', true),
(47, '3663210987', 'Acudiente', false),
(47, '3767890123', 'Acudiente', false),
-- Teléfonos para Camper 48
(48, '3578901234', 'Personal', true),
(48, '3672109876', 'Acudiente', false),
(48, '3778901234', 'Acudiente', false),
-- Teléfonos para Camper 49
(49, '3589012345', 'Personal', true),
(49, '3681098765', 'Acudiente', false),
(49, '3789012345', 'Acudiente', false),
-- Teléfonos para Camper 50
(50, '3590123456', 'Personal', true),
(50, '3690987654', 'Acudiente', false),
(50, '3790123456', 'Acudiente', false);

-- Inserts para Acudientes
INSERT INTO Acudientes (id_camper, nombre, relacion, telefono, email, direccion) VALUES
-- Acudientes para Campers 1-5 (Padres)
(1, 'José Pérez', 'Padre', '3109876543', 'jose.perez@example.com', 'Calle 123 #45-67'),
(2, 'Carmen López', 'Madre', '3218765432', 'carmen.lopez@example.com', 'Avenida 89 #12-34'),
(3, 'Roberto Gómez', 'Padre', '3227654321', 'roberto.gomez@example.com', 'Carrera 56 #78-90'),
(4, 'Laura Martínez', 'Madre', '3236543210', 'laura.martinez@example.com', 'Diagonal 34 #56-78'),
(5, 'Miguel Sánchez', 'Padre', '3245432109', 'miguel.sanchez@example.com', 'Transversal 12 #34-56'),
-- Acudientes para Campers 6-10 (Madres)
(6, 'Isabel Ramírez', 'Madre', '3254321098', 'isabel.ramirez@example.com', 'Calle 45 #67-89'),
(7, 'Antonio Torres', 'Padre', '3263210987', 'antonio.torres@example.com', 'Avenida 23 #45-67'),
(8, 'María Vargas', 'Madre', '3272109876', 'maria.vargas@example.com', 'Carrera 78 #90-12'),
(9, 'Carlos Hernández', 'Padre', '3281098765', 'carlos.hernandez@example.com', 'Diagonal 67 #89-01'),
(10, 'Ana Castro', 'Madre', '3290987654', 'ana.castro@example.com', 'Transversal 34 #56-78'),
-- Acudientes para Campers 11-15 (Tutores Legales)
(11, 'Pedro Ortiz', 'Tutor Legal', '3309876543', 'pedro.ortiz@example.com', 'Calle 89 #01-23'),
(12, 'Sofia Gutiérrez', 'Tutor Legal', '3318765432', 'sofia.gutierrez@example.com', 'Avenida 45 #67-89'),
(13, 'Juan Flores', 'Tutor Legal', '3327654321', 'juan.flores@example.com', 'Carrera 12 #34-56'),
(14, 'Carolina Jiménez', 'Tutor Legal', '3336543210', 'carolina.jimenez@example.com', 'Diagonal 89 #01-23'),
(15, 'Ricardo Morales', 'Tutor Legal', '3345432109', 'ricardo.morales@example.com', 'Transversal 56 #78-90'),
-- Acudientes para Campers 16-20 (Otros)
(16, 'Gabriela Rojas', 'Otro', '3354321098', 'gabriela.rojas@example.com', 'Calle 34 #56-78'),
(17, 'Fernando Navarro', 'Otro', '3363210987', 'fernando.navarro@example.com', 'Avenida 67 #89-01'),
(18, 'Isabela Peña', 'Otro', '3372109876', 'isabela.pena@example.com', 'Carrera 45 #67-89'),
(19, 'Héctor Cruz', 'Otro', '3381098765', 'hector.cruz@example.com', 'Diagonal 12 #34-56'),
(20, 'Mónica Mendoza', 'Otro', '3390987654', 'monica.mendoza@example.com', 'Transversal 78 #90-12'),
-- Acudientes para Campers 21-25 (Padres)
(21, 'Esteban Silva', 'Padre', '3409876543', 'esteban.silva@example.com', 'Calle 56 #78-90'),
(22, 'Lucía Delgado', 'Madre', '3418765432', 'lucia.delgado@example.com', 'Avenida 23 #45-67'),
(23, 'Alejandro Mejía', 'Padre', '3427654321', 'alejandro.mejia@example.com', 'Carrera 89 #01-23'),
(24, 'Natalia Paredes', 'Madre', '3436543210', 'natalia.paredes@example.com', 'Diagonal 45 #67-89'),
(25, 'Cristian Arroyo', 'Padre', '3445432109', 'cristian.arroyo@example.com', 'Transversal 12 #34-56'),
-- Acudientes para Campers 26-30 (Madres)
(26, 'Andrea Velásquez', 'Madre', '3454321098', 'andrea.velasquez@example.com', 'Calle 78 #90-12'),
(27, 'Sebastián Carrillo', 'Padre', '3463210987', 'sebastian.carrillo@example.com', 'Avenida 34 #56-78'),
(28, 'Paula Espinosa', 'Madre', '3472109876', 'paula.espinosa@example.com', 'Carrera 67 #89-01'),
(29, 'Rodrigo Herrera', 'Padre', '3481098765', 'rodrigo.herrera@example.com', 'Diagonal 23 #45-67'),
(30, 'Mariana Acosta', 'Madre', '3490987654', 'mariana.acosta@example.com', 'Transversal 89 #01-23'),
-- Acudientes para Campers 31-35 (Tutores Legales)
(31, 'Daniel Barrera', 'Tutor Legal', '3509876543', 'daniel.barrera@example.com', 'Calle 45 #67-89'),
(32, 'Clara González', 'Tutor Legal', '3518765432', 'clara.gonzalez@example.com', 'Avenida 12 #34-56'),
(33, 'Álvaro Salazar', 'Tutor Legal', '3527654321', 'alvaro.salazar@example.com', 'Carrera 78 #90-12'),
(34, 'Liliana Padilla', 'Tutor Legal', '3536543210', 'liliana.padilla@example.com', 'Diagonal 34 #56-78'),
(35, 'Tomás Suárez', 'Tutor Legal', '3545432109', 'tomas.suarez@example.com', 'Transversal 67 #89-01'),
-- Acudientes para Campers 36-40 (Otros)
(36, 'Rafael Ibáñez', 'Otro', '3554321098', 'rafael.ibanez@example.com', 'Calle 23 #45-67'),
(37, 'Beatriz Rosales', 'Otro', '3563210987', 'beatriz.rosales@example.com', 'Avenida 89 #01-23'),
(38, 'Manuel Castellanos', 'Otro', '3572109876', 'manuel.castellanos@example.com', 'Carrera 45 #67-89'),
(39, 'Verónica Montoya', 'Otro', '3581098765', 'veronica.montoya@example.com', 'Diagonal 12 #34-56'),
(40, 'Fabián Villanueva', 'Otro', '3590987654', 'fabian.villanueva@example.com', 'Transversal 78 #90-12'),
-- Acudientes para Campers 41-45 (Padres)
(41, 'Raúl Cortés', 'Padre', '3609876543', 'raul.cortes@example.com', 'Calle 67 #89-01'),
(42, 'Cecilia Valenzuela', 'Madre', '3618765432', 'cecilia.valenzuela@example.com', 'Avenida 34 #56-78'),
(43, 'Patricio Esquivel', 'Padre', '3627654321', 'patricio.esquivel@example.com', 'Carrera 23 #45-67'),
(44, 'Estefanía Franco', 'Madre', '3636543210', 'estefania.franco@example.com', 'Diagonal 89 #01-23'),
(45, 'Martín León', 'Padre', '3645432109', 'martin.leon@example.com', 'Transversal 45 #67-89'),
-- Acudientes para Campers 46-50 (Madres)
(46, 'Angélica Fuentes', 'Madre', '3654321098', 'angelica.fuentes@example.com', 'Calle 12 #34-56'),
(47, 'Germán Maldonado', 'Padre', '3663210987', 'german.maldonado@example.com', 'Avenida 78 #90-12'),
(48, 'Silvia Peralta', 'Madre', '3672109876', 'silvia.peralta@example.com', 'Carrera 67 #89-01'),
(49, 'Julián Soto', 'Padre', '3681098765', 'julian.soto@example.com', 'Diagonal 34 #56-78'),
(50, 'Rosa Ávila', 'Madre', '3690987654', 'rosa.avila@example.com', 'Transversal 23 #45-67');

-- Inserts para Modulos
INSERT INTO Modulos (nombre, descripcion, duracion_dias, requisitos, objetivos, contenido_programatico, proyecto_requerido, peso_proyecto) VALUES
-- Módulos de Fundamentos
('Fundamentos de Programación', 'Introducción a los conceptos básicos de programación y lógica computacional', 20, 'Ninguno', 'Comprender los fundamentos de la programación y desarrollar pensamiento lógico', 'Algoritmos, variables, tipos de datos, control de flujo, funciones, arrays', true, 30.00),
('Lógica de Programación', 'Desarrollo del pensamiento lógico y algorítmico', 15, 'Ninguno', 'Desarrollar habilidades de resolución de problemas', 'Diagramas de flujo, pseudocódigo, estructuras de control', true, 25.00),
('Matemáticas para Programación', 'Conceptos matemáticos aplicados a la programación', 15, 'Ninguno', 'Aplicar conceptos matemáticos en programación', 'Álgebra, lógica matemática, teoría de conjuntos', false, 0.00),
('Inglés Técnico', 'Desarrollo de habilidades en inglés para programación', 20, 'Ninguno', 'Mejorar la comprensión del inglés técnico', 'Vocabulario técnico, documentación, comunicación', false, 0.00),
('Metodologías Ágiles', 'Introducción a las metodologías de desarrollo ágil', 15, 'Ninguno', 'Comprender y aplicar metodologías ágiles', 'Scrum, Kanban, roles, ceremonias', true, 20.00),

-- Módulos de Frontend
('HTML y CSS Básico', 'Fundamentos de desarrollo web frontend', 20, 'Fundamentos de Programación', 'Crear páginas web estáticas', 'HTML5, CSS3, diseño responsivo', true, 35.00),
('JavaScript Básico', 'Programación en JavaScript para web', 25, 'HTML y CSS Básico', 'Desarrollar interactividad web', 'DOM, eventos, AJAX, JSON', true, 40.00),
('React Fundamentals', 'Desarrollo con React.js', 30, 'JavaScript Básico', 'Crear aplicaciones web con React', 'Componentes, hooks, estado, props', true, 45.00),
('Vue.js Básico', 'Introducción a Vue.js', 25, 'JavaScript Básico', 'Desarrollar con Vue.js', 'Directivas, componentes, estado', true, 40.00),
('Angular Fundamentals', 'Desarrollo con Angular', 35, 'JavaScript Básico', 'Crear aplicaciones con Angular', 'Componentes, servicios, módulos', true, 45.00),

-- Módulos de Backend
('Node.js Básico', 'Desarrollo de servidores con Node.js', 25, 'JavaScript Básico', 'Crear servidores web', 'Express, middleware, rutas', true, 40.00),
('Python Backend', 'Desarrollo backend con Python', 30, 'Fundamentos de Programación', 'Implementar servidores en Python', 'Flask, Django, APIs REST', true, 45.00),
('Java Backend', 'Desarrollo backend con Java', 35, 'Fundamentos de Programación', 'Crear aplicaciones Java', 'Spring Boot, JPA, REST', true, 45.00),
('PHP Backend', 'Desarrollo backend con PHP', 25, 'Fundamentos de Programación', 'Implementar servidores PHP', 'Laravel, APIs, MVC', true, 40.00),
('Go Backend', 'Desarrollo backend con Go', 30, 'Fundamentos de Programación', 'Crear servidores en Go', 'Gin, GORM, APIs', true, 45.00),

-- Módulos de Bases de Datos
('SQL Básico', 'Fundamentos de bases de datos relacionales', 20, 'Fundamentos de Programación', 'Gestionar bases de datos SQL', 'MySQL, PostgreSQL, consultas', true, 35.00),
('NoSQL Databases', 'Bases de datos no relacionales', 25, 'SQL Básico', 'Trabajar con bases NoSQL', 'MongoDB, Redis, Cassandra', true, 40.00),
('Diseño de Bases de Datos', 'Diseño y modelado de bases de datos', 20, 'SQL Básico', 'Diseñar esquemas de BD', 'ERD, normalización, optimización', true, 35.00),
('ORM y JPA', 'Mapeo objeto-relacional', 25, 'SQL Básico', 'Implementar ORM', 'Hibernate, Entity Framework', true, 40.00),
('Bases de Datos Avanzadas', 'Conceptos avanzados de BD', 30, 'Diseño de Bases de Datos', 'Optimizar y escalar BD', 'Índices, particionamiento, replicación', true, 45.00),

-- Módulos de Desarrollo Móvil
('React Native Básico', 'Desarrollo móvil con React Native', 30, 'React Fundamentals', 'Crear apps móviles con React Native', 'Componentes, navegación, APIs', true, 45.00),
('Flutter Básico', 'Desarrollo móvil con Flutter', 35, 'Fundamentos de Programación', 'Crear apps con Flutter', 'Widgets, estado, navegación', true, 45.00),
('iOS Development', 'Desarrollo para iOS', 40, 'Fundamentos de Programación', 'Crear apps iOS', 'Swift, UIKit, SwiftUI', true, 50.00),
('Android Development', 'Desarrollo para Android', 40, 'Fundamentos de Programación', 'Crear apps Android', 'Kotlin, Android Studio, Material Design', true, 50.00),
('Cross-Platform Development', 'Desarrollo multiplataforma', 35, 'React Native Básico', 'Crear apps multiplataforma', 'Xamarin, Cordova, Capacitor', true, 45.00),

-- Módulos de DevOps
('Git y Control de Versiones', 'Gestión de código con Git', 15, 'Ninguno', 'Gestionar versiones de código', 'Git, GitHub, GitLab', true, 25.00),
('Docker Básico', 'Contenedores con Docker', 20, 'Git y Control de Versiones', 'Trabajar con contenedores', 'Docker, Docker Compose', true, 30.00),
('Kubernetes', 'Orquestación de contenedores', 25, 'Docker Básico', 'Gestionar clusters', 'Pods, servicios, deployments', true, 35.00),
('CI/CD Fundamentals', 'Integración y despliegue continuo', 20, 'Git y Control de Versiones', 'Implementar CI/CD', 'Jenkins, GitHub Actions', true, 30.00),
('Infraestructura como Código', 'Gestión de infraestructura', 25, 'CI/CD Fundamentals', 'Automatizar infraestructura', 'Terraform, Ansible, CloudFormation', true, 35.00),

-- Módulos de Seguridad
('Seguridad Web Básica', 'Fundamentos de seguridad web', 20, 'Fundamentos de Programación', 'Implementar seguridad web', 'OWASP, HTTPS, autenticación', true, 30.00),
('Criptografía Básica', 'Conceptos de criptografía', 15, 'Seguridad Web Básica', 'Aplicar criptografía', 'Hash, cifrado, certificados', true, 25.00),
('Seguridad en APIs', 'Protección de APIs', 20, 'Seguridad Web Básica', 'Securizar APIs', 'JWT, OAuth, rate limiting', true, 30.00),
('Testing de Seguridad', 'Pruebas de seguridad', 25, 'Seguridad Web Básica', 'Realizar pruebas de seguridad', 'Penetración, vulnerabilidades', true, 35.00),
('Compliance y GDPR', 'Cumplimiento normativo', 15, 'Seguridad Web Básica', 'Implementar compliance', 'GDPR, LGPD, normativas', true, 25.00),

-- Módulos de Cloud
('AWS Fundamentals', 'Conceptos básicos de AWS', 25, 'Fundamentos de Programación', 'Trabajar con AWS', 'EC2, S3, RDS', true, 35.00),
('Azure Basics', 'Fundamentos de Azure', 25, 'Fundamentos de Programación', 'Trabajar con Azure', 'VM, Storage, SQL', true, 35.00),
('GCP Essentials', 'Conceptos de Google Cloud', 25, 'Fundamentos de Programación', 'Trabajar con GCP', 'Compute, Storage, BigQuery', true, 35.00),
('Cloud Architecture', 'Arquitectura en la nube', 30, 'AWS Fundamentals', 'Diseñar arquitecturas cloud', 'Microservicios, serverless', true, 40.00),
('Cloud Security', 'Seguridad en la nube', 25, 'Cloud Architecture', 'Securizar recursos cloud', 'IAM, VPC, WAF', true, 35.00),

-- Módulos de IA/ML
('Python para Data Science', 'Fundamentos de Python para ciencia de datos', 25, 'Fundamentos de Programación', 'Analizar datos con Python', 'Pandas, NumPy, Matplotlib', true, 35.00),
('Machine Learning Básico', 'Introducción a ML', 30, 'Python para Data Science', 'Implementar modelos ML', 'Scikit-learn, modelos básicos', true, 40.00),
('Deep Learning', 'Redes neuronales y deep learning', 35, 'Machine Learning Básico', 'Trabajar con deep learning', 'TensorFlow, PyTorch, CNN', true, 45.00),
('NLP Básico', 'Procesamiento de lenguaje natural', 30, 'Machine Learning Básico', 'Procesar texto', 'NLTK, spaCy, transformers', true, 40.00),
('Computer Vision', 'Visión por computadora', 35, 'Deep Learning', 'Procesar imágenes', 'OpenCV, YOLO, detección', true, 45.00),

-- Módulos de Blockchain
('Blockchain Fundamentals', 'Conceptos básicos de blockchain', 20, 'Fundamentos de Programación', 'Comprender blockchain', 'Bitcoin, Ethereum, smart contracts', true, 30.00),
('Smart Contracts', 'Desarrollo de smart contracts', 25, 'Blockchain Fundamentals', 'Crear smart contracts', 'Solidity, Web3.js', true, 35.00),
('DApps Development', 'Desarrollo de DApps', 30, 'Smart Contracts', 'Crear aplicaciones descentralizadas', 'Web3, IPFS, MetaMask', true, 40.00),
('DeFi Basics', 'Finanzas descentralizadas', 25, 'Blockchain Fundamentals', 'Comprender DeFi', 'DeFi protocols, yield farming', true, 35.00),
('NFT Development', 'Desarrollo de NFTs', 25, 'Smart Contracts', 'Crear NFTs', 'ERC-721, OpenSea, minting', true, 35.00);

-- Inserts para Materiales_Modulo
INSERT INTO Materiales_Modulo (id_modulo, titulo, descripcion, id_tipo_material, url, orden) VALUES
-- Materiales para Fundamentos de Programación (id_modulo = 1)
(1, 'Introducción a la Programación', 'Conceptos básicos y fundamentos de la programación', 1, 'https://campus.com/materiales/fundamentos/intro.pdf', 1),
(1, 'Variables y Tipos de Datos', 'Tutorial sobre variables y tipos de datos básicos', 2, 'https://campus.com/videos/fundamentos/variables.mp4', 2),
(1, 'Estructuras de Control', 'Guía de estructuras de control y flujo de programa', 1, 'https://campus.com/materiales/fundamentos/control.pdf', 3),
(1, 'Funciones y Métodos', 'Tutorial sobre funciones y métodos', 2, 'https://campus.com/videos/fundamentos/funciones.mp4', 4),
(1, 'Arrays y Colecciones', 'Guía de arrays y estructuras de datos básicas', 1, 'https://campus.com/materiales/fundamentos/arrays.pdf', 5),

-- Materiales para HTML y CSS Básico (id_modulo = 6)
(6, 'Introducción a HTML5', 'Fundamentos de HTML5 y estructura web', 1, 'https://campus.com/materiales/html/intro.pdf', 1),
(6, 'Elementos HTML Básicos', 'Tutorial de elementos HTML fundamentales', 2, 'https://campus.com/videos/html/elementos.mp4', 2),
(6, 'CSS3 Fundamentos', 'Introducción a CSS3 y estilos', 1, 'https://campus.com/materiales/css/fundamentos.pdf', 3),
(6, 'Diseño Responsivo', 'Tutorial de diseño web responsivo', 2, 'https://campus.com/videos/css/responsive.mp4', 4),
(6, 'Flexbox y Grid', 'Guía de sistemas de layout modernos', 1, 'https://campus.com/materiales/css/layout.pdf', 5),

-- Materiales para JavaScript Básico (id_modulo = 7)
(7, 'JavaScript Fundamentos', 'Introducción a JavaScript', 1, 'https://campus.com/materiales/js/fundamentos.pdf', 1),
(7, 'DOM Manipulation', 'Tutorial de manipulación del DOM', 2, 'https://campus.com/videos/js/dom.mp4', 2),
(7, 'Eventos y Listeners', 'Guía de eventos en JavaScript', 1, 'https://campus.com/materiales/js/eventos.pdf', 3),
(7, 'AJAX y Fetch API', 'Tutorial de peticiones HTTP', 2, 'https://campus.com/videos/js/ajax.mp4', 4),
(7, 'ES6+ Features', 'Características modernas de JavaScript', 1, 'https://campus.com/materiales/js/es6.pdf', 5),

-- Materiales para React Fundamentals (id_modulo = 8)
(8, 'React Introducción', 'Fundamentos de React', 1, 'https://campus.com/materiales/react/intro.pdf', 1),
(8, 'Componentes React', 'Tutorial de componentes en React', 2, 'https://campus.com/videos/react/componentes.mp4', 2),
(8, 'Hooks y Estado', 'Guía de hooks y manejo de estado', 1, 'https://campus.com/materiales/react/hooks.pdf', 3),
(8, 'React Router', 'Tutorial de enrutamiento en React', 2, 'https://campus.com/videos/react/router.mp4', 4),
(8, 'Context API', 'Guía de Context API en React', 1, 'https://campus.com/materiales/react/context.pdf', 5),

-- Materiales para Node.js Básico (id_modulo = 11)
(11, 'Node.js Fundamentos', 'Introducción a Node.js', 1, 'https://campus.com/materiales/node/fundamentos.pdf', 1),
(11, 'Express.js Básico', 'Tutorial de Express.js', 2, 'https://campus.com/videos/node/express.mp4', 2),
(11, 'Middleware y Rutas', 'Guía de middleware y rutas en Express', 1, 'https://campus.com/materiales/node/middleware.pdf', 3),
(11, 'APIs RESTful', 'Tutorial de APIs REST con Node.js', 2, 'https://campus.com/videos/node/apis.mp4', 4),
(11, 'Autenticación JWT', 'Guía de autenticación con JWT', 1, 'https://campus.com/materiales/node/jwt.pdf', 5),

-- Materiales para SQL Básico (id_modulo = 16)
(16, 'SQL Fundamentos', 'Introducción a SQL', 1, 'https://campus.com/materiales/sql/fundamentos.pdf', 1),
(16, 'Consultas Básicas', 'Tutorial de consultas SQL', 2, 'https://campus.com/videos/sql/consultas.mp4', 2),
(16, 'JOINs y Relaciones', 'Guía de JOINs en SQL', 1, 'https://campus.com/materiales/sql/joins.pdf', 3),
(16, 'Funciones Agregadas', 'Tutorial de funciones agregadas', 2, 'https://campus.com/videos/sql/agregadas.mp4', 4),
(16, 'Índices y Optimización', 'Guía de optimización SQL', 1, 'https://campus.com/materiales/sql/optimizacion.pdf', 5),

-- Materiales para React Native Básico (id_modulo = 21)
(21, 'React Native Introducción', 'Fundamentos de React Native', 1, 'https://campus.com/materiales/rn/intro.pdf', 1),
(21, 'Componentes Nativos', 'Tutorial de componentes nativos', 2, 'https://campus.com/videos/rn/componentes.mp4', 2),
(21, 'Navegación Móvil', 'Guía de navegación en React Native', 1, 'https://campus.com/materiales/rn/navegacion.pdf', 3),
(21, 'APIs Nativas', 'Tutorial de APIs nativas', 2, 'https://campus.com/videos/rn/apis.mp4', 4),
(21, 'Estado y Almacenamiento', 'Guía de estado y almacenamiento local', 1, 'https://campus.com/materiales/rn/estado.pdf', 5),

-- Materiales para Git y Control de Versiones (id_modulo = 26)
(26, 'Git Fundamentos', 'Introducción a Git', 1, 'https://campus.com/materiales/git/fundamentos.pdf', 1),
(26, 'Comandos Básicos', 'Tutorial de comandos Git', 2, 'https://campus.com/videos/git/comandos.mp4', 2),
(26, 'Ramas y Merge', 'Guía de trabajo con ramas', 1, 'https://campus.com/materiales/git/ramas.pdf', 3),
(26, 'GitHub Workflow', 'Tutorial de flujo de trabajo en GitHub', 2, 'https://campus.com/videos/git/github.mp4', 4),
(26, 'Resolución de Conflictos', 'Guía de resolución de conflictos', 1, 'https://campus.com/materiales/git/conflictos.pdf', 5),

-- Materiales para Seguridad Web Básica (id_modulo = 31)
(31, 'Seguridad Web Fundamentos', 'Introducción a seguridad web', 1, 'https://campus.com/materiales/seguridad/fundamentos.pdf', 1),
(31, 'OWASP Top 10', 'Tutorial de vulnerabilidades comunes', 2, 'https://campus.com/videos/seguridad/owasp.mp4', 2),
(31, 'Autenticación y Autorización', 'Guía de autenticación segura', 1, 'https://campus.com/materiales/seguridad/auth.pdf', 3),
(31, 'HTTPS y Certificados', 'Tutorial de seguridad en comunicaciones', 2, 'https://campus.com/videos/seguridad/https.mp4', 4),
(31, 'XSS y CSRF', 'Guía de prevención de ataques web', 1, 'https://campus.com/materiales/seguridad/xss.pdf', 5),

-- Materiales para AWS Fundamentals (id_modulo = 36)
(36, 'AWS Introducción', 'Fundamentos de AWS', 1, 'https://campus.com/materiales/aws/intro.pdf', 1),
(36, 'EC2 y Servicios de Computación', 'Tutorial de servicios EC2', 2, 'https://campus.com/videos/aws/ec2.mp4', 2),
(36, 'S3 y Almacenamiento', 'Guía de servicios de almacenamiento', 1, 'https://campus.com/materiales/aws/s3.pdf', 3),
(36, 'RDS y Bases de Datos', 'Tutorial de bases de datos en AWS', 2, 'https://campus.com/videos/aws/rds.mp4', 4),
(36, 'IAM y Seguridad', 'Guía de seguridad en AWS', 1, 'https://campus.com/materiales/aws/iam.pdf', 5);

-- Inserts para Rutas
INSERT INTO Rutas (nombre, descripcion, duracion_semanas, fecha_inicio, fecha_fin, gestor_db, version_gestor, activa, cupo_maximo) VALUES
-- Rutas de Desarrollo Web
('Desarrollo Web Full Stack', 'Ruta completa de desarrollo web desde frontend hasta backend', 24, '2024-01-01', '2024-06-30', 'MySQL', '8.0', true, 30),
('Desarrollo Frontend Avanzado', 'Ruta especializada en desarrollo frontend moderno', 20, '2024-01-15', '2024-06-15', 'MySQL', '8.0', true, 25),
('Desarrollo Backend Avanzado', 'Ruta especializada en desarrollo backend y APIs', 20, '2024-01-20', '2024-06-20', 'PostgreSQL', '15.0', true, 25),
('Desarrollo Web con React', 'Ruta enfocada en desarrollo con React y ecosistema', 16, '2024-02-01', '2024-05-30', 'MongoDB', '6.0', true, 30),
('Desarrollo Web con Angular', 'Ruta especializada en desarrollo con Angular', 20, '2024-02-15', '2024-07-15', 'PostgreSQL', '15.0', true, 25),

-- Rutas de Desarrollo Móvil
('Desarrollo Móvil con React Native', 'Ruta de desarrollo de aplicaciones móviles multiplataforma', 20, '2024-01-10', '2024-05-30', 'MongoDB', '6.0', true, 25),
('Desarrollo iOS', 'Ruta especializada en desarrollo para iOS', 24, '2024-01-25', '2024-07-25', 'PostgreSQL', '15.0', true, 20),
('Desarrollo Android', 'Ruta especializada en desarrollo para Android', 24, '2024-02-01', '2024-08-01', 'PostgreSQL', '15.0', true, 20),
('Desarrollo Móvil con Flutter', 'Ruta de desarrollo multiplataforma con Flutter', 20, '2024-02-15', '2024-07-15', 'MongoDB', '6.0', true, 25),
('Desarrollo Móvil Híbrido', 'Ruta de desarrollo de apps híbridas', 16, '2024-03-01', '2024-06-30', 'MySQL', '8.0', true, 30),

-- Rutas de Ciencia de Datos
('Ciencia de Datos Básica', 'Ruta introductoria a ciencia de datos', 20, '2024-01-15', '2024-06-15', 'PostgreSQL', '15.0', true, 25),
('Machine Learning', 'Ruta especializada en machine learning', 24, '2024-01-20', '2024-07-20', 'PostgreSQL', '15.0', true, 20),
('Deep Learning', 'Ruta avanzada en deep learning', 28, '2024-02-01', '2024-08-30', 'PostgreSQL', '15.0', true, 20),
('Análisis de Datos', 'Ruta de análisis y visualización de datos', 16, '2024-02-15', '2024-06-15', 'PostgreSQL', '15.0', true, 25),
('Big Data', 'Ruta de procesamiento de grandes volúmenes de datos', 24, '2024-03-01', '2024-08-30', 'PostgreSQL', '15.0', true, 20),

-- Rutas de DevOps
('DevOps Fundamentals', 'Ruta introductoria a DevOps', 20, '2024-01-10', '2024-05-30', 'PostgreSQL', '15.0', true, 25),
('Cloud Computing', 'Ruta de computación en la nube', 24, '2024-01-25', '2024-07-25', 'PostgreSQL', '15.0', true, 20),
('Kubernetes y Contenedores', 'Ruta de orquestación de contenedores', 20, '2024-02-01', '2024-07-01', 'PostgreSQL', '15.0', true, 20),
('CI/CD Avanzado', 'Ruta de integración y despliegue continuo', 16, '2024-02-15', '2024-06-15', 'PostgreSQL', '15.0', true, 25),
('Infraestructura como Código', 'Ruta de automatización de infraestructura', 20, '2024-03-01', '2024-07-30', 'PostgreSQL', '15.0', true, 20),

-- Rutas de Seguridad
('Ciberseguridad Básica', 'Ruta introductoria a ciberseguridad', 20, '2024-01-15', '2024-06-15', 'PostgreSQL', '15.0', true, 25),
('Ethical Hacking', 'Ruta de hacking ético', 24, '2024-01-20', '2024-07-20', 'PostgreSQL', '15.0', true, 20),
('Seguridad en la Nube', 'Ruta de seguridad en entornos cloud', 20, '2024-02-01', '2024-07-01', 'PostgreSQL', '15.0', true, 20),
('Análisis de Vulnerabilidades', 'Ruta de análisis y detección de vulnerabilidades', 16, '2024-02-15', '2024-06-15', 'PostgreSQL', '15.0', true, 25),
('Seguridad en Aplicaciones', 'Ruta de seguridad en desarrollo de software', 20, '2024-03-01', '2024-07-30', 'PostgreSQL', '15.0', true, 20),

-- Rutas de Blockchain
('Blockchain Fundamentals', 'Ruta introductoria a blockchain', 20, '2024-01-10', '2024-05-30', 'PostgreSQL', '15.0', true, 25),
('Smart Contracts', 'Ruta de desarrollo de smart contracts', 24, '2024-01-25', '2024-07-25', 'PostgreSQL', '15.0', true, 20),
('DApps Development', 'Ruta de desarrollo de aplicaciones descentralizadas', 20, '2024-02-01', '2024-07-01', 'PostgreSQL', '15.0', true, 20),
('DeFi Development', 'Ruta de desarrollo en finanzas descentralizadas', 24, '2024-02-15', '2024-08-15', 'PostgreSQL', '15.0', true, 20),
('NFT Development', 'Ruta de desarrollo de tokens no fungibles', 16, '2024-03-01', '2024-06-30', 'PostgreSQL', '15.0', true, 25),

-- Rutas de IA/ML
('Inteligencia Artificial Básica', 'Ruta introductoria a IA', 20, '2024-01-15', '2024-06-15', 'PostgreSQL', '15.0', true, 25),
('Machine Learning Avanzado', 'Ruta avanzada en machine learning', 24, '2024-01-20', '2024-07-20', 'PostgreSQL', '15.0', true, 20),
('Deep Learning Avanzado', 'Ruta avanzada en deep learning', 28, '2024-02-01', '2024-08-30', 'PostgreSQL', '15.0', true, 20),
('NLP y Procesamiento de Texto', 'Ruta de procesamiento de lenguaje natural', 20, '2024-02-15', '2024-07-15', 'PostgreSQL', '15.0', true, 20),
('Computer Vision', 'Ruta de visión por computadora', 24, '2024-03-01', '2024-08-30', 'PostgreSQL', '15.0', true, 20),

-- Rutas de Desarrollo de Videojuegos
('Desarrollo de Videojuegos 2D', 'Ruta de desarrollo de juegos 2D', 20, '2024-01-10', '2024-05-30', 'PostgreSQL', '15.0', true, 25),
('Desarrollo de Videojuegos 3D', 'Ruta de desarrollo de juegos 3D', 24, '2024-01-25', '2024-07-25', 'PostgreSQL', '15.0', true, 20),
('Unity Development', 'Ruta de desarrollo con Unity', 20, '2024-02-01', '2024-07-01', 'PostgreSQL', '15.0', true, 20),
('Unreal Engine Development', 'Ruta de desarrollo con Unreal Engine', 24, '2024-02-15', '2024-08-15', 'PostgreSQL', '15.0', true, 20),
('Game Design', 'Ruta de diseño de videojuegos', 16, '2024-03-01', '2024-06-30', 'PostgreSQL', '15.0', true, 25),

-- Rutas de Desarrollo de Realidad Virtual/Aumentada
('Realidad Virtual Básica', 'Ruta introductoria a VR', 20, '2024-01-15', '2024-06-15', 'PostgreSQL', '15.0', true, 25),
('Realidad Aumentada Básica', 'Ruta introductoria a AR', 20, '2024-01-20', '2024-06-20', 'PostgreSQL', '15.0', true, 25),
('VR Development Avanzado', 'Ruta avanzada en desarrollo VR', 24, '2024-02-01', '2024-07-30', 'PostgreSQL', '15.0', true, 20),
('AR Development Avanzado', 'Ruta avanzada en desarrollo AR', 24, '2024-02-15', '2024-08-15', 'PostgreSQL', '15.0', true, 20),
('XR Development', 'Ruta de desarrollo de experiencias mixtas', 20, '2024-03-01', '2024-07-30', 'PostgreSQL', '15.0', true, 20);

-- Inserts para Ruta_Modulo
INSERT INTO Ruta_Modulo (id_ruta, id_modulo, orden) VALUES
-- Desarrollo Web Full Stack (id_ruta = 1)
(1, 1, 1),  -- Fundamentos de Programación
(1, 6, 2),  -- HTML y CSS Básico
(1, 7, 3),  -- JavaScript Básico
(1, 11, 4), -- Node.js Básico
(1, 16, 5), -- SQL Básico
(1, 26, 6), -- Git y Control de Versiones
(1, 31, 7), -- Seguridad Web Básica

-- Desarrollo Frontend Avanzado (id_ruta = 2)
(2, 1, 1),  -- Fundamentos de Programación
(2, 6, 2),  -- HTML y CSS Básico
(2, 7, 3),  -- JavaScript Básico
(2, 8, 4),  -- React Fundamentals
(2, 26, 5), -- Git y Control de Versiones

-- Desarrollo Backend Avanzado (id_ruta = 3)
(3, 1, 1),  -- Fundamentos de Programación
(3, 11, 2), -- Node.js Básico
(3, 16, 3), -- SQL Básico
(3, 26, 4), -- Git y Control de Versiones
(3, 31, 5), -- Seguridad Web Básica

-- Desarrollo Móvil con React Native (id_ruta = 6)
(6, 1, 1),  -- Fundamentos de Programación
(6, 7, 2),  -- JavaScript Básico
(6, 8, 3),  -- React Fundamentals
(6, 21, 4), -- React Native Básico
(6, 26, 5), -- Git y Control de Versiones

-- Ciencia de Datos Básica (id_ruta = 11)
(11, 1, 1),  -- Fundamentos de Programación
(11, 36, 2), -- Python para Data Science
(11, 16, 3), -- SQL Básico
(11, 26, 4), -- Git y Control de Versiones

-- DevOps Fundamentals (id_ruta = 16)
(16, 26, 1), -- Git y Control de Versiones
(16, 27, 2), -- Docker Básico
(16, 28, 3), -- Kubernetes
(16, 29, 4), -- CI/CD Fundamentals
(16, 30, 5), -- Infraestructura como Código

-- Ciberseguridad Básica (id_ruta = 21)
(21, 1, 1),  -- Fundamentos de Programación
(21, 31, 2), -- Seguridad Web Básica
(21, 32, 3), -- Criptografía Básica
(21, 33, 4), -- Seguridad en APIs
(21, 34, 5), -- Testing de Seguridad

-- Blockchain Fundamentals (id_ruta = 26)
(26, 1, 1),  -- Fundamentos de Programación
(26, 36, 2), -- Python para Data Science
(26, 26, 3), -- Git y Control de Versiones
(26, 31, 4), -- Seguridad Web Básica
(26, 37, 5), -- Blockchain Fundamentals

-- Inteligencia Artificial Básica (id_ruta = 31)
(31, 1, 1),  -- Fundamentos de Programación
(31, 36, 2), -- Python para Data Science
(31, 37, 3), -- Machine Learning Básico
(31, 38, 4), -- Deep Learning
(31, 26, 5), -- Git y Control de Versiones

-- Desarrollo de Videojuegos 2D (id_ruta = 36)
(36, 1, 1),  -- Fundamentos de Programación
(36, 7, 2),  -- JavaScript Básico
(36, 26, 3), -- Git y Control de Versiones
(36, 41, 4), -- Desarrollo de Videojuegos 2D
(36, 45, 5); -- Game Design

-- Inserts para Areas_Entrenamiento
INSERT INTO Areas_Entrenamiento (nombre, id_tipo_area, capacidad_maxima, ubicacion, descripcion, activa, equipamiento) VALUES
-- Áreas de Aula
('Aula 101', 1, 30, 'Piso 1 - Ala Norte', 'Aula principal para desarrollo web', true, '{"proyector": true, "pantalla": true, "computadoras": 30, "aire_acondicionado": true}'),
('Aula 102', 1, 30, 'Piso 1 - Ala Norte', 'Aula para desarrollo frontend', true, '{"proyector": true, "pantalla": true, "computadoras": 30, "aire_acondicionado": true}'),
('Aula 103', 1, 30, 'Piso 1 - Ala Norte', 'Aula para desarrollo backend', true, '{"proyector": true, "pantalla": true, "computadoras": 30, "aire_acondicionado": true}'),
('Aula 104', 1, 30, 'Piso 1 - Ala Sur', 'Aula para desarrollo móvil', true, '{"proyector": true, "pantalla": true, "computadoras": 30, "aire_acondicionado": true}'),
('Aula 105', 1, 30, 'Piso 1 - Ala Sur', 'Aula para ciencia de datos', true, '{"proyector": true, "pantalla": true, "computadoras": 30, "aire_acondicionado": true}'),

-- Laboratorios de Desarrollo
('Lab Dev 201', 2, 25, 'Piso 2 - Ala Norte', 'Laboratorio de desarrollo web', true, '{"computadoras": 25, "servidores": 2, "red": true, "aire_acondicionado": true}'),
('Lab Dev 202', 2, 25, 'Piso 2 - Ala Norte', 'Laboratorio de desarrollo móvil', true, '{"computadoras": 25, "dispositivos_moviles": 10, "red": true, "aire_acondicionado": true}'),
('Lab Dev 203', 2, 25, 'Piso 2 - Ala Sur', 'Laboratorio de ciencia de datos', true, '{"computadoras": 25, "servidores": 3, "red": true, "aire_acondicionado": true}'),
('Lab Dev 204', 2, 25, 'Piso 2 - Ala Sur', 'Laboratorio de IA/ML', true, '{"computadoras": 25, "gpus": 2, "red": true, "aire_acondicionado": true}'),
('Lab Dev 205', 2, 25, 'Piso 2 - Ala Sur', 'Laboratorio de blockchain', true, '{"computadoras": 25, "servidores": 2, "red": true, "aire_acondicionado": true}'),

-- Salas de Reuniones
('Sala Reuniones 301', 3, 15, 'Piso 3 - Ala Norte', 'Sala para reuniones de equipo', true, '{"proyector": true, "pantalla": true, "mesa_reuniones": true, "aire_acondicionado": true}'),
('Sala Reuniones 302', 3, 15, 'Piso 3 - Ala Norte', 'Sala para presentaciones', true, '{"proyector": true, "pantalla": true, "mesa_reuniones": true, "aire_acondicionado": true}'),
('Sala Reuniones 303', 3, 15, 'Piso 3 - Ala Sur', 'Sala para mentorías', true, '{"proyector": true, "pantalla": true, "mesa_reuniones": true, "aire_acondicionado": true}'),
('Sala Reuniones 304', 3, 15, 'Piso 3 - Ala Sur', 'Sala para code reviews', true, '{"proyector": true, "pantalla": true, "mesa_reuniones": true, "aire_acondicionado": true}'),
('Sala Reuniones 305', 3, 15, 'Piso 3 - Ala Sur', 'Sala para planning', true, '{"proyector": true, "pantalla": true, "mesa_reuniones": true, "aire_acondicionado": true}'),

-- Áreas de Trabajo Colaborativo
('Espacio Colaborativo 401', 4, 20, 'Piso 4 - Ala Norte', 'Área de trabajo en equipo', true, '{"mesas_grupo": 5, "pantallas": 2, "red": true, "aire_acondicionado": true}'),
('Espacio Colaborativo 402', 4, 20, 'Piso 4 - Ala Norte', 'Área de proyectos grupales', true, '{"mesas_grupo": 5, "pantallas": 2, "red": true, "aire_acondicionado": true}'),
('Espacio Colaborativo 403', 4, 20, 'Piso 4 - Ala Sur', 'Área de hackathons', true, '{"mesas_grupo": 5, "pantallas": 2, "red": true, "aire_acondicionado": true}'),
('Espacio Colaborativo 404', 4, 20, 'Piso 4 - Ala Sur', 'Área de workshops', true, '{"mesas_grupo": 5, "pantallas": 2, "red": true, "aire_acondicionado": true}'),
('Espacio Colaborativo 405', 4, 20, 'Piso 4 - Ala Sur', 'Área de networking', true, '{"mesas_grupo": 5, "pantallas": 2, "red": true, "aire_acondicionado": true}'),

-- Laboratorios Especializados
('Lab VR/AR 501', 5, 15, 'Piso 5 - Ala Norte', 'Laboratorio de realidad virtual', true, '{"gafas_vr": 10, "computadoras": 15, "sensores": true, "aire_acondicionado": true}'),
('Lab IoT 502', 5, 15, 'Piso 5 - Ala Norte', 'Laboratorio de internet de las cosas', true, '{"sensores": 20, "arduinos": 15, "raspberry_pis": 10, "aire_acondicionado": true}'),
('Lab Robótica 503', 5, 15, 'Piso 5 - Ala Sur', 'Laboratorio de robótica', true, '{"robots": 5, "sensores": 15, "herramientas": true, "aire_acondicionado": true}'),
('Lab IA 504', 5, 15, 'Piso 5 - Ala Sur', 'Laboratorio de inteligencia artificial', true, '{"gpus": 4, "servidores": 2, "sensores": 10, "aire_acondicionado": true}'),
('Lab Blockchain 505', 5, 15, 'Piso 5 - Ala Sur', 'Laboratorio de blockchain', true, '{"nodos": 5, "servidores": 3, "red": true, "aire_acondicionado": true}'),

-- Áreas de Descanso
('Sala de Descanso 601', 6, 30, 'Piso 6 - Ala Norte', 'Área de descanso principal', true, '{"sofás": 5, "mesas": 10, "cafetera": true, "aire_acondicionado": true}'),
('Sala de Descanso 602', 6, 30, 'Piso 6 - Ala Norte', 'Área de descanso secundaria', true, '{"sofás": 5, "mesas": 10, "cafetera": true, "aire_acondicionado": true}'),
('Sala de Descanso 603', 6, 30, 'Piso 6 - Ala Sur', 'Área de descanso con vista', true, '{"sofás": 5, "mesas": 10, "cafetera": true, "aire_acondicionado": true}'),
('Sala de Descanso 604', 6, 30, 'Piso 6 - Ala Sur', 'Área de descanso con juegos', true, '{"sofás": 5, "mesas": 10, "juegos": true, "aire_acondicionado": true}'),
('Sala de Descanso 605', 6, 30, 'Piso 6 - Ala Sur', 'Área de descanso con TV', true, '{"sofás": 5, "mesas": 10, "tv": true, "aire_acondicionado": true}'),

-- Áreas de Evaluación
('Sala Evaluación 701', 7, 20, 'Piso 7 - Ala Norte', 'Sala para evaluaciones escritas', true, '{"mesas_individuales": 20, "reloj": true, "aire_acondicionado": true}'),
('Sala Evaluación 702', 7, 20, 'Piso 7 - Ala Norte', 'Sala para evaluaciones prácticas', true, '{"computadoras": 20, "red": true, "aire_acondicionado": true}'),
('Sala Evaluación 703', 7, 20, 'Piso 7 - Ala Sur', 'Sala para presentaciones finales', true, '{"proyector": true, "pantalla": true, "asientos": 30, "aire_acondicionado": true}'),
('Sala Evaluación 704', 7, 20, 'Piso 7 - Ala Sur', 'Sala para entrevistas técnicas', true, '{"computadora": 1, "pantalla": 1, "mesa": 1, "aire_acondicionado": true}'),
('Sala Evaluación 705', 7, 20, 'Piso 7 - Ala Sur', 'Sala para hackathons internos', true, '{"computadoras": 20, "red": true, "aire_acondicionado": true}'),

-- Áreas de Servicios
('Cafetería 801', 8, 50, 'Piso 8 - Ala Norte', 'Cafetería principal', true, '{"cafetera": true, "refrigerador": true, "microondas": 2, "aire_acondicionado": true}'),
('Cafetería 802', 8, 50, 'Piso 8 - Ala Norte', 'Cafetería secundaria', true, '{"cafetera": true, "refrigerador": true, "microondas": 2, "aire_acondicionado": true}'),
('Cafetería 803', 8, 50, 'Piso 8 - Ala Sur', 'Cafetería con terraza', true, '{"cafetera": true, "refrigerador": true, "microondas": 2, "aire_acondicionado": true}'),
('Cafetería 804', 8, 50, 'Piso 8 - Ala Sur', 'Cafetería con vista', true, '{"cafetera": true, "refrigerador": true, "microondas": 2, "aire_acondicionado": true}'),
('Cafetería 805', 8, 50, 'Piso 8 - Ala Sur', 'Cafetería con lounge', true, '{"cafetera": true, "refrigerador": true, "microondas": 2, "aire_acondicionado": true}'),

-- Áreas de Bienestar
('Gimnasio 901', 9, 20, 'Piso 9 - Ala Norte', 'Gimnasio principal', true, '{"equipos_cardio": 5, "pesas": true, "colchonetas": 10, "aire_acondicionado": true}'),
('Gimnasio 902', 9, 20, 'Piso 9 - Ala Norte', 'Sala de yoga', true, '{"colchonetas": 20, "bloques": 10, "cintas": 5, "aire_acondicionado": true}'),
('Gimnasio 903', 9, 20, 'Piso 9 - Ala Sur', 'Sala de estiramientos', true, '{"colchonetas": 10, "pelotas": 5, "bandas": 10, "aire_acondicionado": true}'),
('Gimnasio 904', 9, 20, 'Piso 9 - Ala Sur', 'Sala de meditación', true, '{"colchonetas": 15, "cojines": 10, "iluminación": true, "aire_acondicionado": true}'),
('Gimnasio 905', 9, 20, 'Piso 9 - Ala Sur', 'Sala de masajes', true, '{"camillas": 2, "aceites": true, "toallas": 10, "aire_acondicionado": true}'),

-- Áreas de Administración
('Oficina Admin 1001', 10, 10, 'Piso 10 - Ala Norte', 'Oficina de administración principal', true, '{"escritorios": 5, "computadoras": 5, "impresora": true, "aire_acondicionado": true}'),
('Oficina Admin 1002', 10, 10, 'Piso 10 - Ala Norte', 'Oficina de recursos humanos', true, '{"escritorios": 5, "computadoras": 5, "impresora": true, "aire_acondicionado": true}'),
('Oficina Admin 1003', 10, 10, 'Piso 10 - Ala Sur', 'Oficina de finanzas', true, '{"escritorios": 5, "computadoras": 5, "impresora": true, "aire_acondicionado": true}'),
('Oficina Admin 1004', 10, 10, 'Piso 10 - Ala Sur', 'Oficina de operaciones', true, '{"escritorios": 5, "computadoras": 5, "impresora": true, "aire_acondicionado": true}'),
('Oficina Admin 1005', 10, 10, 'Piso 10 - Ala Sur', 'Oficina de dirección', true, '{"escritorios": 5, "computadoras": 5, "impresora": true, "aire_acondicionado": true}');

-- Inserts para Horarios
INSERT INTO Horarios (hora_inicio, hora_fin, jornada) VALUES
-- Jornada Mañana
('06:00:00', '12:00:00', 'Mañana'),
('07:00:00', '13:00:00', 'Mañana'),
('08:00:00', '14:00:00', 'Mañana'),
('09:00:00', '15:00:00', 'Mañana'),
('10:00:00', '16:00:00', 'Mañana'),

-- Jornada Tarde
('12:00:00', '18:00:00', 'Tarde'),
('13:00:00', '19:00:00', 'Tarde'),
('14:00:00', '20:00:00', 'Tarde'),
('15:00:00', '21:00:00', 'Tarde'),
('16:00:00', '22:00:00', 'Tarde'),

-- Jornada Noche
('18:00:00', '23:00:00', 'Noche'),
('19:00:00', '23:00:00', 'Noche'),
('20:00:00', '23:00:00', 'Noche'),
('21:00:00', '23:00:00', 'Noche'),
('22:00:00', '23:00:00', 'Noche'),

-- Horarios Especiales
('07:30:00', '13:30:00', 'Mañana'),
('08:30:00', '14:30:00', 'Mañana'),
('09:30:00', '15:30:00', 'Mañana'),
('10:30:00', '16:30:00', 'Mañana'),
('11:30:00', '17:30:00', 'Mañana'),

-- Horarios Extendidos
('06:00:00', '14:00:00', 'Mañana'),
('08:00:00', '16:00:00', 'Mañana'),
('10:00:00', '18:00:00', 'Tarde'),
('12:00:00', '20:00:00', 'Tarde'),
('14:00:00', '22:00:00', 'Tarde'),

-- Horarios Nocturnos
('18:00:00', '02:00:00', 'Noche'),
('19:00:00', '03:00:00', 'Noche'),
('20:00:00', '04:00:00', 'Noche'),
('21:00:00', '05:00:00', 'Noche'),
('22:00:00', '06:00:00', 'Noche'),

-- Horarios Flexibles
('08:00:00', '13:00:00', 'Mañana'),
('09:00:00', '14:00:00', 'Mañana'),
('10:00:00', '15:00:00', 'Mañana'),
('11:00:00', '16:00:00', 'Mañana'),
('12:00:00', '17:00:00', 'Tarde'),

-- Horarios Intensivos
('06:00:00', '15:00:00', 'Mañana'),
('07:00:00', '16:00:00', 'Mañana'),
('08:00:00', '17:00:00', 'Mañana'),
('09:00:00', '18:00:00', 'Mañana'),
('10:00:00', '19:00:00', 'Mañana'),

-- Horarios Alternativos
('11:00:00', '20:00:00', 'Tarde'),
('12:00:00', '21:00:00', 'Tarde'),
('13:00:00', '22:00:00', 'Tarde'),
('14:00:00', '23:00:00', 'Tarde'),
('15:00:00', '23:00:00', 'Tarde'),

-- Horarios Especiales Nocturnos
('16:00:00', '23:00:00', 'Tarde'),
('17:00:00', '23:00:00', 'Tarde'),
('18:00:00', '23:00:00', 'Noche'),
('19:00:00', '23:00:00', 'Noche'),
('20:00:00', '23:00:00', 'Noche');

-- Inserts para Area_Horario
INSERT INTO Area_Horario (id_area, id_horario, disponible) VALUES
-- Aulas (id_area 1-5) - Horarios de mañana y tarde
(1, 1, true), (1, 6, true), (1, 11, true), (1, 16, true), (1, 21, true),
(2, 2, true), (2, 7, true), (2, 12, true), (2, 17, true), (2, 22, true),
(3, 3, true), (3, 8, true), (3, 13, true), (3, 18, true), (3, 23, true),
(4, 4, true), (4, 9, true), (4, 14, true), (4, 19, true), (4, 24, true),
(5, 5, true), (5, 10, true), (5, 15, true), (5, 20, true), (5, 25, true),

-- Laboratorios de Desarrollo (id_area 6-10) - Horarios extendidos
(6, 26, true), (6, 31, true), (6, 36, true), (6, 41, true), (6, 46, true),
(7, 27, true), (7, 32, true), (7, 37, true), (7, 42, true), (7, 47, true),
(8, 28, true), (8, 33, true), (8, 38, true), (8, 43, true), (8, 48, true),
(9, 29, true), (9, 34, true), (9, 39, true), (9, 44, true), (9, 49, true),
(10, 30, true), (10, 35, true), (10, 40, true), (10, 45, true), (10, 50, true),

-- Salas de Reuniones (id_area 11-15) - Horarios flexibles
(11, 1, true), (11, 6, true), (11, 11, true), (11, 16, true), (11, 21, true),
(12, 2, true), (12, 7, true), (12, 12, true), (12, 17, true), (12, 22, true),
(13, 3, true), (13, 8, true), (13, 13, true), (13, 18, true), (13, 23, true),
(14, 4, true), (14, 9, true), (14, 14, true), (14, 19, true), (14, 24, true),
(15, 5, true), (15, 10, true), (15, 15, true), (15, 20, true), (15, 25, true),

-- Áreas de Trabajo Colaborativo (id_area 16-20) - Horarios extendidos
(16, 26, true), (16, 31, true), (16, 36, true), (16, 41, true), (16, 46, true),
(17, 27, true), (17, 32, true), (17, 37, true), (17, 42, true), (17, 47, true),
(18, 28, true), (18, 33, true), (18, 38, true), (18, 43, true), (18, 48, true),
(19, 29, true), (19, 34, true), (19, 39, true), (19, 44, true), (19, 49, true),
(20, 30, true), (20, 35, true), (20, 40, true), (20, 45, true), (20, 50, true),

-- Laboratorios Especializados (id_area 21-25) - Horarios nocturnos
(21, 31, true), (21, 36, true), (21, 41, true), (21, 46, true), (21, 1, true),
(22, 32, true), (22, 37, true), (22, 42, true), (22, 47, true), (22, 2, true),
(23, 33, true), (23, 38, true), (23, 43, true), (23, 48, true), (23, 3, true),
(24, 34, true), (24, 39, true), (24, 44, true), (24, 49, true), (24, 4, true),
(25, 35, true), (25, 40, true), (25, 45, true), (25, 50, true), (25, 5, true),

-- Áreas de Descanso (id_area 26-30) - Horarios flexibles
(26, 6, true), (26, 11, true), (26, 16, true), (26, 21, true), (26, 26, true),
(27, 7, true), (27, 12, true), (27, 17, true), (27, 22, true), (27, 27, true),
(28, 8, true), (28, 13, true), (28, 18, true), (28, 23, true), (28, 28, true),
(29, 9, true), (29, 14, true), (29, 19, true), (29, 24, true), (29, 29, true),
(30, 10, true), (30, 15, true), (30, 20, true), (30, 25, true), (30, 30, true),

-- Áreas de Evaluación (id_area 31-35) - Horarios específicos
(31, 31, true), (31, 36, true), (31, 41, true), (31, 46, true), (31, 1, true),
(32, 32, true), (32, 37, true), (32, 42, true), (32, 47, true), (32, 2, true),
(33, 33, true), (33, 38, true), (33, 43, true), (33, 48, true), (33, 3, true),
(34, 34, true), (34, 39, true), (34, 44, true), (34, 49, true), (34, 4, true),
(35, 35, true), (35, 40, true), (35, 45, true), (35, 50, true), (35, 5, true),

-- Áreas de Servicios (id_area 36-40) - Horarios extendidos
(36, 6, true), (36, 11, true), (36, 16, true), (36, 21, true), (36, 26, true),
(37, 7, true), (37, 12, true), (37, 17, true), (37, 22, true), (37, 27, true),
(38, 8, true), (38, 13, true), (38, 18, true), (38, 23, true), (38, 28, true),
(39, 9, true), (39, 14, true), (39, 19, true), (39, 24, true), (39, 29, true),
(40, 10, true), (40, 15, true), (40, 20, true), (40, 25, true), (40, 30, true),

-- Áreas de Bienestar (id_area 41-45) - Horarios flexibles
(41, 31, true), (41, 36, true), (41, 41, true), (41, 46, true), (41, 1, true),
(42, 32, true), (42, 37, true), (42, 42, true), (42, 47, true), (42, 2, true),
(43, 33, true), (43, 38, true), (43, 43, true), (43, 48, true), (43, 3, true),
(44, 34, true), (44, 39, true), (44, 44, true), (44, 49, true), (44, 4, true),
(45, 35, true), (45, 40, true), (45, 45, true), (45, 50, true), (45, 5, true),

-- Áreas de Administración (id_area 46-50) - Horarios de oficina
(46, 6, true), (46, 11, true), (46, 16, true), (46, 21, true), (46, 26, true),
(47, 7, true), (47, 12, true), (47, 17, true), (47, 22, true), (47, 27, true),
(48, 8, true), (48, 13, true), (48, 18, true), (48, 23, true), (48, 28, true),
(49, 9, true), (49, 14, true), (49, 19, true), (49, 24, true), (49, 29, true),
(50, 10, true), (50, 15, true), (50, 20, true), (50, 25, true), (50, 30, true);

-- Inserts para Trainers
INSERT INTO Trainers (id_usuario, numero_identificacion, id_tipo_documento, nombres, apellidos, email, fecha_contratacion, activo, especialidad, nivel_educacion) VALUES
-- Trainers de Desarrollo Web
(1, 'CC1001', 1, 'Juan', 'García', 'juan.garcia@campus.edu', '2023-01-15', true, 'Desarrollo Web Full Stack', 'Ingeniero de Sistemas'),
(2, 'CC1002', 1, 'María', 'Rodríguez', 'maria.rodriguez@campus.edu', '2023-02-01', true, 'Frontend Development', 'Ingeniera Informática'),
(3, 'CC1003', 1, 'Carlos', 'López', 'carlos.lopez@campus.edu', '2023-02-15', true, 'Backend Development', 'Ingeniero de Software'),
(4, 'CC1004', 1, 'Ana', 'Martínez', 'ana.martinez@campus.edu', '2023-03-01', true, 'Full Stack Development', 'Ingeniera de Sistemas'),
(5, 'CC1005', 1, 'Pedro', 'Sánchez', 'pedro.sanchez@campus.edu', '2023-03-15', true, 'Web Development', 'Ingeniero Informático'),

-- Trainers de Desarrollo Móvil
(6, 'CC1006', 1, 'Laura', 'Fernández', 'laura.fernandez@campus.edu', '2023-04-01', true, 'Desarrollo Móvil', 'Ingeniera de Software'),
(7, 'CC1007', 1, 'Roberto', 'Pérez', 'roberto.perez@campus.edu', '2023-04-15', true, 'iOS Development', 'Ingeniero de Sistemas'),
(8, 'CC1008', 1, 'Sofia', 'González', 'sofia.gonzalez@campus.edu', '2023-05-01', true, 'Android Development', 'Ingeniera Informática'),
(9, 'CC1009', 1, 'Diego', 'Ramírez', 'diego.ramirez@campus.edu', '2023-05-15', true, 'Cross-platform Development', 'Ingeniero de Software'),
(10, 'CC1010', 1, 'Carmen', 'Torres', 'carmen.torres@campus.edu', '2023-06-01', true, 'Mobile UI/UX', 'Diseñadora UI/UX'),

-- Trainers de Ciencia de Datos
(11, 'CC1011', 1, 'José', 'Silva', 'jose.silva@campus.edu', '2023-06-15', true, 'Data Science', 'Magíster en Ciencia de Datos'),
(12, 'CC1012', 1, 'Isabel', 'Castro', 'isabel.castro@campus.edu', '2023-07-01', true, 'Machine Learning', 'Ingeniera de Datos'),
(13, 'CC1013', 1, 'Miguel', 'Ruiz', 'miguel.ruiz@campus.edu', '2023-07-15', true, 'Big Data', 'Ingeniero de Datos'),
(14, 'CC1014', 1, 'Elena', 'Moreno', 'elena.moreno@campus.edu', '2023-08-01', true, 'Data Analytics', 'Magíster en Analytics'),
(15, 'CC1015', 1, 'Francisco', 'Jiménez', 'francisco.jimenez@campus.edu', '2023-08-15', true, 'Business Intelligence', 'Ingeniero de Datos'),

-- Trainers de DevOps
(16, 'CC1016', 1, 'Patricia', 'Hernández', 'patricia.hernandez@campus.edu', '2023-09-01', true, 'DevOps Engineering', 'Ingeniera de Sistemas'),
(17, 'CC1017', 1, 'Antonio', 'Díaz', 'antonio.diaz@campus.edu', '2023-09-15', true, 'Cloud Computing', 'Ingeniero Cloud'),
(18, 'CC1018', 1, 'Lucía', 'Romero', 'lucia.romero@campus.edu', '2023-10-01', true, 'CI/CD', 'Ingeniera DevOps'),
(19, 'CC1019', 1, 'Manuel', 'Navarro', 'manuel.navarro@campus.edu', '2023-10-15', true, 'Infrastructure as Code', 'Ingeniero de Sistemas'),
(20, 'CC1020', 1, 'Rosa', 'Alonso', 'rosa.alonso@campus.edu', '2023-11-01', true, 'Container Orchestration', 'Ingeniera DevOps'),

-- Trainers de Seguridad
(21, 'CC1021', 1, 'Alberto', 'Gutiérrez', 'alberto.gutierrez@campus.edu', '2023-11-15', true, 'Ciberseguridad', 'Ingeniero de Seguridad'),
(22, 'CC1022', 1, 'Marta', 'Molina', 'marta.molina@campus.edu', '2023-12-01', true, 'Ethical Hacking', 'Ingeniera de Seguridad'),
(23, 'CC1023', 1, 'Javier', 'Herrera', 'javier.herrera@campus.edu', '2023-12-15', true, 'Network Security', 'Ingeniero de Redes'),
(24, 'CC1024', 1, 'Cristina', 'Vega', 'cristina.vega@campus.edu', '2024-01-01', true, 'Application Security', 'Ingeniera de Seguridad'),
(25, 'CC1025', 1, 'David', 'Flores', 'david.flores@campus.edu', '2024-01-15', true, 'Security Operations', 'Ingeniero de Seguridad'),

-- Trainers de Blockchain
(26, 'CC1026', 1, 'Natalia', 'Cruz', 'natalia.cruz@campus.edu', '2024-02-01', true, 'Blockchain Development', 'Ingeniera Blockchain'),
(27, 'CC1027', 1, 'Pablo', 'Reyes', 'pablo.reyes@campus.edu', '2024-02-15', true, 'Smart Contracts', 'Ingeniero Blockchain'),
(28, 'CC1028', 1, 'Sara', 'Aguilar', 'sara.aguilar@campus.edu', '2024-03-01', true, 'DApp Development', 'Ingeniera de Software'),
(29, 'CC1029', 1, 'Raúl', 'Pascual', 'raul.pascual@campus.edu', '2024-03-15', true, 'Blockchain Architecture', 'Ingeniero de Sistemas'),
(30, 'CC1030', 1, 'Beatriz', 'Santos', 'beatriz.santos@campus.edu', '2024-04-01', true, 'Cryptocurrency', 'Ingeniera Blockchain'),

-- Trainers de IA/ML
(31, 'CC1031', 1, 'Fernando', 'Castro', 'fernando.castro@campus.edu', '2024-04-15', true, 'Inteligencia Artificial', 'Magíster en IA'),
(32, 'CC1032', 1, 'Marina', 'López', 'marina.lopez@campus.edu', '2024-05-01', true, 'Machine Learning', 'Ingeniera de Datos'),
(33, 'CC1033', 1, 'Ricardo', 'Mendoza', 'ricardo.mendoza@campus.edu', '2024-05-15', true, 'Deep Learning', 'Ingeniero de IA'),
(34, 'CC1034', 1, 'Clara', 'Ortega', 'clara.ortega@campus.edu', '2024-06-01', true, 'Computer Vision', 'Ingeniera de IA'),
(35, 'CC1035', 1, 'Hugo', 'Rubio', 'hugo.rubio@campus.edu', '2024-06-15', true, 'Natural Language Processing', 'Ingeniero de IA'),

-- Trainers de Videojuegos
(36, 'CC1036', 1, 'Irene', 'Sánchez', 'irene.sanchez@campus.edu', '2024-07-01', true, 'Game Development', 'Ingeniera de Software'),
(37, 'CC1037', 1, 'Óscar', 'Martín', 'oscar.martin@campus.edu', '2024-07-15', true, 'Game Design', 'Diseñador de Juegos'),
(38, 'CC1038', 1, 'Alicia', 'Gil', 'alicia.gil@campus.edu', '2024-08-01', true, 'Game Art', 'Artista Digital'),
(39, 'CC1039', 1, 'Marcos', 'Vidal', 'marcos.vidal@campus.edu', '2024-08-15', true, 'Game Programming', 'Ingeniero de Software'),
(40, 'CC1040', 1, 'Julia', 'Sanz', 'julia.sanz@campus.edu', '2024-09-01', true, 'Game Testing', 'Ingeniera QA'),

-- Trainers de VR/AR
(41, 'CC1041', 1, 'Ángel', 'Cano', 'angel.cano@campus.edu', '2024-09-15', true, 'Realidad Virtual', 'Ingeniero VR'),
(42, 'CC1042', 1, 'Eva', 'Prieto', 'eva.prieto@campus.edu', '2024-10-01', true, 'Realidad Aumentada', 'Ingeniera AR'),
(43, 'CC1043', 1, 'Rubén', 'Hidalgo', 'ruben.hidalgo@campus.edu', '2024-10-15', true, 'Mixed Reality', 'Ingeniero XR'),
(44, 'CC1044', 1, 'Silvia', 'Ferrer', 'silvia.ferrer@campus.edu', '2024-11-01', true, '3D Development', 'Ingeniera 3D'),
(45, 'CC1045', 1, 'Daniel', 'Moya', 'daniel.moya@campus.edu', '2024-11-15', true, 'Spatial Computing', 'Ingeniero VR'),

-- Trainers de IoT
(46, 'CC1046', 1, 'Carmen', 'Vidal', 'carmen.vidal@campus.edu', '2024-12-01', true, 'Internet of Things', 'Ingeniera IoT'),
(47, 'CC1047', 1, 'Jorge', 'Crespo', 'jorge.crespo@campus.edu', '2024-12-15', true, 'Embedded Systems', 'Ingeniero de Sistemas'),
(48, 'CC1048', 1, 'Laura', 'Pérez', 'laura.perez@campus.edu', '2025-01-01', true, 'Sensor Networks', 'Ingeniera IoT'),
(49, 'CC1049', 1, 'Roberto', 'Sánchez', 'roberto.sanchez@campus.edu', '2025-01-15', true, 'Smart Devices', 'Ingeniero IoT'),
(50, 'CC1050', 1, 'Ana', 'García', 'ana.garcia@campus.edu', '2025-02-01', true, 'IoT Security', 'Ingeniera de Seguridad');

-- Inserts para Telefonos_Trainer
INSERT INTO Telefonos_Trainer (id_trainer, telefono, tipo) VALUES
(1, '3001234567', 'Personal'), (1, '3101234567', 'Oficina'),
(2, '3002345678', 'Personal'), (2, '3102345678', 'Oficina'),
(3, '3003456789', 'Personal'), (3, '3103456789', 'Oficina'),
(4, '3004567890', 'Personal'), (4, '3104567890', 'Oficina'),
(5, '3005678901', 'Personal'), (5, '3105678901', 'Oficina'),

-- Trainers de Desarrollo Móvil
(6, '3006789012', 'Personal'), (6, '3106789012', 'Oficina'),
(7, '3007890123', 'Personal'), (7, '3107890123', 'Oficina'),
(8, '3008901234', 'Personal'), (8, '3108901234', 'Oficina'),
(9, '3009012345', 'Personal'), (9, '3109012345', 'Oficina'),
(10, '3000123456', 'Personal'), (10, '3100123456', 'Oficina'),

-- Trainers de Ciencia de Datos
(11, '3001234568', 'Personal'), (11, '3101234568', 'Oficina'),
(12, '3002345679', 'Personal'), (12, '3102345679', 'Oficina'),
(13, '3003456780', 'Personal'), (13, '3103456780', 'Oficina'),
(14, '3004567891', 'Personal'), (14, '3104567891', 'Oficina'),
(15, '3005678902', 'Personal'), (15, '3105678902', 'Oficina'),

-- Trainers de DevOps
(16, '3006789013', 'Personal'), (16, '3106789013', 'Oficina'),
(17, '3007890124', 'Personal'), (17, '3107890124', 'Oficina'),
(18, '3008901235', 'Personal'), (18, '3108901235', 'Oficina'),
(19, '3009012346', 'Personal'), (19, '3109012346', 'Oficina'),
(20, '3000123457', 'Personal'), (20, '3100123457', 'Oficina'),

-- Trainers de Seguridad
(21, '3001234569', 'Personal'), (21, '3101234569', 'Oficina'),
(22, '3002345680', 'Personal'), (22, '3102345680', 'Oficina'),
(23, '3003456781', 'Personal'), (23, '3103456781', 'Oficina'),
(24, '3004567892', 'Personal'), (24, '3104567892', 'Oficina'),
(25, '3005678903', 'Personal'), (25, '3105678903', 'Oficina'),

-- Trainers de Blockchain
(26, '3006789014', 'Personal'), (26, '3106789014', 'Oficina'),
(27, '3007890125', 'Personal'), (27, '3107890125', 'Oficina'),
(28, '3008901236', 'Personal'), (28, '3108901236', 'Oficina'),
(29, '3009012347', 'Personal'), (29, '3109012347', 'Oficina'),
(30, '3000123458', 'Personal'), (30, '3100123458', 'Oficina'),

-- Trainers de IA/ML
(31, '3001234570', 'Personal'), (31, '3101234570', 'Oficina'),
(32, '3002345681', 'Personal'), (32, '3102345681', 'Oficina'),
(33, '3003456782', 'Personal'), (33, '3103456782', 'Oficina'),
(34, '3004567893', 'Personal'), (34, '3104567893', 'Oficina'),
(35, '3005678904', 'Personal'), (35, '3105678904', 'Oficina'),

-- Trainers de Videojuegos
(36, '3006789015', 'Personal'), (36, '3106789015', 'Oficina'),
(37, '3007890126', 'Personal'), (37, '3107890126', 'Oficina'),
(38, '3008901237', 'Personal'), (38, '3108901237', 'Oficina'),
(39, '3009012348', 'Personal'), (39, '3109012348', 'Oficina'),
(40, '3000123459', 'Personal'), (40, '3100123459', 'Oficina'),

-- Trainers de VR/AR
(41, '3001234571', 'Personal'), (41, '3101234571', 'Oficina'),
(42, '3002345682', 'Personal'), (42, '3102345682', 'Oficina'),
(43, '3003456783', 'Personal'), (43, '3103456783', 'Oficina'),
(44, '3004567894', 'Personal'), (44, '3104567894', 'Oficina'),
(45, '3005678905', 'Personal'), (45, '3105678905', 'Oficina'),

-- Trainers de IoT
(46, '3006789016', 'Personal'), (46, '3106789016', 'Oficina'),
(47, '3007890127', 'Personal'), (47, '3107890127', 'Oficina'),
(48, '3008901238', 'Personal'), (48, '3108901238', 'Oficina'),
(49, '3009012349', 'Personal'), (49, '3109012349', 'Oficina'),
(50, '3000123460', 'Personal'), (50, '3100123460', 'Oficina');


-- Inserts para Disponibilidad_Trainer
INSERT INTO Disponibilidad_Trainer (id_trainer, dia_semana, hora_inicio, hora_fin) VALUES
-- Trainers de Desarrollo Web (Jornada Mañana)
(1, 'Lunes', '08:00:00', '12:00:00'), (1, 'Martes', '08:00:00', '12:00:00'), (1, 'Miércoles', '08:00:00', '12:00:00'),
(1, 'Jueves', '08:00:00', '12:00:00'), (1, 'Viernes', '08:00:00', '12:00:00'),
(2, 'Lunes', '09:00:00', '13:00:00'), (2, 'Martes', '09:00:00', '13:00:00'), (2, 'Miércoles', '09:00:00', '13:00:00'),
(2, 'Jueves', '09:00:00', '13:00:00'), (2, 'Viernes', '09:00:00', '13:00:00'),
(3, 'Lunes', '10:00:00', '14:00:00'), (3, 'Martes', '10:00:00', '14:00:00'), (3, 'Miércoles', '10:00:00', '14:00:00'),
(3, 'Jueves', '10:00:00', '14:00:00'), (3, 'Viernes', '10:00:00', '14:00:00'),
(4, 'Lunes', '11:00:00', '15:00:00'), (4, 'Martes', '11:00:00', '15:00:00'), (4, 'Miércoles', '11:00:00', '15:00:00'),
(4, 'Jueves', '11:00:00', '15:00:00'), (4, 'Viernes', '11:00:00', '15:00:00'),
(5, 'Lunes', '12:00:00', '16:00:00'), (5, 'Martes', '12:00:00', '16:00:00'), (5, 'Miércoles', '12:00:00', '16:00:00'),
(5, 'Jueves', '12:00:00', '16:00:00'), (5, 'Viernes', '12:00:00', '16:00:00'),

-- Trainers de Desarrollo Móvil (Jornada Tarde)
(6, 'Lunes', '14:00:00', '18:00:00'), (6, 'Martes', '14:00:00', '18:00:00'), (6, 'Miércoles', '14:00:00', '18:00:00'),
(6, 'Jueves', '14:00:00', '18:00:00'), (6, 'Viernes', '14:00:00', '18:00:00'),
(7, 'Lunes', '15:00:00', '19:00:00'), (7, 'Martes', '15:00:00', '19:00:00'), (7, 'Miércoles', '15:00:00', '19:00:00'),
(7, 'Jueves', '15:00:00', '19:00:00'), (7, 'Viernes', '15:00:00', '19:00:00'),
(8, 'Lunes', '16:00:00', '20:00:00'), (8, 'Martes', '16:00:00', '20:00:00'), (8, 'Miércoles', '16:00:00', '20:00:00'),
(8, 'Jueves', '16:00:00', '20:00:00'), (8, 'Viernes', '16:00:00', '20:00:00'),
(9, 'Lunes', '17:00:00', '21:00:00'), (9, 'Martes', '17:00:00', '21:00:00'), (9, 'Miércoles', '17:00:00', '21:00:00'),
(9, 'Jueves', '17:00:00', '21:00:00'), (9, 'Viernes', '17:00:00', '21:00:00'),
(10, 'Lunes', '18:00:00', '22:00:00'), (10, 'Martes', '18:00:00', '22:00:00'), (10, 'Miércoles', '18:00:00', '22:00:00'),
(10, 'Jueves', '18:00:00', '22:00:00'), (10, 'Viernes', '18:00:00', '22:00:00'),

-- Trainers de Ciencia de Datos (Jornada Mixta)
(11, 'Lunes', '09:00:00', '13:00:00'), (11, 'Martes', '14:00:00', '18:00:00'), (11, 'Miércoles', '09:00:00', '13:00:00'),
(11, 'Jueves', '14:00:00', '18:00:00'), (11, 'Viernes', '09:00:00', '13:00:00'),
(12, 'Lunes', '14:00:00', '18:00:00'), (12, 'Martes', '09:00:00', '13:00:00'), (12, 'Miércoles', '14:00:00', '18:00:00'),
(12, 'Jueves', '09:00:00', '13:00:00'), (12, 'Viernes', '14:00:00', '18:00:00'),
(13, 'Lunes', '10:00:00', '14:00:00'), (13, 'Martes', '15:00:00', '19:00:00'), (13, 'Miércoles', '10:00:00', '14:00:00'),
(13, 'Jueves', '15:00:00', '19:00:00'), (13, 'Viernes', '10:00:00', '14:00:00'),
(14, 'Lunes', '15:00:00', '19:00:00'), (14, 'Martes', '10:00:00', '14:00:00'), (14, 'Miércoles', '15:00:00', '19:00:00'),
(14, 'Jueves', '10:00:00', '14:00:00'), (14, 'Viernes', '15:00:00', '19:00:00'),
(15, 'Lunes', '11:00:00', '15:00:00'), (15, 'Martes', '16:00:00', '20:00:00'), (15, 'Miércoles', '11:00:00', '15:00:00'),
(15, 'Jueves', '16:00:00', '20:00:00'), (15, 'Viernes', '11:00:00', '15:00:00'),

-- Trainers de DevOps (Jornada Noche)
(16, 'Lunes', '18:00:00', '22:00:00'), (16, 'Martes', '18:00:00', '22:00:00'), (16, 'Miércoles', '18:00:00', '22:00:00'),
(16, 'Jueves', '18:00:00', '22:00:00'), (16, 'Viernes', '18:00:00', '22:00:00'),
(17, 'Lunes', '19:00:00', '23:00:00'), (17, 'Martes', '19:00:00', '23:00:00'), (17, 'Miércoles', '19:00:00', '23:00:00'),
(17, 'Jueves', '19:00:00', '23:00:00'), (17, 'Viernes', '19:00:00', '23:00:00'),
(18, 'Lunes', '20:00:00', '23:00:00'), (18, 'Martes', '20:00:00', '23:00:00'), (18, 'Miércoles', '20:00:00', '23:00:00'),
(18, 'Jueves', '20:00:00', '23:00:00'), (18, 'Viernes', '20:00:00', '23:00:00'),
(19, 'Lunes', '21:00:00', '23:00:00'), (19, 'Martes', '21:00:00', '23:00:00'), (19, 'Miércoles', '21:00:00', '23:00:00'),
(19, 'Jueves', '21:00:00', '23:00:00'), (19, 'Viernes', '21:00:00', '23:00:00'),
(20, 'Lunes', '22:00:00', '23:00:00'), (20, 'Martes', '22:00:00', '23:00:00'), (20, 'Miércoles', '22:00:00', '23:00:00'),
(20, 'Jueves', '22:00:00', '23:00:00'), (20, 'Viernes', '22:00:00', '23:00:00'),

-- Trainers de Seguridad (Jornada Mixta)
(21, 'Lunes', '08:00:00', '12:00:00'), (21, 'Martes', '14:00:00', '18:00:00'), (21, 'Miércoles', '08:00:00', '12:00:00'),
(21, 'Jueves', '14:00:00', '18:00:00'), (21, 'Viernes', '08:00:00', '12:00:00'),
(22, 'Lunes', '14:00:00', '18:00:00'), (22, 'Martes', '08:00:00', '12:00:00'), (22, 'Miércoles', '14:00:00', '18:00:00'),
(22, 'Jueves', '08:00:00', '12:00:00'), (22, 'Viernes', '14:00:00', '18:00:00'),
(23, 'Lunes', '09:00:00', '13:00:00'), (23, 'Martes', '15:00:00', '19:00:00'), (23, 'Miércoles', '09:00:00', '13:00:00'),
(23, 'Jueves', '15:00:00', '19:00:00'), (23, 'Viernes', '09:00:00', '13:00:00'),
(24, 'Lunes', '15:00:00', '19:00:00'), (24, 'Martes', '09:00:00', '13:00:00'), (24, 'Miércoles', '15:00:00', '19:00:00'),
(24, 'Jueves', '09:00:00', '13:00:00'), (24, 'Viernes', '15:00:00', '19:00:00'),
(25, 'Lunes', '10:00:00', '14:00:00'), (25, 'Martes', '16:00:00', '20:00:00'), (25, 'Miércoles', '10:00:00', '14:00:00'),
(25, 'Jueves', '16:00:00', '20:00:00'), (25, 'Viernes', '10:00:00', '14:00:00'),

-- Trainers de Blockchain (Jornada Tarde)
(26, 'Lunes', '14:00:00', '18:00:00'), (26, 'Martes', '14:00:00', '18:00:00'), (26, 'Miércoles', '14:00:00', '18:00:00'),
(26, 'Jueves', '14:00:00', '18:00:00'), (26, 'Viernes', '14:00:00', '18:00:00'),
(27, 'Lunes', '15:00:00', '19:00:00'), (27, 'Martes', '15:00:00', '19:00:00'), (27, 'Miércoles', '15:00:00', '19:00:00'),
(27, 'Jueves', '15:00:00', '19:00:00'), (27, 'Viernes', '15:00:00', '19:00:00'),
(28, 'Lunes', '16:00:00', '20:00:00'), (28, 'Martes', '16:00:00', '20:00:00'), (28, 'Miércoles', '16:00:00', '20:00:00'),
(28, 'Jueves', '16:00:00', '20:00:00'), (28, 'Viernes', '16:00:00', '20:00:00'),
(29, 'Lunes', '17:00:00', '21:00:00'), (29, 'Martes', '17:00:00', '21:00:00'), (29, 'Miércoles', '17:00:00', '21:00:00'),
(29, 'Jueves', '17:00:00', '21:00:00'), (29, 'Viernes', '17:00:00', '21:00:00'),
(30, 'Lunes', '18:00:00', '22:00:00'), (30, 'Martes', '18:00:00', '22:00:00'), (30, 'Miércoles', '18:00:00', '22:00:00'),
(30, 'Jueves', '18:00:00', '22:00:00'), (30, 'Viernes', '18:00:00', '22:00:00'),

-- Trainers de IA/ML (Jornada Mañana)
(31, 'Lunes', '08:00:00', '12:00:00'), (31, 'Martes', '08:00:00', '12:00:00'), (31, 'Miércoles', '08:00:00', '12:00:00'),
(31, 'Jueves', '08:00:00', '12:00:00'), (31, 'Viernes', '08:00:00', '12:00:00'),
(32, 'Lunes', '09:00:00', '13:00:00'), (32, 'Martes', '09:00:00', '13:00:00'), (32, 'Miércoles', '09:00:00', '13:00:00'),
(32, 'Jueves', '09:00:00', '13:00:00'), (32, 'Viernes', '09:00:00', '13:00:00'),
(33, 'Lunes', '10:00:00', '14:00:00'), (33, 'Martes', '10:00:00', '14:00:00'), (33, 'Miércoles', '10:00:00', '14:00:00'),
(33, 'Jueves', '10:00:00', '14:00:00'), (33, 'Viernes', '10:00:00', '14:00:00'),
(34, 'Lunes', '11:00:00', '15:00:00'), (34, 'Martes', '11:00:00', '15:00:00'), (34, 'Miércoles', '11:00:00', '15:00:00'),
(34, 'Jueves', '11:00:00', '15:00:00'), (34, 'Viernes', '11:00:00', '15:00:00'),
(35, 'Lunes', '12:00:00', '16:00:00'), (35, 'Martes', '12:00:00', '16:00:00'), (35, 'Miércoles', '12:00:00', '16:00:00'),
(35, 'Jueves', '12:00:00', '16:00:00'), (35, 'Viernes', '12:00:00', '16:00:00'),

-- Trainers de Videojuegos (Jornada Tarde)
(36, 'Lunes', '14:00:00', '18:00:00'), (36, 'Martes', '14:00:00', '18:00:00'), (36, 'Miércoles', '14:00:00', '18:00:00'),
(36, 'Jueves', '14:00:00', '18:00:00'), (36, 'Viernes', '14:00:00', '18:00:00'),
(37, 'Lunes', '15:00:00', '19:00:00'), (37, 'Martes', '15:00:00', '19:00:00'), (37, 'Miércoles', '15:00:00', '19:00:00'),
(37, 'Jueves', '15:00:00', '19:00:00'), (37, 'Viernes', '15:00:00', '19:00:00'),
(38, 'Lunes', '16:00:00', '20:00:00'), (38, 'Martes', '16:00:00', '20:00:00'), (38, 'Miércoles', '16:00:00', '20:00:00'),
(38, 'Jueves', '16:00:00', '20:00:00'), (38, 'Viernes', '16:00:00', '20:00:00'),
(39, 'Lunes', '17:00:00', '21:00:00'), (39, 'Martes', '17:00:00', '21:00:00'), (39, 'Miércoles', '17:00:00', '21:00:00'),
(39, 'Jueves', '17:00:00', '21:00:00'), (39, 'Viernes', '17:00:00', '21:00:00'),
(40, 'Lunes', '18:00:00', '22:00:00'), (40, 'Martes', '18:00:00', '22:00:00'), (40, 'Miércoles', '18:00:00', '22:00:00'),
(40, 'Jueves', '18:00:00', '22:00:00'), (40, 'Viernes', '18:00:00', '22:00:00'),

-- Trainers de VR/AR (Jornada Mixta)
(41, 'Lunes', '09:00:00', '13:00:00'), (41, 'Martes', '14:00:00', '18:00:00'), (41, 'Miércoles', '09:00:00', '13:00:00'),
(41, 'Jueves', '14:00:00', '18:00:00'), (41, 'Viernes', '09:00:00', '13:00:00'),
(42, 'Lunes', '14:00:00', '18:00:00'), (42, 'Martes', '09:00:00', '13:00:00'), (42, 'Miércoles', '14:00:00', '18:00:00'),
(42, 'Jueves', '09:00:00', '13:00:00'), (42, 'Viernes', '14:00:00', '18:00:00'),
(43, 'Lunes', '10:00:00', '14:00:00'), (43, 'Martes', '15:00:00', '19:00:00'), (43, 'Miércoles', '10:00:00', '14:00:00'),
(43, 'Jueves', '15:00:00', '19:00:00'), (43, 'Viernes', '10:00:00', '14:00:00'),
(44, 'Lunes', '15:00:00', '19:00:00'), (44, 'Martes', '10:00:00', '14:00:00'), (44, 'Miércoles', '15:00:00', '19:00:00'),
(44, 'Jueves', '10:00:00', '14:00:00'), (44, 'Viernes', '15:00:00', '19:00:00'),
(45, 'Lunes', '11:00:00', '15:00:00'), (45, 'Martes', '16:00:00', '20:00:00'), (45, 'Miércoles', '11:00:00', '15:00:00'),
(45, 'Jueves', '16:00:00', '20:00:00'), (45, 'Viernes', '11:00:00', '15:00:00'),

-- Trainers de IoT (Jornada Noche)
(46, 'Lunes', '18:00:00', '22:00:00'), (46, 'Martes', '18:00:00', '22:00:00'), (46, 'Miércoles', '18:00:00', '22:00:00'),
(46, 'Jueves', '18:00:00', '22:00:00'), (46, 'Viernes', '18:00:00', '22:00:00'),
(47, 'Lunes', '19:00:00', '23:00:00'), (47, 'Martes', '19:00:00', '23:00:00'), (47, 'Miércoles', '19:00:00', '23:00:00'),
(47, 'Jueves', '19:00:00', '23:00:00'), (47, 'Viernes', '19:00:00', '23:00:00'),
(48, 'Lunes', '20:00:00', '23:00:00'), (48, 'Martes', '20:00:00', '23:00:00'), (48, 'Miércoles', '20:00:00', '23:00:00'),
(48, 'Jueves', '20:00:00', '23:00:00'), (48, 'Viernes', '20:00:00', '23:00:00'),
(49, 'Lunes', '21:00:00', '23:00:00'), (49, 'Martes', '21:00:00', '23:00:00'), (49, 'Miércoles', '21:00:00', '23:00:00'),
(49, 'Jueves', '21:00:00', '23:00:00'), (49, 'Viernes', '21:00:00', '23:00:00'),
(50, 'Lunes', '22:00:00', '23:00:00'), (50, 'Martes', '22:00:00', '23:00:00'), (50, 'Miércoles', '22:00:00', '23:00:00'),
(50, 'Jueves', '22:00:00', '23:00:00'), (50, 'Viernes', '22:00:00', '23:00:00');

-- Inserts para Trainer_Modulo
INSERT INTO Trainer_Modulo (id_trainer, id_modulo, nivel_experiencia) VALUES
-- Trainers de Desarrollo Web
(1, 1, 'Experto'), (1, 2, 'Experto'), (1, 3, 'Avanzado'), (1, 4, 'Avanzado'), (1, 5, 'Experto'),
(2, 2, 'Experto'), (2, 3, 'Experto'), (2, 4, 'Avanzado'), (2, 5, 'Avanzado'), (2, 6, 'Experto'),
(3, 3, 'Experto'), (3, 4, 'Experto'), (3, 5, 'Avanzado'), (3, 6, 'Avanzado'), (3, 7, 'Experto'),
(4, 4, 'Experto'), (4, 5, 'Experto'), (4, 6, 'Avanzado'), (4, 7, 'Avanzado'), (4, 8, 'Experto'),
(5, 5, 'Experto'), (5, 6, 'Experto'), (5, 7, 'Avanzado'), (5, 8, 'Avanzado'), (5, 9, 'Experto'),

-- Trainers de Desarrollo Móvil
(6, 10, 'Experto'), (6, 11, 'Experto'), (6, 12, 'Avanzado'), (6, 13, 'Avanzado'), (6, 14, 'Experto'),
(7, 11, 'Experto'), (7, 12, 'Experto'), (7, 13, 'Avanzado'), (7, 14, 'Avanzado'), (7, 15, 'Experto'),
(8, 12, 'Experto'), (8, 13, 'Experto'), (8, 14, 'Avanzado'), (8, 15, 'Avanzado'), (8, 16, 'Experto'),
(9, 13, 'Experto'), (9, 14, 'Experto'), (9, 15, 'Avanzado'), (9, 16, 'Avanzado'), (9, 17, 'Experto'),
(10, 14, 'Experto'), (10, 15, 'Experto'), (10, 16, 'Avanzado'), (10, 17, 'Avanzado'), (10, 18, 'Experto'),

-- Trainers de Ciencia de Datos
(11, 19, 'Experto'), (11, 20, 'Experto'), (11, 21, 'Avanzado'), (11, 22, 'Avanzado'), (11, 23, 'Experto'),
(12, 20, 'Experto'), (12, 21, 'Experto'), (12, 22, 'Avanzado'), (12, 23, 'Avanzado'), (12, 24, 'Experto'),
(13, 21, 'Experto'), (13, 22, 'Experto'), (13, 23, 'Avanzado'), (13, 24, 'Avanzado'), (13, 25, 'Experto'),
(14, 22, 'Experto'), (14, 23, 'Experto'), (14, 24, 'Avanzado'), (14, 25, 'Avanzado'), (14, 26, 'Experto'),
(15, 23, 'Experto'), (15, 24, 'Experto'), (15, 25, 'Avanzado'), (15, 26, 'Avanzado'), (15, 27, 'Experto'),

-- Trainers de DevOps
(16, 28, 'Experto'), (16, 29, 'Experto'), (16, 30, 'Avanzado'), (16, 31, 'Avanzado'), (16, 32, 'Experto'),
(17, 29, 'Experto'), (17, 30, 'Experto'), (17, 31, 'Avanzado'), (17, 32, 'Avanzado'), (17, 33, 'Experto'),
(18, 30, 'Experto'), (18, 31, 'Experto'), (18, 32, 'Avanzado'), (18, 33, 'Avanzado'), (18, 34, 'Experto'),
(19, 31, 'Experto'), (19, 32, 'Experto'), (19, 33, 'Avanzado'), (19, 34, 'Avanzado'), (19, 35, 'Experto'),
(20, 32, 'Experto'), (20, 33, 'Experto'), (20, 34, 'Avanzado'), (20, 35, 'Avanzado'), (20, 36, 'Experto'),

-- Trainers de Seguridad
(21, 37, 'Experto'), (21, 38, 'Experto'), (21, 39, 'Avanzado'), (21, 40, 'Avanzado'), (21, 41, 'Experto'),
(22, 38, 'Experto'), (22, 39, 'Experto'), (22, 40, 'Avanzado'), (22, 41, 'Avanzado'), (22, 42, 'Experto'),
(23, 39, 'Experto'), (23, 40, 'Experto'), (23, 41, 'Avanzado'), (23, 42, 'Avanzado'), (23, 43, 'Experto'),
(24, 40, 'Experto'), (24, 41, 'Experto'), (24, 42, 'Avanzado'), (24, 43, 'Avanzado'), (24, 44, 'Experto'),
(25, 41, 'Experto'), (25, 42, 'Experto'), (25, 43, 'Avanzado'), (25, 44, 'Avanzado'), (25, 45, 'Experto'),

-- Trainers de Blockchain
(26, 46, 'Experto'), (26, 47, 'Experto'), (26, 48, 'Avanzado'), (26, 49, 'Avanzado'), (26, 50, 'Experto'),
(27, 47, 'Experto'), (27, 48, 'Experto'), (27, 49, 'Avanzado'), (27, 50, 'Avanzado'), (27, 51, 'Experto'),
(28, 48, 'Experto'), (28, 49, 'Experto'), (28, 50, 'Avanzado'), (28, 51, 'Avanzado'), (28, 52, 'Experto'),
(29, 49, 'Experto'), (29, 50, 'Experto'), (29, 51, 'Avanzado'), (29, 52, 'Avanzado'), (29, 53, 'Experto'),
(30, 50, 'Experto'), (30, 51, 'Experto'), (30, 52, 'Avanzado'), (30, 53, 'Avanzado'), (30, 54, 'Experto'),

-- Trainers de IA/ML
(31, 55, 'Experto'), (31, 56, 'Experto'), (31, 57, 'Avanzado'), (31, 58, 'Avanzado'), (31, 59, 'Experto'),
(32, 56, 'Experto'), (32, 57, 'Experto'), (32, 58, 'Avanzado'), (32, 59, 'Avanzado'), (32, 60, 'Experto'),
(33, 57, 'Experto'), (33, 58, 'Experto'), (33, 59, 'Avanzado'), (33, 60, 'Avanzado'), (33, 61, 'Experto'),
(34, 58, 'Experto'), (34, 59, 'Experto'), (34, 60, 'Avanzado'), (34, 61, 'Avanzado'), (34, 62, 'Experto'),
(35, 59, 'Experto'), (35, 60, 'Experto'), (35, 61, 'Avanzado'), (35, 62, 'Avanzado'), (35, 63, 'Experto'),

-- Trainers de Videojuegos
(36, 64, 'Experto'), (36, 65, 'Experto'), (36, 66, 'Avanzado'), (36, 67, 'Avanzado'), (36, 68, 'Experto'),
(37, 65, 'Experto'), (37, 66, 'Experto'), (37, 67, 'Avanzado'), (37, 68, 'Avanzado'), (37, 69, 'Experto'),
(38, 66, 'Experto'), (38, 67, 'Experto'), (38, 68, 'Avanzado'), (38, 69, 'Avanzado'), (38, 70, 'Experto'),
(39, 67, 'Experto'), (39, 68, 'Experto'), (39, 69, 'Avanzado'), (39, 70, 'Avanzado'), (39, 71, 'Experto'),
(40, 68, 'Experto'), (40, 69, 'Experto'), (40, 70, 'Avanzado'), (40, 71, 'Avanzado'), (40, 72, 'Experto'),

-- Trainers de VR/AR
(41, 73, 'Experto'), (41, 74, 'Experto'), (41, 75, 'Avanzado'), (41, 76, 'Avanzado'), (41, 77, 'Experto'),
(42, 74, 'Experto'), (42, 75, 'Experto'), (42, 76, 'Avanzado'), (42, 77, 'Avanzado'), (42, 78, 'Experto'),
(43, 75, 'Experto'), (43, 76, 'Experto'), (43, 77, 'Avanzado'), (43, 78, 'Avanzado'), (43, 79, 'Experto'),
(44, 76, 'Experto'), (44, 77, 'Experto'), (44, 78, 'Avanzado'), (44, 79, 'Avanzado'), (44, 80, 'Experto'),
(45, 77, 'Experto'), (45, 78, 'Experto'), (45, 79, 'Avanzado'), (45, 80, 'Avanzado'), (45, 81, 'Experto'),

-- Trainers de IoT
(46, 82, 'Experto'), (46, 83, 'Experto'), (46, 84, 'Avanzado'), (46, 85, 'Avanzado'), (46, 86, 'Experto'),
(47, 83, 'Experto'), (47, 84, 'Experto'), (47, 85, 'Avanzado'), (47, 86, 'Avanzado'), (47, 87, 'Experto'),
(48, 84, 'Experto'), (48, 85, 'Experto'), (48, 86, 'Avanzado'), (48, 87, 'Avanzado'), (48, 88, 'Experto'),
(49, 85, 'Experto'), (49, 86, 'Experto'), (49, 87, 'Avanzado'), (49, 88, 'Avanzado'), (49, 89, 'Experto'),
(50, 86, 'Experto'), (50, 87, 'Experto'), (50, 88, 'Avanzado'), (50, 89, 'Avanzado'), (50, 90, 'Experto');


-- Inserts para Matriculas
INSERT INTO Matriculas (id_camper, id_ruta, id_area, id_horario, id_estado_matricula, fecha_matricula, fecha_finalizacion) VALUES
-- Matrículas en Desarrollo Web Full Stack (Ruta 1)
(1, 1, 1, 1, 1, '2024-01-01', NULL), (2, 1, 1, 1, 1, '2024-01-01', NULL), (3, 1, 1, 1, 1, '2024-01-01', NULL),
(4, 1, 1, 1, 1, '2024-01-01', NULL), (5, 1, 1, 1, 1, '2024-01-01', NULL),

-- Matrículas en Desarrollo Frontend Avanzado (Ruta 2)
(6, 2, 2, 2, 1, '2024-01-15', NULL), (7, 2, 2, 2, 1, '2024-01-15', NULL), (8, 2, 2, 2, 1, '2024-01-15', NULL),
(9, 2, 2, 2, 1, '2024-01-15', NULL), (10, 2, 2, 2, 1, '2024-01-15', NULL),

-- Matrículas en Desarrollo Backend Avanzado (Ruta 3)
(11, 3, 3, 3, 1, '2024-02-01', NULL), (12, 3, 3, 3, 1, '2024-02-01', NULL), (13, 3, 3, 3, 1, '2024-02-01', NULL),
(14, 3, 3, 3, 1, '2024-02-01', NULL), (15, 3, 3, 3, 1, '2024-02-01', NULL),

-- Matrículas en Desarrollo Móvil con React Native (Ruta 6)
(16, 6, 4, 4, 1, '2024-01-10', NULL), (17, 6, 4, 4, 1, '2024-01-10', NULL), (18, 6, 4, 4, 1, '2024-01-10', NULL),
(19, 6, 4, 4, 1, '2024-01-10', NULL), (20, 6, 4, 4, 1, '2024-01-10', NULL),

-- Matrículas en Ciencia de Datos Básica (Ruta 11)
(21, 11, 5, 5, 1, '2024-01-20', NULL), (22, 11, 5, 5, 1, '2024-01-20', NULL), (23, 11, 5, 5, 1, '2024-01-20', NULL),
(24, 11, 5, 5, 1, '2024-01-20', NULL), (25, 11, 5, 5, 1, '2024-01-20', NULL),

-- Matrículas en DevOps Fundamentals (Ruta 16)
(26, 16, 6, 6, 1, '2024-02-15', NULL), (27, 16, 6, 6, 1, '2024-02-15', NULL), (28, 16, 6, 6, 1, '2024-02-15', NULL),
(29, 16, 6, 6, 1, '2024-02-15', NULL), (30, 16, 6, 6, 1, '2024-02-15', NULL),

-- Matrículas en Ciberseguridad Básica (Ruta 21)
(31, 21, 7, 7, 1, '2024-01-25', NULL), (32, 21, 7, 7, 1, '2024-01-25', NULL), (33, 21, 7, 7, 1, '2024-01-25', NULL),
(34, 21, 7, 7, 1, '2024-01-25', NULL), (35, 21, 7, 7, 1, '2024-01-25', NULL),

-- Matrículas en Blockchain Fundamentals (Ruta 26)
(36, 26, 8, 8, 1, '2024-02-10', NULL), (37, 26, 8, 8, 1, '2024-02-10', NULL), (38, 26, 8, 8, 1, '2024-02-10', NULL),
(39, 26, 8, 8, 1, '2024-02-10', NULL), (40, 26, 8, 8, 1, '2024-02-10', NULL),

-- Matrículas en Inteligencia Artificial Básica (Ruta 31)
(41, 31, 9, 9, 1, '2024-01-30', NULL), (42, 31, 9, 9, 1, '2024-01-30', NULL), (43, 31, 9, 9, 1, '2024-01-30', NULL),
(44, 31, 9, 9, 1, '2024-01-30', NULL), (45, 31, 9, 9, 1, '2024-01-30', NULL),

-- Matrículas en Desarrollo de Videojuegos 2D (Ruta 36)
(46, 36, 10, 10, 1, '2024-02-20', NULL), (47, 36, 10, 10, 1, '2024-02-20', NULL), (48, 36, 10, 10, 1, '2024-02-20', NULL),
(49, 36, 10, 10, 1, '2024-02-20', NULL), (50, 36, 10, 10, 1, '2024-02-20', NULL);


-- Inserts para Reasignaciones_Ruta
INSERT INTO Reasignaciones_Ruta (id_matricula, id_ruta_origen, id_ruta_destino, fecha_reasignacion, motivo, id_usuario) VALUES
-- Reasignaciones por preferencia del estudiante
(1, 1, 2, '2024-01-15', 'Cambio de ruta por preferencia del estudiante hacia Frontend Avanzado', 1),
(2, 2, 3, '2024-01-20', 'Cambio de ruta por preferencia del estudiante hacia Backend Avanzado', 1),
(3, 3, 6, '2024-02-05', 'Cambio de ruta por preferencia del estudiante hacia Desarrollo Móvil', 1),

-- Reasignaciones por disponibilidad de cupos
(4, 1, 11, '2024-01-25', 'Reasignación por disponibilidad de cupos en Ciencia de Datos', 1),
(5, 2, 16, '2024-02-01', 'Reasignación por disponibilidad de cupos en DevOps', 1),
(6, 3, 21, '2024-02-10', 'Reasignación por disponibilidad de cupos en Ciberseguridad', 1),

-- Reasignaciones por horario
(7, 6, 26, '2024-01-30', 'Cambio de ruta por ajuste de horario a Blockchain', 1),
(8, 11, 31, '2024-02-15', 'Cambio de ruta por ajuste de horario a IA/ML', 1),
(9, 16, 36, '2024-02-20', 'Cambio de ruta por ajuste de horario a Videojuegos', 1),

-- Reasignaciones por rendimiento académico
(10, 21, 2, '2024-01-28', 'Reasignación por rendimiento académico a Frontend Avanzado', 1),
(11, 26, 3, '2024-02-08', 'Reasignación por rendimiento académico a Backend Avanzado', 1),
(12, 31, 6, '2024-02-18', 'Reasignación por rendimiento académico a Desarrollo Móvil', 1),

-- Reasignaciones por cambio de interés
(1, 1, 2, '2024-01-15', 'Cambio de ruta por preferencia del estudiante', 1),
(2, 2, 3, '2024-01-20', 'Reasignación por disponibilidad de cupos', 1),
(3, 3, 4, '2024-02-05', 'Cambio de ruta por horario', 1);


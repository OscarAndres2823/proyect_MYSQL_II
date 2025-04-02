--consultas

-- Campers
-- 1. Obtener todos los campers inscritos actualmente
SELECT 
    c.id,
    c.nombre,
    c.email,
    c.estado,
    c.nivel_riesgo,
    c.fecha_registro
FROM campers c
WHERE c.estado = 'Inscrito'
ORDER BY c.fecha_registro DESC;

-- 2. Listar los campers con estado "Aprobado"
SELECT 
    c.id,
    c.nombre,
    c.email,
    c.estado,
    c.nivel_riesgo,
    c.fecha_registro
FROM campers c
WHERE c.estado = 'Aprobado'
ORDER BY c.fecha_registro DESC;

-- 3. Mostrar los campers que ya están cursando alguna ruta
SELECT 
    c.id,
    c.nombre,
    c.email,
    c.estado,
    r.nombre AS ruta,
    t.nombre AS trainer
FROM campers c
INNER JOIN asignaciones a ON c.id = a.camper_id
INNER JOIN rutas r ON a.ruta_id = r.id
INNER JOIN trainers t ON a.trainer_id = t.id
WHERE c.estado = 'Cursando'
ORDER BY c.nombre;

-- 4. Consultar los campers graduados por cada ruta
SELECT 
    r.nombre AS ruta,
    COUNT(c.id) AS total_graduados,
    GROUP_CONCAT(c.nombre SEPARATOR ', ') AS campers_graduados
FROM rutas r
LEFT JOIN asignaciones a ON r.id = a.ruta_id
LEFT JOIN campers c ON a.camper_id = c.id AND c.estado = 'Graduado'
GROUP BY r.id, r.nombre
ORDER BY r.nombre;

-- 5. Obtener los campers que se encuentran en estado "Expulsado" o "Retirado"
SELECT 
    c.id,
    c.nombre,
    c.email,
    c.estado,
    c.nivel_riesgo,
    c.fecha_registro
FROM campers c
WHERE c.estado IN ('Expulsado', 'Retirado')
ORDER BY c.estado, c.nombre;

-- 6. Listar campers con nivel de riesgo "Alto"
SELECT 
    c.id,
    c.nombre,
    c.email,
    c.estado,
    c.nivel_riesgo,
    c.fecha_registro
FROM campers c
WHERE c.nivel_riesgo = 'Alto'
ORDER BY c.fecha_registro DESC;

-- 7. Mostrar el total de campers por cada nivel de riesgo
SELECT 
    nivel_riesgo,
    COUNT(*) AS total_campers,
    GROUP_CONCAT(nombre SEPARATOR ', ') AS lista_campers
FROM campers
GROUP BY nivel_riesgo
ORDER BY nivel_riesgo;

-- 8. Obtener campers con más de un número telefónico registrado
SELECT 
    c.id,
    c.nombre,
    c.email,
    COUNT(tc.telefono) AS total_telefonos,
    GROUP_CONCAT(tc.telefono SEPARATOR ', ') AS telefonos
FROM campers c
INNER JOIN telefonos_campers tc ON c.id = tc.camper_id
GROUP BY c.id, c.nombre, c.email
HAVING COUNT(tc.telefono) > 1
ORDER BY c.nombre;

-- 9. Listar los campers y sus respectivos acudientes y teléfonos
SELECT 
    c.id,
    c.nombre AS nombre_camper,
    c.email AS email_camper,
    c.acudiente_nombre,
    c.acudiente_telefono
FROM campers c
ORDER BY c.nombre;

-- 10. Mostrar campers que aún no han sido asignados a una ruta
SELECT 
    c.id,
    c.nombre,
    c.email,
    c.estado,
    c.nivel_riesgo
FROM campers c
LEFT JOIN asignaciones a ON c.id = a.camper_id
WHERE a.id IS NULL
ORDER BY c.nombre;

📊 Evaluaciones

-- 1. Obtener las notas teóricas, prácticas y quizzes de cada camper por módulo
SELECT 
    c.nombre AS camper,
    m.nombre AS modulo,
    e.nota_teorica,
    e.nota_practica,
    e.nota_quiz,
    e.nota_final,
    e.fecha_evaluacion
FROM evaluaciones e
INNER JOIN campers c ON e.camper_id = c.id
INNER JOIN modulos m ON e.modulo_id = m.id
ORDER BY c.nombre, m.nombre;

-- 2. Calcular la nota final de cada camper por módulo
SELECT 
    c.nombre AS camper,
    m.nombre AS modulo,
    e.nota_final,
    CASE 
        WHEN e.nota_final >= 60 THEN 'Aprobado'
        ELSE 'Reprobado'
    END AS estado
FROM evaluaciones e
INNER JOIN campers c ON e.camper_id = c.id
INNER JOIN modulos m ON e.modulo_id = m.id
ORDER BY c.nombre, m.nombre;

-- 3. Mostrar los campers que reprobaron algún módulo (nota < 60)
SELECT 
    c.nombre AS camper,
    m.nombre AS modulo,
    e.nota_final,
    t.nombre AS trainer
FROM evaluaciones e
INNER JOIN campers c ON e.camper_id = c.id
INNER JOIN modulos m ON e.modulo_id = m.id
INNER JOIN trainers t ON e.trainer_id = t.id
WHERE e.nota_final < 60
ORDER BY e.nota_final ASC;

-- 4. Listar los módulos con más campers en bajo rendimiento
SELECT 
    m.nombre AS modulo,
    COUNT(CASE WHEN e.nota_final < 60 THEN 1 END) AS total_reprobados,
    COUNT(*) AS total_evaluados,
    ROUND((COUNT(CASE WHEN e.nota_final < 60 THEN 1 END) * 100.0 / COUNT(*)), 2) AS porcentaje_reprobados
FROM evaluaciones e
INNER JOIN modulos m ON e.modulo_id = m.id
GROUP BY m.id, m.nombre
HAVING COUNT(CASE WHEN e.nota_final < 60 THEN 1 END) > 0
ORDER BY total_reprobados DESC;

-- 5. Obtener el promedio de notas finales por cada módulo
SELECT 
    m.nombre AS modulo,
    ROUND(AVG(e.nota_final), 2) AS promedio_nota,
    MIN(e.nota_final) AS nota_minima,
    MAX(e.nota_final) AS nota_maxima,
    COUNT(*) AS total_evaluados
FROM evaluaciones e
INNER JOIN modulos m ON e.modulo_id = m.id
GROUP BY m.id, m.nombre
ORDER BY promedio_nota DESC;

-- 6. Consultar el rendimiento general por ruta de entrenamiento
SELECT 
    r.nombre AS ruta,
    COUNT(DISTINCT e.camper_id) AS total_campers,
    ROUND(AVG(e.nota_final), 2) AS promedio_general,
    COUNT(DISTINCT CASE WHEN e.nota_final >= 60 THEN e.camper_id END) AS campers_aprobados,
    COUNT(DISTINCT CASE WHEN e.nota_final < 60 THEN e.camper_id END) AS campers_reprobados
FROM rutas r
INNER JOIN modulos m ON r.id = m.ruta_id
INNER JOIN evaluaciones e ON m.id = e.modulo_id
GROUP BY r.id, r.nombre
ORDER BY promedio_general DESC;

-- 7. Mostrar los trainers responsables de campers con bajo rendimiento
SELECT 
    t.nombre AS trainer,
    COUNT(DISTINCT e.camper_id) AS total_campers_bajo_rendimiento,
    GROUP_CONCAT(DISTINCT c.nombre SEPARATOR ', ') AS campers
FROM evaluaciones e
INNER JOIN trainers t ON e.trainer_id = t.id
INNER JOIN campers c ON e.camper_id = c.id
WHERE e.nota_final < 60
GROUP BY t.id, t.nombre
ORDER BY total_campers_bajo_rendimiento DESC;

-- 8. Comparar el promedio de rendimiento por trainer
SELECT 
    t.nombre AS trainer,
    COUNT(DISTINCT e.camper_id) AS total_campers,
    ROUND(AVG(e.nota_final), 2) AS promedio_rendimiento,
    COUNT(DISTINCT CASE WHEN e.nota_final >= 60 THEN e.camper_id END) AS campers_aprobados,
    COUNT(DISTINCT CASE WHEN e.nota_final < 60 THEN e.camper_id END) AS campers_reprobados
FROM trainers t
INNER JOIN evaluaciones e ON t.id = e.trainer_id
INNER JOIN campers c ON e.camper_id = c.id
GROUP BY t.id, t.nombre
ORDER BY promedio_rendimiento DESC;

-- 9. Listar los mejores 5 campers por nota final en cada ruta
WITH RankedCampers AS (
    SELECT 
        r.nombre AS ruta,
        c.nombre AS camper,
        e.nota_final,
        ROW_NUMBER() OVER (PARTITION BY r.id ORDER BY e.nota_final DESC) AS ranking
    FROM evaluaciones e
    INNER JOIN campers c ON e.camper_id = c.id
    INNER JOIN modulos m ON e.modulo_id = m.id
    INNER JOIN rutas r ON m.ruta_id = r.id
)
SELECT 
    ruta,
    camper,
    nota_final
FROM RankedCampers
WHERE ranking <= 5
ORDER BY ruta, ranking;

-- 10. Mostrar cuántos campers pasaron cada módulo por ruta
SELECT 
    r.nombre AS ruta,
    m.nombre AS modulo,
    COUNT(DISTINCT e.camper_id) AS total_campers,
    COUNT(DISTINCT CASE WHEN e.nota_final >= 60 THEN e.camper_id END) AS campers_aprobados,
    COUNT(DISTINCT CASE WHEN e.nota_final < 60 THEN e.camper_id END) AS campers_reprobados,
    ROUND((COUNT(DISTINCT CASE WHEN e.nota_final >= 60 THEN e.camper_id END) * 100.0 / 
           COUNT(DISTINCT e.camper_id)), 2) AS porcentaje_aprobacion
FROM rutas r
INNER JOIN modulos m ON r.id = m.ruta_id
INNER JOIN evaluaciones e ON m.id = e.modulo_id
GROUP BY r.id, r.nombre, m.id, m.nombre
ORDER BY r.nombre, m.nombre;

🧭 Rutas y Áreas de Entrenamiento

-- 1. Mostrar todas las rutas de entrenamiento disponibles
SELECT 
    r.id,
    r.nombre,
    r.descripcion,
    r.duracion_meses,
    r.sgdb_principal,
    r.sgdb_alternativo
FROM rutas r
ORDER BY r.nombre;

-- 2. Obtener las rutas con su SGDB principal y alternativo
SELECT 
    r.nombre AS ruta,
    r.sgdb_principal AS base_datos_principal,
    r.sgdb_alternativo AS base_datos_alternativo,
    CASE 
        WHEN r.sgdb_alternativo IS NOT NULL THEN 'Sí'
        ELSE 'No'
    END AS tiene_alternativo
FROM rutas r
ORDER BY r.nombre;

-- 3. Listar los módulos asociados a cada ruta
SELECT 
    r.nombre AS ruta,
    COUNT(m.id) AS total_modulos,
    GROUP_CONCAT(m.nombre SEPARATOR ', ') AS modulos,
    SUM(m.duracion_horas) AS horas_totales
FROM rutas r
LEFT JOIN modulos m ON r.id = m.ruta_id
GROUP BY r.id, r.nombre
ORDER BY r.nombre;

-- 4. Consultar cuántos campers hay en cada ruta
SELECT 
    r.nombre AS ruta,
    COUNT(DISTINCT a.camper_id) AS total_campers,
    COUNT(DISTINCT CASE WHEN c.estado = 'Cursando' THEN a.camper_id END) AS campers_activos,
    COUNT(DISTINCT CASE WHEN c.estado = 'Graduado' THEN a.camper_id END) AS campers_graduados
FROM rutas r
LEFT JOIN asignaciones a ON r.id = a.ruta_id
LEFT JOIN campers c ON a.camper_id = c.id
GROUP BY r.id, r.nombre
ORDER BY total_campers DESC;

-- 5. Mostrar las áreas de entrenamiento y su capacidad máxima
SELECT 
    a.id,
    a.nombre,
    a.descripcion,
    a.capacidad_maxima,
    a.horario_inicio,
    a.horario_fin
FROM areas a
ORDER BY a.nombre;

-- 6. Obtener las áreas que están ocupadas al 100%
SELECT 
    a.nombre AS area,
    a.capacidad_maxima,
    COUNT(DISTINCT asig.camper_id) AS ocupacion_actual,
    ROUND((COUNT(DISTINCT asig.camper_id) * 100.0 / a.capacidad_maxima), 2) AS porcentaje_ocupacion
FROM areas a
INNER JOIN rutas r ON a.id = r.area_id
INNER JOIN asignaciones asig ON r.id = asig.ruta_id
WHERE asig.estado = 'Activo'
GROUP BY a.id, a.nombre, a.capacidad_maxima
HAVING COUNT(DISTINCT asig.camper_id) >= a.capacidad_maxima
ORDER BY porcentaje_ocupacion DESC;

-- 7. Verificar la ocupación actual de cada área
SELECT 
    a.nombre AS area,
    a.capacidad_maxima,
    COUNT(DISTINCT asig.camper_id) AS ocupacion_actual,
    (a.capacidad_maxima - COUNT(DISTINCT asig.camper_id)) AS cupos_disponibles,
    ROUND((COUNT(DISTINCT asig.camper_id) * 100.0 / a.capacidad_maxima), 2) AS porcentaje_ocupacion
FROM areas a
LEFT JOIN rutas r ON a.id = r.area_id
LEFT JOIN asignaciones asig ON r.id = asig.ruta_id AND asig.estado = 'Activo'
GROUP BY a.id, a.nombre, a.capacidad_maxima
ORDER BY porcentaje_ocupacion DESC;

-- 8. Consultar los horarios disponibles por cada área
SELECT 
    a.nombre AS area,
    TIME_FORMAT(a.horario_inicio, '%H:%i') AS hora_inicio,
    TIME_FORMAT(a.horario_fin, '%H:%i') AS hora_fin,
    TIMESTAMPDIFF(HOUR, a.horario_inicio, a.horario_fin) AS horas_disponibles
FROM areas a
ORDER BY a.horario_inicio;

-- 9. Mostrar las áreas con más campers asignados
SELECT 
    a.nombre AS area,
    COUNT(DISTINCT asig.camper_id) AS total_campers,
    COUNT(DISTINCT r.id) AS total_rutas,
    ROUND((COUNT(DISTINCT asig.camper_id) * 100.0 / a.capacidad_maxima), 2) AS porcentaje_ocupacion
FROM areas a
INNER JOIN rutas r ON a.id = r.area_id
INNER JOIN asignaciones asig ON r.id = asig.ruta_id
WHERE asig.estado = 'Activo'
GROUP BY a.id, a.nombre, a.capacidad_maxima
ORDER BY total_campers DESC;

-- 10. Listar las rutas con sus respectivos trainers y áreas asignadas
SELECT 
    r.nombre AS ruta,
    a.nombre AS area,
    GROUP_CONCAT(DISTINCT t.nombre SEPARATOR ', ') AS trainers,
    COUNT(DISTINCT asig.camper_id) AS total_campers,
    a.capacidad_maxima,
    ROUND((COUNT(DISTINCT asig.camper_id) * 100.0 / a.capacidad_maxima), 2) AS porcentaje_ocupacion
FROM rutas r
INNER JOIN areas a ON r.area_id = a.id
INNER JOIN asignaciones asig ON r.id = asig.ruta_id
INNER JOIN trainers t ON asig.trainer_id = t.id
WHERE asig.estado = 'Activo'
GROUP BY r.id, r.nombre, a.id, a.nombre, a.capacidad_maxima
ORDER BY r.nombre;

-- Trainers

-- 1. Listar todos los entrenadores registrados
SELECT 
    t.id,
    t.nombre,
    t.email,
    t.telefono,
    t.especialidad,
    t.fecha_inicio,
    a.nombre AS area
FROM trainers t
INNER JOIN areas a ON t.area_id = a.id
ORDER BY t.nombre;

-- 2. Mostrar los trainers con sus horarios asignados
SELECT 
    t.nombre AS trainer,
    h.dia_semana,
    TIME_FORMAT(h.hora_inicio, '%H:%i') AS hora_inicio,
    TIME_FORMAT(h.hora_fin, '%H:%i') AS hora_fin,
    s.nombre AS salon
FROM trainers t
INNER JOIN horarios_clases h ON t.id = h.trainer_id
INNER JOIN salones s ON h.salon_id = s.id
WHERE h.estado = 'Activo'
ORDER BY t.nombre, h.dia_semana, h.hora_inicio;

-- 3. Consultar los trainers asignados a más de una ruta
SELECT 
    t.nombre AS trainer,
    COUNT(DISTINCT a.ruta_id) AS total_rutas,
    GROUP_CONCAT(DISTINCT r.nombre SEPARATOR ', ') AS rutas
FROM trainers t
INNER JOIN asignaciones a ON t.id = a.trainer_id
INNER JOIN rutas r ON a.ruta_id = r.id
WHERE a.estado = 'Activo'
GROUP BY t.id, t.nombre
HAVING COUNT(DISTINCT a.ruta_id) > 1
ORDER BY total_rutas DESC;

-- 4. Obtener el número de campers por trainer
SELECT 
    t.nombre AS trainer,
    COUNT(DISTINCT a.camper_id) AS total_campers,
    COUNT(DISTINCT CASE WHEN c.estado = 'Cursando' THEN a.camper_id END) AS campers_activos,
    COUNT(DISTINCT CASE WHEN c.estado = 'Graduado' THEN a.camper_id END) AS campers_graduados
FROM trainers t
LEFT JOIN asignaciones a ON t.id = a.trainer_id
LEFT JOIN campers c ON a.camper_id = c.id
WHERE a.estado = 'Activo'
GROUP BY t.id, t.nombre
ORDER BY total_campers DESC;

-- 5. Mostrar las áreas en las que trabaja cada trainer
SELECT 
    t.nombre AS trainer,
    COUNT(DISTINCT a.id) AS total_areas,
    GROUP_CONCAT(DISTINCT a.nombre SEPARATOR ', ') AS areas
FROM trainers t
INNER JOIN areas a ON t.area_id = a.id
INNER JOIN rutas r ON a.id = r.area_id
INNER JOIN asignaciones asig ON r.id = asig.ruta_id
WHERE asig.estado = 'Activo'
GROUP BY t.id, t.nombre
ORDER BY t.nombre;

-- 6. Listar los trainers sin asignación de área o ruta
SELECT 
    t.nombre AS trainer,
    t.email,
    t.telefono,
    t.especialidad
FROM trainers t
LEFT JOIN asignaciones a ON t.id = a.trainer_id
WHERE a.id IS NULL
ORDER BY t.nombre;

-- 7. Mostrar cuántos módulos están a cargo de cada trainer
SELECT 
    t.nombre AS trainer,
    COUNT(DISTINCT m.id) AS total_modulos,
    GROUP_CONCAT(DISTINCT m.nombre SEPARATOR ', ') AS modulos,
    SUM(m.duracion_horas) AS horas_totales
FROM trainers t
INNER JOIN evaluaciones e ON t.id = e.trainer_id
INNER JOIN modulos m ON e.modulo_id = m.id
GROUP BY t.id, t.nombre
ORDER BY total_modulos DESC;

-- 8. Obtener el trainer con mejor rendimiento promedio de campers
SELECT 
    t.nombre AS trainer,
    COUNT(DISTINCT e.camper_id) AS total_campers,
    ROUND(AVG(e.nota_final), 2) AS promedio_rendimiento,
    COUNT(DISTINCT CASE WHEN e.nota_final >= 60 THEN e.camper_id END) AS campers_aprobados,
    COUNT(DISTINCT CASE WHEN e.nota_final < 60 THEN e.camper_id END) AS campers_reprobados
FROM trainers t
INNER JOIN evaluaciones e ON t.id = e.trainer_id
GROUP BY t.id, t.nombre
ORDER BY promedio_rendimiento DESC
LIMIT 1;

-- 9. Consultar los horarios ocupados por cada trainer
SELECT 
    t.nombre AS trainer,
    h.dia_semana,
    TIME_FORMAT(h.hora_inicio, '%H:%i') AS hora_inicio,
    TIME_FORMAT(h.hora_fin, '%H:%i') AS hora_fin,
    m.nombre AS modulo,
    s.nombre AS salon
FROM trainers t
INNER JOIN horarios_clases h ON t.id = h.trainer_id
INNER JOIN modulos m ON h.modulo_id = m.id
INNER JOIN salones s ON h.salon_id = s.id
WHERE h.estado = 'Activo'
ORDER BY t.nombre, h.dia_semana, h.hora_inicio;

-- 10. Mostrar la disponibilidad semanal de cada trainer
SELECT 
    t.nombre AS trainer,
    h.dia_semana,
    TIME_FORMAT(h.hora_inicio, '%H:%i') AS hora_inicio,
    TIME_FORMAT(h.hora_fin, '%H:%i') AS hora_fin,
    COUNT(DISTINCT h.modulo_id) AS modulos_asignados,
    COUNT(DISTINCT h.salon_id) AS salones_utilizados
FROM trainers t
INNER JOIN horarios_clases h ON t.id = h.trainer_id
WHERE h.estado = 'Activo'
GROUP BY t.id, t.nombre, h.dia_semana, h.hora_inicio, h.hora_fin
ORDER BY t.nombre, 
    CASE h.dia_semana
        WHEN 'Lunes' THEN 1
        WHEN 'Martes' THEN 2
        WHEN 'Miércoles' THEN 3
        WHEN 'Jueves' THEN 4
        WHEN 'Viernes' THEN 5
        WHEN 'Sábado' THEN 6
    END,
    h.hora_inicio;

🔍 Consultas con Subconsultas y Cálculos Avanzados 

-- 1. Obtener los campers con la nota más alta en cada módulo
WITH MaxNotas AS (
    SELECT 
        modulo_id,
        MAX(nota_final) AS max_nota
    FROM evaluaciones
    GROUP BY modulo_id
)
SELECT 
    m.nombre AS modulo,
    c.nombre AS camper,
    e.nota_final,
    t.nombre AS trainer
FROM evaluaciones e
INNER JOIN MaxNotas mn ON e.modulo_id = mn.modulo_id AND e.nota_final = mn.max_nota
INNER JOIN modulos m ON e.modulo_id = m.id
INNER JOIN campers c ON e.camper_id = c.id
INNER JOIN trainers t ON e.trainer_id = t.id
ORDER BY m.nombre;

-- 2. Mostrar el promedio general de notas por ruta y comparar con el promedio global
WITH PromediosRutas AS (
    SELECT 
        r.nombre AS ruta,
        ROUND(AVG(e.nota_final), 2) AS promedio_ruta
    FROM rutas r
    INNER JOIN modulos m ON r.id = m.ruta_id
    INNER JOIN evaluaciones e ON m.id = e.modulo_id
    GROUP BY r.id, r.nombre
),
PromedioGlobal AS (
    SELECT ROUND(AVG(nota_final), 2) AS promedio_global
    FROM evaluaciones
)
SELECT 
    pr.ruta,
    pr.promedio_ruta,
    pg.promedio_global,
    ROUND(pr.promedio_ruta - pg.promedio_global, 2) AS diferencia
FROM PromediosRutas pr
CROSS JOIN PromedioGlobal pg
ORDER BY diferencia DESC;

-- 3. Listar las áreas con más del 80% de ocupación
SELECT 
    a.nombre AS area,
    a.capacidad_maxima,
    COUNT(DISTINCT asig.camper_id) AS ocupacion_actual,
    ROUND((COUNT(DISTINCT asig.camper_id) * 100.0 / a.capacidad_maxima), 2) AS porcentaje_ocupacion
FROM areas a
INNER JOIN rutas r ON a.id = r.area_id
INNER JOIN asignaciones asig ON r.id = asig.ruta_id
WHERE asig.estado = 'Activo'
GROUP BY a.id, a.nombre, a.capacidad_maxima
HAVING (COUNT(DISTINCT asig.camper_id) * 100.0 / a.capacidad_maxima) > 80
ORDER BY porcentaje_ocupacion DESC;

-- 4. Mostrar los trainers con menos del 70% de rendimiento promedio
SELECT 
    t.nombre AS trainer,
    COUNT(DISTINCT e.camper_id) AS total_campers,
    ROUND(AVG(e.nota_final), 2) AS promedio_rendimiento,
    COUNT(DISTINCT CASE WHEN e.nota_final >= 60 THEN e.camper_id END) AS campers_aprobados,
    COUNT(DISTINCT CASE WHEN e.nota_final < 60 THEN e.camper_id END) AS campers_reprobados
FROM trainers t
INNER JOIN evaluaciones e ON t.id = e.trainer_id
GROUP BY t.id, t.nombre
HAVING (COUNT(DISTINCT CASE WHEN e.nota_final >= 60 THEN e.camper_id END) * 100.0 / 
        COUNT(DISTINCT e.camper_id)) < 70
ORDER BY promedio_rendimiento;

-- 5. Consultar los campers cuyo promedio está por debajo del promedio general
WITH PromediosCampers AS (
    SELECT 
        c.id,
        c.nombre,
        ROUND(AVG(e.nota_final), 2) AS promedio_camper
    FROM campers c
    INNER JOIN evaluaciones e ON c.id = e.camper_id
    GROUP BY c.id, c.nombre
),
PromedioGlobal AS (
    SELECT ROUND(AVG(nota_final), 2) AS promedio_global
    FROM evaluaciones
)
SELECT 
    pc.nombre,
    pc.promedio_camper,
    pg.promedio_global,
    ROUND(pc.promedio_camper - pg.promedio_global, 2) AS diferencia
FROM PromediosCampers pc
CROSS JOIN PromedioGlobal pg
WHERE pc.promedio_camper < pg.promedio_global
ORDER BY diferencia;

-- 6. Obtener los módulos con la menor tasa de aprobación
SELECT 
    m.nombre AS modulo,
    COUNT(*) AS total_evaluados,
    COUNT(CASE WHEN e.nota_final >= 60 THEN 1 END) AS aprobados,
    COUNT(CASE WHEN e.nota_final < 60 THEN 1 END) AS reprobados,
    ROUND((COUNT(CASE WHEN e.nota_final >= 60 THEN 1 END) * 100.0 / COUNT(*)), 2) AS tasa_aprobacion
FROM modulos m
INNER JOIN evaluaciones e ON m.id = e.modulo_id
GROUP BY m.id, m.nombre
ORDER BY tasa_aprobacion
LIMIT 5;

-- 7. Listar los campers que han aprobado todos los módulos de su ruta
WITH ModulosPorRuta AS (
    SELECT 
        r.id AS ruta_id,
        COUNT(DISTINCT m.id) AS total_modulos
    FROM rutas r
    INNER JOIN modulos m ON r.id = m.ruta_id
    GROUP BY r.id
),
ModulosAprobadosCamper AS (
    SELECT 
        c.id AS camper_id,
        r.id AS ruta_id,
        COUNT(DISTINCT CASE WHEN e.nota_final >= 60 THEN m.id END) AS modulos_aprobados
    FROM campers c
    INNER JOIN asignaciones a ON c.id = a.camper_id
    INNER JOIN rutas r ON a.ruta_id = r.id
    INNER JOIN modulos m ON r.id = m.ruta_id
    INNER JOIN evaluaciones e ON m.id = e.modulo_id AND c.id = e.camper_id
    GROUP BY c.id, r.id
)
SELECT 
    c.nombre AS camper,
    r.nombre AS ruta,
    mpr.total_modulos,
    mac.modulos_aprobados
FROM ModulosAprobadosCamper mac
INNER JOIN ModulosPorRuta mpr ON mac.ruta_id = mpr.ruta_id
INNER JOIN campers c ON mac.camper_id = c.id
INNER JOIN rutas r ON mac.ruta_id = r.id
WHERE mac.modulos_aprobados = mpr.total_modulos
ORDER BY c.nombre;

-- 8. Mostrar rutas con más de 10 campers en bajo rendimiento
SELECT 
    r.nombre AS ruta,
    COUNT(DISTINCT e.camper_id) AS total_campers,
    COUNT(DISTINCT CASE WHEN e.nota_final < 60 THEN e.camper_id END) AS campers_bajo_rendimiento,
    ROUND((COUNT(DISTINCT CASE WHEN e.nota_final < 60 THEN e.camper_id END) * 100.0 / 
           COUNT(DISTINCT e.camper_id)), 2) AS porcentaje_bajo_rendimiento
FROM rutas r
INNER JOIN modulos m ON r.id = m.ruta_id
INNER JOIN evaluaciones e ON m.id = e.modulo_id
GROUP BY r.id, r.nombre
HAVING COUNT(DISTINCT CASE WHEN e.nota_final < 60 THEN e.camper_id END) > 10
ORDER BY campers_bajo_rendimiento DESC;

-- 9. Calcular el promedio de rendimiento por SGDB principal
SELECT 
    r.sgdb_principal AS base_datos,
    COUNT(DISTINCT e.camper_id) AS total_campers,
    ROUND(AVG(e.nota_final), 2) AS promedio_rendimiento,
    COUNT(DISTINCT CASE WHEN e.nota_final >= 60 THEN e.camper_id END) AS campers_aprobados,
    COUNT(DISTINCT CASE WHEN e.nota_final < 60 THEN e.camper_id END) AS campers_reprobados
FROM rutas r
INNER JOIN modulos m ON r.id = m.ruta_id
INNER JOIN evaluaciones e ON m.id = e.modulo_id
GROUP BY r.sgdb_principal
ORDER BY promedio_rendimiento DESC;

-- 10. Listar los módulos con al menos un 30% de campers reprobados
SELECT 
    m.nombre AS modulo,
    COUNT(*) AS total_evaluados,
    COUNT(CASE WHEN e.nota_final < 60 THEN 1 END) AS reprobados,
    ROUND((COUNT(CASE WHEN e.nota_final < 60 THEN 1 END) * 100.0 / COUNT(*)), 2) AS porcentaje_reprobados
FROM modulos m
INNER JOIN evaluaciones e ON m.id = e.modulo_id
GROUP BY m.id, m.nombre
HAVING (COUNT(CASE WHEN e.nota_final < 60 THEN 1 END) * 100.0 / COUNT(*)) >= 30
ORDER BY porcentaje_reprobados DESC;

-- 11. Mostrar el módulo más cursado por campers con riesgo alto
SELECT 
    m.nombre AS modulo,
    COUNT(DISTINCT e.camper_id) AS total_campers,
    COUNT(DISTINCT CASE WHEN c.nivel_riesgo = 'Alto' THEN e.camper_id END) AS campers_riesgo_alto,
    ROUND((COUNT(DISTINCT CASE WHEN c.nivel_riesgo = 'Alto' THEN e.camper_id END) * 100.0 / 
           COUNT(DISTINCT e.camper_id)), 2) AS porcentaje_riesgo_alto
FROM modulos m
INNER JOIN evaluaciones e ON m.id = e.modulo_id
INNER JOIN campers c ON e.camper_id = c.id
GROUP BY m.id, m.nombre
ORDER BY campers_riesgo_alto DESC
LIMIT 1;

-- 12. Consultar los trainers con más de 3 rutas asignadas
SELECT 
    t.nombre AS trainer,
    COUNT(DISTINCT a.ruta_id) AS total_rutas,
    GROUP_CONCAT(DISTINCT r.nombre SEPARATOR ', ') AS rutas
FROM trainers t
INNER JOIN asignaciones a ON t.id = a.trainer_id
INNER JOIN rutas r ON a.ruta_id = r.id
WHERE a.estado = 'Activo'
GROUP BY t.id, t.nombre
HAVING COUNT(DISTINCT a.ruta_id) > 3
ORDER BY total_rutas DESC;

-- 13. Listar los horarios más ocupados por áreas
SELECT 
    a.nombre AS area,
    h.dia_semana,
    TIME_FORMAT(h.hora_inicio, '%H:%i') AS hora_inicio,
    TIME_FORMAT(h.hora_fin, '%H:%i') AS hora_fin,
    COUNT(DISTINCT h.id) AS total_clases,
    COUNT(DISTINCT h.modulo_id) AS modulos_diferentes,
    COUNT(DISTINCT h.trainer_id) AS trainers_asignados
FROM areas a
INNER JOIN rutas r ON a.id = r.area_id
INNER JOIN asignaciones asig ON r.id = asig.ruta_id
INNER JOIN horarios_clases h ON asig.trainer_id = h.trainer_id
WHERE h.estado = 'Activo'
GROUP BY a.id, a.nombre, h.dia_semana, h.hora_inicio, h.hora_fin
ORDER BY total_clases DESC;

-- 14. Consultar las rutas con el mayor número de módulos
SELECT 
    r.nombre AS ruta,
    COUNT(DISTINCT m.id) AS total_modulos,
    GROUP_CONCAT(DISTINCT m.nombre SEPARATOR ', ') AS modulos,
    SUM(m.duracion_horas) AS horas_totales
FROM rutas r
INNER JOIN modulos m ON r.id = m.ruta_id
GROUP BY r.id, r.nombre
ORDER BY total_modulos DESC
LIMIT 5;

-- 15. Obtener los campers que han cambiado de estado más de una vez
WITH CambiosEstado AS (
    SELECT 
        c.id,
        c.nombre,
        COUNT(DISTINCT c.estado) AS total_estados,
        GROUP_CONCAT(DISTINCT c.estado ORDER BY c.fecha_registro SEPARATOR ' -> ') AS historial_estados
    FROM campers c
    GROUP BY c.id, c.nombre
    HAVING COUNT(DISTINCT c.estado) > 1
)
SELECT *
FROM CambiosEstado
ORDER BY total_estados DESC;

-- 16. Mostrar las evaluaciones donde la nota teórica sea mayor a la práctica
SELECT 
    c.nombre AS camper,
    m.nombre AS modulo,
    e.nota_teorica,
    e.nota_practica,
    e.nota_final,
    t.nombre AS trainer
FROM evaluaciones e
INNER JOIN campers c ON e.camper_id = c.id
INNER JOIN modulos m ON e.modulo_id = m.id
INNER JOIN trainers t ON e.trainer_id = t.id
WHERE e.nota_teorica > e.nota_practica
ORDER BY (e.nota_teorica - e.nota_practica) DESC;

-- 17. Listar los módulos donde la media de quizzes supera el 9
SELECT 
    m.nombre AS modulo,
    COUNT(*) AS total_evaluaciones,
    ROUND(AVG(e.nota_quiz), 2) AS promedio_quiz,
    MIN(e.nota_quiz) AS quiz_minimo,
    MAX(e.nota_quiz) AS quiz_maximo
FROM modulos m
INNER JOIN evaluaciones e ON m.id = e.modulo_id
GROUP BY m.id, m.nombre
HAVING AVG(e.nota_quiz) > 9
ORDER BY promedio_quiz DESC;

-- 18. Consultar la ruta con mayor tasa de graduación
SELECT 
    r.nombre AS ruta,
    COUNT(DISTINCT c.id) AS total_campers,
    COUNT(DISTINCT CASE WHEN c.estado = 'Graduado' THEN c.id END) AS campers_graduados,
    ROUND((COUNT(DISTINCT CASE WHEN c.estado = 'Graduado' THEN c.id END) * 100.0 / 
           COUNT(DISTINCT c.id)), 2) AS tasa_graduacion
FROM rutas r
INNER JOIN asignaciones a ON r.id = a.ruta_id
INNER JOIN campers c ON a.camper_id = c.id
GROUP BY r.id, r.nombre
ORDER BY tasa_graduacion DESC
LIMIT 1;

-- 19. Mostrar los módulos cursados por campers de nivel de riesgo medio o alto
SELECT 
    m.nombre AS modulo,
    COUNT(DISTINCT e.camper_id) AS total_campers,
    COUNT(DISTINCT CASE WHEN c.nivel_riesgo IN ('Medio', 'Alto') THEN e.camper_id END) AS campers_riesgo,
    ROUND((COUNT(DISTINCT CASE WHEN c.nivel_riesgo IN ('Medio', 'Alto') THEN e.camper_id END) * 100.0 / 
           COUNT(DISTINCT e.camper_id)), 2) AS porcentaje_riesgo
FROM modulos m
INNER JOIN evaluaciones e ON m.id = e.modulo_id
INNER JOIN campers c ON e.camper_id = c.id
GROUP BY m.id, m.nombre
HAVING COUNT(DISTINCT CASE WHEN c.nivel_riesgo IN ('Medio', 'Alto') THEN e.camper_id END) > 0
ORDER BY porcentaje_riesgo DESC;

-- 20. Obtener la diferencia entre capacidad y ocupación en cada área
SELECT 
    a.nombre AS area,
    a.capacidad_maxima,
    COUNT(DISTINCT asig.camper_id) AS ocupacion_actual,
    (a.capacidad_maxima - COUNT(DISTINCT asig.camper_id)) AS cupos_disponibles,
    ROUND((COUNT(DISTINCT asig.camper_id) * 100.0 / a.capacidad_maxima), 2) AS porcentaje_ocupacion,
    CASE 
        WHEN (a.capacidad_maxima - COUNT(DISTINCT asig.camper_id)) = 0 THEN 'Llena'
        WHEN (a.capacidad_maxima - COUNT(DISTINCT asig.camper_id)) < 5 THEN 'Casi llena'
        ELSE 'Disponible'
    END AS estado_ocupacion
FROM areas a
LEFT JOIN rutas r ON a.id = r.area_id
LEFT JOIN asignaciones asig ON r.id = asig.ruta_id AND asig.estado = 'Activo'
GROUP BY a.id, a.nombre, a.capacidad_maxima
ORDER BY cupos_disponibles;

🔁 JOINs Básicos

-- 1. Obtener los nombres completos de los campers junto con el nombre de la ruta a la que están inscritos
SELECT 
    c.nombre AS nombre_camper,
    c.apellidos AS apellidos_camper,
    r.nombre AS ruta,
    a.estado AS estado_asignacion
FROM campers c
INNER JOIN asignaciones a ON c.id = a.camper_id
INNER JOIN rutas r ON a.ruta_id = r.id
WHERE a.estado = 'Activo'
ORDER BY c.nombre;

-- 2. Mostrar los campers con sus evaluaciones por cada módulo
SELECT 
    c.nombre AS camper,
    m.nombre AS modulo,
    e.nota_teorica,
    e.nota_practica,
    e.nota_quiz,
    e.nota_final,
    e.fecha_evaluacion
FROM campers c
INNER JOIN evaluaciones e ON c.id = e.camper_id
INNER JOIN modulos m ON e.modulo_id = m.id
ORDER BY c.nombre, m.nombre;

-- 3. Listar todos los módulos que componen cada ruta de entrenamiento
SELECT 
    r.nombre AS ruta,
    m.nombre AS modulo,
    m.descripcion AS descripcion_modulo,
    m.duracion_horas,
    m.peso_teorico,
    m.peso_practico,
    m.peso_quiz
FROM rutas r
INNER JOIN modulos m ON r.id = m.ruta_id
ORDER BY r.nombre, m.nombre;

-- 4. Consultar las rutas con sus trainers asignados y las áreas
SELECT 
    r.nombre AS ruta,
    t.nombre AS trainer,
    a.nombre AS area,
    a.capacidad_maxima,
    a.horario_inicio,
    a.horario_fin
FROM rutas r
INNER JOIN asignaciones asig ON r.id = asig.ruta_id
INNER JOIN trainers t ON asig.trainer_id = t.id
INNER JOIN areas a ON r.area_id = a.id
WHERE asig.estado = 'Activo'
ORDER BY r.nombre, t.nombre;

-- 5. Mostrar los campers junto con el trainer responsable de su ruta actual
SELECT 
    c.nombre AS camper,
    c.estado AS estado_camper,
    r.nombre AS ruta,
    t.nombre AS trainer,
    t.email AS email_trainer,
    t.telefono AS telefono_trainer
FROM campers c
INNER JOIN asignaciones a ON c.id = a.camper_id
INNER JOIN rutas r ON a.ruta_id = r.id
INNER JOIN trainers t ON a.trainer_id = t.id
WHERE a.estado = 'Activo'
ORDER BY c.nombre;

-- 6. Obtener el listado de evaluaciones realizadas con nombre de camper, módulo y ruta
SELECT 
    c.nombre AS camper,
    m.nombre AS modulo,
    r.nombre AS ruta,
    e.nota_teorica,
    e.nota_practica,
    e.nota_quiz,
    e.nota_final,
    e.fecha_evaluacion
FROM evaluaciones e
INNER JOIN campers c ON e.camper_id = c.id
INNER JOIN modulos m ON e.modulo_id = m.id
INNER JOIN rutas r ON m.ruta_id = r.id
ORDER BY c.nombre, m.nombre;

-- 7. Listar los trainers y los horarios en que están asignados a las áreas
SELECT 
    t.nombre AS trainer,
    a.nombre AS area,
    h.dia_semana,
    TIME_FORMAT(h.hora_inicio, '%H:%i') AS hora_inicio,
    TIME_FORMAT(h.hora_fin, '%H:%i') AS hora_fin,
    s.nombre AS salon
FROM trainers t
INNER JOIN horarios_clases h ON t.id = h.trainer_id
INNER JOIN areas a ON t.area_id = a.id
INNER JOIN salones s ON h.salon_id = s.id
WHERE h.estado = 'Activo'
ORDER BY t.nombre, h.dia_semana, h.hora_inicio;

-- 8. Consultar todos los campers junto con su estado actual y el nivel de riesgo
SELECT 
    c.nombre AS camper,
    c.apellidos AS apellidos_camper,
    c.email AS email_camper,
    c.estado AS estado_actual,
    c.nivel_riesgo,
    c.fecha_registro
FROM campers c
ORDER BY c.nombre;

-- 9. Obtener todos los módulos de cada ruta junto con sus porcentajes
SELECT 
    r.nombre AS ruta,
    m.nombre AS modulo,
    m.duracion_horas,
    m.peso_teorico,
    m.peso_practico,
    m.peso_quiz,
    (m.peso_teorico + m.peso_practico + m.peso_quiz) AS total_porcentaje
FROM rutas r
INNER JOIN modulos m ON r.id = m.ruta_id
ORDER BY r.nombre, m.nombre;

-- 10. Mostrar los nombres de las áreas junto con los campers que están asistiendo
SELECT 
    a.nombre AS area,
    a.capacidad_maxima,
    COUNT(DISTINCT c.id) AS total_campers,
    GROUP_CONCAT(DISTINCT c.nombre ORDER BY c.nombre SEPARATOR ', ') AS lista_campers
FROM areas a
LEFT JOIN rutas r ON a.id = r.area_id
LEFT JOIN asignaciones asig ON r.id = asig.ruta_id AND asig.estado = 'Activo'
LEFT JOIN campers c ON asig.camper_id = c.id
GROUP BY a.id, a.nombre, a.capacidad_maxima
ORDER BY a.nombre;

🔀 JOINs con condiciones específicas

-- 1. Listar los campers que han aprobado todos los módulos de su ruta
WITH ModulosPorRuta AS (
    SELECT 
        r.id AS ruta_id,
        COUNT(DISTINCT m.id) AS total_modulos
    FROM rutas r
    INNER JOIN modulos m ON r.id = m.ruta_id
    GROUP BY r.id
),
ModulosAprobadosCamper AS (
    SELECT 
        c.id AS camper_id,
        r.id AS ruta_id,
        COUNT(DISTINCT CASE WHEN e.nota_final >= 60 THEN m.id END) AS modulos_aprobados
    FROM campers c
    INNER JOIN asignaciones a ON c.id = a.camper_id
    INNER JOIN rutas r ON a.ruta_id = r.id
    INNER JOIN modulos m ON r.id = m.ruta_id
    INNER JOIN evaluaciones e ON m.id = e.modulo_id AND c.id = e.camper_id
    GROUP BY c.id, r.id
)
SELECT 
    c.nombre AS camper,
    r.nombre AS ruta,
    mpr.total_modulos,
    mac.modulos_aprobados
FROM ModulosAprobadosCamper mac
INNER JOIN ModulosPorRuta mpr ON mac.ruta_id = mpr.ruta_id
INNER JOIN campers c ON mac.camper_id = c.id
INNER JOIN rutas r ON mac.ruta_id = r.id
WHERE mac.modulos_aprobados = mpr.total_modulos
ORDER BY c.nombre;

-- 2. Mostrar las rutas que tienen más de 10 campers inscritos actualmente
SELECT 
    r.nombre AS ruta,
    COUNT(DISTINCT a.camper_id) AS total_campers,
    GROUP_CONCAT(DISTINCT c.nombre ORDER BY c.nombre SEPARATOR ', ') AS lista_campers
FROM rutas r
INNER JOIN asignaciones a ON r.id = a.ruta_id
INNER JOIN campers c ON a.camper_id = c.id
WHERE a.estado = 'Activo'
GROUP BY r.id, r.nombre
HAVING COUNT(DISTINCT a.camper_id) > 10
ORDER BY total_campers DESC;

-- 3. Consultar las áreas que superan el 80% de su capacidad
SELECT 
    a.nombre AS area,
    a.capacidad_maxima,
    COUNT(DISTINCT asig.camper_id) AS ocupacion_actual,
    ROUND((COUNT(DISTINCT asig.camper_id) * 100.0 / a.capacidad_maxima), 2) AS porcentaje_ocupacion
FROM areas a
INNER JOIN rutas r ON a.id = r.area_id
INNER JOIN asignaciones asig ON r.id = asig.ruta_id
WHERE asig.estado = 'Activo'
GROUP BY a.id, a.nombre, a.capacidad_maxima
HAVING (COUNT(DISTINCT asig.camper_id) * 100.0 / a.capacidad_maxima) > 80
ORDER BY porcentaje_ocupacion DESC;

-- 4. Obtener los trainers que imparten más de una ruta diferente
SELECT 
    t.nombre AS trainer,
    COUNT(DISTINCT a.ruta_id) AS total_rutas,
    GROUP_CONCAT(DISTINCT r.nombre SEPARATOR ', ') AS rutas
FROM trainers t
INNER JOIN asignaciones a ON t.id = a.trainer_id
INNER JOIN rutas r ON a.ruta_id = r.id
WHERE a.estado = 'Activo'
GROUP BY t.id, t.nombre
HAVING COUNT(DISTINCT a.ruta_id) > 1
ORDER BY total_rutas DESC;

-- 5. Listar las evaluaciones donde la nota práctica es mayor que la nota teórica
SELECT 
    c.nombre AS camper,
    m.nombre AS modulo,
    e.nota_teorica,
    e.nota_practica,
    e.nota_final,
    t.nombre AS trainer
FROM evaluaciones e
INNER JOIN campers c ON e.camper_id = c.id
INNER JOIN modulos m ON e.modulo_id = m.id
INNER JOIN trainers t ON e.trainer_id = t.id
WHERE e.nota_practica > e.nota_teorica
ORDER BY (e.nota_practica - e.nota_teorica) DESC;

-- 6. Mostrar campers que están en rutas cuyo SGDB principal es MySQL
SELECT 
    c.nombre AS camper,
    c.email AS email_camper,
    r.nombre AS ruta,
    r.sgdb_principal AS base_datos
FROM campers c
INNER JOIN asignaciones a ON c.id = a.camper_id
INNER JOIN rutas r ON a.ruta_id = r.id
WHERE a.estado = 'Activo'
AND r.sgdb_principal = 'MySQL'
ORDER BY c.nombre;

-- 7. Obtener los nombres de los módulos donde los campers han tenido bajo rendimiento
SELECT 
    m.nombre AS modulo,
    COUNT(*) AS total_evaluaciones,
    COUNT(CASE WHEN e.nota_final < 60 THEN 1 END) AS evaluaciones_bajas,
    ROUND((COUNT(CASE WHEN e.nota_final < 60 THEN 1 END) * 100.0 / COUNT(*)), 2) AS porcentaje_bajo_rendimiento
FROM modulos m
INNER JOIN evaluaciones e ON m.id = e.modulo_id
GROUP BY m.id, m.nombre
HAVING COUNT(CASE WHEN e.nota_final < 60 THEN 1 END) > 0
ORDER BY porcentaje_bajo_rendimiento DESC;

-- 8. Consultar las rutas con más de 3 módulos asociados
SELECT 
    r.nombre AS ruta,
    COUNT(DISTINCT m.id) AS total_modulos,
    GROUP_CONCAT(DISTINCT m.nombre SEPARATOR ', ') AS modulos,
    SUM(m.duracion_horas) AS horas_totales
FROM rutas r
INNER JOIN modulos m ON r.id = m.ruta_id
GROUP BY r.id, r.nombre
HAVING COUNT(DISTINCT m.id) > 3
ORDER BY total_modulos DESC;

-- 9. Listar las inscripciones realizadas en los últimos 30 días
SELECT 
    c.nombre AS camper,
    r.nombre AS ruta,
    a.fecha_inicio AS fecha_inscripcion,
    t.nombre AS trainer
FROM asignaciones a
INNER JOIN campers c ON a.camper_id = c.id
INNER JOIN rutas r ON a.ruta_id = r.id
INNER JOIN trainers t ON a.trainer_id = t.id
WHERE a.fecha_inicio >= DATE_SUB(CURRENT_DATE, INTERVAL 30 DAY)
ORDER BY a.fecha_inicio DESC;

-- 10. Obtener los trainers que están asignados a rutas con campers en estado de "Alto Riesgo"
SELECT 
    t.nombre AS trainer,
    COUNT(DISTINCT c.id) AS total_campers_alto_riesgo,
    GROUP_CONCAT(DISTINCT c.nombre SEPARATOR ', ') AS campers,
    r.nombre AS ruta
FROM trainers t
INNER JOIN asignaciones a ON t.id = a.trainer_id
INNER JOIN rutas r ON a.ruta_id = r.id
INNER JOIN campers c ON a.camper_id = c.id
WHERE a.estado = 'Activo'
AND c.nivel_riesgo = 'Alto'
GROUP BY t.id, t.nombre, r.id, r.nombre
ORDER BY total_campers_alto_riesgo DESC;

🔎 JOINs con funciones de agregación

-- 1. Obtener el promedio de nota final por módulo
SELECT 
    m.nombre AS modulo,
    COUNT(*) AS total_evaluaciones,
    ROUND(AVG(e.nota_final), 2) AS promedio_nota,
    MIN(e.nota_final) AS nota_minima,
    MAX(e.nota_final) AS nota_maxima
FROM modulos m
INNER JOIN evaluaciones e ON m.id = e.modulo_id
GROUP BY m.id, m.nombre
ORDER BY promedio_nota DESC;

-- 2. Calcular la cantidad total de campers por ruta
SELECT 
    r.nombre AS ruta,
    COUNT(DISTINCT a.camper_id) AS total_campers,
    COUNT(DISTINCT CASE WHEN c.estado = 'Cursando' THEN a.camper_id END) AS campers_activos,
    COUNT(DISTINCT CASE WHEN c.estado = 'Graduado' THEN a.camper_id END) AS campers_graduados
FROM rutas r
LEFT JOIN asignaciones a ON r.id = a.ruta_id
LEFT JOIN campers c ON a.camper_id = c.id
GROUP BY r.id, r.nombre
ORDER BY total_campers DESC;

-- 3. Mostrar la cantidad de evaluaciones realizadas por cada trainer
SELECT 
    t.nombre AS trainer,
    COUNT(DISTINCT e.id) AS total_evaluaciones,
    COUNT(DISTINCT e.camper_id) AS campers_evaluados,
    COUNT(DISTINCT e.modulo_id) AS modulos_evaluados
FROM trainers t
INNER JOIN evaluaciones e ON t.id = e.trainer_id
GROUP BY t.id, t.nombre
ORDER BY total_evaluaciones DESC;

-- 4. Consultar el promedio general de rendimiento por cada área de entrenamiento
SELECT 
    a.nombre AS area,
    COUNT(DISTINCT e.camper_id) AS total_campers,
    ROUND(AVG(e.nota_final), 2) AS promedio_rendimiento,
    COUNT(DISTINCT CASE WHEN e.nota_final >= 60 THEN e.camper_id END) AS campers_aprobados,
    COUNT(DISTINCT CASE WHEN e.nota_final < 60 THEN e.camper_id END) AS campers_reprobados
FROM areas a
INNER JOIN rutas r ON a.id = r.area_id
INNER JOIN modulos m ON r.id = m.ruta_id
INNER JOIN evaluaciones e ON m.id = e.modulo_id
GROUP BY a.id, a.nombre
ORDER BY promedio_rendimiento DESC;

-- 5. Obtener la cantidad de módulos asociados a cada ruta de entrenamiento
SELECT 
    r.nombre AS ruta,
    COUNT(DISTINCT m.id) AS total_modulos,
    SUM(m.duracion_horas) AS horas_totales,
    GROUP_CONCAT(DISTINCT m.nombre SEPARATOR ', ') AS lista_modulos
FROM rutas r
LEFT JOIN modulos m ON r.id = m.ruta_id
GROUP BY r.id, r.nombre
ORDER BY total_modulos DESC;

-- 6. Mostrar el promedio de nota final de los campers en estado "Cursando"
SELECT 
    c.estado,
    COUNT(DISTINCT e.camper_id) AS total_campers,
    ROUND(AVG(e.nota_final), 2) AS promedio_nota,
    COUNT(DISTINCT e.modulo_id) AS modulos_evaluados
FROM campers c
INNER JOIN evaluaciones e ON c.id = e.camper_id
WHERE c.estado = 'Cursando'
GROUP BY c.estado;

-- 7. Listar el número de campers evaluados en cada módulo
SELECT 
    m.nombre AS modulo,
    COUNT(DISTINCT e.camper_id) AS total_campers,
    COUNT(*) AS total_evaluaciones,
    ROUND(AVG(e.nota_final), 2) AS promedio_nota
FROM modulos m
INNER JOIN evaluaciones e ON m.id = e.modulo_id
GROUP BY m.id, m.nombre
ORDER BY total_campers DESC;

-- 8. Consultar el porcentaje de ocupación actual por cada área de entrenamiento
SELECT 
    a.nombre AS area,
    a.capacidad_maxima,
    COUNT(DISTINCT asig.camper_id) AS ocupacion_actual,
    ROUND((COUNT(DISTINCT asig.camper_id) * 100.0 / a.capacidad_maxima), 2) AS porcentaje_ocupacion,
    (a.capacidad_maxima - COUNT(DISTINCT asig.camper_id)) AS cupos_disponibles
FROM areas a
LEFT JOIN rutas r ON a.id = r.area_id
LEFT JOIN asignaciones asig ON r.id = asig.ruta_id AND asig.estado = 'Activo'
GROUP BY a.id, a.nombre, a.capacidad_maxima
ORDER BY porcentaje_ocupacion DESC;

-- 9. Mostrar cuántos trainers tiene asignados cada área
SELECT 
    a.nombre AS area,
    COUNT(DISTINCT t.id) AS total_trainers,
    GROUP_CONCAT(DISTINCT t.nombre SEPARATOR ', ') AS lista_trainers
FROM areas a
INNER JOIN trainers t ON a.id = t.area_id
GROUP BY a.id, a.nombre
ORDER BY total_trainers DESC;

-- 10. Listar las rutas que tienen más campers en riesgo alto
SELECT 
    r.nombre AS ruta,
    COUNT(DISTINCT c.id) AS total_campers,
    COUNT(DISTINCT CASE WHEN c.nivel_riesgo = 'Alto' THEN c.id END) AS campers_riesgo_alto,
    ROUND((COUNT(DISTINCT CASE WHEN c.nivel_riesgo = 'Alto' THEN c.id END) * 100.0 / 
           COUNT(DISTINCT c.id)), 2) AS porcentaje_riesgo_alto
FROM rutas r
INNER JOIN asignaciones a ON r.id = a.ruta_id
INNER JOIN campers c ON a.camper_id = c.id
WHERE a.estado = 'Activo'
GROUP BY r.id, r.nombre
HAVING COUNT(DISTINCT CASE WHEN c.nivel_riesgo = 'Alto' THEN c.id END) > 0
ORDER BY campers_riesgo_alto DESC;

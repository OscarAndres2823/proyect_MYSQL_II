--funciones

🧮 FUNCIONES SQL (20)

-- 1. Calcular el promedio ponderado de evaluaciones de un camper
CREATE FUNCTION fn_calcular_promedio_ponderado(p_camper_id INT)
RETURNS DECIMAL(5,2)
DETERMINISTIC
BEGIN
    DECLARE v_promedio DECIMAL(5,2);
    
    -- Validar que el camper exista
    IF NOT EXISTS (SELECT 1 FROM campers WHERE id = p_camper_id) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El camper no existe';
    END IF;
    
    -- Calcular promedio ponderado usando una tabla temporal
    CREATE TEMPORARY TABLE IF NOT EXISTS temp_promedio AS
    SELECT ROUND(
        SUM(
            (e.nota_teorica * m.peso_teorico / 100) +
            (e.nota_practica * m.peso_practico / 100) +
            (e.nota_quiz * m.peso_quiz / 100)
        ) / NULLIF(COUNT(DISTINCT e.id), 0),
        2
    ) as promedio
    FROM evaluaciones e
    INNER JOIN modulos m ON e.modulo_id = m.id
    WHERE e.camper_id = p_camper_id;
    
    -- Obtener el resultado
    SELECT COALESCE(promedio, 0)
    INTO v_promedio
    FROM temp_promedio;
    
    -- Limpiar la tabla temporal
    DROP TEMPORARY TABLE IF EXISTS temp_promedio;
    
    RETURN v_promedio;
END //

-- 2. Determinar si un camper aprueba o no un módulo específico
CREATE FUNCTION fn_aprobacion_modulo(p_camper_id INT, p_modulo_id INT)
RETURNS BOOLEAN
DETERMINISTIC
BEGIN
    DECLARE v_nota_final DECIMAL(5,2);
    
    -- Validar que el camper y el módulo existan
    IF NOT EXISTS (SELECT 1 FROM campers WHERE id = p_camper_id) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El camper no existe';
    END IF;
    
    IF NOT EXISTS (SELECT 1 FROM modulos WHERE id = p_modulo_id) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El módulo no existe';
    END IF;
    
    -- Calcular nota final usando una tabla temporal
    CREATE TEMPORARY TABLE IF NOT EXISTS temp_nota AS
    SELECT ROUND(AVG(nota_final), 2) as nota
    FROM evaluaciones
    WHERE camper_id = p_camper_id
    AND modulo_id = p_modulo_id;
    
    -- Obtener el resultado
    SELECT COALESCE(nota, 0)
    INTO v_nota_final
    FROM temp_nota;
    
    -- Limpiar la tabla temporal
    DROP TEMPORARY TABLE IF EXISTS temp_nota;
    
    RETURN v_nota_final >= 60;
END //

-- 3. Evaluar el nivel de riesgo de un camper según su rendimiento promedio
CREATE FUNCTION fn_evaluar_nivel_riesgo(p_camper_id INT)
RETURNS ENUM('Bajo', 'Medio', 'Alto')
DETERMINISTIC
BEGIN
    DECLARE v_promedio DECIMAL(5,2) DEFAULT 0;
    
    -- Validar que el camper exista
    IF NOT EXISTS (SELECT 1 FROM campers WHERE id = p_camper_id) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El camper no existe';
    END IF;
    
    -- Obtener promedio de notas
    SELECT COALESCE(ROUND(AVG(nota_final), 2), 0)
    INTO v_promedio
    FROM evaluaciones
    WHERE camper_id = p_camper_id;
    
    -- Determinar nivel de riesgo
    RETURN CASE
        WHEN v_promedio >= 80 THEN 'Bajo'
        WHEN v_promedio >= 60 THEN 'Medio'
        ELSE 'Alto'
    END;
END //

-- 4. Obtener el total de campers asignados a una ruta específica
CREATE FUNCTION fn_total_campers_ruta(p_ruta_id INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE v_total INT DEFAULT 0;
    
    -- Validar que la ruta exista
    IF NOT EXISTS (SELECT 1 FROM rutas WHERE id = p_ruta_id) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'La ruta no existe';
    END IF;
    
    -- Contar campers asignados
    SELECT COALESCE(COUNT(DISTINCT camper_id), 0)
    INTO v_total
    FROM asignaciones
    WHERE ruta_id = p_ruta_id
    AND estado = 'Activa';
    
    RETURN v_total;
END //

-- 5. Consultar la cantidad de módulos que ha aprobado un camper
CREATE FUNCTION fn_modulos_aprobados(p_camper_id INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE v_total INT DEFAULT 0;
    
    -- Validar que el camper exista
    IF NOT EXISTS (SELECT 1 FROM campers WHERE id = p_camper_id) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El camper no existe';
    END IF;
    
    -- Contar módulos aprobados
    SELECT COALESCE(COUNT(DISTINCT modulo_id), 0)
    INTO v_total
    FROM evaluaciones
    WHERE camper_id = p_camper_id
    AND nota_final >= 60;
    
    RETURN v_total;
END //

-- 6. Validar si hay cupos disponibles en una determinada área
CREATE FUNCTION fn_cupos_disponibles_area(p_area_id INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE v_cupos INT DEFAULT 0;
    
    -- Validar que el área exista
    IF NOT EXISTS (SELECT 1 FROM areas WHERE id = p_area_id) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El área no existe';
    END IF;
    
    -- Calcular cupos disponibles
    SELECT COALESCE(a.capacidad_maxima - COUNT(DISTINCT asig.camper_id), 0)
    INTO v_cupos
    FROM areas a
    LEFT JOIN rutas r ON a.id = r.area_id
    LEFT JOIN asignaciones asig ON r.id = asig.ruta_id AND asig.estado = 'Activa'
    WHERE a.id = p_area_id
    GROUP BY a.id, a.capacidad_maxima;
    
    RETURN v_cupos;
END //

-- 7. Calcular el porcentaje de ocupación de un área de entrenamiento
CREATE FUNCTION fn_porcentaje_ocupacion_area(p_area_id INT)
RETURNS DECIMAL(5,2)
DETERMINISTIC
BEGIN
    DECLARE v_porcentaje DECIMAL(5,2) DEFAULT 0;
    
    -- Validar que el área exista
    IF NOT EXISTS (SELECT 1 FROM areas WHERE id = p_area_id) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El área no existe';
    END IF;
    
    -- Calcular porcentaje de ocupación
    SELECT COALESCE(ROUND(
        (COUNT(DISTINCT asig.camper_id) * 100.0) / NULLIF(a.capacidad_maxima, 0),
        2
    ), 0)
    INTO v_porcentaje
    FROM areas a
    LEFT JOIN rutas r ON a.id = r.area_id
    LEFT JOIN asignaciones asig ON r.id = asig.ruta_id AND asig.estado = 'Activa'
    WHERE a.id = p_area_id
    GROUP BY a.id, a.capacidad_maxima;
    
    RETURN v_porcentaje;
END //

-- 8. Determinar la nota más alta obtenida en un módulo
CREATE FUNCTION fn_nota_maxima_modulo(p_modulo_id INT)
RETURNS DECIMAL(5,2)
DETERMINISTIC
BEGIN
    DECLARE v_nota_maxima DECIMAL(5,2) DEFAULT 0;
    
    -- Validar que el módulo exista
    IF NOT EXISTS (SELECT 1 FROM modulos WHERE id = p_modulo_id) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El módulo no existe';
    END IF;
    
    -- Obtener nota máxima
    SELECT COALESCE(MAX(nota_final), 0)
    INTO v_nota_maxima
    FROM evaluaciones
    WHERE modulo_id = p_modulo_id;
    
    RETURN v_nota_maxima;
END //

-- 9. Calcular la tasa de aprobación de una ruta
CREATE FUNCTION fn_tasa_aprobacion_ruta(p_ruta_id INT)
RETURNS DECIMAL(5,2)
DETERMINISTIC
BEGIN
    DECLARE v_tasa DECIMAL(5,2) DEFAULT 0;
    
    -- Validar que la ruta exista
    IF NOT EXISTS (SELECT 1 FROM rutas WHERE id = p_ruta_id) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'La ruta no existe';
    END IF;
    
    -- Calcular tasa de aprobación
    SELECT COALESCE(ROUND(
        (COUNT(DISTINCT CASE WHEN e.nota_final >= 60 THEN e.camper_id END) * 100.0) /
        NULLIF(COUNT(DISTINCT e.camper_id), 0),
        2
    ), 0)
    INTO v_tasa
    FROM modulos m
    INNER JOIN evaluaciones e ON m.id = e.modulo_id
    WHERE m.ruta_id = p_ruta_id;
    
    RETURN v_tasa;
END //

-- 10. Verificar si un trainer tiene horario disponible
CREATE FUNCTION fn_trainer_horario_disponible(p_trainer_id INT, p_hora_inicio TIME, p_hora_fin TIME)
RETURNS BOOLEAN
DETERMINISTIC
BEGIN
    DECLARE v_conflicto INT DEFAULT 0;
    
    -- Validar que el trainer exista
    IF NOT EXISTS (SELECT 1 FROM trainers WHERE id = p_trainer_id) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El trainer no existe';
    END IF;
    
    -- Verificar conflictos de horario
    SELECT COALESCE(COUNT(*), 0)
    INTO v_conflicto
    FROM horarios_clases
    WHERE trainer_id = p_trainer_id
    AND estado = 'Activo'
    AND (
        (p_hora_inicio BETWEEN hora_inicio AND hora_fin)
        OR (p_hora_fin BETWEEN hora_inicio AND hora_fin)
    );
    
    RETURN v_conflicto = 0;
END //

-- 11. Obtener el promedio de notas por ruta
CREATE FUNCTION fn_promedio_notas_ruta(p_ruta_id INT)
RETURNS DECIMAL(5,2)
DETERMINISTIC
BEGIN
    DECLARE v_promedio DECIMAL(5,2) DEFAULT 0;
    
    -- Validar que la ruta exista
    IF NOT EXISTS (SELECT 1 FROM rutas WHERE id = p_ruta_id) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'La ruta no existe';
    END IF;
    
    -- Calcular promedio de notas
    SELECT COALESCE(ROUND(AVG(e.nota_final), 2), 0)
    INTO v_promedio
    FROM modulos m
    INNER JOIN evaluaciones e ON m.id = e.modulo_id
    WHERE m.ruta_id = p_ruta_id;
    
    RETURN v_promedio;
END //

-- 12. Calcular cuántas rutas tiene asignadas un trainer
CREATE FUNCTION fn_rutas_asignadas_trainer(p_trainer_id INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE v_total INT DEFAULT 0;
    
    -- Validar que el trainer exista
    IF NOT EXISTS (SELECT 1 FROM trainers WHERE id = p_trainer_id) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El trainer no existe';
    END IF;
    
    -- Contar rutas asignadas
    SELECT COALESCE(COUNT(DISTINCT ruta_id), 0)
    INTO v_total
    FROM asignaciones
    WHERE trainer_id = p_trainer_id
    AND estado = 'Activa';
    
    RETURN v_total;
END //

-- 13. Verificar si un camper puede ser graduado
CREATE FUNCTION fn_puede_graduarse(p_camper_id INT)
RETURNS BOOLEAN
DETERMINISTIC
BEGIN
    DECLARE v_total_modulos INT DEFAULT 0;
    DECLARE v_modulos_aprobados INT DEFAULT 0;
    
    -- Validar que el camper exista
    IF NOT EXISTS (SELECT 1 FROM campers WHERE id = p_camper_id) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El camper no existe';
    END IF;
    
    -- Obtener total de módulos
    SELECT COALESCE(COUNT(DISTINCT m.id), 0)
    INTO v_total_modulos
    FROM asignaciones a
    INNER JOIN rutas r ON a.ruta_id = r.id
    INNER JOIN modulos m ON r.id = m.ruta_id
    WHERE a.camper_id = p_camper_id
    AND a.estado = 'Activa';
    
    -- Obtener módulos aprobados
    SELECT COALESCE(COUNT(DISTINCT e.modulo_id), 0)
    INTO v_modulos_aprobados
    FROM evaluaciones e
    WHERE e.camper_id = p_camper_id
    AND e.nota_final >= 60;
    
    RETURN v_modulos_aprobados = v_total_modulos;
END //

-- 14. Obtener el estado actual de un camper en función de sus evaluaciones
CREATE FUNCTION fn_estado_camper(p_camper_id INT)
RETURNS ENUM('Inscrito', 'Cursando', 'Graduado', 'Expulsado', 'Retirado', 'Aprobado', 'En proceso')
DETERMINISTIC
BEGIN
    DECLARE v_promedio DECIMAL(5,2) DEFAULT 0;
    
    -- Validar que el camper exista
    IF NOT EXISTS (SELECT 1 FROM campers WHERE id = p_camper_id) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El camper no existe';
    END IF;
    
    -- Obtener promedio de notas
    SELECT COALESCE(ROUND(AVG(nota_final), 2), 0)
    INTO v_promedio
    FROM evaluaciones
    WHERE camper_id = p_camper_id;
    
    -- Determinar estado
    RETURN CASE
        WHEN v_promedio >= 80 THEN 'Aprobado'
        WHEN v_promedio >= 60 THEN 'Cursando'
        WHEN v_promedio < 60 THEN 'En proceso'
        ELSE 'Inscrito'
    END;
END //

-- 15. Calcular la carga horaria semanal de un trainer
CREATE FUNCTION fn_carga_horaria_trainer(p_trainer_id INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE v_horas INT DEFAULT 0;
    
    -- Validar que el trainer exista
    IF NOT EXISTS (SELECT 1 FROM trainers WHERE id = p_trainer_id) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El trainer no existe';
    END IF;
    
    -- Calcular horas semanales
    SELECT COALESCE(SUM(
        TIME_TO_SEC(TIMEDIFF(hora_fin, hora_inicio)) / 3600
    ), 0)
    INTO v_horas
    FROM horarios_clases
    WHERE trainer_id = p_trainer_id
    AND estado = 'Activo';
    
    RETURN v_horas;
END //

-- 16. Determinar si una ruta tiene módulos pendientes por evaluación
CREATE FUNCTION fn_modulos_pendientes_ruta(p_ruta_id INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE v_pendientes INT DEFAULT 0;
    
    -- Validar que la ruta exista
    IF NOT EXISTS (SELECT 1 FROM rutas WHERE id = p_ruta_id) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'La ruta no existe';
    END IF;
    
    -- Contar módulos pendientes
    SELECT COALESCE(COUNT(DISTINCT m.id), 0)
    INTO v_pendientes
    FROM modulos m
    LEFT JOIN evaluaciones e ON m.id = e.modulo_id
    WHERE m.ruta_id = p_ruta_id
    AND e.id IS NULL;
    
    RETURN v_pendientes;
END //

-- 17. Calcular el promedio general del programa
CREATE FUNCTION fn_promedio_general_programa()
RETURNS DECIMAL(5,2)
DETERMINISTIC
BEGIN
    DECLARE v_promedio DECIMAL(5,2) DEFAULT 0;
    
    -- Calcular promedio general
    SELECT COALESCE(ROUND(AVG(nota_final), 2), 0)
    INTO v_promedio
    FROM evaluaciones;
    
    RETURN v_promedio;
END //

-- 18. Verificar si un horario choca con otros entrenadores en el área
CREATE FUNCTION fn_horario_choca_area(p_area_id INT, p_hora_inicio TIME, p_hora_fin TIME)
RETURNS BOOLEAN
DETERMINISTIC
BEGIN
    DECLARE v_conflicto INT DEFAULT 0;
    
    -- Validar que el área exista
    IF NOT EXISTS (SELECT 1 FROM areas WHERE id = p_area_id) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El área no existe';
    END IF;
    
    -- Verificar conflictos
    SELECT COALESCE(COUNT(*), 0)
    INTO v_conflicto
    FROM horarios_clases
    WHERE area_id = p_area_id
    AND estado = 'Activo'
    AND (
        (p_hora_inicio BETWEEN hora_inicio AND hora_fin)
        OR (p_hora_fin BETWEEN hora_inicio AND hora_fin)
    );
    
    RETURN v_conflicto > 0;
END //

-- 19. Calcular cuántos campers están en riesgo en una ruta específica
CREATE FUNCTION fn_campers_riesgo_ruta(p_ruta_id INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE v_total INT DEFAULT 0;
    
    -- Validar que la ruta exista
    IF NOT EXISTS (SELECT 1 FROM rutas WHERE id = p_ruta_id) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'La ruta no existe';
    END IF;
    
    -- Contar campers en riesgo
    SELECT COALESCE(COUNT(DISTINCT c.id), 0)
    INTO v_total
    FROM campers c
    INNER JOIN asignaciones a ON c.id = a.camper_id
    INNER JOIN evaluaciones e ON c.id = e.camper_id
    WHERE a.ruta_id = p_ruta_id
    AND a.estado = 'Activa'
    AND e.nota_final < 60;
    
    RETURN v_total;
END //

-- 20. Consultar el número de módulos evaluados por un camper
CREATE FUNCTION fn_modulos_evaluados_camper(p_camper_id INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE v_total INT DEFAULT 0;
    
    -- Validar que el camper exista
    IF NOT EXISTS (SELECT 1 FROM campers WHERE id = p_camper_id) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El camper no existe';
    END IF;
    
    -- Contar módulos evaluados
    SELECT COALESCE(COUNT(DISTINCT modulo_id), 0)
    INTO v_total
    FROM evaluaciones
    WHERE camper_id = p_camper_id;
    
    RETURN v_total;
END //
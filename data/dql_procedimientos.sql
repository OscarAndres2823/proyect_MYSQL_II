--procedimientos almacenados

⚙️ PROCEDIMIENTOS ALMACENADOS (20)

-- 1. Registrar un nuevo camper con toda su información personal y estado inicial
CREATE PROCEDURE sp_registrar_camper(
    IN nombre VARCHAR(100),
    IN apellidos VARCHAR(100),
    IN email VARCHAR(100),
    IN edad INT,
    IN telefono VARCHAR(20),
    IN acudiente_nombre VARCHAR(100),
    IN acudiente_telefono VARCHAR(20),
    IN nivel_riesgo ENUM('Bajo', 'Medio', 'Alto'),
    OUT id INT
)
BEGIN
    -- Validar que el email no exista
    IF EXISTS (SELECT 1 FROM campers WHERE email = email) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El email ya está registrado';
    END IF;
    
    -- Validar que la edad sea válida
    IF edad IS NULL OR edad < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'La edad debe ser un número positivo';
    END IF;
    
    -- Insertar el nuevo camper
    INSERT INTO campers (
        nombre, apellidos, email, edad, telefono, 
        acudiente_nombre, acudiente_telefono, 
        nivel_riesgo, estado, fecha_registro
    ) VALUES (
        nombre, apellidos, email, edad, telefono,
        acudiente_nombre, acudiente_telefono,
        nivel_riesgo, 'En proceso', NOW()
    );
    
    -- Asignar el ID del camper recién insertado a la variable de salida
    SET id = LAST_INSERT_ID();
END //

-- 2. Actualizar el estado de un camper luego de completar el proceso de ingreso
CREATE PROCEDURE sp_actualizar_estado_camper(
    IN p_camper_id INT,
    IN p_nuevo_estado ENUM('Inscrito', 'Cursando', 'Graduado', 'Expulsado', 'Retirado', 'Aprobado', 'En proceso')
)
BEGIN
    DECLARE v_estado_anterior ENUM('Inscrito', 'Cursando', 'Graduado', 'Expulsado', 'Retirado', 'Aprobado', 'En proceso');
    
    -- Obtener el estado anterior
    SELECT estado INTO v_estado_anterior
    FROM campers
    WHERE id = p_camper_id;
    
    -- Validar que el camper exista
    IF v_estado_anterior IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El camper no existe';
    END IF;
    
    -- Validar que el nuevo estado sea diferente
    IF v_estado_anterior = p_nuevo_estado THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El nuevo estado debe ser diferente al actual';
    END IF;
    
    -- Actualizar el estado
    UPDATE campers 
    SET estado = p_nuevo_estado
    WHERE id = p_camper_id;
    
    -- Registrar el cambio en el log
    INSERT INTO log_cambios_estado (
        camper_id, estado_anterior, estado_nuevo, fecha_cambio
    ) VALUES (
        p_camper_id, v_estado_anterior, p_nuevo_estado, NOW()
    );
END //

-- 3. Procesar la inscripción de un camper a una ruta específica
CREATE PROCEDURE sp_inscribir_camper_ruta(
    IN p_camper_id INT,
    IN p_ruta_id INT,
    IN p_trainer_id INT,
    IN p_fecha_inicio DATE,
    OUT p_asignacion_id INT
)
BEGIN
    DECLARE v_area_id INT;
    DECLARE v_capacidad_disponible INT;
    DECLARE v_estado_camper ENUM('Inscrito', 'Cursando', 'Graduado', 'Expulsado', 'Retirado', 'Aprobado', 'En proceso');
    
    -- Validar que el camper exista y esté en estado válido
    SELECT estado INTO v_estado_camper
    FROM campers
    WHERE id = p_camper_id;
    
    IF v_estado_camper IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El camper no existe';
    END IF;
    
    IF v_estado_camper NOT IN ('Inscrito', 'En proceso') THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El camper no está en estado para ser inscrito';
    END IF;
    
    -- Validar que la ruta exista
    IF NOT EXISTS (SELECT 1 FROM rutas WHERE id = p_ruta_id) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'La ruta no existe';
    END IF;
    
    -- Validar que el trainer exista
    IF NOT EXISTS (SELECT 1 FROM trainers WHERE id = p_trainer_id) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El trainer no existe';
    END IF;
    
    -- Obtener el área de la ruta
    SELECT area_id INTO v_area_id
    FROM rutas
    WHERE id = p_ruta_id;
    
    -- Verificar disponibilidad en el área
    SELECT (a.capacidad_maxima - COUNT(DISTINCT asig.camper_id))
    INTO v_capacidad_disponible
    FROM areas a
    LEFT JOIN rutas r ON a.id = r.area_id
    LEFT JOIN asignaciones asig ON r.id = asig.ruta_id AND asig.estado = 'Activa'
    WHERE a.id = v_area_id
    GROUP BY a.id, a.capacidad_maxima;
    
    IF v_capacidad_disponible > 0 THEN
        -- Verificar que el camper no tenga una asignación activa
        IF EXISTS (
            SELECT 1 FROM asignaciones 
            WHERE camper_id = p_camper_id 
            AND estado = 'Activa'
        ) THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'El camper ya tiene una asignación activa';
        END IF;
        
        -- Registrar la asignación
        INSERT INTO asignaciones (
            camper_id, ruta_id, trainer_id, fecha_inicio, estado
        ) VALUES (
            p_camper_id, p_ruta_id, p_trainer_id, p_fecha_inicio, 'Activa'
        );
        
        SET p_asignacion_id = LAST_INSERT_ID();
        
        -- Actualizar estado del camper
        UPDATE campers 
        SET estado = 'Cursando'
        WHERE id = p_camper_id;
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'No hay cupos disponibles en el área';
    END IF;
END //

-- 4. Registrar una evaluación completa para un camper
CREATE PROCEDURE sp_registrar_evaluacion(
    IN p_camper_id INT,
    IN p_modulo_id INT,
    IN p_trainer_id INT,
    IN p_nota_teorica DECIMAL(5,2),
    IN p_nota_practica DECIMAL(5,2),
    IN p_nota_quiz DECIMAL(5,2),
    OUT p_evaluacion_id INT
)
BEGIN
    DECLARE v_nota_final DECIMAL(5,2);
    DECLARE v_peso_teorico DECIMAL(5,2);
    DECLARE v_peso_practico DECIMAL(5,2);
    DECLARE v_peso_quiz DECIMAL(5,2);
    
    -- Validar que el camper exista y esté en estado válido
    IF NOT EXISTS (
        SELECT 1 FROM campers 
        WHERE id = p_camper_id 
        AND estado IN ('Cursando', 'Aprobado')
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El camper no está en estado para ser evaluado';
    END IF;
    
    -- Validar que el módulo exista
    IF NOT EXISTS (SELECT 1 FROM modulos WHERE id = p_modulo_id) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El módulo no existe';
    END IF;
    
    -- Validar que el trainer exista
    IF NOT EXISTS (SELECT 1 FROM trainers WHERE id = p_trainer_id) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El trainer no existe';
    END IF;
    
    -- Validar que las notas estén en el rango correcto
    IF p_nota_teorica < 0 OR p_nota_teorica > 100 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'La nota teórica debe estar entre 0 y 100';
    END IF;
    
    IF p_nota_practica < 0 OR p_nota_practica > 100 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'La nota práctica debe estar entre 0 y 100';
    END IF;
    
    IF p_nota_quiz < 0 OR p_nota_quiz > 100 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'La nota del quiz debe estar entre 0 y 100';
    END IF;
    
    -- Obtener los pesos del módulo
    SELECT peso_teorico, peso_practico, peso_quiz
    INTO v_peso_teorico, v_peso_practico, v_peso_quiz
    FROM modulos
    WHERE id = p_modulo_id;
    
    -- Calcular nota final
    SET v_nota_final = ROUND(
        (p_nota_teorica * v_peso_teorico / 100) +
        (p_nota_practica * v_peso_practico / 100) +
        (p_nota_quiz * v_peso_quiz / 100),
        2
    );
    
    -- Registrar la evaluación
    INSERT INTO evaluaciones (
        camper_id, modulo_id, trainer_id, nota_teorica,
        nota_practica, nota_quiz, nota_final, fecha_evaluacion
    ) VALUES (
        p_camper_id, p_modulo_id, p_trainer_id, p_nota_teorica,
        p_nota_practica, p_nota_quiz, v_nota_final, NOW()
    );
    
    SET p_evaluacion_id = LAST_INSERT_ID();
    
    -- Actualizar estado del camper si la nota es aprobatoria
    IF v_nota_final >= 60 THEN
        UPDATE campers
        SET estado = 'Aprobado'
        WHERE id = p_camper_id;
    END IF;
END //

-- 5. Calcular y registrar automáticamente la nota final de un módulo
CREATE PROCEDURE sp_calcular_nota_final_modulo(
    IN p_camper_id INT,
    IN p_modulo_id INT
)
BEGIN
    DECLARE v_nota_final DECIMAL(5,2);
    DECLARE v_total_evaluaciones INT;
    
    -- Validar que el camper exista
    IF NOT EXISTS (SELECT 1 FROM campers WHERE id = p_camper_id) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El camper no existe';
    END IF;
    
    -- Validar que el módulo exista
    IF NOT EXISTS (SELECT 1 FROM modulos WHERE id = p_modulo_id) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El módulo no existe';
    END IF;
    
    -- Obtener el total de evaluaciones
    SELECT COUNT(*)
    INTO v_total_evaluaciones
    FROM evaluaciones
    WHERE camper_id = p_camper_id
    AND modulo_id = p_modulo_id;
    
    IF v_total_evaluaciones = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'No hay evaluaciones registradas para este módulo';
    END IF;
    
    -- Calcular promedio de evaluaciones
    SELECT ROUND(AVG(nota_final), 2)
    INTO v_nota_final
    FROM evaluaciones
    WHERE camper_id = p_camper_id
    AND modulo_id = p_modulo_id;
    
    -- Actualizar la última evaluación con la nota final
    UPDATE evaluaciones
    SET nota_final = v_nota_final
    WHERE id = (
        SELECT id FROM (
            SELECT MAX(id) as id
            FROM evaluaciones
            WHERE camper_id = p_camper_id
            AND modulo_id = p_modulo_id
        ) as temp
    );
    
    -- Actualizar estado del camper si la nota final es aprobatoria
    IF v_nota_final >= 60 THEN
        UPDATE campers
        SET estado = 'Aprobado'
        WHERE id = p_camper_id;
    END IF;
END //

-- 6. Asignar campers aprobados a una ruta de acuerdo con la disponibilidad del área
CREATE PROCEDURE sp_asignar_campers_aprobados(
    IN p_ruta_id INT,
    IN p_trainer_id INT
)
BEGIN
    DECLARE v_area_id INT;
    DECLARE v_capacidad_disponible INT;
    
    -- Obtener el área de la ruta
    SELECT area_id INTO v_area_id
    FROM rutas
    WHERE id = p_ruta_id;
    
    -- Verificar disponibilidad en el área
    SELECT (a.capacidad_maxima - COUNT(DISTINCT asig.camper_id))
    INTO v_capacidad_disponible
    FROM areas a
    LEFT JOIN rutas r ON a.id = r.area_id
    LEFT JOIN asignaciones asig ON r.id = asig.ruta_id AND asig.estado = 'Activo'
    WHERE a.id = v_area_id
    GROUP BY a.id, a.capacidad_maxima;
    
    -- Asignar campers aprobados
    INSERT INTO asignaciones (camper_id, ruta_id, trainer_id, fecha_inicio, estado)
    SELECT 
        c.id,
        p_ruta_id,
        p_trainer_id,
        NOW(),
        'Activo'
    FROM campers c
    WHERE c.estado = 'Aprobado'
    AND c.id NOT IN (
        SELECT camper_id 
        FROM asignaciones 
        WHERE estado = 'Activo'
    )
    LIMIT v_capacidad_disponible;
END //

-- 7. Asignar un trainer a una ruta y área específica, validando el horario
CREATE PROCEDURE sp_asignar_trainer_ruta(
    IN p_trainer_id INT,
    IN p_ruta_id INT,
    IN p_area_id INT,
    IN p_horario_inicio TIME,
    IN p_horario_fin TIME
)
BEGIN
    DECLARE v_conflicto INT;
    
    -- Verificar conflictos de horario
    SELECT COUNT(*)
    INTO v_conflicto
    FROM horarios_clases h
    WHERE h.trainer_id = p_trainer_id
    AND h.estado = 'Activo'
    AND (
        (p_horario_inicio BETWEEN h.hora_inicio AND h.hora_fin)
        OR (p_horario_fin BETWEEN h.hora_inicio AND h.hora_fin)
    );
    
    IF v_conflicto = 0 THEN
        -- Registrar el horario
        INSERT INTO horarios_clases (
            trainer_id, ruta_id, area_id, hora_inicio,
            hora_fin, estado
        ) VALUES (
            p_trainer_id, p_ruta_id, p_area_id, p_horario_inicio,
            p_horario_fin, 'Activo'
        );
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Existe un conflicto de horario';
    END IF;
END //

-- 8. Registrar una nueva ruta con sus módulos y SGDB asociados
CREATE PROCEDURE sp_registrar_ruta(
    IN p_nombre VARCHAR(100),
    IN p_descripcion TEXT,
    IN p_duracion_meses INT,
    IN p_sgdb_principal VARCHAR(50),
    IN p_sgdb_alternativo VARCHAR(50),
    IN p_area_id INT,
    OUT p_ruta_id INT
)
BEGIN
    INSERT INTO rutas (
        nombre, descripcion, duracion_meses,
        sgdb_principal, sgdb_alternativo, area_id
    ) VALUES (
        p_nombre, p_descripcion, p_duracion_meses,
        p_sgdb_principal, p_sgdb_alternativo, p_area_id
    );
    
    SET p_ruta_id = LAST_INSERT_ID();
END //

-- 9. Registrar una nueva área de entrenamiento con su capacidad y horarios
CREATE PROCEDURE sp_registrar_area(
    IN p_nombre VARCHAR(100),
    IN p_descripcion TEXT,
    IN p_capacidad_maxima INT,
    IN p_horario_inicio TIME,
    IN p_horario_fin TIME,
    OUT p_area_id INT
)
BEGIN
    INSERT INTO areas (
        nombre, descripcion, capacidad_maxima,
        horario_inicio, horario_fin, estado
    ) VALUES (
        p_nombre, p_descripcion, p_capacidad_maxima,
        p_horario_inicio, p_horario_fin, 'Activo'
    );
    
    SET p_area_id = LAST_INSERT_ID();
END //

-- 10. Consultar disponibilidad de horario en un área determinada
CREATE PROCEDURE sp_consultar_disponibilidad_area(
    IN p_area_id INT,
    IN p_fecha DATE,
    IN p_hora_inicio TIME,
    IN p_hora_fin TIME
)
BEGIN
    SELECT 
        a.nombre AS area,
        a.capacidad_maxima,
        COUNT(DISTINCT asig.camper_id) AS ocupacion_actual,
        (a.capacidad_maxima - COUNT(DISTINCT asig.camper_id)) AS cupos_disponibles,
        GROUP_CONCAT(DISTINCT h.hora_inicio, ' - ', h.hora_fin) AS horarios_ocupados
    FROM areas a
    LEFT JOIN rutas r ON a.id = r.area_id
    LEFT JOIN asignaciones asig ON r.id = asig.ruta_id AND asig.estado = 'Activo'
    LEFT JOIN horarios_clases h ON a.id = h.area_id AND h.estado = 'Activo'
    WHERE a.id = p_area_id
    GROUP BY a.id, a.nombre, a.capacidad_maxima;
END //

-- 11. Reasignar a un camper a otra ruta en caso de bajo rendimiento
CREATE PROCEDURE sp_reasignar_camper(
    IN p_camper_id INT,
    IN p_nueva_ruta_id INT,
    IN p_nuevo_trainer_id INT
)
BEGIN
    DECLARE v_area_id INT;
    DECLARE v_capacidad_disponible INT;
    
    -- Obtener el área de la nueva ruta
    SELECT area_id INTO v_area_id
    FROM rutas
    WHERE id = p_nueva_ruta_id;
    
    -- Verificar disponibilidad en el área
    SELECT (a.capacidad_maxima - COUNT(DISTINCT asig.camper_id))
    INTO v_capacidad_disponible
    FROM areas a
    LEFT JOIN rutas r ON a.id = r.area_id
    LEFT JOIN asignaciones asig ON r.id = asig.ruta_id AND asig.estado = 'Activo'
    WHERE a.id = v_area_id
    GROUP BY a.id, a.capacidad_maxima;
    
    IF v_capacidad_disponible > 0 THEN
        -- Desactivar asignación anterior
        UPDATE asignaciones
        SET estado = 'Inactivo'
        WHERE camper_id = p_camper_id AND estado = 'Activo';
        
        -- Crear nueva asignación
        INSERT INTO asignaciones (
            camper_id, ruta_id, trainer_id, fecha_inicio, estado
        ) VALUES (
            p_camper_id, p_nueva_ruta_id, p_nuevo_trainer_id, NOW(), 'Activo'
        );
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'No hay cupos disponibles en el área';
    END IF;
END //

-- 12. Cambiar el estado de un camper a "Graduado" al finalizar todos los módulos
CREATE PROCEDURE sp_graduar_camper(IN p_camper_id INT)
BEGIN
    DECLARE v_total_modulos INT;
    DECLARE v_modulos_aprobados INT;
    
    -- Obtener total de módulos de la ruta
    SELECT COUNT(DISTINCT m.id)
    INTO v_total_modulos
    FROM asignaciones a
    INNER JOIN rutas r ON a.ruta_id = r.id
    INNER JOIN modulos m ON r.id = m.ruta_id
    WHERE a.camper_id = p_camper_id
    AND a.estado = 'Activo';
    
    -- Obtener módulos aprobados
    SELECT COUNT(DISTINCT e.modulo_id)
    INTO v_modulos_aprobados
    FROM evaluaciones e
    WHERE e.camper_id = p_camper_id
    AND e.nota_final >= 60;
    
    -- Verificar si aprobó todos los módulos
    IF v_modulos_aprobados = v_total_modulos THEN
        UPDATE campers
        SET estado = 'Graduado'
        WHERE id = p_camper_id;
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El camper no ha aprobado todos los módulos';
    END IF;
END //

-- 13. Consultar y exportar todos los datos de rendimiento de un camper
CREATE PROCEDURE sp_exportar_rendimiento_camper(IN p_camper_id INT)
BEGIN
    SELECT 
        c.nombre AS camper,
        c.estado AS estado_actual,
        c.nivel_riesgo,
        r.nombre AS ruta,
        m.nombre AS modulo,
        e.nota_teorica,
        e.nota_practica,
        e.nota_quiz,
        e.nota_final,
        e.fecha_evaluacion,
        t.nombre AS trainer
    FROM campers c
    INNER JOIN asignaciones a ON c.id = a.camper_id
    INNER JOIN rutas r ON a.ruta_id = r.id
    LEFT JOIN modulos m ON r.id = m.ruta_id
    LEFT JOIN evaluaciones e ON m.id = e.modulo_id AND c.id = e.camper_id
    LEFT JOIN trainers t ON e.trainer_id = t.id
    WHERE c.id = p_camper_id
    ORDER BY m.nombre, e.fecha_evaluacion;
END //

-- 14. Registrar la asistencia a clases por área y horario
CREATE PROCEDURE sp_registrar_asistencia(
    IN p_area_id INT,
    IN p_fecha DATE,
    IN p_hora_inicio TIME,
    IN p_hora_fin TIME
)
BEGIN
    INSERT INTO asistencias (
        area_id, fecha, hora_inicio, hora_fin
    ) VALUES (
        p_area_id, p_fecha, p_hora_inicio, p_hora_fin
    );
END //

-- 15. Generar reporte mensual de notas por ruta
CREATE PROCEDURE sp_reporte_mensual_notas(
    IN p_ruta_id INT,
    IN p_mes INT,
    IN p_anio INT
)
BEGIN
    SELECT 
        r.nombre AS ruta,
        m.nombre AS modulo,
        COUNT(DISTINCT e.camper_id) AS total_evaluados,
        ROUND(AVG(e.nota_final), 2) AS promedio_nota,
        COUNT(DISTINCT CASE WHEN e.nota_final >= 60 THEN e.camper_id END) AS aprobados,
        COUNT(DISTINCT CASE WHEN e.nota_final < 60 THEN e.camper_id END) AS reprobados
    FROM rutas r
    INNER JOIN modulos m ON r.id = m.ruta_id
    LEFT JOIN evaluaciones e ON m.id = e.modulo_id
    WHERE r.id = p_ruta_id
    AND MONTH(e.fecha_evaluacion) = p_mes
    AND YEAR(e.fecha_evaluacion) = p_anio
    GROUP BY r.id, r.nombre, m.id, m.nombre
    ORDER BY m.nombre;
END //

-- 16. Validar y registrar la asignación de un salón a una ruta
CREATE PROCEDURE sp_asignar_salon_ruta(
    IN p_salon_id INT,
    IN p_ruta_id INT,
    IN p_horario_inicio TIME,
    IN p_horario_fin TIME
)
BEGIN
    DECLARE v_conflicto INT;
    
    -- Verificar conflictos de horario en el salón
    SELECT COUNT(*)
    INTO v_conflicto
    FROM horarios_clases h
    WHERE h.salon_id = p_salon_id
    AND h.estado = 'Activo'
    AND (
        (p_horario_inicio BETWEEN h.hora_inicio AND h.hora_fin)
        OR (p_horario_fin BETWEEN h.hora_inicio AND h.hora_fin)
    );
    
    IF v_conflicto = 0 THEN
        -- Registrar el horario
        INSERT INTO horarios_clases (
            salon_id, ruta_id, hora_inicio,
            hora_fin, estado
        ) VALUES (
            p_salon_id, p_ruta_id, p_horario_inicio,
            p_horario_fin, 'Activo'
        );
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El salón ya está ocupado en ese horario';
    END IF;
END //

-- 17. Registrar cambio de horario de un trainer
CREATE PROCEDURE sp_cambiar_horario_trainer(
    IN p_trainer_id INT,
    IN p_horario_actual_id INT,
    IN p_nuevo_horario_inicio TIME,
    IN p_nuevo_horario_fin TIME
)
BEGIN
    DECLARE v_conflicto INT;
    
    -- Verificar conflictos de horario
    SELECT COUNT(*)
    INTO v_conflicto
    FROM horarios_clases h
    WHERE h.trainer_id = p_trainer_id
    AND h.id != p_horario_actual_id
    AND h.estado = 'Activo'
    AND (
        (p_nuevo_horario_inicio BETWEEN h.hora_inicio AND h.hora_fin)
        OR (p_nuevo_horario_fin BETWEEN h.hora_inicio AND h.hora_fin)
    );
    
    IF v_conflicto = 0 THEN
        UPDATE horarios_clases
        SET 
            hora_inicio = p_nuevo_horario_inicio,
            hora_fin = p_nuevo_horario_fin
        WHERE id = p_horario_actual_id;
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Existe un conflicto de horario';
    END IF;
END //

-- 18. Eliminar la inscripción de un camper a una ruta
CREATE PROCEDURE sp_eliminar_inscripcion(
    IN p_camper_id INT,
    IN p_ruta_id INT
)
BEGIN
    -- Desactivar la asignación
    UPDATE asignaciones
    SET estado = 'Inactivo'
    WHERE camper_id = p_camper_id
    AND ruta_id = p_ruta_id
    AND estado = 'Activo';
    
    -- Actualizar estado del camper
    UPDATE campers
    SET estado = 'Retirado'
    WHERE id = p_camper_id;
END //

-- 19. Recalcular el estado de todos los campers según su rendimiento acumulado
CREATE PROCEDURE sp_recalcular_estados_campers()
BEGIN
    DECLARE v_camper_id INT;
    DECLARE v_total_modulos INT;
    DECLARE v_modulos_aprobados INT;
    DECLARE v_estado VARCHAR(20);
    
    -- Cursor para procesar cada camper
    DECLARE cur CURSOR FOR
    SELECT DISTINCT c.id
    FROM campers c
    WHERE c.estado = 'Cursando';
    
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET @done = TRUE;
    
    OPEN cur;
    
    read_loop: LOOP
        FETCH cur INTO v_camper_id;
        IF @done THEN
            LEAVE read_loop;
        END IF;
        
        -- Obtener total de módulos
        SELECT COUNT(DISTINCT m.id)
        INTO v_total_modulos
        FROM asignaciones a
        INNER JOIN rutas r ON a.ruta_id = r.id
        INNER JOIN modulos m ON r.id = m.ruta_id
        WHERE a.camper_id = v_camper_id
        AND a.estado = 'Activo';
        
        -- Obtener módulos aprobados
        SELECT COUNT(DISTINCT e.modulo_id)
        INTO v_modulos_aprobados
        FROM evaluaciones e
        WHERE e.camper_id = v_camper_id
        AND e.nota_final >= 60;
        
        -- Determinar nuevo estado
        IF v_modulos_aprobados = v_total_modulos THEN
            SET v_estado = 'Graduado';
        ELSEIF v_modulos_aprobados = 0 THEN
            SET v_estado = 'Expulsado';
        ELSE
            SET v_estado = 'Cursando';
        END IF;
        
        -- Actualizar estado
        UPDATE campers
        SET estado = v_estado
        WHERE id = v_camper_id;
        
    END LOOP;
    
    CLOSE cur;
END //

-- 20. Asignar horarios automáticamente a trainers disponibles
CREATE PROCEDURE sp_asignar_horarios_automaticos()
BEGIN
    DECLARE v_trainer_id INT;
    DECLARE v_area_id INT;
    DECLARE v_horario_inicio TIME;
    DECLARE v_horario_fin TIME;
    
    -- Cursor para procesar cada trainer
    DECLARE cur CURSOR FOR
    SELECT t.id, t.area_id
    FROM trainers t
    WHERE t.estado = 'Activo';
    
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET @done = TRUE;
    
    OPEN cur;
    
    read_loop: LOOP
        FETCH cur INTO v_trainer_id, v_area_id;
        IF @done THEN
            LEAVE read_loop;
        END IF;
        
        -- Obtener horarios disponibles del área
        SELECT 
            a.horario_inicio,
            a.horario_fin
        INTO v_horario_inicio, v_horario_fin
        FROM areas a
        WHERE a.id = v_area_id;
        
        -- Asignar horario al trainer
        INSERT INTO horarios_clases (
            trainer_id, area_id, hora_inicio,
            hora_fin, estado
        ) VALUES (
            v_trainer_id, v_area_id, v_horario_inicio,
            v_horario_fin, 'Activo'
        );
        
    END LOOP;
    
    CLOSE cur;
END //

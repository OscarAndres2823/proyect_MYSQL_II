--triggers

🔁 TRIGGERS SQL (20)

-- 1. Al insertar una evaluación, calcular automáticamente la nota final
CREATE TRIGGER tr_calcular_nota_final_ins
AFTER INSERT ON evaluaciones
FOR EACH ROW
BEGIN
    DECLARE v_peso_teorico DECIMAL(5,2);
    DECLARE v_peso_practico DECIMAL(5,2);
    DECLARE v_peso_quiz DECIMAL(5,2);
    DECLARE v_nota_final DECIMAL(5,2);
    
    -- Obtener pesos del módulo
    SELECT peso_teorico, peso_practico, peso_quiz
    INTO v_peso_teorico, v_peso_practico, v_peso_quiz
    FROM modulos
    WHERE id = NEW.modulo_id;
    
    -- Calcular nota final
    SET v_nota_final = ROUND(
        (NEW.nota_teorica * v_peso_teorico / 100) +
        (NEW.nota_practica * v_peso_practico / 100) +
        (NEW.nota_quiz * v_peso_quiz / 100),
        2
    );
    
    -- Actualizar la nota final
    UPDATE evaluaciones
    SET nota_final = v_nota_final
    WHERE id = NEW.id;
END //

-- 2. Al actualizar la nota final de un módulo, verificar si el camper aprueba o reprueba
CREATE TRIGGER tr_verificar_aprobacion_modulo
AFTER UPDATE ON evaluaciones
FOR EACH ROW
BEGIN
    IF NEW.nota_final >= 60 THEN
        -- Actualizar estado del camper a aprobado si es necesario
        UPDATE campers
        SET estado = 'Aprobado'
        WHERE id = NEW.camper_id
        AND estado = 'Cursando';
    ELSE
        -- Actualizar estado del camper a en proceso si es necesario
        UPDATE campers
        SET estado = 'En proceso'
        WHERE id = NEW.camper_id
        AND estado = 'Aprobado';
    END IF;
END //

-- 3. Al insertar una inscripción, cambiar el estado del camper a "Inscrito"
CREATE TRIGGER tr_actualizar_estado_inscripcion
AFTER INSERT ON inscripciones
FOR EACH ROW
BEGIN
    UPDATE campers
    SET estado = 'Inscrito'
    WHERE id = NEW.camper_id;
END //

-- 4. Al actualizar una evaluación, recalcular su promedio inmediatamente
CREATE TRIGGER tr_recalcular_promedio_evaluacion
AFTER UPDATE ON evaluaciones
FOR EACH ROW
BEGIN
    DECLARE v_promedio DECIMAL(5,2);
    DECLARE v_camper_id INT;
    DECLARE v_modulo_id INT;
    
    -- Guardar IDs para uso posterior
    SET v_camper_id = NEW.camper_id;
    SET v_modulo_id = NEW.modulo_id;
    
    -- Calcular nuevo promedio
    SELECT ROUND(AVG(nota_final), 2)
    INTO v_promedio
    FROM evaluaciones
    WHERE camper_id = v_camper_id
    AND modulo_id = v_modulo_id;
    
    -- Actualizar promedio en la tabla de promedios
    INSERT INTO promedios_modulos (camper_id, modulo_id, promedio)
    VALUES (v_camper_id, v_modulo_id, v_promedio)
    ON DUPLICATE KEY UPDATE promedio = v_promedio;
END //

-- 5. Al eliminar una inscripción, marcar al camper como "Retirado"
CREATE TRIGGER tr_marcar_camper_retirado
AFTER DELETE ON inscripciones
FOR EACH ROW
BEGIN
    UPDATE campers
    SET estado = 'Retirado'
    WHERE id = OLD.camper_id;
END //

-- 6. Al insertar un nuevo módulo, registrar automáticamente su SGDB asociado
CREATE TRIGGER tr_registrar_sgdb_modulo
AFTER INSERT ON modulos
FOR EACH ROW
BEGIN
    INSERT INTO sgdb_modulos (modulo_id, sgdb_id)
    SELECT NEW.id, sgdb_id
    FROM sgdb_rutas
    WHERE ruta_id = NEW.ruta_id;
END //

-- 7. Al insertar un nuevo trainer, verificar duplicados por identificación
CREATE TRIGGER tr_verificar_duplicado_trainer
BEFORE INSERT ON trainers
FOR EACH ROW
BEGIN
    IF EXISTS (SELECT 1 FROM trainers WHERE identificacion = NEW.identificacion) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Ya existe un trainer con esta identificación';
    END IF;
END //

-- 8. Al asignar un área, validar que no exceda su capacidad
CREATE TRIGGER tr_validar_capacidad_area
BEFORE INSERT ON asignaciones
FOR EACH ROW
BEGIN
    DECLARE v_capacidad_actual INT;
    DECLARE v_capacidad_maxima INT;
    
    -- Obtener capacidad actual y máxima
    SELECT 
        COUNT(DISTINCT a.camper_id),
        ar.capacidad_maxima
    INTO v_capacidad_actual, v_capacidad_maxima
    FROM areas ar
    LEFT JOIN rutas r ON ar.id = r.area_id
    LEFT JOIN asignaciones a ON r.id = a.ruta_id AND a.estado = 'Activa'
    WHERE ar.id = NEW.area_id
    GROUP BY ar.id, ar.capacidad_maxima;
    
    -- Validar capacidad
    IF v_capacidad_actual >= v_capacidad_maxima THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El área ha alcanzado su capacidad máxima';
    END IF;
END //

-- 9. Al insertar una evaluación con nota < 60, marcar al camper como "Bajo rendimiento"
CREATE TRIGGER tr_marcar_bajo_rendimiento
AFTER INSERT ON evaluaciones
FOR EACH ROW
BEGIN
    IF NEW.nota_final < 60 THEN
        UPDATE campers
        SET nivel_riesgo = 'Alto'
        WHERE id = NEW.camper_id;
    END IF;
END //

-- 10. Al cambiar de estado a "Graduado", mover registro a la tabla de egresados
CREATE TRIGGER tr_mover_egresado
AFTER UPDATE ON campers
FOR EACH ROW
BEGIN
    IF NEW.estado = 'Graduado' AND OLD.estado != 'Graduado' THEN
        INSERT INTO egresados (
            id, nombre, email, telefono, fecha_graduacion
        )
        VALUES (
            NEW.id, NEW.nombre, NEW.email, NEW.telefono, CURRENT_DATE()
        );
    END IF;
END //

-- 11. Al modificar horarios de trainer, verificar solapamiento con otros
CREATE TRIGGER tr_verificar_solapamiento_horario
BEFORE INSERT ON horarios_clases
FOR EACH ROW
BEGIN
    IF EXISTS (
        SELECT 1 FROM horarios_clases
        WHERE trainer_id = NEW.trainer_id
        AND estado = 'Activo'
        AND (
            (NEW.hora_inicio BETWEEN hora_inicio AND hora_fin)
            OR (NEW.hora_fin BETWEEN hora_inicio AND hora_fin)
        )
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El horario se solapa con otro horario existente';
    END IF;
END //

-- 12. Al eliminar un trainer, liberar sus horarios y rutas asignadas
CREATE TRIGGER tr_liberar_recursos_trainer
AFTER DELETE ON trainers
FOR EACH ROW
BEGIN
    -- Liberar horarios
    UPDATE horarios_clases
    SET estado = 'Inactivo'
    WHERE trainer_id = OLD.id;
    
    -- Liberar rutas
    UPDATE rutas
    SET trainer_id = NULL
    WHERE trainer_id = OLD.id;
END //

-- 13. Al cambiar la ruta de un camper, actualizar automáticamente sus módulos
CREATE TRIGGER tr_actualizar_modulos_camper
AFTER UPDATE ON asignaciones
FOR EACH ROW
BEGIN
    IF NEW.ruta_id != OLD.ruta_id THEN
        -- Eliminar evaluaciones de módulos antiguos
        DELETE FROM evaluaciones
        WHERE camper_id = NEW.camper_id
        AND modulo_id IN (
            SELECT id FROM modulos WHERE ruta_id = OLD.ruta_id
        );
        
        -- Crear nuevas evaluaciones para módulos de la nueva ruta
        INSERT INTO evaluaciones (camper_id, modulo_id, fecha_evaluacion)
        SELECT NEW.camper_id, id, CURRENT_DATE()
        FROM modulos
        WHERE ruta_id = NEW.ruta_id;
    END IF;
END //

-- 14. Al insertar un nuevo camper, verificar si ya existe por número de documento
CREATE TRIGGER tr_verificar_duplicado_camper
BEFORE INSERT ON campers
FOR EACH ROW
BEGIN
    IF EXISTS (SELECT 1 FROM campers WHERE documento = NEW.documento) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Ya existe un camper con este número de documento';
    END IF;
END //

-- 15. Al actualizar la nota final, recalcular el estado del módulo automáticamente
CREATE TRIGGER tr_recalcular_estado_modulo
AFTER UPDATE ON evaluaciones
FOR EACH ROW
BEGIN
    DECLARE v_promedio DECIMAL(5,2);
    DECLARE v_modulo_id INT;
    
    -- Guardar ID del módulo para uso posterior
    SET v_modulo_id = NEW.modulo_id;
    
    -- Calcular promedio del módulo
    SELECT ROUND(AVG(nota_final), 2)
    INTO v_promedio
    FROM evaluaciones
    WHERE modulo_id = v_modulo_id;
    
    -- Actualizar estado del módulo
    UPDATE modulos
    SET estado = CASE
        WHEN v_promedio >= 80 THEN 'Excelente'
        WHEN v_promedio >= 60 THEN 'Aprobado'
        ELSE 'Reprobado'
    END
    WHERE id = v_modulo_id;
END //

-- 16. Al asignar un módulo, verificar que el trainer tenga ese conocimiento
CREATE TRIGGER tr_verificar_conocimiento_trainer
BEFORE INSERT ON asignaciones
FOR EACH ROW
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM conocimientos_trainer
        WHERE trainer_id = NEW.trainer_id
        AND modulo_id = NEW.modulo_id
        AND nivel >= 'Avanzado'
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El trainer no tiene el conocimiento necesario para este módulo';
    END IF;
END //

-- 17. Al cambiar el estado de un área a inactiva, liberar campers asignados
CREATE TRIGGER tr_liberar_campers_area
AFTER UPDATE ON areas
FOR EACH ROW
BEGIN
    IF NEW.estado = 'Inactiva' AND OLD.estado != 'Inactiva' THEN
        -- Actualizar estado de asignaciones
        UPDATE asignaciones a
        INNER JOIN rutas r ON a.ruta_id = r.id
        SET a.estado = 'Inactiva'
        WHERE r.area_id = NEW.id;
        
        -- Actualizar estado de campers
        UPDATE campers c
        INNER JOIN asignaciones a ON c.id = a.camper_id
        INNER JOIN rutas r ON a.ruta_id = r.id
        SET c.estado = 'Retirado'
        WHERE r.area_id = NEW.id;
    END IF;
END //

-- 18. Al crear una nueva ruta, clonar la plantilla base de módulos y SGDBs
CREATE TRIGGER tr_clonar_plantilla_ruta
AFTER INSERT ON rutas
FOR EACH ROW
BEGIN
    -- Clonar módulos de la plantilla
    INSERT INTO modulos (
        nombre, descripcion, ruta_id, peso_teorico, peso_practico, peso_quiz
    )
    SELECT 
        nombre, descripcion, NEW.id, peso_teorico, peso_practico, peso_quiz
    FROM modulos_plantilla;
    
    -- Clonar SGDBs asociados
    INSERT INTO sgdb_rutas (ruta_id, sgdb_id)
    SELECT NEW.id, sgdb_id
    FROM sgdb_plantilla;
END //

-- 19. Al registrar la nota práctica, verificar que no supere 60% del total
CREATE TRIGGER tr_validar_nota_practica
BEFORE INSERT ON evaluaciones
FOR EACH ROW
BEGIN
    DECLARE v_peso_practico DECIMAL(5,2);
    
    -- Obtener peso práctico del módulo
    SELECT peso_practico
    INTO v_peso_practico
    FROM modulos
    WHERE id = NEW.modulo_id;
    
    -- Validar que la nota práctica no supere el 60% del total
    IF (NEW.nota_practica * v_peso_practico / 100) > 60 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'La nota práctica no puede superar el 60% del total';
    END IF;
END //

-- 20. Al modificar una ruta, notificar cambios a los trainers asignados
CREATE TRIGGER tr_notificar_cambios_ruta
AFTER UPDATE ON rutas
FOR EACH ROW
BEGIN
    -- Insertar notificación para cada trainer asignado
    INSERT INTO notificaciones (
        trainer_id, mensaje, tipo, fecha_creacion
    )
    SELECT DISTINCT
        a.trainer_id,
        CONCAT('La ruta ', NEW.nombre, ' ha sido modificada'),
        'Cambio de Ruta',
        CURRENT_TIMESTAMP
    FROM asignaciones a
    WHERE a.ruta_id = NEW.id
    AND a.estado = 'Activa';
END //
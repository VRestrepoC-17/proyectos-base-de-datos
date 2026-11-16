SELECT e.documento, e.nombres, e.apellidos, m.fecha_matricula
FROM dbo.ESTUDIANTE AS e
INNER JOIN dbo.MATRICULA AS m
ON e.id_estudiante = m.id_estudiante
INNER JOIN dbo.PERIODO_ACADEMICO AS pe
ON m.id_periodo = pe.id_periodo
WHERE m.estado = 'Activa'
AND pe.nombre = '2026-2'
;

/*Consultar estudiantes con matrícula activa en el periodo vigente (2026-2).*/
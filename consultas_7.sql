SELECT TOP 1 e.documento, e.nombres, e.apellidos,
    COUNT(m.id_matricula) AS total_matriculas_activas
FROM dbo.ESTUDIANTE AS e
INNER JOIN dbo.MATRICULA AS m
ON e.id_estudiante = m.id_estudiante
WHERE m.estado = 'Activa'
GROUP BY e.id_estudiante, e.documento, e.nombres, e.apellidos
ORDER BY total_matriculas_activas DESC
;

/*Consultar el número máximo de matrículas activas asociadas a un mismo estudiante
y datos de este estudiante.*/
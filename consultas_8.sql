SELECT pr.nombre AS programa,
    COUNT(m.id_estudiante) AS total_estudiantes
FROM dbo.PROGRAMA AS pr
LEFT JOIN dbo.MATRICULA AS m
ON pr.id_programa = m.id_programa
GROUP BY pr.id_programa, pr.nombre
;

/*Consultar el promedio de estudiantes por cada programa.*/
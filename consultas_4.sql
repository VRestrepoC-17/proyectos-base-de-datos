SELECT id_estudiante,
    COUNT(id_matricula) AS total_matriculas
FROM dbo.MATRICULA
GROUP BY id_estudiante
HAVING COUNT(id_matricula) > 1
;

/*Consultar id de estudiantes con más de una matrícula inscrita.*/
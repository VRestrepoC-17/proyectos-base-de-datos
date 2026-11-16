SELECT TOP 5 id_docente,
    COUNT(id_asignatura) AS asignaturas_asignadas
FROM dbo.ASIGNATURA
GROUP BY id_docente
HAVING COUNT(id_asignatura) >= 2
ORDER BY asignaturas_asignadas DESC
;

/*Consultar id de docentes con dos o más asignaturas asignadas,
mostrando sólo los 5 con más cantidad de mayor a menor.*/
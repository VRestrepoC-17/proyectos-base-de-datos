SELECT estado,
	COUNT(*) AS total_estudiantes
FROM dbo.ESTUDIANTE
GROUP BY estado
ORDER BY estado ASC
;

/*Consultar cuántos estudiantes hay registrados por cada estado y ordenar alfabéticamente.*/
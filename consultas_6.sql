SELECT id_periodo,
    COUNT(*) AS cantidad_matriculas
FROM dbo.MATRICULA
GROUP BY id_periodo
ORDER BY cantidad_matriculas DESC
;

/*Consultar cantidad de matrículas por periodo y ordenar en orden de mayor a menor.*/
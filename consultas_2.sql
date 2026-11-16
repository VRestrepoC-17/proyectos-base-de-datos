SELECT *
FROM dbo.MATRICULA
WHERE fecha_matricula BETWEEN '2025-01-01' AND '2025-12-31'
AND estado IN('Finalizada', 'Cancelada')
;

/*Consultar matrículas realizadas durante 2025, cuyo estado sea Finalizada o Cancelada.*/
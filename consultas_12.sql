SELECT DISTINCT pr.nombre AS programa_activo
FROM dbo.PROGRAMA AS pr
INNER JOIN dbo.MATRICULA AS m 
ON pr.id_programa = m.id_programa
WHERE m.estado = 'Activa'
;

/*Consultar programas con matrículas activas evitando repetir los nombres.*/
SELECT
	MIN(fecha_inicio) AS primera_fecha_inicio,
	MAX(fecha_fin) AS ultima_fecha_fin,
	COUNT(id_periodo) AS total_periodos
FROM dbo.PERIODO_ACADEMICO
;

/*Consultar fecha de inicio más antigua, fecha final más reciente
y total de periodos registrados.*/
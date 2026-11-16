SELECT apellidos, nombres, estado
FROM dbo.ESTUDIANTE
WHERE estado = 'Activo'
ORDER BY apellidos ASC
;

/*Consultar estudiantes activos registrados y ordenar en orden alfabético según apellido.*/
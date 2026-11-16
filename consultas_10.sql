SELECT nombres, apellidos, correo
FROM dbo.ESTUDIANTE
WHERE correo NOT LIKE 'NULL'
;

/*Consultar nombre y correo de estudiantes con correo registrado.*/
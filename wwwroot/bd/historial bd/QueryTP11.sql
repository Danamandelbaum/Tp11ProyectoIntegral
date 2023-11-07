--SP de iniciar sesion (gmail, contrase�a) 
CREATE PROCEDURE IniciarSesion
 @gmail VARCHAR(50),
 @contrase�a VARCHAR(50)
	AS
	BEGIN
		Select * from Registro R where R.Email = @gmail and R.Contrase�a = @contrase�a
	END 
	GO

EXEC IniciarSesion
--SP de registrarte (nombre usuario,apellido usuario, contrase�a,gmail)
CREATE PROCEDURE Registrarte
@nombreU Varchar(50),
@apellidoU Varchar(50),
@gmail VARCHAR(50),
@contrase�a VARCHAR(50)
	AS
	BEGIN
	Insert 
		
	END 
	GO

EXEC IniciarSesion
--SP de editar perfil (todo menos id 6 campos)

--BuscarCasa(todo de casa)
--ObtenerSemanasDisponibles(idCasa,a�o,mes)
--Reservar(idCasa,idUsuario,a�o,mes,semana)

--ObtenerSemanasDisponibles(idCasa, anio, mes, semana)
ALTER PROCEDURE ObtenerSemanasDisponibles
@IdCasa int,
@mes int,
@anio int
	AS
	BEGIN
		SELECT Semana FROM Alquiler WHERE IDCasa = @IdCasa AND Mes = @mes AND Anio = @anio
	END 
	GO
EXEC ObtenerSemanasDisponibles


--GuardarFavoritos(idUsuario,idCasa)
--VerFavoritos(idUsuario)

--GuardarFavoritos(idUsuario,idCasa)
ALTER PROCEDURE GuardarFavoritos
@IdUser int,
@IdCasa int
	AS
	BEGIN 
		INSERT INTO Favorito (IDUsuario, IDCasa) VALUES (@IdUser, @IdCasa) 
	END 
	GO
EXEC GuardarFavoritos

--VerFavoritos(idUsuario)
ALTER PROCEDURE VerFavoritos
@IdUser int
	AS 
	BEGIN
		SELECT * FROM Favorito WHERE IDUsuario = @IdUser
	END 
	GO
EXEC VerFavoritos

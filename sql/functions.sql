 -- El autor es Imane Aalouane
 --RF-1-02
  -- no es necesario elfunctions sql 
 --FUNCION QUE, DADO EL EMAIL UN USUARIO, DEVUELVA EL NUMERO DE FOTOS SUBIDAS 
 DELIMITER //
 CREATE OR REPLACE FUNCTION 
            fGetTotalPhotos(email varchar(250)) RETURNS INT 
BEGIN 
        RETURN(
            SELECT count(*)
            FROM fotos F 
            WHERE (F.email = email)
        );
END//
DELIMITER;

 --RF-2-01
 --FUNCION QUE, DADO EL EMAIL DE UN USUARIO, DEVUELVA EL NUMERO TOTAL DE VINCULOS DE AMISTAD QUE TIENE 
  DELIMITER //
 CREATE OR REPLACE FUNCTION
            fGetTotalVinculos(email1 varchar(250)) RETURNS INT
BEGIN 
        RETURN(
            SELECT count(*)
            FROM vinculos_amistades
            WHERE vinculos_amistades.email1 = email
        );
END//
DELIMITER;



--FUNCION QUE DEVUELVE TOTAL DE LOS MENSAJES QUE SE HAN MANDADO EN EL MISMO TIEMPO (INSTANTE)
DELIMITER //
CREATE OR REPLACE FUNCTION 
	fMensajesDate(instantdate DATETIME ) RETURNS INT
BEGIN
	RETURN (
		SELECT count(*)
		FROM mensajes
		WHERE (mensajes.instante = instantdate)
	);
END //
DELIMITER ;



 

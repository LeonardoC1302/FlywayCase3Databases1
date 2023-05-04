-----------------------------------------------------------
-- Autor: Rnunez
-- Fecha: 1/5/2023
-- Descripcion: esta description en comentarios queda almacenada
-- Otros detalles de los parametros
-----------------------------------------------------------
-- Author: Leonardo Céspedes y Frankmin Feng
-- Fecha: 04-26-2023
-- Desc: actualiza la tabla de xyz bla bla bla
-----------------------------------------------------------

CREATE TYPE ContractType AS TABLE (
    startDate DATE NOT NULL,
    endDate DATE NOT NULL,
    contractStatusId INT NOT NULL
);

GO

ALTER PROCEDURE [dbo].[InsertContract]
    @contracts ContractType READONLY
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @ErrorNumber INT, @ErrorSeverity INT, @ErrorState INT, @CustomError INT;
    DECLARE @Message VARCHAR(200);
    DECLARE @InicieTransaccion BIT;


	-- Check for NULL values before starting the transaction
    IF EXISTS (SELECT 1 FROM @contracts WHERE startDate IS NULL OR endDate IS NULL OR contractStatusId IS NULL)
    BEGIN
		SET @Message = 'Valores con null';
        RAISERROR('%s', 16, 1, @Message);
        RETURN;
    END;
    SET @InicieTransaccion = 0;

    IF @@TRANCOUNT = 0
    BEGIN
		
        SET @InicieTransaccion = 1;
        SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
        BEGIN TRANSACTION;
    END;

    BEGIN TRY
        SET @CustomError = 2001;
        INSERT INTO dbo.contracts (startDate, endDate, contractStatusId)
        SELECT startDate, endDate, contractStatusId
        FROM @contracts;

        IF @InicieTransaccion = 1
        BEGIN
            COMMIT;
        END;
    END TRY
    BEGIN CATCH
        SET @ErrorNumber = ERROR_NUMBER();
        SET @ErrorSeverity = ERROR_SEVERITY();
        SET @ErrorState = ERROR_STATE();
        SET @Message = ERROR_MESSAGE();

        IF @InicieTransaccion = 1
        BEGIN
            ROLLBACK;
        END;

        RAISERROR('%s - Error Number: %i', @ErrorSeverity, @ErrorState, @Message, @CustomError);
    END CATCH;
END;

GO

DECLARE @contracts AS ContractType;
INSERT INTO @contracts (startDate, endDate, contractStatusId) 
VALUES 
    ('2023-04-01', '2024-03-31', 2), 
    ('2023-05-01', '2023-08-31', 1);

EXEC [dbo].[InsertContract] @contracts;

select * from dbo.contracts;
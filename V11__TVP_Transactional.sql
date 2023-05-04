IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[prodCharges]') AND type in (N'P', N'PC'))
BEGIN
    EXEC ('CREATE PROCEDURE [dbo].[prodCharges]
        @payment paymentType READONLY
    AS
    BEGIN
        SET NOCOUNT ON;
        DECLARE @ErrorNumber INT, @ErrorSeverity INT, @ErrorState INT, @CustomError INT;
        DECLARE @Message VARCHAR(200);
        DECLARE @InicieTransaccion BIT;

        SET @InicieTransaccion = 0;

        IF @@TRANCOUNT = 0
        BEGIN
            SET @InicieTransaccion = 1;
            SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
            BEGIN TRANSACTION;
        END;

        BEGIN TRY
            SET @CustomError = 2001;
            
            INSERT INTO [dbo].[invoices] ([date], [dueDate], [total_amount], [producerId], [number], [discountXsponsor])
            SELECT paymentDate, dueDate, amount, producerId,  number, discount
            FROM @payment;
            UPDATE p
            SET p.balance = p.balance - pt.amount
            FROM producers p
            INNER JOIN @payment pt ON p.producerId = pt.producerId;

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

            RAISERROR(''%s - Error Number: %i'', @ErrorSeverity, @ErrorState, @Message, @CustomError);
        END CATCH;
    END;')
END

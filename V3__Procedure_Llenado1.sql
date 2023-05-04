IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[InsertWasteMovements]') AND type in (N'P', N'PC'))
BEGIN
    EXEC ('CREATE PROCEDURE [dbo].[InsertWasteMovements]
    @numRecords INT 
    AS 
    BEGIN 
        SET NOCOUNT ON; 
        
        DECLARE @i INT = 1;
        WHILE @i <= @numRecords 
        BEGIN 
            
    
            INSERT INTO [dbo].[wasteMovements] (
                [posttime],
                [responsibleName],
                [signImage],
                [addressId],
                [movementTypeId],
                [contractId],
                [quantity],
                [userId],
                [checksum],
                [computer],
                [containerId],
                [wasteId],
                [carId]
            )
            SELECT 
                GETDATE(),
                ''John Doe'', 
                0, 
                (SELECT TOP 1 [addressId] FROM [dbo].[addresses] ORDER BY NEWID()),
                (SELECT TOP 1 [movementTypeId] FROM [dbo].[movementTypes] ORDER BY NEWID()),
                (SELECT TOP 1 [contractId] FROM [dbo].[contracts] ORDER BY NEWID()),
                100.0 + (900.0 * RAND()), 
                (SELECT TOP 1 [userId] FROM [dbo].[usersResponsibles] ORDER BY NEWID()),
                0, 
                ''Computer1'', 
                (SELECT TOP 1 [containerId] FROM [dbo].[containers] ORDER BY NEWID()),
                (SELECT TOP 1 [wasteId] FROM [dbo].[wastes] ORDER BY NEWID()),
                (SELECT TOP 1 [carId] FROM [dbo].[cars] ORDER BY NEWID());
    
            INSERT INTO [dbo].[producersXmovements] (
                [producerId],
                [wasteMovementId]
            )
            SELECT    
                (SELECT TOP 1 [producerId] FROM [dbo].[producers] ORDER BY NEWID()),
                (SELECT TOP 1 [wasteMovementId] FROM [dbo].[wasteMovements] ORDER BY wasteMovementId DESC);
    
            
            SET @i = @i + 1; 
        END 
    END')
END

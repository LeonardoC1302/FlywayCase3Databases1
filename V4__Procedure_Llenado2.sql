IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GenerateContainerMovements]') AND type in (N'P', N'PC'))
BEGIN
    EXEC ('CREATE PROCEDURE [dbo].[GenerateContainerMovements]
    AS
    BEGIN
        DECLARE @containerId INT, @postime DATETIME, @fromProducerId INT;
        DECLARE @i INT = 1;

        SET NOCOUNT ON;

        WHILE @i <= 200
        BEGIN
            SELECT @containerId = ABS(CHECKSUM(NewId())) % 5 + 1, -- Random containerId from 1 to 5
                   @postime = DATEADD(day, ABS(CHECKSUM(NewId())) % 365, ''2022-01-01''), -- Random postime from Jan 1, 2022 to Dec 31, 2022
                   @fromProducerId = ABS(CHECKSUM(NewId())) % 5 + 1 -- Random fromProducerId from 1 to 5

            INSERT INTO [dbo].[containerMovements]([containerActionId],[containerId],[postime],[quantity],
            [fromProducerId], [checksum]) VALUES
                (1, @containerId, @postime, 1, @fromProducerId, NULL);

            SET @i = @i + 1;
        END;

    END;')
END;

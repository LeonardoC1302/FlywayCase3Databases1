CREATE TABLE [dbo].[flyway_schema_history] (
    [installed_rank] INT NOT NULL,
    [version] VARCHAR(50),
    [description] VARCHAR(200) NOT NULL,
    [type] VARCHAR(20) NOT NULL,
    [script] VARCHAR(1000) NOT NULL,
    [checksum] INT,
    [installed_by] VARCHAR(100) NOT NULL,
    [installed_on] DATETIME NOT NULL DEFAULT GETDATE(),
    [execution_time] INT NOT NULL,
    [success] BIT NOT NULL
);
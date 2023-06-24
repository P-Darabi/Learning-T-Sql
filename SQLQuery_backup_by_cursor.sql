declare Backup_Cursor scroll cursor for
select [Name] from sys.databases where [Name] not in ('master','tempdb','model','msdb')

open Backup_Cursor

declare @DBName nvarchar(200)
declare @Backup_Folder nvarchar(200)= 'd:\DBbackups\'

fetch next from Backup_Cursor into @DBName

while @@FETCH_STATUS=0
begin
	declare @Backup_Name nvarchar(200)= @DBName+ N'-'+ CONVERT(NVARCHAR(200), YEAR(GETDATE()))+ N'-'+ CONVERT(NVARCHAR(200), MONTH(GETDATE()))+ N'-'+ CONVERT(NVARCHAR(200), DAY(GETDATE()))+'.bak'
	DECLARE @Backup_Path nvarchar(1000)= @Backup_Folder+  @Backup_Name
	Backup Database @DBName to disk = @Backup_Path
	fetch next from Backup_Cursor into @DBName
end

close Backup_Cursor
deallocate Backup_Cursor
:: @echo off
:: set "sourcePath=C:\Users\Administrator\Documents\Codes\batch_files\secret_3.txt"
:: set "destinationPath=C:\backups"
:: robocopy "%sourcePath%" "%destinationPath%" /LOG:backuplog.txt
:: pause
@echo off
Robocopy.exe C:\Users\Administrator\Documents\Codes\batch_files C:\backups /LOG:backuplog.txt :: /MIR with every folder and subfolder
:: shutdown -s -t 30
pause


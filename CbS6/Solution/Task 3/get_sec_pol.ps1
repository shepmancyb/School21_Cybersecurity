#Requires -RunAsAdministrator

secedit /export /cfg secpol_temp.cfg
Get-Content secpol_temp.cfg | Out-File secpol2.txt
Remove-Item secpol_temp.cfg
Write-Host "Готово. Результат сохранён в файл secpol2.txt"
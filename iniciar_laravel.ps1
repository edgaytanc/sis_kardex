# Cambiar al directorio donde se encuentra el proyecto Laravel
#Set-Location -Path C:\kardex

# Iniciar el servidor PHP en un nuevo proceso de PowerShell, con la ventana minimizada
Start-Process PowerShell -ArgumentList "-NoProfile", "-Command", "php artisan serve" -WindowStyle Minimized

# Esperar un poco a que el servidor inicie completamente antes de abrir el navegador
Start-Sleep -Seconds 8

# Abrir el navegador en la URL del servidor local
Start-Process "http://127.0.0.1:8000/"



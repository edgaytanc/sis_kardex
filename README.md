# sis_kardex

**Sistema de gestión de kardex para inventario**

*Descripción:*

Sis_kardex es un sistema web desarrollado en Laravel que permite gestionar el inventario de productos mediante el uso de kardex. El sistema te permite:

* Registrar productos: Ingresa información básica como nombre, descripción, precio, cantidad y categoría.
* Entradas y salidas: Registra movimientos de entrada y salida de productos, actualizando el stock en tiempo real.
* Kardex: Visualiza el kardex de cada producto con información detallada de sus movimientos.
* Reportes: Genera reportes en PDF y Excel con información del inventario, entradas, salidas y kardex.
* Usuarios y permisos: Controla el acceso al sistema mediante roles y permisos para diferentes usuarios.

**Tecnologías:**

* Framework: Laravel 10
* Base de datos: MySQL
* Autenticación: Laravel Auth
* Control de versiones: Git
* Entorno de desarrollo: Docker

**Requisitos:**

* PHP >= 8.0
* Composer
* Servidor web (Apache, Nginx)
* Base de datos MySQL

**Instalación:**

1. Clonar el repositorio: git clone https://github.com/edgaytanc/sis_kardex.git
2. Instalar las dependencias: composer install
3. Configurar el archivo .env con la información de tu base de datos.
4. Ejecutar las migraciones: php artisan migrate
5. Iniciar el servidor: php artisan serve

**Uso:**

* Accede al sistema en la siguiente URL: http://localhost:8000
* Inicia sesión con el usuario admin@example.com y contraseña password
* Explora las diferentes funcionalidades del sistema para gestionar el inventario de productos.

# App_Fletes_S&P 2023
Repositorio de codigo fuente utilizado en el desarrollo de la aplicacion de app fletes - IESTP

- Para tener en local el proyecto funcionando, primero:

1. Instalar la base de datos en local/remoto mediante el script .sql
2. Ir a la raíz del proyecto y hacer: 'npm install' (tareas de gulp)
2.1. Tambien ir a la raiz del proyecto y hacer 'composer install', o 'composer update' para actualizar los paquetes php.
3. Una vez instalado las dependencias Node, hacer: 'npm run dev' => para compilar en JS, y SCSS minified y comprimir las imagenes.

4. Finalmente, levantar el servidor en local en la raiz del proyecto con: php -S localhost:3000 -t ./public  , he ir al navegador en: localhost:3000
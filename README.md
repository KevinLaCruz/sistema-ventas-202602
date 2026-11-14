# Sistema de Ventas 2026

Sistema de escritorio desarrollado en Java para administrar información básica de ventas y registrar facturas. La aplicación ofrece formularios gráficos para mantener productos y empleados, preparar facturas con sus respectivos detalles y consultar reportes.

## Funcionalidades

### Productos

Permite registrar, modificar, buscar y desactivar productos. Los productos se pueden buscar desde el formulario de facturación para incorporarlos al detalle de una venta con su precio y cantidad.

### Empleados

Permite registrar, modificar, buscar y desactivar empleados. Los empleados se relacionan con un distrito y pueden aparecer en el proceso de facturación y en los reportes disponibles.

### Facturación

El formulario de facturación permite seleccionar un cliente y un empleado, buscar productos y agregarlos a una factura. Al indicar la cantidad, se calcula el importe de cada producto. Si se vuelve a agregar un producto que ya está en la factura, se acumula la cantidad y se actualiza su importe.

El sistema calcula el subtotal, el IGV y el total de la factura. La información se almacena en una cabecera de factura y en sus respectivos detalles.

### Reportes

Incluye reportes de productos y empleados generados con JasperReports.

## Base de datos

La base de datos utilizada se llama `ventas_202602`. Su modelo incluye estas tablas:

- `cliente`: información de los clientes.
- `distrito`: distritos asociados a clientes y empleados.
- `empleado`: información de los empleados.
- `producto`: productos disponibles para la venta.
- `factura`: cabecera de cada venta.
- `detalle_factura`: productos, cantidades, precios e importes asociados a cada factura.

Las relaciones entre las tablas se definen mediante claves primarias y foráneas. La aplicación accede a la base de datos mediante JDBC y utiliza procedimientos almacenados y vistas para algunas operaciones y consultas.

## Tecnologías utilizadas

- Java 26.
- Java Swing para la interfaz gráfica.
- NetBeans y sistema de construcción Ant.
- MySQL/MariaDB.
- JDBC y MySQL Connector/J.
- JasperReports para la generación de reportes.

## Estado del proyecto

El proyecto se encuentra en desarrollo. Su funcionalidad actual se centra en el mantenimiento de productos y empleados, la generación de facturas y la consulta de reportes de productos y empleados.

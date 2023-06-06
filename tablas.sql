create table clientes(
    cliente_id serial primary key,
    cliente_nombre varchar(80) not null,
    cliente_nit varchar(10) not null,
    cliente_situacion smallint not null default 1
);

create table productos(
    producto_id serial primary key,
    producto_nombre varchar(50) not null,
    producto_precio decimal(10,2) not null,
    producto_situacion smallint not null default 1
);

CREATE TABLE ventas (
    venta_id serial primary key,
    venta_cliente int not null references clientes(cliente_id),
    venta_fecha datetime year to minute not null,
    venta_situacion char(1) not null default '1'
);
CREATE TABLE detalle_ventas (
    detalle_id serial primary key,
    detalle_venta int not null references ventas(venta_id),
    detalle_producto int not null references productos(producto_id),
    detalle_cantidad smallint not null,
    detalle_situacion char(1) not null default '1'
);
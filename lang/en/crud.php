<?php

return [
    'common' => [
        'actions' => 'Acciones',
        'create' => 'Crear',
        'edit' => 'Edita',
        'update' => 'Actualizar',
        'new' => 'Nuevo',
        'cancel' => 'Cancelar',
        'attach' => 'Adjuntar',
        'detach' => 'Excluir',
        'save' => 'Guardar',
        'delete' => 'Eliminar',
        'delete_selected' => 'Eliminar Selección',
        'search' => 'Buscar...',
        'back' => 'Volver al incio',
        'are_you_sure' => 'Esta usted seguro...?',
        'no_items_found' => 'Elemento no encontrado!',
        'created' => 'Creado satisfactoriamente',
        'saved' => 'Guardado satisfactoriamente',
        'removed' => 'Eliminado satisfactoriamente',
        'delete_error' => 'No puedes eliminar esta entrada porque tiene movimientos de salida asociados.',
    ],

    'users' => [
        'name' => 'Users',
        'index_title' => 'Lista de Usuarios',
        'new_title' => 'Nuevo Usuario',
        'create_title' => 'Crear Usuario',
        'edit_title' => 'Editar Usuario',
        'show_title' => 'Mostar Usuario',
        'inputs' => [
            'name' => 'Nombre',
            'email' => 'Correo',
            'password' => 'Contraseña',
            'localidad' => 'Localidad',
        ],
    ],

    'productos' => [
        'name' => 'Productos',
        'index_title' => 'Lista Productos',
        'new_title' => 'Producto Nuevo',
        'create_title' => 'Crear Producto',
        'edit_title' => 'Editar Producto',
        'show_title' => 'Mostar Producto',
        'inputs' => [
            'categoria' => 'Categoria',
            'nombre' => 'Nombre',
            'presentacion' => 'Presentacion',
            'concentracion' => 'Concentracion',
            'envase' => 'Envase',
            'unidad_medida' => 'Unidad Medida',
        ],
    ],

    'remitentes' => [
        'name' => 'Remitentes',
        'index_title' => 'Lista Remitentes',
        'new_title' => 'Nuevos Remitentes',
        'create_title' => 'Crear Remitentes',
        'edit_title' => 'Editar Remitentes',
        'show_title' => 'Mostrar Remitentes',
        'inputs' => [
            'nombre' => 'Nombre',
        ],
    ],

    'entradas' => [
        'name' => 'Entradas',
        'index_title' => 'Lista Entradas',
        'new_title' => 'Nueva Entrada',
        'create_title' => 'Crear Entrada',
        'edit_title' => 'Editar Entrada',
        'show_title' => 'Mostar Entradas',
        'inputs' => [
            'entrada_id' => 'Id Entrada',
            'producto_id' => 'Producto',
            'fecha' => 'Fecha',
            'numero_referencia' => 'Número Referencia',
            'cantidad' => 'Cantidad',
            'precio_unitario' => 'Precio Unitario',
            'fecha_vencimiento' => 'Fecha Vencimiento',
            'remitente_id' => 'Remitente',
            'numero_lote' => 'Número Lote',
            'reajuste_positivo' => 'Reajuste Positivo',
            
        ],
    ],

    'destinatarios' => [
        'name' => 'Destinatarios',
        'index_title' => 'Lsita Destinatarios',
        'new_title' => 'Nuevo Destinatario',
        'create_title' => 'Crear Destinatario',
        'edit_title' => 'Editar Destinatario',
        'show_title' => 'Mostar Destinatarios',
        'inputs' => [
            'nombre' => 'Nombre',
        ],
    ],

    'salidas' => [
        'name' => 'Salidas',
        'index_title' => 'Lista Salidas',
        'new_title' => 'Nueva Salida',
        'create_title' => 'Crear Salida',
        'edit_title' => 'Editar Salida',
        'show_title' => 'Mostrar Salidas',
        'inputs' => [
            'entrada_id' => 'Entrada',
            'nombre_producto' => 'Nombre Producto',
            'fecha' => 'Fecha',
            'numero_referencia' => 'Numero Referencia',
            'destinatario_id' => 'Destinatario',
            'fecha_vencimiento' => 'Fecha Vencimiento',
            'lote_salida' => 'Lote Salida',
            'cantidad_salida' => 'Cantidad Salida',
            'reajuste_negativo' => 'Reajuste Negativo',
        ],
    ],

    'roles' => [
        'name' => 'Roles',
        'index_title' => 'Lista Roles',
        'create_title' => 'Crear Role',
        'edit_title' => 'Editar Role',
        'show_title' => 'Mostar Roles',
        'inputs' => [
            'name' => 'Name',
        ],
    ],

    'permissions' => [
        'name' => 'Permissions',
        'index_title' => 'Permissions List',
        'create_title' => 'Create Permission',
        'edit_title' => 'Edit Permission',
        'show_title' => 'Show Permission',
        'inputs' => [
            'name' => 'Name',
        ],
    ],
];

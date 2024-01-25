<?php

return [
    'common' => [
        'actions' => 'Acciones',
        'create' => 'Create',
        'edit' => 'Edit',
        'update' => 'Update',
        'new' => 'New',
        'cancel' => 'Cancel',
        'attach' => 'Attach',
        'detach' => 'Detach',
        'save' => 'Save',
        'delete' => 'Delete',
        'delete_selected' => 'Delete selected',
        'search' => 'Search...',
        'back' => 'Back to Index',
        'are_you_sure' => 'Are you sure?',
        'no_items_found' => 'No items found',
        'created' => 'Successfully created',
        'saved' => 'Saved successfully',
        'removed' => 'Successfully removed',
    ],

    'users' => [
        'name' => 'Users',
        'index_title' => 'Users List',
        'new_title' => 'New User',
        'create_title' => 'Create User',
        'edit_title' => 'Edit User',
        'show_title' => 'Show User',
        'inputs' => [
            'name' => 'Name',
            'email' => 'Email',
            'password' => 'Password',
        ],
    ],

    'productos' => [
        'name' => 'Productos',
        'index_title' => 'Productos List',
        'new_title' => 'New Producto',
        'create_title' => 'Create Producto',
        'edit_title' => 'Edit Producto',
        'show_title' => 'Show Producto',
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
        'index_title' => 'Remitentes List',
        'new_title' => 'New Remitente',
        'create_title' => 'Create Remitente',
        'edit_title' => 'Edit Remitente',
        'show_title' => 'Show Remitente',
        'inputs' => [
            'nombre' => 'Nombre',
        ],
    ],

    'entradas' => [
        'name' => 'Entradas',
        'index_title' => 'Entradas List',
        'new_title' => 'New Entrada',
        'create_title' => 'Create Entrada',
        'edit_title' => 'Edit Entrada',
        'show_title' => 'Show Entrada',
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
        'index_title' => 'Destinatarios List',
        'new_title' => 'New Destinatario',
        'create_title' => 'Create Destinatario',
        'edit_title' => 'Edit Destinatario',
        'show_title' => 'Show Destinatario',
        'inputs' => [
            'nombre' => 'Nombre',
        ],
    ],

    'salidas' => [
        'name' => 'Salidas',
        'index_title' => 'Salidas List',
        'new_title' => 'New Salida',
        'create_title' => 'Create Salida',
        'edit_title' => 'Edit Salida',
        'show_title' => 'Show Salida',
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
        'index_title' => 'Roles List',
        'create_title' => 'Create Role',
        'edit_title' => 'Edit Role',
        'show_title' => 'Show Role',
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

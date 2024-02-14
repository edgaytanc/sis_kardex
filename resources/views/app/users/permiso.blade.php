@extends('layouts.app')

@section('content')
<style>

    #permisoToast .toast-header {
        background-color: #28a745; /* Un verde Bootstrap-like */
        color: white;
    }

    #permisoToast .toast-body {
        background-color: #28a745; /* Asegura coherencia en el fondo */
        color: white;
    }




</style>
<div class="container">
    <h2>Activar Permiso Especial de Usuario</h2>
    <table class="table table-striped table-hover">
        <thead>
            <tr>
                <th>Nombre</th>
                <th>Email</th>
                <th>Permiso Especial</th>
            </tr>
        </thead>
        <tbody>
            @foreach ($users as $user)
                <tr>
                    <td>{{ $user->name }}</td>
                    <td>{{ $user->email }}</td>
                    <td>
                        <label class="switch">
                            <input type="checkbox" class="permission-toggle" data-user-id="{{ $user->id }}" {{ $user->permiso ? 'checked' : '' }}>
                            <span class="slider round"></span>
                        </label>
                    </td>
                </tr>
            @endforeach
        </tbody>
    </table>
</div>


<div class=" position-fixed bottom-0 end-0 p-3" style="z-index: 5; right: 0; bottom: 0;">
    <div id="permisoToast" class="toast" role="alert" aria-live="assertive" aria-atomic="true">
        <div class="toast-header">
            <strong class="mr-auto">Notificación</strong>
            {{-- <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button> --}}
            <button type="button" class="ml-2 mb-1 close" data-dismiss="toast" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
        </div>
        <div class="toast-body">
            Aquí va el mensaje.
        </div>
    </div>
</div>


@endsection

@push('scripts')
<script>
    $(document).ready(function() {
        $('.permission-toggle').change(function() {
            var userId = $(this).data('user-id');
            var permiso = $(this).is(':checked') ? 1 : 0;

            $.ajax({
                url: '/users/' + userId + '/permission',
                type: 'POST',
                data: {
                    permiso: permiso,
                    _token: '{{ csrf_token() }}'
                },
                success: function(response) {
                    var toastElement = new bootstrap.Toast(document.getElementById('permisoToast'));
                    document.querySelector('#permisoToast .toast-body').textContent = 'Permiso actualizado correctamente.';
                    toastElement.show();
                },
                error: function(error) {
                    var toastElement = new bootstrap.Toast(document.getElementById('permisoToast'));
                    document.querySelector('#permisoToast .toast-body').textContent = 'Ocurrió un error al actualizar el permiso.';
                    toastElement.show();
                    console.log(error);
                }
            });
        });
    });
</script>
@endpush

@extends('layouts.app')

@section('content')
<div class="container">
    <h2>Seleccionar Usuario</h2>
    <form action="{{ route('process_user_selection') }}" method="POST">
        @csrf
        <div class="form-group">
            <label for="user_id">Usuarios:</label>
            <select name="user_id" id="user_id" class="form-control">
                @foreach ($users as $user)
                    <option value="{{ $user->id }}">{{ $user->name }}</option>
                @endforeach
            </select>
        </div>
        <button type="submit" class="btn btn-primary">Seleccionar</button>
    </form>
</div>

@endsection

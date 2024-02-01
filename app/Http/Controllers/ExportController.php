<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use App\Exports\UsersExport;
use App\Exports\DestinatariosExport;
use App\Exports\EntradasExport;
use App\Exports\RemitentesExport;
use App\Exports\SalidasExport;
use App\Models\Destinatario;
use Maatwebsite\Excel\Facades\Excel;

class ExportController extends Controller
{
    //vistas
    public function index()
    {
        return view('app.exports.users',[
            'users' => User::paginate()
        ]);
    }

    // public function index_destinatarios()
    // {
    //     return view('app..exports.destinatarios',[
    //         'destinatarios' => Destinatario::paginate()
    //     ]);
    // }


    //Exportaciones

    public function users()
    {
        return Excel::download(new UsersExport, 'users.xlsx');
    }

    public function destinatarios()
    {
        return Excel::download(new DestinatariosExport, 'destinatarios.xlsx');
    }

    public function remitentes()
    {
        return Excel::download(new RemitentesExport, 'remitentes.xlsx');
    }

    public function entradas()
    {
        return Excel::download(new EntradasExport, 'entradas.xlsx');
    }

    public function salidas()
    {
        return Excel::download(new SalidasExport, 'salidas.xlsx');
    }




}

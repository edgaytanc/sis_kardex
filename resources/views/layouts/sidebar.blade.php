<!-- Main Sidebar Container -->
<aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo -->
    <a href="{{ url('/home') }}" class="brand-link">
        <img src="https://vemto.app/favicon.png" alt="Vemto Logo" class="brand-image bg-white img-circle">
        {{-- <span class="brand-text font-weight-light">{{auth()->user()->localidad}}</span> --}}
    </a>

    <!-- Sidebar -->
    <div class="sidebar">

        <!-- Sidebar Menu -->
        <nav class="mt-2">
            <ul class="nav nav-pills nav-sidebar flex-column nav-child-indent" data-widget="treeview" role="menu">

                @auth
                <li class="nav-item">
                    <a href="{{ route('home') }}" class="nav-link">
                        <i class="nav-icon icon ion-md-pulse"></i>
                        <p>
                            Dashboard
                        </p>
                    </a>
                </li>

                {{-- @auth
                    @if(Auth::user()->hasRole('super-admin')) --}}
                        <li class="nav-item">
                            <a href="{{ route('export.index') }}" class="nav-link">
                                <i class="nav-icon icon ion-md-pulse"></i>
                                <p>
                                    Import/Export
                                </p>
                            </a>
                        </li>
                    {{-- @endif
                @endauth --}}


                <li class="nav-item">
                    <a href="#" class="nav-link">
                        <i class="nav-icon icon ion-md-apps"></i>
                        <p>
                            Apps
                            <i class="nav-icon right icon ion-md-arrow-round-back"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">
                            @can('view-any', App\Models\User::class)
                            <li class="nav-item">
                                <a href="{{ route('users.index') }}" class="nav-link">
                                    <i class="nav-icon icon ion-md-radio-button-off"></i>
                                    <p>Users</p>
                                </a>
                            </li>
                            @endcan
                            @can('view-any', App\Models\Producto::class)
                            <li class="nav-item">
                                <a href="{{ route('productos.index') }}" class="nav-link">
                                    <i class="nav-icon icon ion-md-radio-button-off"></i>
                                    <p>Productos</p>
                                </a>
                            </li>
                            @endcan
                            @can('view-any', App\Models\Remitente::class)
                            <li class="nav-item">
                                <a href="{{ route('remitentes.index') }}" class="nav-link">
                                    <i class="nav-icon icon ion-md-radio-button-off"></i>
                                    <p>Remitentes</p>
                                </a>
                            </li>
                            @endcan
                            @can('view-any', App\Models\Entrada::class)
                            <li class="nav-item">
                                <a href="{{ route('entradas.index') }}" class="nav-link">
                                    <i class="nav-icon icon ion-md-radio-button-off"></i>
                                    <p>Entradas</p>
                                </a>
                            </li>
                            @endcan
                            @can('view-any', App\Models\Destinatario::class)
                            <li class="nav-item">
                                <a href="{{ route('destinatarios.index') }}" class="nav-link">
                                    <i class="nav-icon icon ion-md-radio-button-off"></i>
                                    <p>Destinatarios</p>
                                </a>
                            </li>
                            @endcan
                            @can('view-any', App\Models\Salida::class)
                            <li class="nav-item">
                                <a href="{{ route('salidas.index') }}" class="nav-link">
                                    <i class="nav-icon icon ion-md-radio-button-off"></i>
                                    <p>Salidas</p>
                                </a>
                            </li>
                            @endcan
                    </ul>
                </li>


                <li class="nav-item">
                    <a href="#" class="nav-link">
                        <i class="nav-icon icon ion-md-document"></i>
                        <p>
                            Reportes
                            <i class="nav-icon right icon ion-md-arrow-round-back"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">
                        <!-- Tus otros enlaces de Apps aquí -->
                        <!-- ... -->

                        <!-- Agrega tu nuevo enlace aquí -->
                        @can('view-any', App\Models\Producto::class)
                        <li class="nav-item">
                            <a href="{{ route('seleccionar_producto') }}" class="nav-link">
                                <i class="nav-icon icon ion-md-radio-button-off"></i>
                                <p>Informe por Producto</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="{{ route('consolidado.kardex') }}" class="nav-link">
                                <i class="nav-icon icon ion-md-radio-button-off"></i>
                                <p>Consolidado Kardex</p>
                            </a>
                        </li>
                        @endcan

                        <!-- Continúa con tus otros enlaces -->
                        <!-- ... -->
                    </ul>
                </li>




                @if (Auth::user()->can('view-any', Spatie\Permission\Models\Role::class) ||
                    Auth::user()->can('view-any', Spatie\Permission\Models\Permission::class))
                <li class="nav-item">
                    <a href="#" class="nav-link">
                        <i class="nav-icon icon ion-md-key"></i>
                        <p>
                            Access Management
                            <i class="nav-icon right icon ion-md-arrow-round-back"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">
                        @can('view-any', Spatie\Permission\Models\Role::class)
                        <li class="nav-item">
                            <a href="{{ route('roles.index') }}" class="nav-link">
                                <i class="nav-icon icon ion-md-radio-button-off"></i>
                                <p>Roles</p>
                            </a>
                        </li>
                        @endcan

                        @can('view-any', Spatie\Permission\Models\Permission::class)
                        <li class="nav-item">
                            <a href="{{ route('permissions.index') }}" class="nav-link">
                                <i class="nav-icon icon ion-md-radio-button-off"></i>
                                <p>Permisos</p>
                            </a>
                        </li>
                        @endcan

                        @can('view-any', Spatie\Permission\Models\Permission::class)
                        <li class="nav-item">
                            <a href="{{ route('users.permisos') }}" class="nav-link">
                                <i class="nav-icon icon ion-md-radio-button-off"></i>
                                <p>Permiso Especial</p>
                            </a>
                        </li>
                        @endcan
                    </ul>
                </li>
                @endif
                @endauth

                @auth
                    @if(Auth::user()->hasRole('super-admin'))
                        <li class="nav-item">
                            <a href="{{route('select_user')}}" class="nav-link">
                                <i class="nav-icon icon ion-md-key"></i>
                                <p>
                                    Control Management
                                    {{-- <i class="nav-icon right icon ion-md-arrow-round-back"></i> --}}
                                </p>
                            </a>

                        </li>
                    @endif
                @endauth

                <li class="nav-item">
                    <a href="https://adminlte.io/docs/3.1//index.html" target="_blank" class="nav-link">
                        <i class="nav-icon icon ion-md-help-circle-outline"></i>
                        <p>Docs</p>
                    </a>
                </li>

                @auth
                <li class="nav-item">
                    <a class="nav-link" href="{{ route('logout') }}" onclick="event.preventDefault(); document.getElementById('logout-form').submit();">
                        <i class="nav-icon icon ion-md-exit"></i>
                        <p>{{ __('Logout') }}</p>
                    </a>

                    <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
                        @csrf
                    </form>
                </li>
                @endauth
            </ul>
        </nav>
        <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
</aside>

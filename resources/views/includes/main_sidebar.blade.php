<!-- Main Sidebar Container -->
<style>
    /* Mengubah warna teks menjadi putih */
.main-sidebar * {
    color: white !important;
}

/* Mengubah warna ikon menjadi putih (jika diperlukan) */
.main-sidebar .nav-icon {
    color: white !important;
}

/* Mengubah latar belakang (background-color) sidebar */
.main-sidebar {
    background-color: rgba(58, 96, 208, 255) !important;
}

</style>
<aside class="main-sidebar elevation-4" style = "z-index: 1040 !important; background-color:rgba(58,96,208,255)">
    <!-- Brand Logo -->
    <a 
    @can('admin-access')
        href="{{ route('admin.index') }}"
    @endcan
    @can('employee-access')
        href="{{ route('employee.index') }}"
    @endcan
    class="brand-link text-center">
        {{-- <img
            src="/dist/img/AdminLTELogo.png"
            alt="AdminLTE Logo"
            class="brand-image img-circle elevation-3"
            style="opacity: 0.8;"
        /> --}}
        <img src="/img/logo.png" alt="" style="max-width: 40%">
    </a>

    <!-- Sidebar -->
    <div class="sidebar">

        <!-- Sidebar Menu -->
        <nav class="mt-2">
            <ul
                class="nav nav-pills nav-sidebar flex-column"
                data-widget="treeview"
                role="menu"
                data-accordion="false"
            >
                @can('admin-access')

                <li class="nav-item">
                    <a href="#" class="nav-link">
                        <i class="nav-icon fas fa-tachometer-alt"></i>
                        <p>
                                Dashboard Admin
                            
                        </p>
                    </a>
                </li>
                @include('includes.admin.sidebar_items')
                @endcan
                @can('employee-access')
                <li class="nav-item">
                    <a href="{{ route('employee.index') }}" class="nav-link">
                        <i class="nav-icon fas fa-tachometer-alt"></i>
                        <p>
                                Dashboard Karyawan
                            
                        </p>
                    </a>
                </li>
                @include('includes.employee.sidebar_items')
                @endcan
            </ul>
        </nav>
        <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
</aside>

<div class="user-panel mt-3 pb-3 mb-3 d-flex">
    <div class="info">
        <a href="#" class="d-block">Absensi</a>
    </div>
</div>
<li class="nav-item has-treeview">
    <a href="#" class="nav-link">
        <i class="nav-icon fa fa-calendar-check-o"></i>
        <p>
            Karyawan
            <i class="fas fa-angle-left right"></i>
            <span class="badge badge-info right">3</span>
        </p>
    </a>
    <ul class="nav nav-treeview">
        <li class="nav-item">
            <a
                href="{{ route('admin.employees.create') }}"
                class="nav-link"
            >
                <i class="far fa-circle nav-icon"></i>
                <p>Tambah Karyawan</p>
            </a>
        </li>
        <li class="nav-item">
            <a
                href="{{ route('admin.employees.index') }}"
                class="nav-link"
            >
                <i class="far fa-circle nav-icon"></i>
                <p>Daftar Karyawan</p>
            </a>
        </li>
        <li class="nav-item">
            <a
                href="{{ route('admin.employees.attendance') }}"
                class="nav-link"
            >
                <i class="far fa-circle nav-icon"></i>
                <p>Absensi Karyawan</p>
            </a>
        </li>
    </ul>
</li>
<li class="nav-item has-treeview">
    <a href="#" class="nav-link">
        <i class="nav-icon fa fa-unlock-alt"></i>
        <p>
            Daftar Cuti Karyawan
            <i class="fas fa-angle-left right"></i>
            <span class="badge badge-info right">2</span>
        </p>
    </a>
    <ul class="nav nav-treeview">
        <li class="nav-item">
            <a
                href="{{ route('admin.leaves.index') }}"
                class="nav-link"
            >
                <i class="far fa-circle nav-icon"></i>
                <p>Cuti</p>
            </a>
        </li>
        <!-- <li class="nav-item">
            <a
                href="{{ route('admin.expenses.index') }}"
                class="nav-link"
            >
                <i class="far fa-circle nav-icon"></i>
                <p>Expenses</p>
            </a>
        </li> -->
    </ul>
</li>
<div class="user-panel mt-3 pb-3 mb-3 d-flex">
    <div class="info">
        <a href="#" class="d-block">Keperluan Streaming</a>
    </div>
</div>
<li class="nav-item">
    <a href="{{route('admin.pemakaians.index')}}" class="nav-link">
        <i class="nav-icon fas fa-tachometer-alt"></i>
        <p>
                Operasional
        </p>
    </a>
</li>
<li class="nav-item">
    <a href="{{route('admin.inventaris.index')}}" class="nav-link">
        <i class="nav-icon fas fa-tachometer-alt"></i>
        <p>
                Inventaris
            
        </p>
    </a>
</li>
<li class="nav-item">
    <a href="{{route('admin.jadwals.index')}}" class="nav-link">
        <i class="nav-icon fas fa-tachometer-alt"></i>
        <p>
                Jadwal
        </p>
    </a>
</li>
<div class="user-panel mt-3 pb-3 mb-3 d-flex">
    <div class="info">
        <a href="#" class="d-block">Management Akun Aplikasi</a>
    </div>
</div>
<li class="nav-item">
    <a href="#" class="nav-link" onclick="showAlert()">
        <i class="nav-icon fas fa-tachometer-alt"></i>
        <p>List Roles</p>
    </a>
</li>
<li class="nav-item">
    <a href="#" class="nav-link" onclick="showAlert()">
        <i class="nav-icon fas fa-tachometer-alt"></i>
        <p>Management Akun</p>
    </a>
</li>

<script>
    function showAlert() {
        alert("Maaf sedang dalam pengembangan - Nur Fitriani");
    }
</script>
<!-- <li class="nav-item has-treeview">
    <a href="#" class="nav-link">
        <i class="nav-icon fa fa-calendar-minus-o"></i>
        <p>
            Hari Libur
            <i class="fas fa-angle-left right"></i>
            <span class="badge badge-info right">2</span>
        </p>
    </a>
    <ul class="nav nav-treeview">
        <li class="nav-item">
            <a
                href="{{ route('admin.holidays.create') }}"
                class="nav-link"
            >
                <i class="far fa-circle nav-icon"></i>
                <p>Tambah Hari Libur</p>
            </a>
        </li>
        <li class="nav-item">
            <a
                href="{{ route('admin.holidays.index') }}"
                class="nav-link"
            >
                <i class="far fa-circle nav-icon"></i>
                <p>Daftar Hari Libur</p>
            </a>
        </li>
    </ul>
</li> -->
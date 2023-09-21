@extends('layouts.app')

@section('content')


    @if ($message = Session::get('success'))
        <div class="alert alert-success">
            <p>{{ $message }}</p>
        </div>
    @endif
    {{-- modal --}}
    <div class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1 class="m-0 text-dark">Daftar Jadwal</h1>
                </div>
                <!-- /.col -->
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item">
                            <a href="{{ route('admin.index') }}">Dashboard Admin</a>
                        </li>
                        <li class="breadcrumb-item active">
                            Daftar Jadwal
                        </li>
                    </ol>
                </div>
                <!-- /.col -->
            </div>
            <!-- /.row -->
        </div>
        <!-- /.container-fluid -->
    </div>
    <section class="content">

        <div class="container">
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <h6 class="m-0 font-weight-bold text-primary">Tabel Jadwal</h6>
                </div>
                <div class="col d-flex justify-content-center mt-2">
                    <div id='calendar' style="width:50%"></div>
                </div>
                <div class="card-body">
                    <div class="row">
                        <div class="col-lg-12 margin-tb">
                            <div class="pull-right">
                                <div class="d-sm-flex align-items-center justify-content-between mb-4">
                                    <h1 class="h3 mb-0 text-gray-800"></h1>
                                    {{-- @can('jadwal-create') --}}
                                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                                        <h1 class="h3 mb-0 text-gray-800"></h1>
                                       
                                          <!-- Button trigger modal -->
                                                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
                                                    Tambah Jadwal
                                                </button>
                                                
                                                <!-- Modal -->
                                                <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                    <div class="modal-dialog modal-xl" role="document">
                                                    <div class="modal-content ">
                                                        <div class="modal-header">
                                                        <h5 class="modal-title" id="exampleModalLabel">Tambah Jadwal</h5>
                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                            <span aria-hidden="true">&times;</span>
                                                        </button>
                                                        </div>
                                                        <div class="modal-body">
                                                            <form action="{{ route('admin.jadwals.store') }}" method="POST" enctype="multipart/form-data">
                                                                @csrf  
                                                                <div class="form-row">
                                                                    <div class="form-group col-md-6">
                                                                        <label for="inputPassword4">Judul Acara</label>
                                                                        <input type="text" class="form-control @error('title') is-invalid @enderror" name="title" value="{{ old('title') }}" placeholder="Masukkan Judul Acara">
                                                                    </div>
                                                                    <div class="form-group col-md-6">
                                                                        <label for="inputPassword4">Tanggal Mulai Acara</label>
                                                                        <input type="date" class="form-control @error('start_date') is-invalid @enderror" name="start_date" value="{{ old('start_date') }}" placeholder="Masukkan Nama Barang">
                                                                    </div>
                                                                    {{-- <div class="form-group col-md-6">
                                                                        <label for="inputPassword4">Tanggal Selesai Acara</label>
                                                                        <input type="date" class="form-control @error('end_date') is-invalid @enderror" name="end_date" value="{{ old('end_date') }}" placeholder="Masukkan Nama Barang">
                                                                    </div> --}}
                                                                    <div class="form-group col-md-6">
                                                                        <label for="inputPassword4">keterangan Acara</label>
                                                                        <input type="text" class="form-control @error('description') is-invalid @enderror" name="description" value="{{ old('description') }}" placeholder="Masukkan keterangan Acara">
                                                                    </div>
                                                                    <div class="form-group col-md-6">
                                                                        <label for="inputPassword4">Jam Acara</label>
                                                                        <input type="time" class="form-control @error('jam_acara') is-invalid @enderror" name="jam_acara" value="{{ old('jam_acara') }}" placeholder="Masukkan keterangan Acara">
                                                                    </div>
                                                                </div>
                                                                <div class="modal-footer">
                                                                    <button type="submit" class="btn btn-primary">Simpan</button>
                                                                </div>
                                                            </form>
                                                        </div>
                                                    </div>
                                                </div>
                                            {{-- <a class="btn btn-success" href="{{ route('inventaris.create') }}"> Create New inventaris </a> --}}
                                      
                                    </div>
                                    {{-- @endcan --}}
                                </div>
    
                            </div>
                        </div>
                    </div>
                    <div class="table-responsive">
                        <table id="example" class="table table-bordered text-center">
                            <thead>
                                <tr>
                                    <th>Judul Acara</th>
                                    <th>Keterangan Acara</th>
                                    <th>Tanggal Pelaksanaan</th>
                                    <th width="280px"></th>
                                </tr>
                            </thead>
    
                            @foreach ($jadwals as $product)
                            <tr>
                                <td>{{ $product->title }}</td>
                                <td>{{ $product->description }}</td>
                                <td>{{ $product->start_date}}</td>
                                <td>
                                
                                    <form action="{{ route('admin.jadwals.delete',$product->id) }}" method="POST">
                                        @csrf
                                        @method('DELETE')
                                        <button type="submit" class="btn btn-danger">Hapus</button>
                                      
                                     
                                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#edit{{ $product->id }}">
                                            Edit
                                        </button>
                                      
                                    </form>
                                    <div class="modal fade" id="edit{{ $product->id }}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                        <div class="modal-dialog" role="document">
                                        <div class="modal-content ">
                                            <div class="modal-header">
                                            <h5 class="modal-title" id="exampleModalLabel">Edit Jadwal</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                            </div>
                                            <div class="modal-body">
                                                <form action="{{ route('admin.jadwals.update',[$product->id]) }}" method="POST" enctype="multipart/form-data">
                                                    @csrf  
                                                    @method('PUT')
                                                    {{-- <form action="{{ route('admin.jadwals.update',[$product->id]) }}" method="POST" enctype="multipart/form-data"> --}}
                                                        @csrf  
                                                            <div class="form-group ">
                                                                <label for="inputPassword4">Judul Acara</label>
                                                                <input type="text" class="form-control @error('title') is-invalid @enderror" value="{{ $product->title }}" name="title" value="{{ old('title') }}" placeholder="Masukkan Judul Acara">
                                                            </div>
                                                            <div class="form-group ">
                                                                <label for="inputPassword4">Tanggal Mulai Acara</label>
                                                                <input type="date" class="form-control @error('start_date') is-invalid @enderror"  value="{{ $product->start_date }}" name="start_date" value="{{ old('start_date') }}" placeholder="Masukkan Nama Barang" required> 
                                                            </div>
                                                            
                                                            <div class="form-group ">
                                                                <label for="inputPassword4">Jam Acara</label>
                                                                <input type="time" class="form-control @error('jam_acara') is-invalid @enderror" value="{{ $product->jam_acara }}" name="jam_acara" value="{{ old('description') }}" placeholder="Masukkan keterangan Acara">
                                                            </div>
                                                            <div class="form-group ">
                                                                <label for="inputPassword4">keterangan Acara</label>
                                                                <input type="text" class="form-control @error('description') is-invalid @enderror" value="{{ $product->description }}" name="description" value="{{ old('description') }}" placeholder="Masukkan keterangan Acara">
                                                            </div>
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="submit" class="btn btn-primary">Simpan</button>
                                                        </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            @endforeach
                        </table>
                        {{-- {!! $jadwals->links() !!} --}}
                    </div>
                </div>
            </div>
    
        </div>
    </section>
   



@endsection

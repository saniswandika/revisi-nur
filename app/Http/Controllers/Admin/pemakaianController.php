<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Event;
use App\Models\inventaris;
use App\Models\pemakaian;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
class pemakaianController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */


    private $checkRoles ;
    function __construct()
    {
       
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $jadwals = DB::table('events')->get();
        $pemakaian = DB::table('pemakaians')->get();
        $barang = DB::table('inventaris')->orderByDesc('created_at')->get();

        return view('pemakaians.index', compact('pemakaian', 'barang', 'jadwals'))
            ->with('i', (request()->input('page', 1) - 1) * 5);
    }

    public function create()
    {
        $checkRoles = $this->checkRoles->getRoles();
        return view('pemakaians.create', compact('checkRoles'));
    }

    public function store(Request $request)
    {
        $data = [
            'Nama_Pemakaian' => $request->input('Nama_Pemakaian'),
            'Nama_barang' => json_encode($request->input('Nama_barang')),
            'tanggal_pakai' => $request->input('tanggal_pakai'),
            'jam_mulai' => $request->input('jam_mulai'),
            'jam_selesai' => $request->input('jam_selesai'),
            'Keterangan' => $request->input('Keterangan'),
            'pj_pemakaian' => Auth::user()->name,
        ];

        DB::table('pemakaians')->insert($data);

        return redirect()->route('admin.pemakaians.index')
            ->with('success', 'pemakaian created successfully.');
    }

    public function show($id)
    {
        $pemakaian = DB::table('pemakaians')->find($id);
        $checkRoles = $this->checkRoles->getRoles();

        return view('pemakaians.show', compact('pemakaian', 'checkRoles'));
    }

    public function edit($id)
    {
        $checkRoles = $this->checkRoles->getRoles();
        $pemakaian = DB::table('pemakaians')->find($id);

        return view('pemakaians.edit', compact('pemakaian', 'checkRoles'));
    }

    public function update(Request $request, $id)
    {
        $data = [
            'Nama_Pemakaian' => $request->input('Nama_Pemakaian'),
            'Nama_barang' => json_encode($request->input('Nama_barang')),
            'tanggal_pakai' => $request->input('tanggal_pakai'),
            'jam_mulai' => $request->input('jam_mulai'),
            'jam_selesai' => $request->input('jam_selesai'),
            'Keterangan' => $request->input('Keterangan'),
            'pj_pemakaian' => Auth::user()->name,
        ];

        DB::table('pemakaians')->where('id', $id)->update($data);

        return redirect()->route('pemakaians.index')
            ->with('success', 'pemakaian updated successfully');
    }

    public function destroy($id)
    {
        DB::table('pemakaians')->where('id', $id)->delete();

        return redirect()->route('pemakaians.index')
            ->with('success', 'pemakaian deleted successfully');
    }
}

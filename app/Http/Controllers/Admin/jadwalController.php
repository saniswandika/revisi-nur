<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Event;
use App\Models\jadwal;
use Illuminate\Http\Request;

use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\DB;

class jadwalController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    // function __construct()
    // {
    //      $this->middleware('permission:jadwal-list|jadwal-create|jadwal-edit|jadwal-delete', ['only' => ['index','show']]);
    //      $this->middleware('permission:jadwal-create', ['only' => ['create','store']]);
    //      $this->middleware('permission:jadwal-edit', ['only' => ['edit','update']]);
    //      $this->middleware('permission:jadwal-delete', ['only' => ['destroy']]);
    // }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */

    private $checkRoles;

    public function __construct()
    {
     
    }

    public function index(Request $request)
    {
        
        $jadwals = DB::table('events')
            ->orderBy('created_at', 'desc')
            ->get();

        return view('jadwals.index', compact('jadwals'));
    }

    public function create()
    {
        return view('jadwals.create');
    }

    public function store(Request $request)
    {
        $data = [
            'title' => $request->input('title'),
            'start_date' => $request->input('start_date'),
            'description' => $request->input('description'),
            'jam_acara' => $request->input('jam_acara'),
        ];

        DB::table('events')->insert($data);

        return redirect()->route('admin.jadwals.index')
            ->with('success', 'jadwal created successfully.');
    }

    public function show($id)
    {
        $jadwal = DB::table('events')->find($id);

        return view('jadwal.show', compact('jadwal'));
    }

    public function edit($id)
    {
        $checkRoles = $this->checkRoles->getRoles();
        $jadwal = DB::table('events')->find($id);

        return view('jadwals.edit', compact('jadwal', 'checkRoles'));
    }

    public function update(Request $request, $id)
    {
        $data = [
            'title' => $request->input('title'),
            'start_date' => $request->input('start_date'),
            'description' => $request->input('description'),
            'jam_acara' => $request->input('jam_acara'),
        ];

        DB::table('events')->where('id', $id)->update($data);

        return redirect()->route('admin.jadwals.index')
            ->with('success', 'jadwal updated successfully');
    }

    public function destroy($id)
    {
        DB::table('events')->where('id', $id)->delete();

        return redirect()->route('admin.jadwals.index')
            ->with('success', 'jadwal deleted successfully');
    }
}

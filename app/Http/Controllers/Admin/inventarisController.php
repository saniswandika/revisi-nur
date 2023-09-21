<?php

namespace App\Http\Controllers\Admin;

use App\Event;
use Illuminate\Http\Request;
use App\inventaris;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;

class inventarisController extends Controller
{

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
        // $checkRoles = $this->checkRoles->getRoles();
        $jadwals = DB::table('events')->get();
        // Fetch inventaris data using raw SQL query
        $inventaris = DB::table('inventaris')
            ->orderBy('jenis_barang')
            ->get();

        // Fetch inventaris data with additional sorting and grouping
        $data = DB::table('inventaris')
            ->orderBy('jenis_barang')
            ->orderBy('nama_barang')
            ->orderByDesc('created_at')
            ->get();

        $groupedData = $data->groupBy('jenis_barang');
        // dd($data);
        // dd($inventaris);
        // $inventaris = inventaris::all();
       
        // $data = inventaris::where('jenis_barang', $inventaris->jenis_barang)->count(); 
        // dd($result);
        return view('inventaris.index',compact('inventaris','jadwals','groupedData'))
            ->with('i', (request()->input('page', 1) - 1) * 5);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $data = $request->validate([
            'nama_barang' => 'required',
            'jenis_barang' => 'required',
            // 'jumlah' => 'required',
        ]);
    
        // Construct the raw SQL query
        $query = "INSERT INTO inventaris (nama_barang, jenis_barang, created_at, updated_at) VALUES (?, ?, ?, ?)";
    
        // You can set the created_at and updated_at columns as needed, or use the current timestamp
        $currentTimestamp = now();
    
        // Bind the values to the query and execute it
        DB::insert($query, [
            $data['nama_barang'],
            $data['jenis_barang'],
            $currentTimestamp,
            $currentTimestamp,
        ]);
    
        return redirect()->back()->with('success', 'pemakaian created successfully.');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $request->validate([
            'nama_barang' => 'required',
            'jenis_barang' => 'required',
        ]);
    
        // Construct the raw SQL query for the update
        $query = "UPDATE inventaris SET nama_barang = ?, jenis_barang = ?, updated_at = ? WHERE id = ?";
    
        // You can set the updated_at column as needed, or use the current timestamp
        $currentTimestamp = now();
    
        // Execute the raw SQL query
        DB::update($query, [
            $request->input('nama_barang'),
            $request->input('jenis_barang'),
            $currentTimestamp,
            $id,
        ]);
    
        return redirect()->route('admin.inventaris.index')
            ->with('success', 'inventaris updated successfully');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        DB::table("inventaris")->where('id',$id)->delete();

        return redirect()->route('admin.inventaris.index')
                        ->with('success','inventaris deleted successfully');
    }
}

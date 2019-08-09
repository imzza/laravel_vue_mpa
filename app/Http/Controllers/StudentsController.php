<?php

namespace App\Http\Controllers;

use App\Student;
use Illuminate\Http\Request;
use App\Http\Resources\StudentResource;

class StudentsController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return  response()->json(StudentResource::collection(Student::all()), 200);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {

        $request->validate([
            'about' => 'required|min:100',
            'address' => 'required',
            'city' => 'required',
            'email' => 'required',
            'first_name' => 'required',
            'gender' => 'required',
            'image' => 'required',
            'last_name' => 'required',
            'password' => 'required',
            'state' => 'required',
            'zip' => 'required',
        ]);


        $name="";
        if($request->get('image')) {
          $image = $request->get('image');
          $name = time().'.' . explode('/', explode(':', substr($image, 0, strpos($image, ';')))[1])[1];
          \Image::make($request->get('image'))->save(public_path('images/').$name);
        }

        $student = new Student();
        $student->about = $request->about;
        $student->address = $request->address;
        $student->address2 = $request->address2;
        $student->city = $request->city;
        $student->email = $request->email;
        $student->first_name = $request->first_name;
        $student->gender = $request->gender;
        $student->image = $name;
        $student->last_name = $request->last_name;
        $student->password = $request->password;
        $student->state = $request->state;
        $student->zip = $request->zip;


        if ($request->exists('offers')) {
            $student->offers = $request->offers;
        }


        $student->save();
        if ($student->id) {
            return response()->json($student,201);
        }else{
            return response()->json(['message' => 'Bad Request'], 400);
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Student  $student
     * @return \Illuminate\Http\Response
     */
    public function show(Student $student)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Student  $student
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Student $student)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Student  $student
     * @return \Illuminate\Http\Response
     */
    public function destroy(Student $student)
    {
        //
    }
}

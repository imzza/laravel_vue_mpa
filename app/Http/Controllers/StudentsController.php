<?php

namespace App\Http\Controllers;

use App\Student;
use Illuminate\Http\Request;
use App\Http\Resources\StudentResource;


class StudentsController extends Controller {
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request) {
        $sortRules = $request->input('sort');
        $limit = $request->input('per_page');
        list($field, $dir) = explode('|', $sortRules);

        $result = Student::orderBy($field, $dir);
        if ($request->filter != '') {
            $result = $result->where('first_name', 'like', '%'.$request->filter.'%');
            $result = $result->orWhere('last_name', 'like', '%'.$request->filter.'%');
            $result = $result->orWhere('email', 'like', '%'.$request->filter.'%');
            $result = $result->orWhere('address', 'like', '%'.$request->filter.'%');
            $result = $result->orWhere('about', 'like', '%'.$request->filter.'%');
        }
        $result = $result->paginate($limit);

        return response()->json($result, 200);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request) {
        $request->validate([
            'about' => 'required|min:100',
            'address' => 'required',
            'city' => 'required',
            'email' => 'required|unique:students',
            'first_name' => 'required',
            'gender' => 'required',
            'image' => 'required',
            'last_name' => 'required',
            'password' => 'required',
            'state' => 'required',
            'zip' => 'required'
        ]);

        $name = '';
        if ($request->get('image')) {
            $image = $request->get('image');
            $name = time() . '.' . explode('/', explode(':', substr($image, 0, strpos($image, ';')))[1])[1];

            if (!file_exists(public_path('images/'))) {
                mkdir(public_path('images/'), 666, true);
            }

            \Image::make($request->get('image'))->save(public_path('images/') . $name);
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
            return response()->json($student, 201);
        } else {
            return response()->json(['message' => 'Bad Request'], 400);
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Student  $student
     * @return \Illuminate\Http\Response
     */
    public function show(Student $student) {
        if ($student->image != '') {
            $student->image_link = url('public/images/' . $student->image);
            $student->image = '';
        }
        return response()->json($student, 200);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Student  $student
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Student $student) {
        $request->validate([
            'about' => 'required|min:100',
            'address' => 'required',
            'city' => 'required',
            'email' => 'required',
            'email' => 'required|unique:students,email,'.$student->id,
            'first_name' => 'required',
            'gender' => 'required',
            'last_name' => 'required',
            'password' => 'required',
            'state' => 'required',
            'zip' => 'required'
        ]);

        $name = '';

        if ($request->get('image') && $request->image != '') {
            $image = $request->get('image');
            $name = time() . '.' . explode('/', explode(':', substr($image, 0, strpos($image, ';')))[1])[1];

            if (!file_exists(public_path('images/'))) {
                mkdir(public_path('images/'), 666, true);
            }

            \Image::make($request->get('image'))->save(public_path('images/') . $name);
        }

        $student->about = $request->about;
        $student->address = $request->address;
        $student->address2 = $request->address2;
        $student->city = $request->city;
        $student->email = $request->email;
        $student->first_name = $request->first_name;
        $student->gender = $request->gender;
        if ($name != '') {
            $student->image = $name;
        }
        $student->last_name = $request->last_name;
        $student->password = $request->password;
        $student->state = $request->state;
        $student->zip = $request->zip;

        if ($request->exists('offers')) {
            $student->offers = $request->offers;
        }

        $res = $student->save();
        dd($res);
        if ($student->id) {
            return response()->json($student, 201);
        } else {
            return response()->json(['message' => 'Bad Request'], 400);
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Student  $student
     * @return \Illuminate\Http\Response
     */
    public function destroy(Student $student) {
        $student->delete();
        return response()->json(null, 204);
    }
}

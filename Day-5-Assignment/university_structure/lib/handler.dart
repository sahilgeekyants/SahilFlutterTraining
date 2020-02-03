class Handler{
  int studentCount;
  int professorCount;
  Map<int,Student> students;
  Map<int,Professor> professors;
  Handler(){
    studentCount = 0;
    professorCount = 0;
    students = Map<int,Student>();
    professors = Map<int,Professor>();
    initialize();
  }
  void initialize(){
    students[++studentCount] = Student(rollNumber:12,avrMarks:70,seminarsCount:9,age:21,name:'Sahil Garg',phoneNo:'8901119226',email:'garg.boy@outlook.com',
                              street:'Railway Road',city:'Tohana',state:'Haryana',postalCode:'125120',country:'INDIA',uni_name:'AKTU',uni_phoneNo:'7879134856',
                              uni_email:'aktu@gmail.com',branchId:101,branchName:'NIET',branchLocation:'Greater Noida',courseId:11,courseName:'B.Tech',
                              uni_street:'MANOHAR',uni_city:'LUCKNOW',uni_state:'UTTAR PRADESH',uni_postalCode:'226005',uni_country:'INDIA');
    students[++studentCount] = Student(rollNumber:11,avrMarks:75,seminarsCount:11,age:22,name:'Shubham Srivastava',phoneNo:'7857601342',email:'shubham@gmail.com',
                              street:'Mohan',city:'Gorakhpur',state:'UTTAR PRADESH',postalCode:'201206',country:'INDIA',uni_name:'AKTU',uni_phoneNo:'7879134856',
                              uni_email:'aktu@gmail.com',branchId:101,branchName:'NIET',branchLocation:'Greater Noida',courseId:11,courseName:'B.Tech',
                              uni_street:'MANOHAR',uni_city:'LUCKNOW',uni_state:'UTTAR PRADESH',uni_postalCode:'226005',uni_country:'INDIA');
    students[++studentCount] = Student(rollNumber:13,avrMarks:79,seminarsCount:5,age:21,name:'Sahil Garg',phoneNo:'8901119226',email:'garg.boy@outlook.com',
                              street:'Railway Road',city:'Tohana',state:'Haryana',postalCode:'125120',country:'INDIA',uni_name:'AKTU',uni_phoneNo:'7879134856',
                              uni_email:'aktu@gmail.com',branchId:102,branchName:'ABES',branchLocation:'Ghaziabad',courseId:12,courseName:'MBA',
                              uni_street:'MANOHAR',uni_city:'LUCKNOW',uni_state:'UTTAR PRADESH',uni_postalCode:'226005',uni_country:'INDIA');
    professors[++professorCount] = Professor(salary:70000,employeeId:1011,age:42,name:'Bhupendra Kumar',phoneNo:'9865370124',email:'bhupendrakumar@gmail.com',
                              street:'Rathi',city:'NOIDA',state:'UTTAR PRADESH',postalCode:'110096',country:'INDIA',uni_name:'AKTU',uni_phoneNo:'7879134856',
                              uni_email:'aktu@gmail.com',branchId:101,branchName:'NIET',branchLocation:'Greater Noida',courseId:11,courseName:'B.Tech',
                              uni_street:'MANOHAR',uni_city:'LUCKNOW',uni_state:'UTTAR PRADESH',uni_postalCode:'226005',uni_country:'INDIA');
    professors[++professorCount] = Professor(salary:80000,employeeId:1012,age:47,name:'Pitambar Sharma',phoneNo:'9865370124',email:'pitambarsharma@gmail.com',
                              street:'Roshan',city:'NOIDA',state:'UTTAR PRADESH',postalCode:'110096',country:'INDIA',uni_name:'AKTU',uni_phoneNo:'7879134856',
                              uni_email:'aktu@gmail.com',branchId:102,branchName:'NIET',branchLocation:'Greater Noida',courseId:12,courseName:'MBA',
                              uni_street:'MANOHAR',uni_city:'LUCKNOW',uni_state:'UTTAR PRADESH',uni_postalCode:'226005',uni_country:'INDIA');
  }
  void begin(){
    print('\n----List of Students----');
    for(var entry in students.entries){
      print('\n${entry.key}. ${entry.value.getStudentDetails().toString()}');
    }
    print('\n----List of Professors----');
    for(var entry in professors.entries){
      print('\n${entry.key}. ${entry.value.getProfessorDetails().toString()}');
    }
  }
}

abstract class Address{
  String street,city,state,postalCode,country;
  Address( this.street, this.city, this.state, this.postalCode, this.country);
  Map getAddress(){
    return {'Street':street,'City':city,'State':state,'PostalCode':postalCode,'Country':country};
  }
}

abstract class Person implements Address{
  String name,phoneNo,email;
  int age;
  void getPersonDetails(){}
}

abstract class Branch {
  Map<String, Object> branch;// = {'id': 101,'name': 'NIET','location':'Noida'};
  void getBranch(){}
}

abstract class Course {
  Map<String, Object> course;// = {'id': 11,'name': 'MBA'};
  void getCourse(){}
}

class University extends Address implements Branch , Course{
  String name,phoneNo,email;
  @override
  Map<String, Object> branch;
  @override
  Map<String, Object> course;

  University(this.name,this.phoneNo,this.email,int branchId,String branchName,String branchLocation,int courseId,String courseName,
              String street,String city,String state,String postalCode, String country) : super(street,city,state,postalCode,country) {
    branch = {'id': branchId,'name': branchName,'location':branchLocation};
    course = {'id': courseId,'name': courseName};
  }
  Map getUniversityDetails(){
    return {'Name':name,'Phone No':phoneNo,'Email':email, 'Address':super.getAddress(), 'Branch':getBranch(), 'Course':getCourse()};
  }
  @override
  Map getBranch() {
    return branch;
  }
  @override
  Map getCourse() {
    return course;
  }
}

class Student extends University implements Person {
  int rollNumber,avrMarks,seminarsCount;    // avrMarks should be out of 100
  @override
  int age;
  @override
  String name,phoneNo,email,street,city,state,postalCode,country; 
  Student({this.rollNumber,this.avrMarks,this.seminarsCount,
          this.age,this.name,this.phoneNo,this.email,this.street,this.city,this.state,this.postalCode,this.country,
          String uni_name,String uni_phoneNo,String uni_email,int branchId,String branchName,String branchLocation,int courseId,
          String courseName,String uni_street,String uni_city,String uni_state,String uni_postalCode,String uni_country}):
          super(uni_name,uni_phoneNo,uni_email,branchId,branchName,branchLocation,courseId,courseName,uni_street,uni_city,
          uni_state,uni_postalCode,uni_country); //pending here
  Map getStudentDetails(){
    return {'Roll':rollNumber,'Average':avrMarks,'Seminars':seminarsCount,'PersonInfo':getPersonDetails(),'Address':getAddress()};
    
  }
  @override
  Map getAddress() {
    return {'Street':street,'City':city,'State':state,'PostalCode':postalCode,'Country':country};
  }
  @override
  Map getPersonDetails() {
    return {'Name':name,'Age':age,'PhoneNo':phoneNo,'Email':email};
  }
}

class Professor extends University implements Person {
  int salary;     //  INR per month
  int employeeId;
  @override
  int age;
  @override
  String name,phoneNo,email,street,city,state,postalCode,country; 
  Professor({this.salary,this.employeeId,
            this.age,this.name,this.phoneNo,this.email,this.street,this.city,this.state,this.postalCode,this.country,
            String uni_name,String uni_phoneNo,String uni_email,int branchId,String branchName,String branchLocation,int courseId,
            String courseName,String uni_street,String uni_city,String uni_state,String uni_postalCode,String uni_country}):
            super(uni_name,uni_phoneNo,uni_email,branchId,branchName,branchLocation,courseId,courseName,uni_street,uni_city,
            uni_state,uni_postalCode,uni_country);
  Map getProfessorDetails(){
    return {'Salary':salary,'EmployeeId':employeeId,'PersonInfo':getPersonDetails(),'Address':getAddress()};
  }
  @override
  Map getAddress() {
    return {'Street':street,'City':city,'State':state,'PostalCode':postalCode,'Country':country};
  }
  @override
  Map getPersonDetails() {
    return {'Name':name,'Age':age,'PhoneNo':phoneNo,'Email':email};
  }
}
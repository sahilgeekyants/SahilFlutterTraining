class Handler{
  int universityCount;
  Map<int,University> universities;
  Handler(){
    universityCount =0;
    universities = Map<int, University>();
    initialize();
    print('Inside Handler');
  }
  void initialize(){
    universities[1] = University(name:'AKTU', phoneNo:'7879134856', email:'aktu@gmail.com', street:'MANOHAR', city:'LUCKNOW', state:'UTTAR PRADESH', postalCode:'226005', country:'INDIA');
    universities[1].addBranch(101,'NIET', 'Greater Noida');     //Adding branches to the university
    universities[1].addBranch(102,'ABES', 'Ghaziabad');
    universities[1].addBranch(103,'Campus', 'LUCKNOW');
    universities[1].addCourse(11, 'B.Tech');     //Adding Courses to the university
    universities[1].addCourse(12, 'BCA');
    universities[1].addCourse(13, 'M.Tech');
    universities[1].addCourse(14, 'MCA');
    universities[1].addCourse(15, 'B.Pharma');
    universities[1].addCourse(16, 'MBA');
    universities[1].addProfessor(101, 11, 70000, 'Bhupendra Kumar', '9865370124', 'bhupendrakumar@gmail.com', 43, 'Rathi','NOIDA', 'UTTAR PRADESH', '110096', 'INDIA'); //Adding professor
    universities[1].addProfessor(102, 13, 80000, 'Pooja Singh', '8175650124', 'poojasingh@gmail.com', 43, 'Rathi','NOIDA', 'UTTAR PRADESH', '110096', 'INDIA');
    universities[1].addProfessor(103, 11, 90000, 'Pitambar Sharma', '7835370214', 'pitambarsharma@gmail.com', 43, 'Rathi','NOIDA', 'UTTAR PRADESH', '110096', 'INDIA');
    universities[1].addStudent(101, 11, 1613081, 70, 8, 'Sahil Garg', '8901119226', 'garg.boy@outlook.com', 21, 'Railway Road', 'Tohana', 'Haryana', '125120', 'INDIA'); //Adding students
    universities[1].addStudent(101, 16, 1613065, 78, 12, 'Shubham', '7857601342', 'shubham@gmail.com', 22, 'Mohan', 'Gorakhpur', 'UTTAR PRADESH', '201206', 'INDIA');
    universities[2] = University(name:'GGSIPU', phoneNo:'8931584627', email:'ggsipu@gmail.com', street:'VILAS', city:'NEW DELHI', state:'NEW DELHI', postalCode:'110006', country:'INDIA');
    universities[2].addBranch(201, 'Campus', 'NEW DELHI');     //Adding branches to the university
    universities[2].addBranch(202, 'United', 'GREATER NOIDA');
    universities[2].addCourse(11, 'B.Tech');     //Adding Courses to the university
    universities[2].addCourse(12, 'BCA');
    universities[2].addCourse(13, 'M.Tech');
    universities[2].addCourse(14, 'MCA');
    universities[3] = University(name:'BITS', phoneNo:'9418719725', email:'bits@gmail.com', street:'ROSHAN', city:'PILANI', state:'RAJASTHAN', postalCode:'333031', country:'INDIA');
    universities[4] = University(name:'PRINCETON', phoneNo:'6520389698', email:'princeton@gmail.com', street:'ROSEBURG', city:'PRINCETON', state:'NEW JERSEY', postalCode:'08544', country:'UNITED STATES');
    universityCount =4;
  }
  void begin(){
    getUniversitiesList();
    getUniversityBranches(1);   // universityId from getUniversitiesList
    getUniversityCourses(1);
    getStudentsList(1);
  }
  void getUniversitiesList(){
    print('----List of Universities----\n Sr No.\t Name\t\t City\n--------------------------------------------------------------');
    for(var entry in universities.entries){
      print('  ${entry.key}\t${entry.value.getUniversityDetails()['Name']}\t\t ${entry.value.getUniversityDetails()['Address']['City']}');
    }
  }
  void getUniversityBranches(int universityId){
    print('\n\n----List of Branches in ${universities[universityId].getUniversityDetails()['Name']}----\n Branch Id\t Name\t\t Location');
    print('--------------------------------------------------------------');
    for(var entry in universities[universityId].getBranches().entries){
      print('     ${entry.key}\t${entry.value.branchName}\t\t${entry.value.branchLocation}');
    }
  }
  void getUniversityCourses(int universityId){
    print('\n\n----List of Courses in ${universities[universityId].getUniversityDetails()['Name']}----\n Course Id\t Name');
    print('-----------------------------------------------');
    for(var entry in universities[universityId].getCourses().entries){
      print('    ${entry.key}\t\t${entry.value.courseName}');
    }
  }
  void getStudentsList(int universityId){
    print('\n\n----List of Students in ${universities[universityId].getUniversityDetails()['Name']}----');
    print('\n Roll No.\tName   \tAge\tBranch \tCourse\tAverage Marks\tSeminars Attended');
    print('------------------------------------------------------------------------------------');
    for(var entry in universities[universityId].getStudentList()){
      print('${entry.rollNumber}\t${entry.name}\t${entry.age}\t${entry.branchName}\t${entry.courseName}\t  ${entry.avrMarks}  \t      ${entry.seminarsCount}');
    }
  }
}

class Address{
  String street;
  String city;
  String state;
  String postalCode;
  String country;
  Address( this.street, this.city, this.state, this.postalCode, this.country);
  Map getAddress(){
    return {'Street':street,'City':city,'State':state,'PostalCode':postalCode,'Country':country};
  }
}

class Person extends Address{
  String name;
  String phoneNo;
  String email;
  int age;
  Person( this.name, this.phoneNo, this.email,this.age,String street,String city,String state,String postalCode,
          String country) : super(street,city,state,postalCode,country);
  Map getPersonalDetails(){
    return {'Name':name,'Phone No':phoneNo,'Email':email, 'Address':super.getAddress()};
  }
}

class Branch {
  int branchId;   // It should be unique 
  String branchName;
  String branchLocation;
  Branch(this.branchId,this.branchName, this.branchLocation);
}

class Course {
  int courseId;
  String courseName;
  Course(this.courseId,this.courseName);
}

class Student extends Person implements Branch, Course {
  int rollNumber;
  int avrMarks;       // out of 100
  int seminarsCount;
  @override
  int branchId;
  @override
  String branchName;
  @override
  String branchLocation;
  @override
  int courseId;
  @override
  String courseName;
  Student(this.branchId,this.branchName,this.branchLocation,this.courseId,this.courseName,this.rollNumber,this.avrMarks,this.seminarsCount,
          String name,String phoneNo,String email,int age,String street,String city,String state,String postalCode,String country) : 
          super(name,phoneNo,email,age,street,city,state,postalCode,country);
  Map getStudentDetails(){
    return {'Roll':rollNumber,'Average':avrMarks,'Seminars':seminarsCount,'Age':age,
            'BranchName':branchName,'CourseName':courseName,'Details':super.getPersonalDetails()};
  }
}

class Professor extends Person implements Branch, Course{
  int salary;     //  INR per month
  @override
  int branchId;
  @override
  String branchName;
  @override
  String branchLocation;
  @override
  int courseId;
  @override
  String courseName;
  Professor(this.branchId,this.branchName,this.branchLocation,this.courseId,this.courseName,this.salary, 
            String name, String phoneNo, String email, int age, String street, String city, String state, String postalCode, String country) : 
            super(name, phoneNo, email, age, street, city, state, postalCode, country);
  Map getProfessorDetails(){
    return {'Salary':salary,'BranchName':branchName,'CourseName':courseName,'Details':super.getPersonalDetails()};
  }
}

class University extends Address {
  String name;
  String phoneNo;
  String email;
  List<Student> studentList;
  List<Professor> professorList;
  Map<int,Course> courseList;
  Map<int,Branch> branchList;
  University({this.name, this.phoneNo, this.email, String street, String city, String state, String postalCode, 
              String country}) : super(street, city, state, postalCode, country) {
    studentList = List<Student>();
    professorList = List<Professor>();
    courseList = Map<int,Course>();
    branchList = Map<int,Branch>();
  }
  Map getUniversityDetails(){
    return {'Name':name,'Phone No':phoneNo,'Email':email, 'Address':super.getAddress()};
  }
  void addBranch(int id, String name, String location){
    branchList[id] = Branch(id,name,location);
  }
  Map getBranches(){
    return branchList;
  }
  void addCourse(int id, String name){
    courseList[id] = Course(id,name);
  }
  Map getCourses(){
    return courseList;
  }
  void addStudent(int branchId,int courseId, int rollNo, int avgMarks, int seminars, String name,String phone,String email, int age,
                  String street, String city, String state, String postalCode, String country){
    studentList.add(Student(branchId,getBranches()[branchId].branchName,getBranches()[branchId].branchLocation,courseId,
                    getCourses()[courseId].courseName,rollNo,avgMarks,seminars,name,phone,email,age,street,city,state,postalCode,country));
    //student Added
  }
  void addProfessor(int branchId,int courseId,int salary,String name,String phone,String email, int age,
                    String street, String city, String state, String postalCode, String country){
    professorList.add(Professor(branchId,getBranches()[branchId].branchName,getBranches()[branchId].branchLocation,courseId,
                    getCourses()[courseId].courseName,salary,name,phone,email,age,street,city,state,postalCode,country));
    //professor Added
  }
  List<Student> getStudentList(){
    return studentList;
  }
  List<Professor> getProfessorList(){
    return professorList;
  }
}
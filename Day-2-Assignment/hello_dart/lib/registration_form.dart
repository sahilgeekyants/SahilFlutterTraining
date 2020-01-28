class RegistrationForm{
  String p_name;
  int p_age;
  String p_email;
  String p_phone;
  RegistrationForm(String p_name,int p_age,String p_email,String p_phone){
    this.p_name = p_name;
    this.p_age = p_age;
    this.p_email = p_email;
    this.p_phone = p_phone;
  }
  void getDetails(){
    print('Details of person are:\nName : ${p_name}\nAge : ${p_age}\nEmail : ${p_email}%\nPhone No : ${p_phone}');
  }
}
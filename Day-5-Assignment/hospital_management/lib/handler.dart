class Handler{
  Map<int,Patient> patients;
  Handler(){
    patients = Map<int,Patient>();
  }
  void begin(){
    
  }
}
class Emergency{

}
class ENT{

}
class GeneralPhysicain{

}
class PrivateClinic{

}
class Doctor extends PrivateClinic{

}
class Services extends Doctor implements Emergency, ENT, GeneralPhysicain {

}
class Hospital extends Services{

}
class Patient extends Hospital{

}
class Address{
    String p_address;
    Address(String p_address){
      this.p_address = p_address;
    }
    void intoUpperCase(){
      print('address in uppercase: ${p_address.toUpperCase()}');
    }
}
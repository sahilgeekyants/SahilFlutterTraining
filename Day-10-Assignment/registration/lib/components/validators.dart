class Validator {
  Pattern namePattern,
      emailPattern,
      phonePattern,
      passwordPattern,
      confirmPasswordPattern;
  Validator() {
    namePattern = r'(^[a-zA-Z ]*$)';
    emailPattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    phonePattern = r'^[0-9]{10}$';
    passwordPattern = r'^(?=.*[A-Z])(.{6,})$';
    //confirmPasswordPattern = r'^(?=.*[A-Z])(.{6,})$';
  }
  String nameValidator(String value) {
    RegExp regex = RegExp(namePattern);
    if (value.isEmpty) {
      return 'Enter the name';
    } else if (!regex.hasMatch(value)) {
      return 'Enter alphabets only';
    } else
      return null;
  }

  String emailValidator(String value) {
    RegExp regex = RegExp(emailPattern);
    if (value.isEmpty) {
      return 'Enter the Email';
    } else if (!regex.hasMatch(value)) {
      return 'Enter the Valid Email';
    } else
      return null;
  }

  String phoneValidator(String value) {
    RegExp regex = RegExp(phonePattern);
    if (value.isEmpty) {
      return 'Enter the Phone No';
    } else if (!regex.hasMatch(value)) {
      return 'Enter exactly 10 digits';
    } else
      return null;
  }

  String passwordValidator(String value) {
    RegExp regex = RegExp(passwordPattern);
    if (value.isEmpty) {
      return 'Enter the Password';
    } else if (!regex.hasMatch(value)) {
      return 'Atleast 1 capital & min. 6 characters';
    } else
      return null;
  }

  String confirmPasswordValidator(String value, String pass) {
    //RegExp regex = RegExp(confirmPasswordPattern);
    if (value.isEmpty) {
      return 'Enter the confirm Password';
    }
    if (pass.isEmpty) {
      return 'Enter the Password first';
    }
    // if (!regex.hasMatch(value)) {
    //   return 'Atleast 1 capital & min. 6 characters';
    // }
    if (pass != value) {
      return 'Must be same as Password';
    }
    return null;
  }
}

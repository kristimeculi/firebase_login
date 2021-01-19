
class FormValidation{

  static String emailValidation(String email){
    if(email == null || email.isEmpty){
      return 'Email cannot be empty';
    }else if(!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email)){
      return 'This is not a valid email';
    }else{
      return null;
    }
  }

  static String passwordValidation(String password){
    if(password == null || password.isEmpty){
      return 'Password cannot be empty';
    }else if(password.length<6){
      return 'Password must be more than 6 characters';
    }else{
      return null;
    }
  }

  static String nameValidation(String name){
    if(name == null || name.isEmpty){
      return 'Firstname cannot be empty';
    }else if(name.length<3){
      return 'Firstname must be more than 3 characters';
    }else{
      return null;
    }
  }

}
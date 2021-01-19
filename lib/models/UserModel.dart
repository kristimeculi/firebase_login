
class UserModel{
  String email;
  String password;
  String firstname;
  String city;

  UserModel({this.email, this.password, this.firstname, this.city});

  @override
  String toString() {
    return 'UserModel{email: $email, password: $password, firstname: $firstname, city: $city}';
  }
}
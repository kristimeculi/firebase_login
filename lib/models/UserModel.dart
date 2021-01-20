
class UserModel{
  String email;
  String password;
  String firstname;
  String phone;
  String street;
  int postalCode;
  String city;
  String country;

  UserModel({this.email, this.password, this.firstname, this.phone, this.street,
      this.postalCode, this.city, this.country});

  @override
  String toString() {
    return 'UserModel{email: $email, password: $password, firstname: $firstname, phone: $phone, street: $street, postalCode: $postalCode, city: $city, country: $country}';
  }
}
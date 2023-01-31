
class User {
  final String name;
 
  final String email;
  final String phone;
  final String countryCode;
  const User({
   required this.name ,
   required this.email ,
   required this.phone ,
   required this.countryCode ,
   
  });

  @override
  String toString() {
    return 'User(name: $name, email: $email, phone: $phone, countryCode: $countryCode)';
  }
}

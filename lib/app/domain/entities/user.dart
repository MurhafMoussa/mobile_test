
class User {
  const User({
   required this.name ,
   required this.email ,
   required this.phone ,
   required this.countryCode ,
   
  });
  final String name;
 
  final String email;
  final String phone;
  final String countryCode;

  @override
  String toString() => 'User(name: $name, email: $email, phone: $phone, countryCode: $countryCode)';
}

class EndPoints {
  static const String baseUrl = 'http://testapi.alifouad91.com/';
  
  static const String api = '${baseUrl}api/';
  static const String user = '${api}user/';
  
  //user
  static const String register = '${user}register';
  static const String login = '${api}login';
  static const String changePassword = '${user}changepassword';
  static const String updateUser = '${user}update';
  
  static const String deleteAccount = '${user}delete';
}

import 'dart:convert';
import 'package:http/http.dart' as http;

class UserRegister {
  String username, password, email, confirmPassword, fullname;
  UserRegister(
      {this.email,
      this.username,
      this.password,
      this.confirmPassword,
      this.fullname});
  
}

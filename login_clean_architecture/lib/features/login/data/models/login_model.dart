import 'package:login_clean_architecture/features/login/domain/entities/login.dart';

/*
* The models are used to create functions for manipulate the data.
* In this example we'll manipulate JSON data
*/
class LoginModel extends Login{
  LoginModel({
    String username,
    String password,
    String token
  }) : super(username: username, password: password);

  factory LoginModel.fromJson(Map<String, dynamic> json){
    return LoginModel(
      token: json['token']
    );
  }

  Map<String, dynamic> toJson(){
    return{
      'sLogin': username,
      'sPassword': password
    };
  }
}
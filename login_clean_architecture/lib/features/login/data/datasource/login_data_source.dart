import 'dart:convert';

import 'package:login_clean_architecture/features/login/data/models/login_model.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

/*
* The DataSource files are used to call our webservices.
*/

abstract class LoginDataSource{
  Future<LoginModel> getToken(String username, String password);
}

class LoginDataSourceImpl implements LoginDataSource{
  static const String URL = "URL";
  final http.Client client;

  LoginDataSourceImpl({@required this.client});

  @override
  Future<LoginModel> getToken(String username, String password) =>
    _getTokenFromUrl("$URL/loginFlutter/PHP/login.php?sLogin=$username&sPassword=$password");

  Future<LoginModel> _getTokenFromUrl(String url) async {
    final response = await client.get(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
    );
    if(response.statusCode == 200){
      return LoginModel.fromJson(json.decode(response.body));
    }else{
      throw Exception();
    }
  }
}


import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

/*
 * The entities are formed by:
 * 1. Domain Object
 * 2. Fundational buisiness logic
 * 3. POJOS
 */

class Login extends Equatable {
  final String username;
  final String password;

  Login({@required this.username, @required this.password});

  @override
  List<Object> get props => [username,password];
}

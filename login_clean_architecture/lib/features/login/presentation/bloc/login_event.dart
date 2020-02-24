import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class LoginEvent extends Equatable{
  @override
  List<Object> get props => [];
}

class GetTokenForLogin extends LoginEvent{
  final String username;
  final String password;

  GetTokenForLogin(this.username, this.password);

  @override
  List<Object> get props => [username,password];
}
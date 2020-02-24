import 'package:login_clean_architecture/features/login/domain/entities/login.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class LoginState extends Equatable{
  @override
  List<Object> get props => [];
}

class Empty extends LoginState{}

class Loading extends LoginState{}

class Loaded extends LoginState{
  final Login login;

  Loaded({@required this.login});

  @override
  List<Object> get props => [login];
}

class Error extends LoginState{
  final String message;

  Error({@required this.message});

  @override
  List<Object> get props => [message];

  }
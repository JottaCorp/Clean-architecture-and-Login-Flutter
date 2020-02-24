import 'package:login_clean_architecture/core/error/failures.dart';
import 'package:login_clean_architecture/core/usecases/usecase.dart';
import 'package:login_clean_architecture/features/login/domain/entities/login.dart';
import 'package:login_clean_architecture/features/login/domain/repositories/login_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

/*
* Usecases are use to:
* 1. Actions that can be taken on the entities
* 2. Business logic, plain code.
* 3. A use case doesnt know how the result is going to be used
*/

class GetLoginToken implements UseCase<Login, Params>{
  final LoginRepository repository;

  GetLoginToken(this.repository);

  @override
  Future<Either<Failure, Login>> call(params) async {
    return await repository.getLoginToken(params.username, params.password);
  } 
}

class Params extends Equatable{
  final String username;
  final String password;

  Params({@required this.username, @required this.password});

  @override
  List<Object> get props => [username,password];
}
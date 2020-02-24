import 'package:login_clean_architecture/core/error/failures.dart';
import 'package:login_clean_architecture/core/network/network_info.dart';
import 'package:login_clean_architecture/features/login/data/datasource/login_data_source.dart';
import 'package:login_clean_architecture/features/login/domain/entities/login.dart';
import 'package:login_clean_architecture/features/login/domain/repositories/login_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

typedef Future<Login> _Login();

/*
* Here we'll to implements the functions we had created in domain/repository
* Here, we'll call to DataSource functions and when we'll want get data of our webservice
* rather than calling the DataSource, we'll call our Repository
*/

class LoginRepositoryImpl implements LoginRepository{
  final LoginDataSource loginDataSource;
  final NetworkInfo networkInfo;

  LoginRepositoryImpl({
    @required this.loginDataSource,
    @required this.networkInfo
  });

  @override
  Future<Either<Failure, Login>> getLoginToken(String username, String password) async {
    return await _getToken((){
      return loginDataSource.getToken(username, password);
    });
  }

  Future<Either<Failure, Login>> _getToken(_Login getLogin) async {
    if(await networkInfo.isConnected){
        final remoteLogin = await getLogin();
        return Right(remoteLogin);
    }else{
      return null;
    }
  }
}
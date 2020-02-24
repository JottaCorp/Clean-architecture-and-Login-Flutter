import 'package:login_clean_architecture/core/error/failures.dart';
import 'package:login_clean_architecture/features/login/domain/entities/login.dart';
import 'package:dartz/dartz.dart';

/*
* This is a simple repository interface. We'll see how we can implemnts it this than later in the folder called data/repositories
* Here we'll declare the methods we'll use to call our WebService
*/

abstract class LoginRepository{
  Future<Either<Failure, Login>> getLoginToken(String username, String password);
}
import 'package:login_clean_architecture/core/error/failures.dart';
import 'package:login_clean_architecture/features/login/domain/entities/login.dart';
import 'package:login_clean_architecture/features/login/domain/usecases/get_login_token.dart';
import 'package:login_clean_architecture/features/login/presentation/bloc/login_event.dart';
import 'package:login_clean_architecture/features/login/presentation/bloc/login_state.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState>{

  final GetLoginToken getLoginToken;

    LoginBloc({@required GetLoginToken glToken}) : assert(glToken != null), getLoginToken = glToken;


  @override
  LoginState get initialState => Empty();

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if(event is GetTokenForLogin){
      final inputUsername = event.username;
      final inputPassword = event.password;

      yield Loading();
      final response = await getLoginToken(Params(username: inputUsername, password: inputPassword));
      yield* _eitherLoadedOrErrorState(response);
    }
  }

  Stream<LoginState> _eitherLoadedOrErrorState(
    Either<Failure, Login> failureOrTrivia,
  ) async* {
    yield failureOrTrivia.fold(
      (failure) => Error(message: "error"),
      (login) => Loaded(login: login),
    );
  }

}
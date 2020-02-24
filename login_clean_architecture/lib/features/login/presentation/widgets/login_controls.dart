import 'package:login_clean_architecture/features/login/presentation/bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginControls extends StatefulWidget {
  const LoginControls({
    Key key,
  }) : super(key: key);

  @override
  _LoginControlsState createState() => _LoginControlsState();
}

class _LoginControlsState extends State<LoginControls> {
  final controllerUsername = TextEditingController();
  final controllerPassword = TextEditingController();

  String inputUsername;
  String inputPassword;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(20),
          child: TextField(
            controller: controllerUsername,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Username',
            ),
            onChanged: (value) {
              inputUsername = value;
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: TextField(
            controller: controllerPassword,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Username',
            ),
            onChanged: (value) {
              inputPassword = value;
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: RaisedButton(
            child: Text('Search'),
            color: Theme.of(context).accentColor,
            textTheme: ButtonTextTheme.primary,
            onPressed: dispatchConcrete,
          ),
        )
      ],
    );
  }

  void dispatchConcrete() {
    controllerPassword.clear();
    BlocProvider.of<LoginBloc>(context)
        .add(GetTokenForLogin(inputUsername, inputPassword));
  }
}

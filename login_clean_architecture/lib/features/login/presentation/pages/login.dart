import 'package:login_clean_architecture/features/login/presentation/bloc/login_bloc.dart';
import 'package:login_clean_architecture/features/login/presentation/bloc/bloc.dart';
import 'package:login_clean_architecture/features/login/presentation/widgets/login_controls.dart';
import 'package:login_clean_architecture/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Number Trivia'),
      ),
      body: SingleChildScrollView(
        child: buildBody(context),
      ),
    );
  }

  BlocProvider<LoginBloc> buildBody(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<LoginBloc>(),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
               SizedBox(height: 10),
              BlocBuilder<LoginBloc, LoginState>(
                builder: (context, state) {
                  if (state is Empty) {
                    return Text("");
                  }else if (state is Loaded) {
                    return Text("true");
                  }
                },
              ),
              LoginControls(),
            ],
          ),
        ),
      ),
    );
  }
}

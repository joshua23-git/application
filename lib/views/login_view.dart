import 'package:application/service/auth/auth_exceptions.dart';
import 'package:application/service/auth/bloc/auth_bloc.dart';
import 'package:application/service/auth/bloc/auth_event.dart';
import 'package:application/service/auth/bloc/auth_state.dart';
import 'package:application/utilities/dialogs/error_dialog.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late final TextEditingController _email;
  late final TextEditingController _password;
  

  @override
  void initState() {
    super.initState();
    _email = TextEditingController();
    _password = TextEditingController();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) async {
        // TODO: implement listener
        if (state is AuthStateLoggedOut) {

          if (state.exception is UserNotFoundAuthException) {
            await showErrorDialog(context, 'Cannot find a user with the entered credentials');
          } else if (state.exception is WrongPasswordAuthException) {
            await showErrorDialog(context, 'wrong credentials. Please try again.');
          } else if (state.exception is GenericAuthException) {
            await showErrorDialog(
              context,
              'Authentication error. Please try again.',
            );
          }
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Login'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
            
                const Text(
                  'Please log in to your account in order to interact with and create notes.',
                ),
            
                TextField(
                  controller: _email,
                  enableSuggestions: false,
                  autocorrect: false,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(hintText: 'Enter your email here'),
                ),
                TextField(
                  controller: _password,
                  obscureText: true,
                  enableSuggestions: false,
                  autocorrect: false,
                  decoration: const InputDecoration(hintText: 'Enter your password here'),
                ),
            
                Padding(padding: const EdgeInsets.only(top: 10.0)),
                
                ElevatedButton(
                  onPressed: () async {
                    final email = _email.text;
                    final password = _password.text;
                    context.read<AuthBloc>().add(AuthEventLogIn(email, password));
                  },
                  child: const Text('Login'),
                ),
                ElevatedButton(
                  onPressed: () {
                    final email = _email.text;
                    context.read<AuthBloc>().add(AuthEventForgotPassword(email: email));
                  },
                  child: const Text('I forgot my password'),
                ),
                ElevatedButton(
                  onPressed: () {
                    context.read<AuthBloc>().add(const AuthEventShouldRegister());
                  },
                  child: const Text('Not registered yet? Register here!'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

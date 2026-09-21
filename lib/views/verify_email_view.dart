import 'package:application/service/auth/bloc/auth_bloc.dart';
import 'package:application/service/auth/bloc/auth_event.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmailVerifyView extends StatefulWidget {
  const EmailVerifyView({super.key});

  @override
  State<EmailVerifyView> createState() => _EmailVerifyViewState();
}

class _EmailVerifyViewState extends State<EmailVerifyView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verify Email'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text('Please verify your email address.'),
              const Text('If you have not received a verification email, please check your spam folder.'),
              const Text('If you still cannot find the email, please click the button below to resend the verification email.'),
              ElevatedButton(
                onPressed: () {
                  context.read<AuthBloc>().add(const AuthEventSendEmailVerification());
                },
                child: const Text('Resend Verification Email'),
              ),
              ElevatedButton(
                onPressed: () {
                  context.read<AuthBloc>().add(const AuthEventLogOut());
                },
                child: const Text('Restart'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

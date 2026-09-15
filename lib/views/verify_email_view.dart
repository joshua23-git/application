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
      appBar: AppBar(title: const Text('Email Verification')),
      body: Column(
        children: [
          const Text(
            "We have sent you an email verification link. Please check your email and click on the link to verify your email address.",
          ),
          const Text(
            'If you have not received the email, click the button below to resend the verification email.',
          ),
          TextButton(
            onPressed: () async {
              context.read<AuthBloc>().add(const AuthEventSendEmailVerification());
            },
            child: const Text('Send Verification Email'),
          ),
          TextButton(
            onPressed: () async {
              context.read<AuthBloc>().add(const AuthEventLogOut());
            },
            child: const Text('Restart'),
          ),
        ],
      ),
    );
  }
}

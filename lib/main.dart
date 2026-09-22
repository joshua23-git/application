import 'package:application/constants/routes.dart';
import 'package:application/helpers/loading/loading_screen.dart';
import 'package:application/service/auth/bloc/auth_bloc.dart';
import 'package:application/service/auth/bloc/auth_event.dart';
import 'package:application/service/auth/bloc/auth_state.dart';
import 'package:application/service/auth/firebase_auth_provider.dart';
import 'package:application/views/forgot_password_view.dart';
import 'package:application/views/login_view.dart';
import 'package:application/views/notes/create_update_note_view.dart';
import 'package:application/views/notes/notes_view.dart';
import 'package:application/views/register_view.dart';
import 'package:application/views/verify_email_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MaterialApp(
      title: 'Flutter Demo',
      //theme: ThemeData(primarySwatch: Colors.blue),
      home: BlocProvider <AuthBloc>(
        create: (context) => AuthBloc(FirebaseAuthProvider()),
        child: const HomePage(),
      ),
      routes: {
        
        
        createUpdateNoteRoute: (context) => const CreateUpdateNoteView(),
      },
    ),
  );
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<AuthBloc>().add(const AuthEventInitialize());
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        // TODO: implement listener
        if(state.isLoading) {
          LoadingScreen().show(
            context: context,
            text: state.loadingText ?? 'Please wait a moment',
          );
        } else {
          LoadingScreen().hide();
        }
      },
      builder: (context, state) {
      if (state is AuthStateUninitialized) {
        return const Center(child: CircularProgressIndicator());
      } else if (state is AuthStateLoggedIn) {
        return const NotesView();
      } else if (state is AuthStateNeedsVerification) {
        return const EmailVerifyView();
      } else if (state is AuthStateLoggedOut) {
        return const LoginView();
      } else if (state is AuthStateRegistering) {
        return const RegisterView();
      } else if (state is AuthStateForgotPassword) {
        return const ForgotPasswordView();
      } else {
        return Scaffold(
          body: Center(
            child: Text('State: $state'),
          ),
        );
      }
    });

  }
}

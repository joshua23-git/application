import 'package:application/utilities/dialogs/generic_dialog.dart';
import 'package:flutter/widgets.dart';

Future<void> showPasswordResetEmailSentDialog(BuildContext context) {
  return showGenericDialog<void>(
    context: context,
    title: 'Password Reset',
    content: 'We have sent you an email with a link to reset your password. Please check your email.',
    optionsBuilder: () => {
      'OK': null,
    }
  ); 
}
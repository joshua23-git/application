import 'package:application/utilities/dialogs/generic_dialog.dart';
import 'package:flutter/widgets.dart';

Future<bool> showLogOutDialog(BuildContext context) {
  return showGenericDialog<bool>(
    context: context,
    title: 'SignOut',
    content: 'Are you sure you want to log out?',
    optionsBuilder: () => {
      'Cancel': false,
      'Log out': true,
    },
    cancelActionText: 'Cancel',
    defaultActionText: 'Log out',
  ).then((value) => value ?? false);
}
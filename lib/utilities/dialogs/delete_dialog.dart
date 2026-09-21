import 'package:application/utilities/dialogs/generic_dialog.dart';
import 'package:flutter/widgets.dart';

Future<bool> showDeleteDialog(BuildContext context) {
  return showGenericDialog<bool>(
    context: context,
    title: 'Delete Note',
    content: 'are you sure you want to delete this note?',
    optionsBuilder: () => {
      'Cancel': false,
      'Delete': true,
    }
  ).then((value) => value ?? false);
}
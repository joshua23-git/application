 import 'package:application/utilities/dialogs/generic_dialog.dart';
import 'package:flutter/widgets.dart';

Future<void> showErrorDialog(
  BuildContext context,
   String text,
  

) {
  return showGenericDialog<void>(
    context: context,
    title: 'An error occurred',
    content: text,
    optionsBuilder: () => {
      'OK': null,
    }, cancelActionText: '', defaultActionText: '',
  ); 
}
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

typedef DialogOptionBuilder<T> = Map<String, T?> Function();

Future<T?> showGenericDialog<T>({
  required BuildContext context,
  required String title,
  required String content,
  required DialogOptionBuilder<T> optionsBuilder,
  required String cancelActionText,
  required String defaultActionText,
}) {
  final options = optionsBuilder();
  return showDialog<T>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: options.keys.map((optionTitle) {
          final  value = options[optionTitle];
          return TextButton(
            onPressed: () {
              if (value == null) {
                Navigator.of(context).pop();
              } else {
                Navigator.of(context).pop(value);
              }
            },
            child: Text(optionTitle),
          );
        }).toList()
          // ..add(
          //   TextButton(
          //     onPressed: () {
          //       Navigator.of(context).pop();
          //     },
          //     child: Text(cancelActionText),
          //   ),
          // )
          // ..add(
          //   TextButton(
          //     onPressed: () {
          //       Navigator.of(context).pop(options[defaultActionText]);
          //     },
          //     child: Text(defaultActionText),
          //   ),
          // ),
      );
    },
  );
}
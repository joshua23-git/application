import "package:flutter/material.dart";


extension GetArguments on BuildContext {
 T? getArgument<T>() {
    final modalRoute = ModalRoute.of(this);
    if (modalRoute != null) {
      final arguments = modalRoute.settings.arguments;
      if (arguments !=null && arguments is T  ) {
        return arguments as T;
      }
    }
    return null;
  } 
}
import 'package:flutter/material.dart';
import 'package:nil/nil.dart';

class FormErrorMessage extends StatelessWidget {
  final String? errorMessage;
  const FormErrorMessage({Key? key, this.errorMessage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final message = errorMessage;
    if (message != null) {
      return Text(message,
          style: TextStyle(
            color: Theme.of(context).colorScheme.error,
          ));
    } else {
      return nil;
    }
  }
}

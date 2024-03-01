import 'package:flutter/material.dart';

class FormErrorMessage extends StatelessWidget {
  final String? errorMessage;
  const FormErrorMessage({Key? key, this.errorMessage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
        visible: errorMessage != null,
        child: Text(errorMessage ?? "",
            style: TextStyle(
              color: Theme.of(context).colorScheme.error,
            )));
  }
}

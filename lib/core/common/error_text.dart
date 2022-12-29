import 'package:flutter/cupertino.dart';

class ErrorText extends StatelessWidget {
  final String errorText;
  const ErrorText({super.key, required this.errorText});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(errorText),
    );
  }
}

import 'package:flutter/material.dart';

class ErrorLoading extends StatelessWidget {
  String message;

  ErrorLoading(this.message);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
        message,
      style: TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ));
  }
}

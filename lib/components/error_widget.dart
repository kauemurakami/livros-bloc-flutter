import 'package:flutter/material.dart';

class ErrorLoading extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
        "Erro ao carregar dados",
      style: TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ));
  }
}

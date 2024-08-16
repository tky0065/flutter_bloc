import 'package:flutter/material.dart';

class ToDoEmptyUI extends StatelessWidget {
  const ToDoEmptyUI({
    super.key,
    this.message =
        "La list des Taches est vide\nS'il vous plait cliquer sur le bouton + pour ajouter ",
  });

  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        message,
        textAlign: TextAlign.center,
      ),
    );
  }
}

import 'package:flutter/material.dart';

class Custombutton extends StatelessWidget {
  String title;
  void Function() onClicked;

  Custombutton({required this.title, required this.onClicked});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onClicked,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 16),
        backgroundColor: Theme.of(context).colorScheme.primary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
      child: Text(title, style: Theme.of(context).textTheme.labelMedium),
    );
  }
}

import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  final String text;
  const CategoryScreen({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(text)),
    );
  }
}

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class CourseScreen extends StatefulWidget {
  const CourseScreen({super.key});

  @override
  State<CourseScreen> createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
  // final dir = getExternalStorageDirectory();
  // String file = '';
  Future<bool> file = File('${getExternalStorageDirectory()}').exists();

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(body:Center(child: Text("hello"),)
          // ListView.builder(

          //   itemBuilder: )
          ),
    );
  }
}

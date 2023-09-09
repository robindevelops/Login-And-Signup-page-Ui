// ignore_for_file: prefer_const_constructors, camel_case_types, duplicate_ignore

import 'package:flutter/material.dart';

// ignore: camel_case_types
class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: const [
          SafeArea(
            child: Text(
              "My Notes",
              style: TextStyle(fontSize: 30),
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../view/home.dart';

class UtillsMaterial extends StatelessWidget {
  const UtillsMaterial({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false, 
      home: HomePage(),
    );
  }
}

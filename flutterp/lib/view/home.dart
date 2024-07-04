import 'package:flutter/material.dart';
import 'package:flutterp/view/todo.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
       width: double.infinity,
       height: double.infinity,
       decoration: const BoxDecoration(image: DecorationImage(image:  NetworkImage('https://us.123rf.com/450wm/279photo/279photo2101/279photo210100147/161943355-company-strategy-development-in-business-on-office-desk-background-top-view-mock-up.jpg?ver=6'))),
       child:const TodoView()
      ),
    );
  }
}
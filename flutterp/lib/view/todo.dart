import 'package:flutter/material.dart';
import 'package:flutterp/widget/text_field.dart';

class TodoView extends StatelessWidget {
  const TodoView({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      body: Center(
        child: Column(
          children: [
         Text('TO DO APP',style: TextStyle(fontSize: 20),),
         SizedBox(height: 7,),
         WidgetTextField(),
              SizedBox(height: 12,),
         Text('Tasks List',style: TextStyle(fontSize: 14),),
              SizedBox(height: 7,),
        
          ],
        ),
      ),
    );
  }
}
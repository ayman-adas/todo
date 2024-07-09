import 'package:flutter/material.dart';
import 'package:flutterp/utiils/widget/todo_list.dart';
import 'package:provider/provider.dart';
import '../controller/http.dart';
import '../utiils/widget/text_field.dart';
import 'dart:developer' as developer;

class TodoView extends StatefulWidget {
  const TodoView({super.key});

  @override
  State<TodoView> createState() => _TodoViewState();
}

class _TodoViewState extends State<TodoView> {
  @override
  void initState() {
    HttpController http = Provider.of<HttpController>(context, listen: false);
    http.selectTodo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    HttpController http = Provider.of<HttpController>(context, listen: true);

    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const WidgetTextField(),
            const SizedBox(
              height: 26,
            ),
            const Text(
              'Tasks List',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(
              height: 4,
            ),
            SizedBox(
                height: 800,
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: http.list.length,
                  itemBuilder: (BuildContext context, int index) {
                    developer.log(http.list.length.toString());
                    return WidgetTodoList(
                      iscomplete: http.list[index].complete ?? 'false',
                      task: http.list[index].task ?? '',
                      date: http.list[index].date ?? '0',
                      id: http.list[index].index ?? '0',
                    );
                  },
                ))
          ],
        ),
      ),
    );
  }
}

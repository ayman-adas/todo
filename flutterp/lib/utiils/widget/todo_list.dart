// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:developer' as developer;
import 'package:provider/provider.dart';

import '../../controller/http.dart';

class WidgetTodoList extends StatelessWidget {
  WidgetTodoList(
      {super.key,
      required this.iscomplete,
      required this.task,
      required this.date,
      required this.id});
  final String iscomplete;
  final String task;
  final String date;
  final String id;
  bool isUpadte = false;

  @override
  Widget build(BuildContext context) {
    HttpController https = Provider.of<HttpController>(context, listen: true);
    IconButton iconButton() {
      try {
        if (iscomplete == 'true') {
          return IconButton(
            icon: const Icon(Icons.check),
            onPressed: () async {
              await https.updateTodo(id, task, 'false');
            },
          );
        } else {
          return IconButton(
            icon: const Icon(Icons.question_mark),
            onPressed: () async {
              await https.updateTodo(id, task, 'true');
            },
          );
        }
      } catch (e) {
        developer.log(e.toString());
        return IconButton(onPressed: () {}, icon: const Icon(Icons.error));
      }
    }

    Widget field() {
      if (isUpadte) {
        return SizedBox(
          height: 10,
          width: 10,
          child: TextFormField(
            onSaved: (newValue) async {
              https.updateTodo(id, newValue ?? '', iscomplete);
            },
          ),
        );
      } else {
        return Text(task);
      }
    }

    var dt = DateTime.fromMillisecondsSinceEpoch((int.parse(date)));

    return Card(
      child: Row(
        children: [
          iconButton(),
          const SizedBox(
            width: 10,
          ),
          field(),
          const SizedBox(
            width: 10,
          ),
          Text(DateFormat('yyyy-MM-dd – kk:mm').format(dt)),
          const SizedBox(
            width: 10,
          ),
          InkWell(
              onTap: () {
                isUpadte = !isUpadte;
              },
              child: const Text("Update",
                  style: TextStyle(
                      fontSize: 16, color: Color.fromARGB(255, 14, 10, 214)))),
          const SizedBox(
            width: 10,
          ),
          InkWell(
              onTap: () {
                https.deleteTodo(id);
              },
              child: const Text("delete",
                  style: TextStyle(
                      fontSize: 16, color: Color.fromARGB(255, 216, 24, 24))))
        ],
      ),
    );
  }
}

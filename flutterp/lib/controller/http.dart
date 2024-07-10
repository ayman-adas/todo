import 'package:flutter/material.dart';
import 'package:flutterp/model/todo.dart';
import 'package:uuid/uuid.dart';
import 'dart:developer' as developer;
import '../services/api.dart';

class HttpController extends ChangeNotifier {
  List<Modeltodo> list = [];

  Future<void> createTodo(String task, String complete, int date) async {
    Map<String, dynamic> data = {
      'id': const Uuid().v1(),
      'task': task.toString(),
      'complete': complete.toString(),
      'date': date
    };
    developer.log("the data$data");
    await ServicesApi.post('http://10.0.2.2:1010', '/create', data);
    selectTodo();
  }

  Future<void> updateTodo(
    String index,
    String task,
    String complete,
  ) async {
    Map<String, dynamic> data = {
      'id': index.toString(),
      'task': task.toString(),
      'complete': complete.toString(),
      'date': DateTime.now().millisecondsSinceEpoch.toString()
    };
    developer.log("the data$data");

    await ServicesApi.patch('http://10.0.2.2:1010', '/update', data);
    selectTodo();
  }

  Future<void> deleteTodo(String index) async {
    Map<String, dynamic> data = {'taskid': index.toString()};

    await ServicesApi.delete('http://10.0.2.2:1010', '/delete', data);

    selectTodo();
  }

  Future<void> selectTodo() async {
    try {
      list = (await ServicesApi.get('http://10.0.2.2:1010', '/select'))
          .map((item) {
        developer.log('Mapping item: $item');
        Map<String, dynamic> data = item as Map<String, dynamic>;
        developer.log('data item: $data');
 
        return  Modeltodo.fromMap(data);
      }).toList();
    } catch (e) {
      developer.log(e.toString());
    }
    developer.log(list.toString());
    notifyListeners();
    // var itemCount =Modeltodo.fromMap(jsonconvert) ;
  }
}

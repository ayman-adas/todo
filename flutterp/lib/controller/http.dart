import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutterp/model/todo.dart';
import 'package:http/http.dart' as http;
import 'dart:developer' as developer;

class HttpController extends ChangeNotifier {
  List<Modeltodo> list = [];

  Future<void> createTodo(String task, String complete) async {
    Uri url =
        Uri.parse('http://10.0.2.2:1010/create?task=$task&complete=$complete');
    await http.post(url);
    selectTodo();
  }

  Future<void> updateTodo(
    String index,
    String task,
    String complete,
  ) async {
    Uri url = Uri.parse(
        'http://10.0.2.2:1010/update?index=${index.toString()}&task=$task&complete=$complete&date=${DateTime.now().millisecondsSinceEpoch.toString()}');
    try {
      final response = await http.post(url);
      developer.log(response.body.toString());
    } catch (error) {
      developer.log(error.toString());
    }
    selectTodo();
  }

  Future<void> deleteTodo(String index) async {
    Uri url = Uri.parse('http://10.0.2.2:1010/delete?index=$index');
    await http
        .post(url)
        .then((response) => developer.log(response.body.toString()))
        .catchError((error) => developer.log(error.toString()));
        selectTodo();
  }

  Future<void> selectTodo() async {
    try {
      var url = Uri.parse("http://10.0.2.2:1010/select");
      final response = await http.get(url);
      final List body = json.decode(response.body);
      developer.log(json.decode(response.body).toString());
      list = body.map((item) {
        developer.log('Mapping item: $item');
        Map<String, dynamic> data = item as Map<String, dynamic>;
        developer.log('data item: $data');

        return Modeltodo.fromMap(data);
      }).toList();
      developer.log(body[0].toString());
      developer.log(list[0].toString());
    } catch (e) {
      developer.log(e.toString());
    }
    notifyListeners();
    // var itemCount =Modeltodo.fromMap(jsonconvert) ;
  }
}

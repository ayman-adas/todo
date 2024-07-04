import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutterp/model/todo.dart';
import 'package:http/http.dart' as http;

class HttpController extends ChangeNotifier{
  Future<void> createTodo(String task,bool complete) async {
  Uri url =
      Uri.https('http://localhost:1010', '/create', {'task': {task},'complete':{complete}});
   await http.post(url);
notifyListeners();
  }
   Future<void> updateTodo(int index,String task,bool complete,int date) async {
  Uri url =
      Uri.https('http://localhost:1010', '/update', {'index':index,'task': {task},'complete':{complete},'date':{date}});
   await http.post(url);
notifyListeners();
  }
   Future<void> deleteTodo(int index) async {
  Uri url =
      Uri.https('http://localhost:1010', '/delete', {'index':index});
   await http.post(url);
notifyListeners();
  }
     Future<List<Modeltodo>> selectTodo() async {
  Uri url =
      Uri.https('http://localhost:1010', '/select',);
    http.Response response=await http.get(url);  
notifyListeners();
List<Modeltodo> data = json.decode(response.body).fromMap;

    // var itemCount =Modeltodo.fromMap(jsonconvert) ;
 
return data;
  }
  
  
}
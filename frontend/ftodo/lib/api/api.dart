import 'dart:convert';
import 'package:flutter/material.dart';
import '../models/todo.dart';
import 'package:http/http.dart' as http;

class TodoProvider with ChangeNotifier {
   TodoProvider() {
     this.fetchtaskAll();
    
   }
  List<Todo> _todos = [];

  List<Todo> get todos {
    return [..._todos];
  }

  void addTodo(Todo todo) async {
    final response= await http.post('http://192.168.1.7:8000/apis/v1/?format=json', headers:{"Contents-Type":"application/json"},
    body:json.encode(todo));

    if (response.statusCode == 201){

      todo.id = json.decode(response.body)['id'];
      _todos.add(todo);
      notifyListeners();
    }
   
  }
  fetchtaskAll() async {
    final url="http://192.168.1.7:8000/apis/v1/?format=json";
    final response=await http.get(url);

  if (response.statusCode == 200) {
    var data= json.decode(response.body) as List;
    _todos = data.map<Todo>((json) => Todo.fromJson(json)).toList();
  }
  notifyListeners();
}
}



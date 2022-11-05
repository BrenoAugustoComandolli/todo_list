import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import '../models/todo.dart';

const todoListKey = 'todo_list';

class ToDoRepository {

  late SharedPreferences sharedPreferences;

  Future<List<ToDo>> getTodoList() async {
    sharedPreferences = await SharedPreferences.getInstance();
    final String jsonString = sharedPreferences.getString(todoListKey) ?? '[]';
    final List jsonDecoded = json.decode(jsonString) as List;
    return jsonDecoded.map((e) => ToDo.fromJson(e)).toList();
  }

  void saveToDoList(List<ToDo> toDos){
    final String jsonString = json.encode(toDos);
    sharedPreferences.setString(todoListKey, jsonString);
  }

}
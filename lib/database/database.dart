import 'package:hive_flutter/hive_flutter.dart';

class MainDatabase {
  List todoList = [];

  final _myBox = Hive.box("myBox");

  void createData() {
    todoList = [
      ["Item One", false]
    ];
  }

  void loadData() {
    todoList = _myBox.get("TODOLIST");
  }

  void updateDatabase() {
    _myBox.put("TODOLIST", todoList);
  }
}

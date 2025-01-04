import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:myapp/database/database.dart';
import 'package:myapp/utils/add_task_dialog.dart';
import 'package:myapp/utils/item_todo.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = TextEditingController();

  final _myBox = Hive.box("myBox");
  MainDatabase db = MainDatabase();

  @override
  void initState() {
    if (_myBox.get("TODOLIST") == null) {
      db.createData();
    } else {
      db.loadData();
    }

    super.initState();
  }

  void checkBoxChange(bool? value, int index) {
    setState(() {
      db.todoList[index][1] = !db.todoList[index][1];
    });
    db.updateDatabase();
  }

  void saveNewTask() {
    setState(() {
      db.todoList.add([_controller.text, false]);
      _controller.clear();
      Navigator.of(context).pop();
    });
    db.updateDatabase();
  }

  void openCreateTaskDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return AddTaskDialog(
              controller: _controller,
              onSave: saveNewTask,
              onCancel: () => Navigator.of(context).pop());
        });
  }

  void deleteTask(int index) {
    db.todoList.removeAt(index);
    db.updateDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[200],
      appBar: AppBar(
        title: const Text(
          "Todo App",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.deepPurple[400],
        elevation: 10,
      ),
      body: ListView.builder(
        itemCount: db.todoList.length,
        itemBuilder: (BuildContext context, int index) {
          return ItemTodo(
              isChecked: db.todoList[index][1],
              onCheckChanged: (value) => checkBoxChange(value, index),
              todoTitle: db.todoList[index][0]);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: openCreateTaskDialog,
        child: const Icon(Icons.add),
      ),
    );
  }
}

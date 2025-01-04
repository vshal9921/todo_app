import 'package:flutter/material.dart';

class ItemTodo extends StatelessWidget {
  final bool isChecked;
  final String todoTitle;

  final Function(bool?)? onCheckChanged;

  const ItemTodo(
      {super.key,
      required this.isChecked,
      required this.onCheckChanged,
      required this.todoTitle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: Colors.deepPurple[500],
            borderRadius: const BorderRadius.all(Radius.circular(12))),
        child: Row(
          children: [
            Checkbox(value: isChecked, onChanged: onCheckChanged),
            Text(
              todoTitle,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  decoration: isChecked
                      ? TextDecoration.lineThrough
                      : TextDecoration.none),
            )
          ],
        ),
      ),
    );
  }
}

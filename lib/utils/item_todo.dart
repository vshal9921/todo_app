import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ItemTodo extends StatelessWidget {
  final bool isChecked;
  final String todoTitle;

  final Function(bool?)? onCheckChanged;
  final Function(BuildContext)? onPressed;

  const ItemTodo(
      {super.key,
      required this.isChecked,
      required this.onCheckChanged,
      required this.todoTitle,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Slidable(
        endActionPane: ActionPane(motion: const StretchMotion(), children: [
          SlidableAction(
            onPressed: onPressed,
            icon: Icons.delete,
            backgroundColor: Colors.red,
            borderRadius: BorderRadius.circular(12),
          )
        ]),
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
      ),
    );
  }
}

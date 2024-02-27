import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:session_10_flutter6_todo/task_item.dart';

class TasksTab extends StatelessWidget {
  const TasksTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.only(left: 12),
          child: DatePicker(
            height: 90,
            DateTime.now(),
            initialSelectedDate: DateTime.now(),
            selectionColor: Colors.blue,
            selectedTextColor: Colors.white,
            onDateChange: (date) {},
          ),
        ),
        SizedBox(height: 16),
        Expanded(
          child: ListView.separated(
            separatorBuilder: (context, index) => SizedBox(height: 16,),
            itemBuilder: (context, index) {
              return TaskItem();
            },
            itemCount: 9,
          ),
        )
      ],
    );
  }
}

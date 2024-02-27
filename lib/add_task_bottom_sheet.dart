// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class AddTaskBottomSheet extends StatefulWidget {
  const AddTaskBottomSheet({super.key});

  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  var formKey = GlobalKey<FormState>();
  var selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Add new Task",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            SizedBox(height: 16),
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please Enter Task Title";
                }
                return null;
              },
              decoration: InputDecoration(
                label: Text("Title"),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.red),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.blue),
                ),
              ),
            ),
            SizedBox(height: 16),
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please Enter Task Description";
                }
                return null;
              },
              decoration: InputDecoration(
                  label: Text("Description"),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.red),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.blue),
                  )),
            ),
            SizedBox(height: 16),
            Container(
                alignment: Alignment.centerLeft,
                child: Text("Select Time :",
                    style:
                        TextStyle(fontWeight: FontWeight.w300, fontSize: 20))),
            SizedBox(height: 16),
            InkWell(
              onTap: () {
                selectDate(context);
              },
              child: Text("${selectedDate.toString().split(" ").first}",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            ),
            SizedBox(height: 32),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      print("x");
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                  child: Text(
                    "Add Task",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        color: Colors.white),
                  )),
            ),
          ],
        ),
      ),
    );
  }

  selectDate(BuildContext context) async {
    DateTime? chosenDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(
        Duration(days: 365),
      ),
    );
    if (chosenDate != null) {
      selectedDate = chosenDate;
      setState(() {});
    }
  }
}

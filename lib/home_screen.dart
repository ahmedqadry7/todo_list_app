import 'package:flutter/material.dart';
import 'package:session_10_flutter6_todo/add_task_bottom_sheet.dart';
import 'package:session_10_flutter6_todo/settings_tab.dart';
import 'package:session_10_flutter6_todo/tabs/tasks_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "HomeScreen";
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Color(0xFFDFECDB),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          "ToDo",
          style: TextStyle(fontSize: 30, color: Colors.white , fontWeight: FontWeight.w500),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context, builder: (context) {
            return Container(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom
              ),
              child: AddTaskBottomSheet());
          },);
        },
        backgroundColor: Colors.blue,
        shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.white, width: 4),
            borderRadius: BorderRadius.circular(30)),
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 30,
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        notchMargin: 7,
        shape: CircularNotchedRectangle(),
        padding: EdgeInsets.zero,
        child: BottomNavigationBar(
          currentIndex: index,
          onTap: (value) {
            index = value;
            setState(() {});
          },
          backgroundColor: Colors.transparent,
          elevation: 0,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: false,
          showSelectedLabels: true,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.task), label: "Tasks"),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: "Settings")
          ],
        ),
      ),
      body: tabs[index],
    );
  }

  List<Widget> tabs = [TasksTab(), SettingsTab()];
}

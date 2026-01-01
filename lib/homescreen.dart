import 'package:flutter/material.dart';
import 'package:flutter_sqlite/employee_future.dart';
import 'package:flutter_sqlite/employee_notifier_future.dart';
import 'package:flutter_sqlite/employee_notifier_stream.dart';
import 'package:flutter_sqlite/employee_stream.dart';
// import 'package:flutter_sqlite/local/db/app_db.dart';
// import 'package:intl/intl.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  int index = 0;
  final pages = const [
    // EmployeeFuturescreen(),
    EmployeeNotifierFuturescreen(),
    // EmployeeStreamScreen()
    EmployeeNotifierStreamScreen(),
    
  ];
  // late AppDb _db;

  // @override
  // void initState() {
  //   super.initState();
  //   _db = AppDb();
  // }

  // @override
  // void dispose() {
  //   _db.close();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text("Homescreen"), centerTitle: true),

      body: pages[index],
      
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pushNamed(context, '/add_employee');
        },
        label: Text("Add Employee"),
        icon: const Icon(Icons.add),
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        backgroundColor: Colors.blue.shade300,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white30,
        showSelectedLabels: false,
        showUnselectedLabels: true,
        onTap: (value) {
          setState(() {
            index = value;
          });
        } ,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            activeIcon: Icon(Icons.list_outlined),
            label: 'Employee Future',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            activeIcon: Icon(Icons.list_outlined),
            label: 'Employee Stream',
          ),
        ],
      ),
    );
  }
}

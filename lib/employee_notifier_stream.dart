import 'package:flutter/material.dart';
import 'package:flutter_sqlite/local/db/app_db.dart';
// import 'package:flutter_sqlite/local/db/app_db.dart';
import 'package:flutter_sqlite/notifier/employee_change_notifier.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class EmployeeNotifierStreamScreen extends StatefulWidget {
  const EmployeeNotifierStreamScreen({super.key});

  @override
  State<EmployeeNotifierStreamScreen> createState() =>
      _EmployeeNotifierStreamScreenState();
}

class _EmployeeNotifierStreamScreenState
    extends State<EmployeeNotifierStreamScreen> {
  // late AppDb _db;

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<EmployeeChangeNotifier>().getEmployeeStream();
    });
  }

  @override
  void dispose() {
    // _db.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final employees = context
    //     .watch<EmployeeChangeNotifier>()
    //     .employeeListStream;

    final isLoading = context.select<EmployeeChangeNotifier, bool>(
      (notifier) => notifier.isLoading,
    );
    // final employees = Provider.of<AppDb>(context).getEmployeesStream();

    // final employees = context
    //     .select<EmployeeChangeNotifier, List<EmployeeData>>(
    //       (notifier) => notifier.employeeListFuture,
    //     );

    // final employees = context
    //     .watch<EmployeeChangeNotifier>()
    //     .employeeListFuture;
    return Scaffold(
      appBar: AppBar(title: Text("Employee Stream"), centerTitle: true),

      // body:
      // StreamBuilder<List<EmployeeData>>(
      //   stream: Provider.of<AppDb>(context).getEmployeesStream(),
      //   builder: (context, snapshot) {
      //     // if (snapshot.connectionState != ConnectionState.done) {
      //     //   return Center(child: CircularProgressIndicator());
      //     // }
      //     // ❌ Ye StreamBuilder ke liye galat hai
      //     // Stream kabhi done hota hi nahi (jab tak close na ho)

      //     if (snapshot.connectionState == ConnectionState.waiting) {
      //       return const Center(child: CircularProgressIndicator());
      //     }

      //     if (snapshot.hasError) {
      //       return Center(child: Text(snapshot.error.toString()));
      //     }

      //     final List<EmployeeData>? employees = snapshot.data;

      //     if (snapshot.hasData && employees!.isNotEmpty) {
      //       return
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Selector<EmployeeChangeNotifier, List<EmployeeData>>(
              selector: (context, notifier) => notifier.employeeListStream,
              builder: (context, employees, child) {
                return ListView.builder(
                  itemCount: employees.length,
                  itemBuilder: (context, index) {
                    final employee = employees[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          '/edit_employee',
                          arguments: employee.id,
                        );
                      },
                      child: Card(
                        color: const Color.fromARGB(255, 226, 212, 212),
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: Colors.green,
                            style: BorderStyle.solid,
                            width: 1.2,
                          ),
                          borderRadius: BorderRadiusGeometry.only(
                            topLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          ),
                        ),
                        child: Column(
                          children: [
                            Text((index + 1).toString()),
                            Text("ID:- ${employee.id.toString()}"),
                            Text(employee.userName.toString()),
                            Text(employee.lastName.toString()),
                            Text(employee.address.toString()),
                            Text(employee.number.toString()),
                            // Text(employee.dateOfBirth.toString()),
                            Text(
                              DateFormat(
                                'dd/MM/yyyy',
                              ).format(employee.dateOfBirth).toString(),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}

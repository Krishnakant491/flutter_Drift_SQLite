import 'package:flutter/material.dart';
// import 'package:flutter_sqlite/local/db/app_db.dart';
// import 'package:flutter_sqlite/local/db/app_db.dart';
import 'package:flutter_sqlite/notifier/employee_change_notifier.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class EmployeeNotifierFuturescreen extends StatefulWidget {
  const EmployeeNotifierFuturescreen({super.key});

  @override
  State<EmployeeNotifierFuturescreen> createState() =>
      _EmployeeNotifierFuturescreenState();
}

class _EmployeeNotifierFuturescreenState
    extends State<EmployeeNotifierFuturescreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<EmployeeChangeNotifier>().getEmployeeFuture();
    });
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('BuildContext');
    final isLoading = context.select<EmployeeChangeNotifier, bool>(
      (notifier) => notifier.isLoading,
    );

    // final employees = context.watch<EmployeeChangeNotifier>().employeeListFuture;

    // final employees = context
    //     .select<EmployeeChangeNotifier, List<EmployeeData>>(
    //       (notifier) => notifier.employeeListFuture,
    //     );

    // final employees = context
    //     .watch<EmployeeChangeNotifier>()
    //     .employeeListFuture;
    return Scaffold(
      appBar: AppBar(title: Text("Employee Future"), centerTitle: true),

      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Consumer<EmployeeChangeNotifier>(
              builder: (context, notifier, child) {
                return ListView.builder(
                  itemCount: notifier.employeeListFuture.length,
                  itemBuilder: (context, index) {
                    final employee = notifier.employeeListFuture[index];
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

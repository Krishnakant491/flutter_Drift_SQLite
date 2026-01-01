import 'package:flutter/material.dart';
import 'package:flutter_sqlite/local/db/app_db.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class EmployeeFuturescreen extends StatefulWidget {
  const EmployeeFuturescreen({super.key});

  @override
  State<EmployeeFuturescreen> createState() => _EmployeeFuturescreenState();
}

class _EmployeeFuturescreenState extends State<EmployeeFuturescreen> {
  // late AppDb _db;

  @override
  void initState() {
    super.initState();
    // _db = AppDb();
  }

  @override
  void dispose() {
    // _db.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Employee Future"), centerTitle: true),

      body: FutureBuilder<List<EmployeeData>>(
        // future: _db.getEmployees(),
        future: Provider.of<AppDb>(context, listen: false).getEmployees(),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }

          final List<EmployeeData>? employees = snapshot.data;

          if (snapshot.hasData && employees!.isNotEmpty) {
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
          }

          return const Text("No Data Found");
        },
      ),
    );
  }
}

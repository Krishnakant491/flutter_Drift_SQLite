import 'package:flutter/material.dart';
import 'package:flutter_sqlite/local/db/app_db.dart';
import 'package:flutter_sqlite/notifier/employee_change_notifier.dart';
import 'package:flutter_sqlite/widget/customDatePickerFormField.dart';
import 'package:flutter_sqlite/widget/customTextFormFeild.dart';
import 'package:intl/intl.dart';
import 'package:drift/drift.dart' as drift;
import 'package:provider/provider.dart';

class EditEmployeeScreen extends StatefulWidget {
  final int id;
  const EditEmployeeScreen({super.key, required this.id});

  @override
  State<EditEmployeeScreen> createState() => _EditEmployeeScreenState();
}

class _EditEmployeeScreenState extends State<EditEmployeeScreen> {
  final _formKey = GlobalKey<FormState>();
  // late AppDb _db;
  // DateTime? dob;
  late EmployeeData _employeeData;
  final TextEditingController _firstnameController = TextEditingController();
  final TextEditingController _lastnameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _dateOfBirthController = TextEditingController();
  late DateTime _dateOfBirth;

  late EmployeeChangeNotifier _employeeChangeNotifier;


  @override
  void initState() {
    super.initState();
    // _db = AppDb();
    getEmployees();
    _employeeChangeNotifier = Provider.of<EmployeeChangeNotifier>(
      context,
      listen: false,
    );
    _employeeChangeNotifier.addListener(providerListener);
  }

  @override
  void dispose() {
    // _db.close();

    _lastnameController.dispose();
    _firstnameController.dispose();
    _addressController.dispose();
    _numberController.dispose();
    _dateOfBirthController.dispose();

    // _employeeChangeNotifier.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Update Employee Screen"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              deleteEmployee();
            },
            icon: Icon(Icons.delete),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  Customtextformfeild(
                    labelText: "Name",
                    textController: _firstnameController,
                    customKeyboardType: TextInputType.text,
                  ),
                  const SizedBox(height: 10),
                  Customtextformfeild(
                    labelText: "Surname",
                    textController: _lastnameController,
                    customKeyboardType: TextInputType.text,
                  ),
                  const SizedBox(height: 10),
                  Customtextformfeild(
                    labelText: "Address",
                    textController: _addressController,
                    customKeyboardType: TextInputType.text,
                  ),
                  const SizedBox(height: 10),
                  Customtextformfeild(
                    labelText: "Number",
                    textController: _numberController,
                    customKeyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 10),
                  CustomDatePickerFormFiled(
                    dateOfBirthController: _dateOfBirthController,
                    labelText: "Date of Birth",
                    callback: () {
                      pickDateOfBirth(context);
                    },
                  ),
                  ElevatedButton(
                    onPressed: () {
                      updateEmployee();
                    },
                    child: Text("Update"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> pickDateOfBirth(BuildContext context) async {
    final initialDate = DateTime.now(); // aaj ki date se
    final newDate = await showDatePicker(
      context: context,
      initialDate: _dateOfBirth,
      //initialDate -> date picker open hoga aaj ki date se....._dateOfBirth -> selected date se open hogi
      firstDate: DateTime(
        initialDate.year - 100,
      ), //minimum date = 100 years pehle
      lastDate: DateTime(initialDate.year + 1), //Maximum date = next year
      builder: (context, child) => Theme(
        //Date picker ka look/theme customize karne ke liye
        data: ThemeData().copyWith(
          //Default theme ko modify
          colorScheme: const ColorScheme.light(
            primary: Colors.pink, // Header color
            onPrimary: Colors.white, // Header text
            onSurface: Colors.black, // Body text
          ),
          dialogTheme: DialogThemeData(backgroundColor: Colors.white),
        ),
        child: child ?? const Text('HELLO'),
      ),
    );
    //User ne Cancel dabaya.....Cancel = null......Function yahin ruk jata hai
    if (newDate == null) {
      return;
    }

    setState(() {
      _dateOfBirth = newDate;
      String dob = DateFormat('dd/MM/yyyy').format(newDate);
      _dateOfBirthController.text = dob;
    });
  }

  Future<void> getEmployees() async {
    _employeeData = await Provider.of<AppDb>(
      context,
      listen: false,
    ).getEmployee(widget.id);
    _firstnameController.text = _employeeData.userName;
    _lastnameController.text = _employeeData.lastName;
    _addressController.text = _employeeData.address;
    _numberController.text = _employeeData.number;
    _dateOfBirthController.text = DateFormat(
      'dd/MM/yyyy',
    ).format(_employeeData.dateOfBirth);
    _dateOfBirth = _employeeData.dateOfBirth;
    // dob = DateFormat('dd/MM/yyyy').format(_employeeData.dateOfBirth);
    // _dateOfBirthController.text = dob;
  }

  void updateEmployee() {
    final isValid = _formKey.currentState?.validate();
    if (isValid != null && isValid) {
      final entity = EmployeeCompanion(
        id: drift.Value(widget.id),
        userName: drift.Value(_firstnameController.text),
        lastName: drift.Value(_lastnameController.text),
        address: drift.Value(_addressController.text),
        number: drift.Value(_numberController.text),
        dateOfBirth: drift.Value(_dateOfBirth),
      );

      context.read<EmployeeChangeNotifier>().updateEmployee(entity);
      // listenUpdateProvider();

      // Provider.of<AppDb>(context, listen: false).updateEmployee(entity).then((
      //   value,
      // ) {
      //   if (!mounted) return;
      //   ScaffoldMessenger.of(
      //     context,
      //   ).showSnackBar(SnackBar(content: Text("Employee Updated")));

      //   Navigator.pop(context, true);
      // });
    }
  }

  void listenUpdateProvider() {
    if (!mounted) return;
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text("Employee Updated")));
  }

  Future<void> deleteEmployee() async {
    context.read<EmployeeChangeNotifier>().deleteEmployee(widget.id);
    // listenDeleteProvider();

    // Provider.of<AppDb>(context, listen: false).deleteEmployee(widget.id).then((
    //   value,
    // ) {
    //   if (!mounted) return;
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     SnackBar(
    //       content: Text("Employee ${_firstnameController.text} deleted"),
    //     ),
    //   );

    //   Navigator.pop(context, true);
    // });
  }

  void listenDeleteProvider() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Employee ${_firstnameController.text} deleted")),
    );
  }

  void providerListener() {
    if (_employeeChangeNotifier.isUpdated) {
      listenUpdateProvider();
    }
    if (_employeeChangeNotifier.isDeleted) {
      listenDeleteProvider();
    }
  }
}

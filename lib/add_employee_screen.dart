import 'package:flutter/material.dart';
import 'package:flutter_sqlite/local/db/app_db.dart';
import 'package:flutter_sqlite/notifier/employee_change_notifier.dart';
import 'package:flutter_sqlite/widget/customDatePickerFormField.dart';
import 'package:flutter_sqlite/widget/customTextFormFeild.dart';
import 'package:intl/intl.dart';
import 'package:drift/drift.dart' as drift;
import 'package:provider/provider.dart';

class AddEmployeeScreen extends StatefulWidget {
  const AddEmployeeScreen({super.key});

  @override
  State<AddEmployeeScreen> createState() => _AddEmployeeScreenState();
}

class _AddEmployeeScreenState extends State<AddEmployeeScreen> {
  final _formKey = GlobalKey<FormState>();
  // late AppDb _db;
  final TextEditingController _firstnameController = TextEditingController();
  final TextEditingController _lastnameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _dateOfBirthController = TextEditingController();
  DateTime? _dateOfBirth;

  late EmployeeChangeNotifier _employeeChangeNotifier;

  // saveEmployeeData() {}

  @override
  void initState() {
    super.initState();

    _employeeChangeNotifier = Provider.of<EmployeeChangeNotifier>(context, listen: false);
    _employeeChangeNotifier.addListener(listenAddProvider);

  }

  @override
  void dispose() {
    // _db.close();

    _firstnameController.dispose();
    _lastnameController.dispose();
    _addressController.dispose();
    _numberController.dispose();
    _dateOfBirthController.dispose();
 
    _employeeChangeNotifier.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Employee Screen"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              addEmployee();
            },
            icon: Icon(Icons.save),
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
                  const SizedBox(height: 8.0),
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
      initialDate: _dateOfBirth ?? initialDate,
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

  void addEmployee() {
    final isValid = _formKey.currentState?.validate();
    if (isValid != null && isValid) {
      final entity = EmployeeCompanion(
        userName: drift.Value(_firstnameController.text),
        lastName: drift.Value(_lastnameController.text),
        address: drift.Value(_addressController.text),
        number: drift.Value(_numberController.text),
        dateOfBirth: drift.Value(_dateOfBirth!),
      );

      context.read<EmployeeChangeNotifier>().createEmployee(entity);
      // listenAddProvider();


      // Provider.of<AppDb>(context, listen: false)
      //     .insertEmployee(entity)
      //     .then(
      //       (value) => ScaffoldMessenger.of(context).showMaterialBanner(
      //         MaterialBanner(
      //           backgroundColor: Colors.green,
      //           content: Text("New Employee Inserted $value"),
      //           actions: [
      //             TextButton(
      //               onPressed: () => ScaffoldMessenger.of(
      //                 context,
      //               ).hideCurrentMaterialBanner(),
      //               child: const Text("Close"),
      //             ),
      //           ],
      //         ),
      //       ),
      //     );
      // Navigator.pop(context, true);
    }
  }

  void listenAddProvider() {
    if(_employeeChangeNotifier.isAdded){
      ScaffoldMessenger.of(context).showMaterialBanner(
      MaterialBanner(
        backgroundColor: Colors.green,
        content: Text("New Employee Inserted "),
        actions: [
          TextButton(
            onPressed: () =>
                ScaffoldMessenger.of(context).hideCurrentMaterialBanner(),
            child: const Text("Close"),
          ),
        ],
      ),
    );
    }
  }
}

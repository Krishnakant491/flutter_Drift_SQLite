import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomDatePickerFormFiled extends StatelessWidget {
  TextEditingController dateOfBirthController;
  String labelText;
  VoidCallback callback;

  CustomDatePickerFormFiled({
    super.key,
    required this.dateOfBirthController,
    required this.labelText,
    required this.callback,
  });
  // DateTime? _dateOfBirth;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: dateOfBirthController,
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        label: Text(labelText),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return '$labelText cannot br empty';
        }
        return null;
      },
      onTap: () => callback(),
    );
  }

  // Future<void> pickDateOfBirth(BuildContext context) async {
  //   final initialDate = _dateOfBirth ?? DateTime.now(); // aaj ki date se
  //   final newDate = await showDatePicker(
  //     context: context,
  //     initialDate: initialDate, //date picker open hoga aaj ki date se
  //     firstDate: DateTime(
  //       initialDate.year - 100,
  //     ), //minimum date = 100 years pehle
  //     lastDate: DateTime(initialDate.year + 1), //Maximum date = next year
  //     builder: (context, child) => Theme(
  //       //Date picker ka look/theme customize karne ke liye
  //       data: ThemeData().copyWith(
  //         //Default theme ko modify
  //         colorScheme: const ColorScheme.light(
  //           primary: Colors.pink, // Header color
  //           onPrimary: Colors.white, // Header text
  //           onSurface: Colors.black, // Body text
  //         ),
  //         dialogTheme: DialogThemeData(backgroundColor: Colors.white),
  //       ),
  //       child: child ?? const Text(''),
  //     ),
  //   );
  //   //User ne Cancel dabaya.....Cancel = null......Function yahin ruk jata hai
  //   if (newDate == null) {
  //     return;
  //   }

  // setState(() {
  //   _dateOfBirth = newDate;
  //   String dob = DateFormat('dd/MM/yyyy').format(newDate);
  //   dateOfBirthController.text = dob;
  // });
  // }
}

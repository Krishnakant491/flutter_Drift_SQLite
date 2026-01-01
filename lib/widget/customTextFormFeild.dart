import 'package:flutter/material.dart';

class Customtextformfeild extends StatelessWidget {
  final String labelText;
  final TextInputType customKeyboardType;
  final TextEditingController textController;
  const Customtextformfeild({
    super.key,
    required this.labelText,
    required this.textController,
    required this.customKeyboardType
  }  
  );

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textController,
      keyboardType: customKeyboardType ,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        label: Text(labelText),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return '$labelText cannot be empty';
        }
        return null;
      },
    
    );
    
  }
}

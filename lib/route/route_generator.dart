import 'package:flutter/material.dart';
import 'package:flutter_sqlite/add_employee_screen.dart';
import 'package:flutter_sqlite/edit_employee_screen.dart';
import 'package:flutter_sqlite/homescreen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings){
    final args = settings.arguments;
    
    switch(settings.name){
      case '/':
        return MaterialPageRoute(builder: (_) => Homescreen());
      case '/add_employee':
        return MaterialPageRoute(builder: (_) => AddEmployeeScreen());
      case '/edit_employee':
      if(args is int){
        return MaterialPageRoute(builder: (_) => EditEmployeeScreen(id: args));
      }
      return _errorRoute();
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute(){
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text("No Route Found"),
          centerTitle: true,

        ),
        body: const Center(
          child: Text("Sorry, No route found", style: TextStyle(color: Colors.red, fontSize: 20.0, fontWeight: FontWeight.bold),),
        ),
      );
    });
  }
}

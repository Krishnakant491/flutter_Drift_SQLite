import 'package:flutter/material.dart';
import 'package:flutter_sqlite/local/db/app_db.dart';
import 'package:flutter_sqlite/notifier/employee_change_notifier.dart';
import 'package:flutter_sqlite/route/route_generator.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';
// import 'package:path/path.dart';

void main() {
  //Only for provider(Db Provider).....
  //same as below
  // runApp(
  //   Provider<AppDb>(
  //     create: (_) => AppDb(),
  //     dispose: (_, db) => db.close(),
  //     child: const MyApp(),
  //   ),
  // );

  //Only for provider(Db Provider).....
  //same as above
  // runApp(
  //   Provider(
  //     create: (context) => AppDb(),
  //     child: const MyApp(),
  //     dispose: (context, AppDb db) => db.close(),
  //   ),
  // );

  runApp(
    MultiProvider(
      providers: [
        Provider.value(value: AppDb()),
        ChangeNotifierProxyProvider<AppDb, EmployeeChangeNotifier>(
          create: (context) => EmployeeChangeNotifier(),
          // update: (context, db, notifier) => notifier!..initAppDb(db)..getEmployeeFuture(),
          update: (Context, db, notifier) => notifier!..initAppDb(db),
        ),
      ],
      child: const MyApp(),
    ),
  );

  // runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      // theme: ThemeData(
      //   colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      // ),
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
      // home: const Homescreen(),
    );
  }
}

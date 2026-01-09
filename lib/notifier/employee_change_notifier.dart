import 'package:flutter/foundation.dart';
import 'package:flutter_sqlite/local/db/app_db.dart';

class EmployeeChangeNotifier extends ChangeNotifier {
  AppDb? _appDb;

  void initAppDb(AppDb db) {
    _appDb = db;
  }

  List<EmployeeData> _employeeListFuture = [];
  List<EmployeeData> get employeeListFuture => _employeeListFuture;

  List<EmployeeData> _employeeListStream = [];
  List<EmployeeData> get employeeListStream => _employeeListStream;

  EmployeeData? _employeeData;
  EmployeeData? get employeeData => _employeeData;

  bool _isAdded = false;
  bool get isAdded => _isAdded;

  bool _isUpdated = false;
  bool get isUpdated => _isUpdated;

  bool _isDeleted = false;
  bool get isDeleted => _isDeleted;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String _error = '';
  String get error => _error;

  void getEmployeeFuture() {
    _isLoading = true;
    notifyListeners();
    _appDb
        ?.getEmployees()
        .then((value) {
          _employeeListFuture = value;
          _isLoading = false;
          notifyListeners();
        })
        .onError((error, stackTrace) {
          _error = error.toString();
          _isLoading = false;
          notifyListeners();
        });
  }

  void getEmployeeStream() {
    _isLoading = true;

    _appDb
        ?.getEmployeesStream()
        .listen((event) {
          _employeeListStream = event;
          _isLoading = false;
          notifyListeners();
        })
        .onError((error, stackTrace) {
          _error = error.toString();
          _isLoading = false;
          notifyListeners();
        });
  }

  void getEmployee(int id) {
    _appDb?.getEmployee(id).then((value) {}).onError((error, stackTrace) {
      _error = error.toString();
    });
  }

  void createEmployee(EmployeeCompanion entity) {
    _appDb
        ?.insertEmployee(entity)
        .then((value) {
          _isAdded = (value != 0) ? true : false;
          if (_isAdded) {
            getEmployeeFuture();
            notifyListeners();
          }
        })
        .onError((error, stackTrace) {
          _error = error.toString();
          notifyListeners();
        });
  }

  void updateEmployee(EmployeeCompanion entity) {
    _appDb
        ?.updateEmployee(entity)
        .then((value) {
          _isUpdated = value;
          if (_isUpdated) {
            getEmployeeFuture();
            notifyListeners();
          }
        })
        .onError((error, stackTrace) {
          _error = error.toString();
          notifyListeners();
        });
  }

  void deleteEmployee(int id) {
    _appDb
        ?.deleteEmployee(id)
        .then((value) {
          _isDeleted = (value == 1) ? true : false;
          if (_isDeleted) {
            getEmployeeFuture();
            notifyListeners();
          }
        })
        .onError((error, stackTrace) {
          _error = error.toString();
          notifyListeners();
        });
    notifyListeners();
  }
}



// explain this
// final employees = context.watch<EmployeeChangeNotifier>().employeeListFuture;



// Future is for one-time asynchronous operations, whereas Stream is for continuous data flow.
// In Flutter, FutureBuilder is used for static data and StreamBuilder for real-time updates.


// Future handles a single asynchronous result, while Stream handles a sequence of asynchronous events over time. In Flutter, FutureBuilder is used for one-time data and StreamBuilder for real-time updates.


// 🔹 API / button / once → Future
// 🔹 Database / live UI → Stream


// 🔥 Side-by-Side Comparison
// Feature	     Future	          Stream
// Data count	    1 time         	Multiple times
// Live update	  ❌ No	        ✅ Yes
// UI refresh	    Manual        	Automatic
// DB watch	      ❌           	✅
// Best for	    API call, init  	Real-time DB







// notifier
// 🔔 What is ChangeNotifier in Flutter?
// ChangeNotifier is a state-management helper class in Flutter that lets your app notify the UI when data changes, so widgets rebuild automatically.
// In simple words 👉
// “Data badla → UI ko batao → UI update ho jaaye.”

// 🧠 Why ChangeNotifier exists
// Normally Flutter UI is static.
// If your data changes (counter, list, user info), Flutter won’t know unless you tell it.


// Interview-ready definition (remember this)
// ChangeNotifier is a Flutter class that provides a simple way to manage state by notifying listeners when data changes, allowing the UI to rebuild automatically.







// 1️⃣ Subscription memory leak se bachao
// Stream ko dispose() me cancel karna zaroori hai 👇
// StreamSubscription? _subscription;

// void getEmployeeStream() {
//   _subscription = _appDb?.getEmployeesStream().listen((event) {
//     setState(() {
//       _employeeListStream = event;
//     });
//   });
// }

// @override
// void dispose() {
//   _subscription?.cancel();
//   super.dispose();
// }








// Separation of Responsibilities ✅
// Layer	        Responsibility:-
// Provider       setup	Create & inject dependencies
// Notifier	      Business logic
// Screen	        Decide when to load data
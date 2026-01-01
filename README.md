# Flutter Provider State Management with Drift (SQLite)

This project demonstrates **Drift (SQLite)** for local database operations along with **Flutter state management using Provider**.
It covers real-world usage of **Provider, ChangeNotifier, Consumer, Selector, and MultiProvider** with proper architecture.

---

## 🚀 Tech Stack

- **Flutter**
- **Dart**
- **Provider (State Management)**
- **Drift (SQLite)**
- **SQLite Local Database**

---

## Concepts Covered

### 1️⃣ Provider

- Dependency injection in Flutter
- Providing database and notifier instances globally
- Clean separation of UI and business logic

````dart
Provider(create: (_) => AppDb());

---

### 2️⃣ ChangeNotifier
- Managing application state
- Handling loading, success, and error states
- Updating UI using `notifyListeners()`
- Best for UI that depends on state

---

### 3️⃣ Consumer
- Listening to ChangeNotifier
- Rebuilding only required widgets
- Avoiding unnecessary widget rebuilds

```dart
Consumer<EmployeeNotifier>(
  builder: (context, notifier, child) {
    return ListView.builder(
      itemCount: notifier.employeeList.length,
      itemBuilder: (context, index) {
        return Text(notifier.employeeList[index].name);
      },
    );
  },
);

---

### 4️⃣ Selector

- Optimized listening to specific values
- Prevents full widget rebuilds
- Improves performance in large applications

```dart
Selector<EmployeeNotifier, bool>(
  selector: (_, notifier) => notifier.isLoading,
  builder: (_, isLoading, __) {
    return isLoading
        ? CircularProgressIndicator()
        : Container();
  },
);

---

### 5️⃣ MultiProvider
- Registering multiple providers at once
- Clean and scalable app structure

```dart
MultiProvider(
      providers: [
        Provider.value(value: AppDb()),
        ChangeNotifierProxyProvider<AppDb, EmployeeChangeNotifier>(
          create: (context) => EmployeeChangeNotifier(),
          update: (Context, db, notifier) => notifier!..initAppDb(db),
        ),
      ],
      child: const MyApp(),
    ),
````


---

UI (Widgets)
↓
Consumer / Selector
↓
ChangeNotifier
↓
Drift DAO
↓
SQLite Database

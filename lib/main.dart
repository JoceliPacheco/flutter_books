import 'package:flutter/material.dart';
import 'package:flutter_books/src/database/database_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Books',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyWidget(child: const Center(child: Text('APP'))),
    );
  }
}

class MyWidget extends StatefulWidget {
  final Widget? child;
  const MyWidget({
    super.key,
    this.child,
  });

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  DatabaseManager db = new DatabaseManager();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.db.database.future;
  }

  @override
  Widget build(BuildContext context) {
    return widget.child ?? Container();
  }
}

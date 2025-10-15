import 'package:flutter/material.dart';
import 'insert_page.dart';
import 'query_page.dart';
import 'update_page.dart';
import 'delete_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SQLite CRUD App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void _goTo(BuildContext context, Widget page) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => page));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SQLite CRUD Example')),
      body: Padding(
        padding: const EdgeInsets.only(top: 50.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ElevatedButton(
                    onPressed: () => _goTo(context, const InsertPage()),
                    child: const Text('Insert'),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () => _goTo(context, const QueryPage()),
                    child: const Text('Query'),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () => _goTo(context, const UpdatePage()),
                    child: const Text('Update'),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () => _goTo(context, const DeletePage()),
                    child: const Text('Delete'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

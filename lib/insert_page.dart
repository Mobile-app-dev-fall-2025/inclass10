import 'package:flutter/material.dart';
import 'database/db_helper.dart';

class InsertPage extends StatefulWidget {
  const InsertPage({super.key});

  @override
  State<InsertPage> createState() => _InsertPageState();
}

class _InsertPageState extends State<InsertPage> {
  final dbHelper = DBHelper.instance;
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  String message = '';

  void _insertData() async {
    final name = nameController.text.trim();
    final age = int.tryParse(ageController.text.trim()) ?? 0;

    if (name.isEmpty || age <= 0) {
      setState(() => message = 'Please enter valid name and age.');
      return;
    }

    final id = await dbHelper.insert({
      DBHelper.columnName: name,
      DBHelper.columnAge: age,
    });

    setState(() => message = 'Inserted row ID: $id');
    nameController.clear();
    ageController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Insert Data')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: ageController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Age'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: _insertData, child: const Text('Insert')),
            const SizedBox(height: 20),
            Text(message),
          ],
        ),
      ),
    );
  }
}

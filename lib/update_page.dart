import 'package:flutter/material.dart';
import './database/db_helper.dart';

class UpdatePage extends StatefulWidget {
  const UpdatePage({super.key});

  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  final dbHelper = DBHelper.instance;
  final idController = TextEditingController();
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  String message = '';

  void _updateData() async {
    final id = int.tryParse(idController.text.trim());
    final name = nameController.text.trim();
    final age = int.tryParse(ageController.text.trim());

    if (id == null || name.isEmpty || age == null) {
      setState(() => message = 'Please enter valid ID, name, and age.');
      return;
    }

    final rowsAffected = await dbHelper.update({
      DBHelper.columnId: id,
      DBHelper.columnName: name,
      DBHelper.columnAge: age,
    });

    setState(() => message = 'Updated $rowsAffected row(s)');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Update Data')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: idController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'ID to Update'),
            ),
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'New Name'),
            ),
            TextField(
              controller: ageController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'New Age'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: _updateData, child: const Text('Update')),
            const SizedBox(height: 20),
            Text(message),
          ],
        ),
      ),
    );
  }
}

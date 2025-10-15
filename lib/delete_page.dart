import 'package:flutter/material.dart';
import './database/db_helper.dart';

class DeletePage extends StatefulWidget {
  const DeletePage({super.key});

  @override
  State<DeletePage> createState() => _DeletePageState();
}

class _DeletePageState extends State<DeletePage> {
  final dbHelper = DBHelper.instance;
  List<Map<String, dynamic>> rows = [];

  @override
  void initState() {
    super.initState();
    _loadRows();
  }

  void _loadRows() async {
    final data = await dbHelper.queryAllRows();
    setState(() => rows = data);
  }

  void _deleteRow(int id) async {
    await dbHelper.delete(id);
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('Deleted row with ID $id')));
    _loadRows(); // refresh the list
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Delete Records')),
      body: rows.isEmpty
          ? const Center(child: Text('No records found.'))
          : ListView.builder(
              itemCount: rows.length,
              itemBuilder: (context, index) {
                final row = rows[index];
                return Card(
                  margin: const EdgeInsets.symmetric(
                    vertical: 6,
                    horizontal: 12,
                  ),
                  child: ListTile(
                    title: Text(row[DBHelper.columnName]),
                    subtitle: Text(
                      'Age: ${row[DBHelper.columnAge]} (ID: ${row[DBHelper.columnId]})',
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () => _deleteRow(row[DBHelper.columnId]),
                    ),
                  ),
                );
              },
            ),
    );
  }
}

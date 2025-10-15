import 'package:flutter/material.dart';
import './database/db_helper.dart';

class QueryPage extends StatefulWidget {
  const QueryPage({super.key});

  @override
  State<QueryPage> createState() => _QueryPageState();
}

class _QueryPageState extends State<QueryPage> {
  final dbHelper = DBHelper.instance;
  List<Map<String, dynamic>> rows = [];

  void _loadRows() async {
    final data = await dbHelper.queryAllRows();
    setState(() => rows = data);
  }

  @override
  void initState() {
    super.initState();
    _loadRows();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Query Data')),
      body: rows.isEmpty
          ? const Center(child: Text('No data found.'))
          : ListView.builder(
              itemCount: rows.length,
              itemBuilder: (context, index) {
                final row = rows[index];
                return ListTile(
                  title: Text(row[DBHelper.columnName]),
                  subtitle: Text(
                    'Age: ${row[DBHelper.columnAge]} (ID: ${row[DBHelper.columnId]})',
                  ),
                );
              },
            ),
    );
  }
}

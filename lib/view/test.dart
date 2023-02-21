import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:unavida/model/log/log.dart';
import 'package:unavida/model/log/log_entry.dart';
import 'package:unavida/model/log/log_entry_dao.dart';

import '../DAL/database_provider.dart';

class TestView extends StatefulWidget {
  TestView({Key? key}) : super(key: key);

  @override
  State<TestView> createState() => _TestViewState();
}

class _TestViewState extends State<TestView> {
  late Database db;
  String logs = '';

  initDb() async {
    db = (await DatabaseProvider.instance.database)!;
  }

  @override
  void initState() {
    initDb();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    late LogEntryDao logEntryDao = LogEntryDao(db);
    TextEditingController typeController = TextEditingController();
    TextEditingController subtypeController = TextEditingController();
    TextEditingController detailsController = TextEditingController();
    final formKey = GlobalKey<FormState>();


    return Scaffold(
      appBar: AppBar(
        title: Text('Log Entry'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Form(
              key: formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: typeController,
                    decoration: InputDecoration(
                      labelText: 'Type',
                    ),
                  ),
                  TextFormField(
                    controller: subtypeController,
                    decoration: InputDecoration(
                      labelText: 'Subtype',
                    ),
                  ),
                  TextFormField(
                    controller: detailsController,
                    decoration: InputDecoration(
                      labelText: 'Details',
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Creating entry...'),
                  ),
                );

                if (formKey.currentState!.validate()) {
                  LogEntry logEntry = LogEntry(
                    Log.stringToLogType(typeController.text),
                    subtypeController.text,
                    detailsController.text,
                  );

                  logEntryDao.insertLogEntry(logEntry);
                }
              },
              child: Text('Create entry'),
            ),
            ElevatedButton(
              onPressed: () async {
                List<LogEntry> entries = await logEntryDao.getAllLogEntries();
                setState(() {
                  logs = entries.toString();
                });
                print('-- Entries: $entries');
              },
              child: Text('Get all entries'),
            ),
            Text(logs),
          ],
        ),
      ),
    );
  }
}

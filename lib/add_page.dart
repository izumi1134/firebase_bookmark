import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddPage extends StatefulWidget {
  AddPage({Key? key}) : super(key: key);

  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  String first = '';
  String last = '';
  int? birthYear;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'First',
              ),
              onChanged: (text) {
                first = text;
              },
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'Last',
              ),
              onChanged: (text) {
                last = text;
              },
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'Birth Year',
              ),
              onChanged: (text) {
                birthYear = int.tryParse(text);
              },
            ),
            ElevatedButton(
              onPressed: () async {
                await _addToFirebase();
                Navigator.pop(context);
              },
              child: Text('追加する'),
            ),
          ],
        ),
      ),
    );
  }

  Future _addToFirebase() async {
    final db = FirebaseFirestore.instance;
    // Create a new user with a first and last name
    final user = <String, dynamic>{
      "first": first,
      "last": last,
      "born": birthYear,
    };

// Add a new document with a generated ID
    await db.collection("users").add(user);
  }
}

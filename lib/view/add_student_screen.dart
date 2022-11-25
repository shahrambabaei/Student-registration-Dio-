import 'package:flutter/material.dart';
import 'package:test_http/data.dart';

class AddStudentScreen extends StatefulWidget {
  const AddStudentScreen({super.key});

  @override
  State<AddStudentScreen> createState() => _AddStudentScreenState();
}

class _AddStudentScreenState extends State<AddStudentScreen> {
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _courseController = TextEditingController();
  final TextEditingController _scoreController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Student'),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 20, 15, 20),
          child: Column(children: [
            TextField(
              controller: _firstNameController,
              decoration: const InputDecoration(label: Text('firstName')),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: _lastNameController,
              decoration: const InputDecoration(label: Text('lastName')),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: _courseController,
              decoration: const InputDecoration(label: Text('course')),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: _scoreController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(label: Text('score')),
            ),
          ]),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () async {
            final result = await saveStudent(
                _firstNameController.text,
                _lastNameController.text,
                _courseController.text,
                int.parse(_scoreController.text));
            Navigator.pop(context, result);
          },
          label: Row(
            children:const [Icon(Icons.add), Text('Add Student')],
          )),
    );
  }
}

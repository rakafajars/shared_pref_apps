import 'package:flutter/material.dart';
import 'package:shared_pref_app/page/home_page.dart';
import 'package:shared_pref_app/utils/shared_pref.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FormLoginPage extends StatefulWidget {
  const FormLoginPage({super.key});

  @override
  State<FormLoginPage> createState() => _FormLoginPageState();
}

class _FormLoginPageState extends State<FormLoginPage> {
  final _nameController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext contextA) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Login',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(hintText: 'Username'),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () async {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomePage(),
                  ),
                );
                await SharedPref().saveToken(
                  _nameController.text,
                );
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}

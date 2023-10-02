import 'package:flutter/material.dart';
import 'package:shared_pref_app/page/splash_page.dart';
import 'package:shared_pref_app/utils/shared_pref.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? username;
  String? password;
  String? email;

  void initial() async {
    username = await SharedPref().getToken();

    setState(() {});
  }

  @override
  void initState() {
    initial();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          const SizedBox(height: 16),
          Text(username ?? "-"),
          const SizedBox(height: 16),
          Text(password ?? "-"),
          const SizedBox(height: 16),
          Text(email ?? "-"),
          const SizedBox(height: 24),
          Center(
            child: ElevatedButton(
              onPressed: () async {
                await SharedPref().removeToken();
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const SplashPage(),
                    ),
                    (route) => false);
              },
              child: const Text(
                'Log Out',
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:shared_pref_app/page/form_login_page.dart';
import 'package:shared_pref_app/page/home_page.dart';
import 'package:shared_pref_app/utils/shared_pref.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  void checkLogin() async {
    String newUser = await SharedPref().getToken();

    print(newUser);

    Future.delayed(
      const Duration(
        seconds: 3,
      ),
      () {
        if (newUser.isNotEmpty) {
          // homePage
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const HomePage(),
              ),
              (route) => false);
        } else {
          // login
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const FormLoginPage(),
              ),
              (route) => false);
        }
      },
    );
  }

  @override
  void initState() {
    checkLogin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Icon(
          Icons.flutter_dash,
          size: 48,
        ),
      ),
    );
  }
}

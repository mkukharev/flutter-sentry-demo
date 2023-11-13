import 'package:flutter/material.dart';
import 'package:receptioner_monitoring/features/widgets/login_form.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: Container(
          width: 350,
          height: 400,
          color: Colors.lightBlueAccent.shade100,
          child: Padding(
            padding: const EdgeInsets.all(50.0),
            child: ListView(
              children: const [
                LoginForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

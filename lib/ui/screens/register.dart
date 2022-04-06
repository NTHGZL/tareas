import 'package:flutter/material.dart';
import 'package:tareas/widgets/register_form.dart';

class Register extends StatelessWidget {
  const Register({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView (
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 100, bottom: 20),
              child: const Text('Welcome !', style: TextStyle(fontSize: 30, color: Colors.white)),
            ),
            const RegisterForm()

          ],
        ),
      )

    );
  }
}

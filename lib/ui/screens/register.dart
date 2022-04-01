import 'package:flutter/material.dart';
import 'package:tareas/widgets/register_form.dart';

class Register extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.black,
      resizeToAvoidBottomInset: false,
      body:
      Center(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 100, bottom: 20),
              child: const Text('!Bienvenido!', style: TextStyle(fontSize: 30, color: Colors.white)),
            ),
             RegisterForm()

          ],
        )
      ),
    );
  }
}

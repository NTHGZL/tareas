
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tareas/widgets/login_form.dart';

class Login extends StatelessWidget{
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(

          children: [
            Padding(padding: const EdgeInsets.only(top: 25, bottom: 25),
              child: SvgPicture.asset(
                'assets/images/logo.svg',
                width: 200,

              ),
            ),
            const LoginForm()
          ],
        ),
      )
    );
  }


}
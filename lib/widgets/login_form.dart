import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tareas/widgets/input.dart';

class LoginForm extends StatelessWidget {

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [ Input(
          label: 'Mail',
          hint: 'name@example.com',
          keyboardType: TextInputType.emailAddress,
          icon: const Icon(Icons.email, color: Colors.white),
          controller: _emailController,
        )
          , Input(
            label: 'Password',
            hint: '********',
            icon: const Icon(Icons.lock, color: Colors.white),
            obscureText: true,
            controller: _passwordController,

          ),
          ElevatedButton(onPressed:
              ()=>{},
              child: const Text('Se connecter'),
          ),
          InkWell(
            onTap: () => {},
            child: const Text('Déjà un compte ?', style: TextStyle(color: Colors.blue),),
          ),

        ]
    );
  }
}
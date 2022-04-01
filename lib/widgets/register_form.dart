import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:tareas/repositories/api_repository.dart';
import 'package:tareas/repositories/token_repository.dart';
import 'package:tareas/repositories/user_repository.dart';
import 'package:tareas/services/user_service.dart';
import 'package:tareas/widgets/input.dart';

import '../models/user.dart';

class RegisterForm extends StatelessWidget{
   RegisterForm({Key? key}) : super(key: key);

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _lastnameController = TextEditingController();

  final UserService _userService = UserService(UserRepository(ApiRepository(TokenRepository())), TokenRepository());

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          children:  [
            Input(
                label: 'Prénom',
                hint: 'Jean',
                icon: const Icon(Icons.person, color: Colors.white,),
                controller: _nameController
            ),
            Input(
                label: 'Nom',
                hint: 'Dupont',
                icon: const Icon(Icons.person, color: Colors.white,),
                controller: _lastnameController
            ),
            Input(
              label: 'Mail',
              hint: 'name@example.com',
              icon: const Icon(Icons.mail, color: Colors.white),
              keyboardType: TextInputType.emailAddress,
              controller: _emailController,
            ),
            Input(
              label: 'Mot de passe',
              hint: '********',
              icon: const Icon(Icons.lock, color: Colors.white),
              obscureText: true,
              keyboardType: TextInputType.text,
              controller: _passwordController,
            ),
            ElevatedButton(

              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.indigo),
                padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.symmetric(vertical: 20, horizontal: 50)),

              ),
              onPressed: () async {
               User user = await _userService.register(
                   email: 'nathan@shff.fr',
                   password: 'test1231',
                    name: 'Nathan',
                    lastname: 'Gonzalez',
                );
                print(user.toString());
              },
              child: const Text('S\'inscrire'),

            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/login');
              },
              child: const Text('Vous avez déjà un compte ?', style: TextStyle(color: Colors.white),),
            )




          ]
        )
      );

  }
  
}
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tareas/blocs/user_cubit.dart';
import 'package:tareas/widgets/button_full_width.dart';
import 'package:tareas/widgets/input.dart';

class LoginForm extends StatelessWidget {

  LoginForm({Key? key}) : super(key: key);

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
                  type: 'email',
                )
                  , Input(
                    label: 'Password',
                    hint: '********',
                    icon: const Icon(Icons.lock, color: Colors.white),
                    obscureText: true,
                    controller: _passwordController,
                    type: 'password',

                  ),
                  ButtonFullWidth(text: 'Se connecter', onPressed: ()async {

                    try{
                      await context.read<UserCubit>().login(_emailController.text, _passwordController.text);
                      Navigator.of(context).pushNamed('/home');
                    }catch(e){
                      throw Exception(e.toString());
                    }



                  }),

                  InkWell(

                    onTap: () => {
                      Navigator.of(context).pushNamed('/register')
                    },
                    child: const Text('Vous n\'avez pas encore de compte ?', style: TextStyle(color: Colors.blue),),
                  ),

                ]
            );

  }
}
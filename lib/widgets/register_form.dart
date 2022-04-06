import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tareas/blocs/user_cubit.dart';
import 'package:tareas/widgets/button_full_width.dart';
import 'package:tareas/widgets/input.dart';

class RegisterForm extends StatefulWidget{
   const RegisterForm({Key? key}) : super(key: key);

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _lastnameController = TextEditingController();



  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children:  [
            Input(
                label: 'Prénom',
                hint: 'Jean',
                icon: const Icon(Icons.person, color: Colors.white,),
                controller: _nameController,
                type: 'name',


            ),
            Input(
                label: 'Nom',
                hint: 'Dupont',
                icon: const Icon(Icons.person, color: Colors.white,),
                controller: _lastnameController,
              type: 'name',

            ),
            Input(
              label: 'Mail',
              hint: 'name@example.com',
              icon: const Icon(Icons.mail, color: Colors.white),
              keyboardType: TextInputType.emailAddress,
              controller: _emailController,
              type: 'email',
            ),
            Input(
              label: 'Mot de passe',
              hint: '********',
              icon: const Icon(Icons.lock, color: Colors.white),
              obscureText: true,
              keyboardType: TextInputType.text,
              controller: _passwordController,
              type: 'password',
            ),
            ButtonFullWidth(text: 'S\'inscrire', onPressed:  ()async {

              if(_formKey.currentState!.validate()){
                try{
                  await context.read<UserCubit>().register(_emailController.text, _passwordController.text,
                      _nameController.text, _lastnameController.text);
                  Navigator.of(context).pushNamed('/home');
                }catch(e){
                  await context.read<UserCubit>().removeUser();

                  throw Exception(e.toString());
                }
              }

            }),

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
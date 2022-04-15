import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tareas/blocs/user_cubit.dart';
import 'package:tareas/widgets/button_full_width.dart';
import 'package:tareas/widgets/input.dart';

class LoginForm extends StatefulWidget {

  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
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
                    ButtonFullWidth(
                      isLoading: isLoading,
                        text: 'Se connecter',
                        onPressed: ()async {

                      if(_formKey.currentState!.validate() && !isLoading){
                        setState(() {
                          isLoading = true;
                        });
                        try{
                          await context.read<UserCubit>().login(_emailController.text.trim(), _passwordController.text.trim());
                          Navigator.of(context).pushNamed('/home');
                        }catch(e){
                          showModalBottomSheet(context: context, builder: (BuildContext context){

                            return Container(
                              height: 100,
                              color: Colors.red,
                              child:  const Center(child: Text('Identifiant ou mot de passe incorrect')),
                            );
                          });


                        }
                      }
                      setState(() {
                        isLoading = false;
                      });
                    }),

                    InkWell(

                      onTap: () => {

                        Navigator.of(context).pushNamed('/register')
                      },
                      child: const Text('Vous n\'avez pas encore de compte ?', style: TextStyle(color: Colors.blue),),
                    ),

                  ]
              ),
    );

  }
}
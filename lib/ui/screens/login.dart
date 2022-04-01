
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Login extends StatelessWidget{
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        
        children: [
           Padding(padding: const EdgeInsets.only(top: 25, bottom: 25),
          child: SvgPicture.asset(
            'assets/images/logo.svg',
            width: 100,
            height: 100,
          ),
          ),
          TextFormField(
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.mail),
              labelText: 'Mail',
              fillColor: Colors.white,
              filled: true
            ),
          ),
          TextFormField(
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.lock),
              labelText: 'Mot de passe',
              fillColor: Colors.white,
              filled: true
            ),
          ),
           Padding(
            padding: const EdgeInsets.only(top: 25, bottom: 25),
            child: TextButton(
              style: TextButton.styleFrom(
                primary: Colors.white,
                backgroundColor: Colors.indigo,
                minimumSize: const Size(150, 50)

              ),
                onPressed: ()=>{
                  Navigator.of(context).pushNamed('/home')
                },
                child: const Text('Se connecter')


            ),


          )
        ],
      )
    );
  }


}
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tareas/widgets/button_full_width.dart';

class PublicHome extends StatelessWidget{
  const PublicHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(

        child: Column(

          children: [
            Padding(padding: const EdgeInsets.only(top: 50, bottom: 100),
              child: SvgPicture.asset(
                'assets/images/logo.svg',
                width: MediaQuery.of(context).size.width * 0.9,

              ),
            ),
            ButtonFullWidth(
                text: 'Je n\'ai pas de compte',
                onPressed: (){
                  Navigator.of(context).pushNamed('/register');
                },
            ),
            ButtonFullWidth(
                text: 'Je suis déjà inscrit',
                onPressed: (){
                  Navigator.of(context).pushNamed('/login');
                },
            ),




          ],
        ),
      ),
    );
  }

}
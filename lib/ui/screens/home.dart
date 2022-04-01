import 'package:flutter/material.dart';
import 'package:tareas/widgets/circle_avatar_initials.dart';

class Home extends StatelessWidget{
  const Home({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: const [
            Text('Nathan Gonzalez', textAlign: TextAlign.left, ),
            Text('nathangonzalez@outlook.fr', textAlign: TextAlign.left, style: TextStyle(fontSize: 12, color: Colors.grey),)
          ],
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const Padding(
          padding: EdgeInsets.only(left: 20),
          child: CircleAvatarInitials(),
        ),
        actions: [
          IconButton(onPressed: ()=>{}, icon: const Icon(Icons.more_vert))
        ],

      ),
      backgroundColor: Colors.black,
      body: Column(
        children: [
          ListTile(
            leading: const Icon(Icons.task_outlined, color: Colors.blue,),
            title: const Text('Mes tâches'),
            textColor: Colors.white,
            onTap: ()=>{
              Navigator.of(context).pushNamed('/tasks')
            },

          ),
          ListTile(
            leading: const Icon(Icons.shopping_cart, color: Colors.orange,),
            title: const Text('Mes courses'),
            textColor: Colors.white,
            onTap: ()=>{},
          ),
          ListTile(
            leading: const Icon(Icons.login, color: Colors.white,),
            title: const Text('Login'),
            textColor: Colors.white,
            onTap: ()=>{
              Navigator.of(context).pushNamed('/login')
            },
          ),
          ListTile(
            leading: const Icon(Icons.app_registration_rounded, color: Colors.blue,),
            title: const Text('Inscription'),
            textColor: Colors.white,
            onTap: ()=>{
              Navigator.of(context).pushNamed('/register')
            },

          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()=>{},
        elevation: 20,
        backgroundColor: Colors.indigo,
        child: const Icon(Icons.add),
      )



    );
  }

}
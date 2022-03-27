import 'package:flutter/material.dart';
import 'package:tareas/components/circle_avatar_initials.dart';

class Home extends StatelessWidget{


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: const [
            Text('Nathan Gonzalez', textAlign: TextAlign.left,),
            Text('nathangonzalez@outlook.fr', textAlign: TextAlign.left, style: TextStyle(fontSize: 10),)
          ],
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const CircleAvatarInitials(),
        actions: [
          IconButton(onPressed: ()=>{}, icon: const Icon(Icons.more_vert))
        ],

      ),
      backgroundColor: Colors.black,
      body: Column(
        children: [
          ListTile(
            leading: const Icon(Icons.task, color: Colors.white,),
            title: const Text('Mes tâches'),
            textColor: Colors.white,
            onTap: ()=>{
              Navigator.of(context).pushNamed('/tasks')
            },

          ),
          ListTile(
            leading: const Icon(Icons.shopping_cart, color: Colors.white,),
            title: const Text('Mes courses'),
            textColor: Colors.white,
            onTap: ()=>{},
          )
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
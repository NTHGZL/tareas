import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tareas/blocs/user_cubit.dart';
import 'package:tareas/models/user.dart';
import 'package:tareas/widgets/circle_avatar_initials.dart';

class Home extends StatelessWidget{
  const Home({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, User?>(
      builder: (context, user){
        return Scaffold(
            appBar: AppBar(
              title: Column(
                children:  [
                  Text(user != null ? user.getFullName() : 'null', textAlign: TextAlign.left, ),
                  Text(user != null ? user.email : 'null', textAlign: TextAlign.left, style: const TextStyle(fontSize: 12, color: Colors.grey),)
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
                  onTap: ()=>{
                    Navigator.of(context).pushNamed('/products')
                  },
                ),
                Container(
                  padding: const EdgeInsets.all(10),

                  decoration: BoxDecoration(
                    color: Colors.red[900],

                  ),
                  child: ListTile(
                    leading: const Icon(Icons.logout, color: Colors.white,),
                    title: const Text('Se déconnecter', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),),
                    textColor: Colors.white,
                    onTap: ()=>{
                      context.read<UserCubit>().logout(),
                      Navigator.of(context).pushNamed('/public_home')

                    },
                  ),
                )
              ],
            ),




        );
      },
    );
  }

}
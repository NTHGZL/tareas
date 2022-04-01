
import 'package:flutter/material.dart';

import '../../models/task.dart';

class ListItem extends StatelessWidget{

  final List<Task> tasks = [Task("Rdv coiffeur", null), Task("Appeler Banque", null), Task("Arroser plantes", null)];

  ListItem({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mes tâches'),

        leading: IconButton(
            onPressed: ()=>{
              Navigator.of(context).pushNamed('/home')
            },
            icon: const Icon(Icons.arrow_back)),
        actions: [
          IconButton(onPressed: ()=>{}, icon: const Icon(Icons.more_vert))
        ],
        backgroundColor: Colors.transparent,

      ),
      backgroundColor: Colors.black,
      floatingActionButton: FloatingActionButton(
        onPressed: () {  },
        child: const Icon(Icons.add),
        backgroundColor: Colors.indigo,
      ),
      body: ListView.builder(
                padding: const EdgeInsets.all(5.0),
                itemCount: tasks.length,
                itemBuilder: (context, index){
                  Task task = tasks[index];
                  return Container(
                    padding: const EdgeInsets.all(5.0),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),

                    ),
                    child: ListTile(
                        leading: const Icon(Icons.circle_outlined, color: Colors.white,),
                        title: Text(task.title),
                        textColor: Colors.white,
                        tileColor: const Color.fromRGBO(78, 78, 78, 1.0),
                        contentPadding: const EdgeInsets.only(top: 5.0, bottom: 5.0, left: 10.0, right: 10.0),
                      // Put rounding on the cornes of the widget
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.0),
                      ),


                    ),
                  );
                }
            ),
    );
  }

}
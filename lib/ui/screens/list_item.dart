
import 'package:flutter/material.dart';

import '../../models/task.dart';

class ListItem extends StatelessWidget{

   List<Task> tasks = [Task("Rdv coiffeur", null, null), Task("Appeler Banque", null, null), Task("Arroser plantes", null, null)];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mes tâches'),
        leading: const Icon(Icons.arrow_back),
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
      body:  ListView.builder(
        padding: const EdgeInsets.all(5.0),
          itemCount: tasks.length,
            itemBuilder: (context, index){
            Task task = tasks[index];
            return Container(
              padding: const EdgeInsets.only(top: 5.0),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),

              ),
              child: ListTile(
                  leading: const Icon(Icons.circle_outlined, color: Colors.white,),
                  title: Text(task.title),
                  textColor: Colors.white,
                  tileColor: const Color.fromRGBO(20, 20, 20, 1.0)

              ),
            );
            }
        ),
      
    );
  }

}
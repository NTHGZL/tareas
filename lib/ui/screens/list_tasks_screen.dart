import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tareas/blocs/task_cubit.dart';
import 'package:tareas/models/task.dart';
import 'package:tareas/widgets/list_item_widget.dart';

class ListTasksScreen extends StatefulWidget {
  const ListTasksScreen({Key? key}) : super(key: key);

  @override
  State<ListTasksScreen> createState() => _ListTasksScreenState();
}

class _ListTasksScreenState extends State<ListTasksScreen> {

  bool isVisible = false;
  final TextEditingController _taskTitleController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Mes tâches'),
        backgroundColor: Colors.transparent,
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await Future.delayed(const Duration(seconds: 1), () {
            context.read<TaskCubit>().loadTasks();
          });
        },
        child: SingleChildScrollView(
          child: BlocBuilder<TaskCubit, List<Task>>(
              builder: (context, tasks){
                List<Task> notCompleteTasks = tasks.where((task) => !task.completed).toList();
                List<Task> completeTasks = tasks.where((task) => task.completed).toList();
                return Column(
                  children:  [
                    ListItemWidget(
                      items: notCompleteTasks,
                      listItemCubit: context.read<TaskCubit>(),
                    ),
                    InkWell(
                      child: Row(
                        children:  [
                          isVisible ? const RotatedBox(quarterTurns: 1, child: Icon(Icons.chevron_right, color: Colors.white,) ,) : const Icon(Icons.chevron_right, color: Colors.white,),
                           Text('Terminées ('+notCompleteTasks.length.toString()+')', style: const TextStyle(fontSize: 20, color: Colors.white)),
                        ],
                      ),
                      onTap: (){
                        setState(() {
                          isVisible = !isVisible;
                        });
                      },
                    ),
                    if(isVisible) ListItemWidget(items: completeTasks, listItemCubit: context.read<TaskCubit>())
                  ],
                );

              }
          ),

        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet<void>(
            isScrollControlled: true,
            context: context,
            builder: (BuildContext context) {
              return SingleChildScrollView(
                padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                child: SizedBox(

                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Container(

                        padding: const EdgeInsets.only(left :20),
                        width: MediaQuery.of(context).size.width*0.6,

                          child: TextFormField(
                            decoration: const InputDecoration(
                              labelText: 'Nouvelle tâche'
                            ),
                          controller: _taskTitleController,
                          autofocus: true,
                        ),
                      ),
                      ElevatedButton(
                        child: const Icon(Icons.add),
                        onPressed: () async {
                          await context.read<TaskCubit>().addTask(_taskTitleController.text);
                          _taskTitleController.text = '';
                          Navigator.of(context).pop();
                        },
                      )
                    ],
                  ),
                ),
              );
            },
          );
        },
        child: const Icon(Icons.add, size: 30,),

      ),
    );

  }
}
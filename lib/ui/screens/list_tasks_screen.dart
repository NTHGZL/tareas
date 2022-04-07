import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tareas/blocs/task_cubit.dart';
import 'package:tareas/models/task.dart';
import 'package:tareas/widgets/create_item_form.dart';
import 'package:tareas/widgets/list_item_widget.dart';

class ListTasksScreen extends StatefulWidget {
  const ListTasksScreen({Key? key}) : super(key: key);

  @override
  State<ListTasksScreen> createState() => _ListTasksScreenState();
}

class _ListTasksScreenState extends State<ListTasksScreen> {

  bool isVisible = false;

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
                return Expanded(
                  child: Column(
                    children:  [
                      ListItemWidget(
                        items: notCompleteTasks,
                        listItemCubit: context.read<TaskCubit>(),
                      ),
                      InkWell(
                        child: Row(
                          children:  [
                            isVisible ? const RotatedBox(quarterTurns: 1, child: Icon(Icons.chevron_right, color: Colors.white,) ,) : const Icon(Icons.chevron_right, color: Colors.white,),
                            Text('Terminées ('+completeTasks.length.toString()+')', style: const TextStyle(fontSize: 20, color: Colors.white)),
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
                  ),
                );

              }
          ),

        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet<void>(
            backgroundColor: const Color.fromRGBO(40, 40, 40, 1.0),
            isScrollControlled: true,
            context: context,
            builder: (BuildContext context) {
              return Padding(
                padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                child:  SizedBox(

                  height: 100,
                  child: CreateItemForm(itemCubit: context.read<TaskCubit>())
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
import 'package:flutter/material.dart';
import 'package:tareas/blocs/item_cubit.dart';

class CreateItemForm extends StatefulWidget{

final ItemCubit itemCubit;

  const CreateItemForm({Key? key, required this.itemCubit}) : super(key: key);

  @override
  State<CreateItemForm> createState() => _CreateItemFormState();
}

class _CreateItemFormState extends State<CreateItemForm> {

  final TextEditingController _titleControler = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              padding: const EdgeInsets.only(left :20),
              width: MediaQuery.of(context).size.width*0.6,
              child: TextFormField(
                autofocus: true,
                style: const TextStyle(color: Colors.white),
                controller: _titleControler,
                validator: (value){
                  if(value == null || value.isEmpty){
                    return 'Ce champ est requis';
                  }
                  return null;
                },
                decoration: const InputDecoration(

                  labelText: 'Nouvelle tâche',
                  labelStyle: TextStyle(color: Colors.white),
                  focusColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)
                  )

                ),

              ),
            ),
            ElevatedButton(onPressed: () async {

              if(_formKey.currentState!.validate()){

                try{
                  await widget.itemCubit.addItems(_titleControler.text);
                  await widget.itemCubit.loadItems();
                  Navigator.of(context).pop();
                }catch(e){
                  throw Exception(e.toString());
                }


              }


            }, child: const Icon(Icons.add))
          ],
        )
    );
  }
}
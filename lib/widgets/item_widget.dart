
import 'package:flutter/material.dart';

import '../models/item.dart';

class ItemWidget extends StatelessWidget{

  final Item item;
  final Function onPressCheckedButton;

  const ItemWidget({Key? key, required this.item, required this.onPressCheckedButton}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5.0),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(
            20)),

      ),
      child: ListTile(
        leading: IconButton(onPressed: () async {
          await onPressCheckedButton();
        },
            icon: item.completed ? const Icon(Icons.check_circle, color: Colors.green, size: 30,) : const Icon(Icons.circle_outlined,
                color: Colors.white, size: 30,)),
        title: Text(item.title, style: TextStyle(decoration: item.completed ? TextDecoration.lineThrough : null)),
        textColor: Colors.white,
        tileColor: const Color.fromRGBO(78, 78, 78, 1.0),
        contentPadding: const EdgeInsets.only(top: 5.0,
            bottom: 5.0,
            left: 10.0,
            right: 10.0),
        // Put rounding on the cornes of the widget
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.0),
        ),


      ),
    );
  }

}
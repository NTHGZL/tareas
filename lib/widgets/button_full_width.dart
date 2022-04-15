import 'package:flutter/material.dart';

class ButtonFullWidth extends StatelessWidget {

  final  Function? onPressed;
  final String text;
  final bool isLoading;
  const ButtonFullWidth({Key? key, required this.text, this.onPressed, required this.isLoading}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: ElevatedButton(

          onPressed: ()async {

            if(onPressed != null) {
              await onPressed!();
            }

          },
          child: Text(text, style: const TextStyle(color: Colors.white)),
          style: ElevatedButton.styleFrom(

            primary: isLoading ? Colors.grey : Colors.indigo,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            minimumSize: const Size.fromHeight(65),
          )

      ),
    );
  }



}
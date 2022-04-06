import 'package:flutter/material.dart';

class ButtonFullWidth extends StatelessWidget {

  final  Function? onPressed;
  final String text;

  const ButtonFullWidth({Key? key, required this.text, this.onPressed}) : super(key: key);

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
            primary: Colors.indigo,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            minimumSize: const Size.fromHeight(65),
          )

      ),
    );
  }



}
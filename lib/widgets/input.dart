import 'package:flutter/material.dart';

class Input extends StatelessWidget{

  final String label;
  final String hint;
  final Icon? icon;
  final bool? obscureText;
  final TextInputType? keyboardType;
  final TextEditingController? controller;

  const Input({Key? key, required this.label, required this.hint, this.keyboardType,this.controller, this.icon, this.obscureText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     return Container(
       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
       margin: const EdgeInsets.symmetric(vertical: 5),
       child: TextFormField(

         decoration:  InputDecoration(

           border: const OutlineInputBorder(
             borderSide: BorderSide(color: Colors.white),
             borderRadius: BorderRadius.all(Radius.elliptical(20, 20)),
           ),
           contentPadding: const EdgeInsets.symmetric(vertical: 25),
           labelText: label,
           labelStyle: const TextStyle(
             color: Colors.white,
             fontSize: 15,
           ),
           hintText: hint,
           hintStyle: const TextStyle(
             color: Colors.grey,
             fontSize: 15,
           ),
           prefixIcon: icon,
           fillColor: const Color.fromRGBO(37, 42, 52, 1),
           filled: true,

         ),
         controller: controller,
         keyboardType: keyboardType,
         obscureText: obscureText ?? false,
         style: const TextStyle(
           color: Colors.white,
           fontSize: 15,
         ),



       )
     );
  }



}
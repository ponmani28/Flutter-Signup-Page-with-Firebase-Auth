import 'package:flutter/material.dart';

class mytextfield extends StatelessWidget {
  
  final TextEditingController controller;
  final String hinttext;
  final bool obsecuretext;


  const mytextfield({super.key, required this.controller, required this.hinttext, required this.obsecuretext});

  

  @override
  Widget build(BuildContext context) {
    return  TextField(controller: controller, obscureText: obsecuretext,
    
    decoration:  InputDecoration(
                      enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                      focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                      fillColor: Colors.grey.shade200,filled: true,
                      hintText: hinttext,hintStyle: TextStyle(color: Colors.grey[500]),
                      
                      
                      
                      
                      
   ),               
  );
  }
}
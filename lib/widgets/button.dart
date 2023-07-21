import 'package:flutter/material.dart';

class mybutton extends StatelessWidget {
  
  
  
  const mybutton({super.key,  required this.text, this.onTap});
  final Function()? onTap;
  final String text;
  

  @override
  Widget build(BuildContext context) {



    return GestureDetector(onTap: onTap,
      child: Container(
          padding: EdgeInsets.all(23),
          decoration: BoxDecoration(color: Colors.black,borderRadius: BorderRadius.circular(8),border: Border.all(color: Colors.yellow)),
          child: Center(child: Text(text,style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 17),),),
    
    
    
      ),
    );
  }
}
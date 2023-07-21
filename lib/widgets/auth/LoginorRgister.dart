

import 'package:firebaseapp/widgets/loginpage.dart';
import 'package:firebaseapp/widgets/signinpage.dart';
import 'package:flutter/material.dart';

class loginorregisterpage extends StatefulWidget {
  const loginorregisterpage({super.key});

  @override
  State<loginorregisterpage> createState() => _loginorregisterpageState();
}

class _loginorregisterpageState extends State<loginorregisterpage> {


//INITIALLY, SHOW THE LOGIN PAGE

  bool showloginpage = true;


//togglE b/w LOGIN AND REGISTER PAGE
void togglepages(){
  setState(() {
    showloginpage = !showloginpage;
  });
}





  @override
  Widget build(BuildContext context) {
     if (showloginpage) {
      return login(onTap: togglepages);
     }else{
      return Registerpage(onTap: togglepages);
     } 
     
  }
}
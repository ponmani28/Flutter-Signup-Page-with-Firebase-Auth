import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebaseapp/widgets/button.dart';

import 'package:firebaseapp/widgets/textfield.dart';
import 'package:flutter/material.dart';

class login extends StatefulWidget {
  const login({super.key, this.onTap});
  final Function()? onTap;

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  
    final emailtextcontroller  = TextEditingController();
final passwordtextcontroller = TextEditingController();

//signin user
 void signIn()async{try {await FirebaseAuth.instance.signInWithEmailAndPassword(email: emailtextcontroller.text, password: passwordtextcontroller.text);}on FirebaseAuthException catch (e){displaymessage(e.code);}

 }

//display a dialog message

void displaymessage(String message){
  showDialog(context:context,builder:(context) => AlertDialog(title: Text(message),));
}

  @override
  Widget build(BuildContext context) {


    return   Scaffold(


      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(children: [
          
              const SizedBox(height: 50),
                
                
              //LOGO
                
                
              const Center(child: Icon(Icons.lock,size: 100)),
          
          
              
                
                
              //WELCOME BACK MESSAGE
              const Padding(
                padding: EdgeInsets.fromLTRB(60, 5,60, 30),
                child: Card(child: ListTile(title: Center(child: Text("WELCOME BACK ",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)),subtitle: Center(child: Text("you've been missed",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)),),),
              ),
                
          
          
            //email textfield
          
            mytextfield(controller: emailtextcontroller, hinttext: 'Email', obsecuretext: false),
                
                
              //PASSWORD TEXT FIELD
              
            mytextfield(controller: passwordtextcontroller, hinttext: 'Password', obsecuretext: true),
      
      
            const SizedBox(height:10),
              
                
                
              // SIGNIN BUTTON
                
            mybutton(text: "Sign in",onTap: signIn,),
      
            const SizedBox(height: 15,),
                
                
              //GO TO REGISTER PAGE
                
             Row(mainAxisAlignment: MainAxisAlignment.center,children: 
             [
              
                          Text("Not a member?",style: TextStyle(color: Colors.grey[700],fontWeight: FontWeight.bold,fontSize: 17),),
             GestureDetector(onTap: widget.onTap,
             child: const Text(" Register now",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue,fontSize: 17),))
             
             
             ],)   
                
                
                
                
                
                
                
                
                
                
                
                
            ],),
          ),
        ),
      ),









    );
  }
}
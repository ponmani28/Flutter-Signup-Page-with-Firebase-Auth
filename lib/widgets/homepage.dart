// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebaseapp/widgets/posts.dart';
// import 'package:firebaseapp/widgets/textfield.dart';
// import 'package:flutter/material.dart';

// class homepage extends StatefulWidget {
//   const homepage({super.key});

//   @override
//   State<homepage> createState() => _homepageState();
// }

// class _homepageState extends State<homepage> {


//   //user
//   final currentUser = FirebaseAuth.instance.currentUser!;
//   //text controller
//   final textcontroller = TextEditingController(); 
//   //post message
//   void postmessage (){
//     if (textcontroller.text.isNotEmpty){
// //store in firebase
//     FirebaseFirestore.instance.collection("user posts").add({
//       'useremail': currentUser.email,
//       'message': textcontroller.text,
//       'timestamp': Timestamp.now()
//     }); 


//     }


//   }
  
//  ///signout 
//   void signout(){
//     FirebaseAuth.instance.signOut();
//   }
  
//   @override
//   Widget build(BuildContext context) {
//     return  Scaffold(
//       appBar: AppBar(title: const Text("Texo"),
//       actions: [IconButton(onPressed: signout , icon: const Icon(Icons.logout))],), 


//       body: Column(children: [ 


    
//           //the wall
//     Expanded(child: StreamBuilder(

//       builder: (context,snapshot){
//           if (snapshot.hasData){return ListView.builder(itemCount: snapshot.data!.docs.length,itemBuilder: (context, index) {
//           //get the message 
//           final post =snapshot.data!.docs[index];
//           return posts(message: post['message'], user: post['useremail']);
//         });}else if (snapshot.hasError)   {return Center(child: Text("error:${snapshot.error}"));
//         }  return const Center(child: CircularProgressIndicator(),);    } ,
        
        
//         stream: FirebaseFirestore.instance.collection("user posts").orderBy("time stamp",descending: false).snapshots())),


//           //postmessage

//           Padding(
//             padding: const EdgeInsets.all(25.0),
//             child: Row(children: [
          
//               Expanded(child: mytextfield(controller: textcontroller, hinttext: "write something blah blah blah....", obsecuretext: false)),

//                //postbutton
//           IconButton(onPressed: postmessage, icon: Icon(Icons.post_add_rounded)),

          
//             ],),
//           ),

         
//           //logged in as
//         Text("loggedin as  " + currentUser.email!)

//       ],),
      
//          );}}



import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebaseapp/widgets/posts.dart';
import 'package:firebaseapp/widgets/textfield.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  //user
  final currentUser = FirebaseAuth.instance.currentUser!;
  //text controller
  final textcontroller = TextEditingController();
  //post message
  void postMessage() {
    if (textcontroller.text.isNotEmpty) {
      //store in firebase
      FirebaseFirestore.instance.collection("user posts").add({
        'useremail': currentUser.email,
        'message': textcontroller.text,
        'timestamp': Timestamp.now(),
      });
    }
  }

  //clear the last field
  setstate(){
    textcontroller.clear();
  }

  //signout
  void signOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Texo"),
        actions: [
          IconButton(
            onPressed: signOut,
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: Column(
        children: [
          //the wall
          Expanded(
            child: StreamBuilder(
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      //get the message
                      final post = snapshot.data!.docs[index];
                      return Posts(
                        message: post['message'],
                        user: post['useremail'],
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return Center(child: Text("error: ${snapshot.error}"));
                }
                return const Center(child: CircularProgressIndicator());
              },
              stream: FirebaseFirestore.instance
                  .collection("user posts")
                  .orderBy("timestamp", descending: false)
                  .snapshots(),
            ),
          ),

          //postmessage
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Row(
              children: [
                Expanded(
                  child: mytextfield(
                    controller: textcontroller,
                    hinttext: "write something blah blah blah....",
                    obsecuretext: false,
                  ),
                ),

                //postbutton
                IconButton(
                  onPressed: postMessage,
                  icon: Icon(Icons.post_add_rounded),
                ),
              ],
            ),
          ),

          //logged in as
          Text("loggedin as  " + currentUser.email!),
        ],
      ),
    );
  }
}

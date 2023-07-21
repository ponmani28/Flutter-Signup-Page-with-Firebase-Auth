// import 'package:flutter/material.dart';

// class posts extends StatelessWidget {


//   final String message;
//   final String user;
  
  

//   const posts({super.key, required this.message, required this.user});

//   @override
//   Widget build(BuildContext context) {
//     return Container(decoration: BoxDecoration(color: Colors.green,borderRadius: BorderRadius.circular(8)),
//       child: Row(children: [
    
//     Column(children:[
//       Text(user,style: TextStyle(color: Colors.grey),),SizedBox(height: 10,),
//       Text(message),
//     ])
    
//       ],),
//     );
//   }
// }

import 'package:flutter/material.dart';

class Posts extends StatelessWidget {
  final String message;
  final String user;

  const Posts({Key? key, required this.message, required this.user})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.greenAccent, borderRadius: BorderRadius.circular(8)),padding: EdgeInsets.all(25),margin: EdgeInsets.only(top: 25,left: 25,right: 15),
      
      child: Row(
        children: [SizedBox(height:10),
          Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                user,
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(height: 10,),
              Text(message),
            ],
          ),
        ],
      ),
    );
  }
}

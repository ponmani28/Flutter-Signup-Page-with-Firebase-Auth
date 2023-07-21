import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebaseapp/widgets/auth/LoginorRgister.dart';
import 'package:firebaseapp/widgets/homepage.dart';
import 'package:flutter/material.dart';

class authentication extends StatelessWidget {
  const authentication({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(builder: (context,Snapshot){if(Snapshot.hasData){return Homepage();}else{return loginorregisterpage();}},
      stream: FirebaseAuth.instance.authStateChanges()),
    );
  }
}
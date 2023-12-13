import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:interfaces/model/user_model.dart';

import '../../constante.dart';

class Menu_screen extends StatefulWidget {
  @override
  _Menu_screen_state createState() => _Menu_screen_state();
}

class _Menu_screen_state extends State<Menu_screen> {
  User user = FirebaseAuth.instance.currentUser;
  UserModel loggedinUser = UserModel();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseFirestore.instance.collection("users").doc(user.uid).get().then((value) => {this.loggedinUser = UserModel.fromMap(value.data()), setState(() {})});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            'images/2.png',
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.asset(
            "images/3.png",
            scale: 1.3,
          ),
          SizedBox(
            height: 80,
          ),
          Text(
            "Welcome Back",
            style: TextStyle(
              fontFamily: 'Tajawal',
              fontSize: 40,
              color: shadows,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "${loggedinUser.username}",
            style: TextStyle(
              fontFamily: 'Tajawal',
              fontSize: 25,
              color: shadows,
            ),
          ),
          SizedBox(
            height: 50,
          ),
          ElevatedButton(
            onPressed: () {
              logout(context);
            },
            child: Text(
              "Sign out",
              style: TextStyle(
                color: shadows,
                fontSize: 16,
              ),
            ),
            style: ElevatedButton.styleFrom(
                primary: bleu,
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))),
          ),
        ]),
      ),
    );
  }

  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushNamed(context, '/sign_in');
  }
}

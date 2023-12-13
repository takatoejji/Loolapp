import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:interfaces/model/user_model.dart';

import '../../constante.dart';

class Form_signup extends StatefulWidget {
  @override
  _Form_signup_state createState() => _Form_signup_state();
}

class _Form_signup_state extends State<Form_signup> {
  final _formkey = GlobalKey<FormState>();
  final TextEditingController _pass = TextEditingController();
  final TextEditingController _confirmPass = TextEditingController();
  final TextEditingController emaileditingcontroller = TextEditingController();
  final TextEditingController usernamecontroller = TextEditingController();
  final _auth = FirebaseAuth.instance;
  bool _obscuretext = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            alignment: Alignment.center,
            child: Text(
              'Register with us ',
              style: TextStyle(color: shadows, fontSize: 25, fontFamily: 'Tajawal', fontWeight: FontWeight.w700),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 14),
            child: TextFormField(
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              controller: emaileditingcontroller,
              onSaved: (value) {
                emaileditingcontroller.text = value;
              },
              decoration: InputDecoration(
                labelText: 'Enter a Email',
                labelStyle: TextStyle(
                  color: shadows,
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(width: 3, color: shadows),
                  borderRadius: BorderRadius.circular(15),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(width: 3, color: purple),
                  borderRadius: BorderRadius.circular(15),
                ),
                prefixIcon: Icon(
                  Icons.email,
                  color: shadows,
                  size: 25.0,
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please Enter your EMAIL';
                }
              },
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 14),
            child: TextFormField(
              keyboardType: TextInputType.name,
              textInputAction: TextInputAction.next,
              controller: usernamecontroller,
              decoration: InputDecoration(
                labelText: 'Enter a Username',
                labelStyle: TextStyle(
                  color: shadows,
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(width: 3, color: shadows),
                  borderRadius: BorderRadius.circular(15),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(width: 3, color: purple),
                  borderRadius: BorderRadius.circular(15),
                ),
                prefixIcon: Icon(
                  Icons.person,
                  color: shadows,
                  size: 25.0,
                ),
              ),
              onSaved: (value) {
                usernamecontroller.text = value;
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please Enter your username';
                }
              },
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 14),
            child: TextFormField(
              controller: _pass,
              obscureText: _obscuretext,
              textInputAction: TextInputAction.next,
              onSaved: (value) {
                _pass.text = value;
              },
              decoration: InputDecoration(
                  labelText: 'Enter a Password',
                  labelStyle: TextStyle(
                    color: shadows,
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(width: 3, color: shadows),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(width: 3, color: purple),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  prefixIcon: Icon(
                    Icons.lock,
                    color: shadows,
                    size: 25.0,
                  ),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        _obscuretext = !_obscuretext;
                      });
                    },
                    child: Icon(
                      _obscuretext ? Icons.visibility : Icons.visibility_off,
                      color: shadows,
                    ),
                  )),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please Enter valide password';
                }
                if (value.length < 8) {
                  return 'Please Enter valide password (+8 Characters)';
                }
              },
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 14),
            child: TextFormField(
              controller: _confirmPass,
              obscureText: _obscuretext,
              textInputAction: TextInputAction.done,
              onSaved: (value) {
                _confirmPass.text = value;
              },
              decoration: InputDecoration(
                  labelText: 'Confirm your Password',
                  labelStyle: TextStyle(
                    color: shadows,
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(width: 3, color: shadows),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(width: 3, color: purple),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  prefixIcon: Icon(
                    Icons.lock,
                    color: shadows,
                    size: 25.0,
                  ),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        _obscuretext = !_obscuretext;
                      });
                    },
                    child: Icon(
                      _obscuretext ? Icons.visibility : Icons.visibility_off,
                      color: shadows,
                    ),
                  )),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please Enter valide password';
                }
                if (value.length < 8) {
                  return 'Please Enter valide password (+8 Characters)';
                }
                if (value != _pass.text) {
                  return "No match ";
                }
              },
            ),
          ),
          Container(
            width: 250,
            height: 50,
            child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(purple),
                  elevation: MaterialStateProperty.all(10),
                ),
                onPressed: () {
                  signUp(emaileditingcontroller.text, _pass.text);
                },
                child: const Text('Vallidate',
                    style: TextStyle(
                      color: shadows,
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ))),
          )
        ],
      ),
    );
  }

  void signUp(String email, String password) async {
    if (_formkey.currentState.validate()) {
      await _auth.createUserWithEmailAndPassword(email: email, password: password).then((value) => {postDetailsToFirestore()}).catchError((error) {
        Fluttertoast.showToast(msg: error.message);
      });
    }
  }

  postDetailsToFirestore() async {
    //call the firestore
    //call usermodel
    //posting data
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User user = _auth.currentUser;
    UserModel userModel = UserModel();
    //writing all the values
    userModel.email = user.email;
    userModel.uid = user.uid;
    userModel.username = usernamecontroller.text;
    //posting to firestore
    await firebaseFirestore.collection("users").doc(user.uid).set(userModel.toMap());
    Fluttertoast.showToast(msg: "Account created succefully");
    Navigator.pushNamed(context, '/mainpage');
  }
}

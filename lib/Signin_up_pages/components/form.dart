import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:interfaces/constante.dart';

class Signin_Form extends StatefulWidget {
  @override
  _Signin_form_state createState() => _Signin_form_state();
}

class _Signin_form_state extends State<Signin_Form> {
  final _formkey = GlobalKey<FormState>();
  bool _obscuretext = true;
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();
  //firebase instance
  final _auth = FirebaseAuth.instance;

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
                'Sign into your account',
                style: TextStyle(color: shadows, fontSize: 25, fontFamily: 'Tajawal', fontWeight: FontWeight.w700),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 14),
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                controller: emailController,
                onSaved: (value) {
                  emailController.text = value;
                },
                decoration: InputDecoration(
                  labelText: 'Email',
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
                    return 'Please Enter your email';
                  }
                  // if (RegExp("[a-zA-Z0-9+_.-]+@[a-zA-z0-9,-]+.[a-z]").hasMatch(value)) {
                  //  return ('Please a valid Email');
                  // }
                  return null;
                },
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 14),
              child: TextFormField(
                obscureText: _obscuretext,
                textInputAction: TextInputAction.done,
                controller: passwordController,
                onSaved: (value) {
                  passwordController.text = value;
                },
                decoration: InputDecoration(
                    labelText: 'Password',
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
              width: 250,
              height: 50,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(purple),
                  elevation: MaterialStateProperty.all(10),
                ),
                onPressed: () {
                  if (_formkey.currentState.validate()) {
                    signIn(emailController.text, passwordController.text);
                  }
                },
                child: const Text(
                  'Login',
                  style: TextStyle(
                    color: shadows,
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            )
          ],
        ));
  }

  void signIn(String email, String password) async {
    if (_formkey.currentState.validate()) {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((uid) => {
                Fluttertoast.showToast(msg: 'Login Succeful'),
                Navigator.pushNamed(context, '/mainpage'),
              })
          .catchError((e) {
        Fluttertoast.showToast(msg: e.message);
      });
    }
  }
}

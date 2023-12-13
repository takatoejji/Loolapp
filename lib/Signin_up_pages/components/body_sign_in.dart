import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:interfaces/constante.dart';
import 'package:flutter/gestures.dart';
import 'form.dart';

class Body_sign_in extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/2.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 530,
                  width: 370,
                  decoration: BoxDecoration(color: purplebox, borderRadius: BorderRadius.all(Radius.circular(15))),
                  child: Signin_Form(),
                ),
                Container(
                  margin: EdgeInsets.only(top: 90),
                  child: Center(
                      child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                            style: TextStyle(
                              color: shadows,
                              fontFamily: 'Tajawal',
                              fontSize: 18,
                            ),
                            text: "Don't have an account ? "),
                        TextSpan(
                            text: 'Register',
                            style: TextStyle(
                              color: purplebox,
                              fontFamily: 'Tajawal',
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.pushNamed(context, '/sign_up');
                              }),
                      ],
                    ),
                  )),
                )
              ],
            ),
          ),
        ));
  }
}

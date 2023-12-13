import 'package:flutter/material.dart';

import '../constante.dart';
import 'components/Sign_up_form.dart';

class Sign_up extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'images/2.png',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Container(
            height: 600,
            width: 370,
            decoration: BoxDecoration(color: purplebox, borderRadius: BorderRadius.all(Radius.circular(15))),
            child: Form_signup(),
          ),
        ),
      ),
    );
  }
}

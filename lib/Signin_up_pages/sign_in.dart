import 'package:flutter/material.dart';
import 'package:interfaces/constante.dart';

import 'components/body_sign_in.dart';

class Sign_in_p extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40),
        child: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                'images/3.png',
                height: 50,
                width: 190,
              )
            ],
          ),
          backgroundColor: appbarpurple,
          elevation: 0,
        ),
      ),
      body: Body_sign_in(),
    );
  }
}

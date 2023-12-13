import 'package:flutter/material.dart';
import 'package:interfaces/constante.dart';

class Body_welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/1.png"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
            width: 140,
            height: 50,
            bottom: 160,
            left: 140,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  alignment: Alignment.center,
                  elevation: 9,
                  shadowColor: Colors.black,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(180))),
              onPressed: () {
                Navigator.pushNamed(context, '/sign_in');
              },
              child: Text(
                "Let's go",
                style: TextStyle(
                  color: shadows,
                  fontSize: 20,
                  fontFamily: "Tajawal",
                  fontWeight: FontWeight.w600,
                ),
              ),
            ))
      ],
    );
  }
}

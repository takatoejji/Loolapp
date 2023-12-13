import 'package:flutter/material.dart';
import 'package:interfaces/Mainpage/screens/menu.dart';
import 'package:interfaces/Mainpage/screens/qrcode.dart';
import 'package:interfaces/Mainpage/screens/searchpage.dart';
import '../constante.dart';
import 'package:interfaces/my_flutter_app_icons.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentindex = 0;
  final screens = [
    Menu_screen(),
    QRCODESCANNER(),
    Search_page(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: screens[currentindex],
        bottomNavigationBar: Theme(
          data: ThemeData(
              //set the background color to purple
              canvasColor: purple,
              //set the active icon to white
              primaryColor: Colors.white),
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(color: Colors.black38, spreadRadius: 12, blurRadius: 10),
              ],
            ),
            child: BottomNavigationBar(
              currentIndex: currentindex,
              onTap: (index) {
                setState(() => currentindex = index);
              },
              type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.person_rounded), tooltip: "Menu", label: "Menu"),
                BottomNavigationBarItem(icon: Icon(Icons.qr_code_rounded), tooltip: 'Scan qrcode', label: "Scan qrcode"),
                BottomNavigationBarItem(icon: Icon(Icons.search_rounded), tooltip: "Search", label: "Search"),
                //BottomNavigationBarItem(icon: Icon(Icons.assistant), tooltip: "Assisstant", label: "Assisstant"),
              ],
            ),
          ),
        ));
  }
}

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:interfaces/Signin_up_pages/sign_in.dart';
import 'package:interfaces/Signin_up_pages/sign_up.dart';
import 'Mainpage/mainpage.dart';
import 'Mainpage/screens/Generated_qrcode.dart';
import 'welcoming/welcome_page.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/welcome",
      routes: {
        '/welcome': (context) => Welcome_page(),
        '/sign_in': (context) => Sign_in_p(),
        '/sign_up': (context) => Sign_up(),
        '/mainpage': (context) => MyHomePage(),
        '/genedqrcode': (context) => Generated_qrcode(),
      },
    );
  }
}

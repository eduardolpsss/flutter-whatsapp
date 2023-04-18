import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/login.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  //Inicializando o Firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyCCjd09xbB9uhLdcUb5IwY1iii7clzhyuQ",
      appId: "1:110274997235:web:20ebbb156e2f7fe0bdc086",
      messagingSenderId: "110274997235",
      projectId: "whatsapp-web-18168",
    ),
  );
  runApp(const MaterialApp(
    title: 'WhatsApp',
    debugShowCheckedModeBanner: false,
    home: Login(),
  ));
}

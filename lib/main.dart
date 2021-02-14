
//Paquetes Propios de Flutter
import 'package:flutter/material.dart';

//Paquetes de Terceros

//Nuestros Paquetes 
import 'package:bandnames/pages/home.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'home',
      routes: {
        'home': ( _ ) => HomePage(),
      },
    );
  }
}
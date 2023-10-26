import 'package:flutter/material.dart';
import 'package:food/pages/cart_page.dart';
import 'package:food/pages/home_page.dart';
import 'package:food/pages/login_page.dart'; //we import the material package which provides widgets
import 'package:food/utils/routes.dart';
import 'package:food/widgets/themes.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  //main function
  runApp(
      MyApp()); //method is runApp and we provide the app name over here and runApp takes a widgets and runs it
}

class MyApp extends StatelessWidget {
  //class called myApp extends a stateless widget
  //const MyApp({Key? key}) : super(key: key); //constructor

  @override
  Widget build(BuildContext context) {
    //final's data can be modified
    //const value never changes ,its like let
    //num is for both int and double
    //build is the method highly used for UI
    return MaterialApp(
      //material app was the root of app's widget tree
      //home: HomePage(),
      themeMode: ThemeMode.system,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      debugShowCheckedModeBanner: false,
      initialRoute: "MyRoutes.homeRoute", //starting route
      routes: {
        "/": (context) =>
            LoginPage(), //object if the word new is written,default
        MyRoutes.homeRoute: (context) => HomePage(),
        MyRoutes.loginRoute: (context) => LoginPage(),
        MyRoutes.cartRoute: (context) => CartPage()
      }, //which page you want to open and it has map which is a key and a function,/ is default route
    );
  }
}

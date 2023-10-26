import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTheme {
  //var buttonColor ;
  static ThemeData lightTheme(BuildContext context) => ThemeData(
      fontFamily: GoogleFonts.poppins().fontFamily,
      cardColor: Colors.white,
      canvasColor: creamColor,
      highlightColor: darkOrangishColor,
      appBarTheme: AppBarTheme(
        color: Colors.white,
        elevation: 0.0,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        // textTheme:Theme.of(context).textTheme,
        toolbarTextStyle: Theme.of(context).textTheme.bodyText2,
        titleTextStyle: Theme.of(context).textTheme.headline6,
      ),
      //accentColor:darkOrangishColor,
      colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.orange)
          .copyWith(secondary: darkOrangishColor));



  static ThemeData darkTheme(BuildContext context) => ThemeData(
      //brightness: Brightness.dark,
      fontFamily: GoogleFonts.poppins().fontFamily,
      cardColor: Colors.black,
      canvasColor: darkCreamColor,
      highlightColor: lightOrangishColor,
      //buttonColor:lightOrangishColor,
      appBarTheme: AppBarTheme(
        color: Colors.black,
        elevation: 0.0,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        //textTheme: Theme.of(context).textTheme,
        // toolbarTextStyle: Theme.of(context).textTheme.bodyText2,
        // titleTextStyle: Theme.of(context).textTheme.headline6,
        toolbarTextStyle: Theme.of(context)
            .textTheme
            .copyWith(
                headline6:
                    context.textTheme.headline6?.copyWith(color: Colors.white))
            .bodyText2,
        titleTextStyle: Theme.of(context)
            .textTheme
            .copyWith(
                headline6:
                    context.textTheme.headline6?.copyWith(color: Colors.white))
            .headline6,
      ),
      //accentColor:Colors.white,
      colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.white));

  //colors
  static Color creamColor = Color(0xfff5f5f5);
  static Color darkCreamColor = Vx.gray900;
  static Color lightOrangishColor = Vx.orange200;
  static Color darkOrangishColor = Color.fromARGB(255, 255, 80, 27);
}

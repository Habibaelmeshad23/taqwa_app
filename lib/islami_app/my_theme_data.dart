import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyThemeData{
  static Color primaryColor=Color(0xFFB7935F);
  static Color blackColor=Color(0xFF242424);
  static Color darkPrimary=Color(0xFF141A2E);
  static Color yellow=Color(0xffFACC1D);




  static ThemeData lightTheme= ThemeData(
      textTheme: TextTheme(
        bodySmall: GoogleFonts.elMessiri(
            fontSize: 20,
            fontWeight: FontWeight.w400,
            color: primaryColor
        ),
        bodyMedium: GoogleFonts.elMessiri(
            fontSize: 25,
            fontWeight: FontWeight.w700,
            color: yellow
        ),
        bodyLarge: GoogleFonts.elMessiri(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: blackColor
        ),
      ),
      scaffoldBackgroundColor: Colors.transparent,
      colorScheme: ColorScheme(
          brightness: Brightness.light,
          primary: primaryColor,
          onPrimary: Colors.white,
          secondary: blackColor,
          onSecondary: Colors.white,
          error: Colors.red,
          onError: Colors.white,
          background: Colors.white,
          onBackground: blackColor,
          surface: primaryColor,
          onSurface: Colors.white),
      appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(color: blackColor,
          size: 30
        ),
        color: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type:BottomNavigationBarType.shifting ,
      selectedItemColor: blackColor,
      unselectedItemColor: Colors.white,
      backgroundColor: primaryColor
    )

  );

  static  ThemeData darkTheme=ThemeData(
      textTheme: TextTheme(
        bodySmall: GoogleFonts.elMessiri(
            fontSize: 20,
            fontWeight: FontWeight.w400,
            color: yellow
        ),
        bodyMedium: GoogleFonts.elMessiri(
            fontSize: 25,
            fontWeight: FontWeight.w700,
            color: Color(0xFF242424)
        ),
        bodyLarge: GoogleFonts.elMessiri(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.white
        ),
      ),
      scaffoldBackgroundColor: Colors.transparent,
      colorScheme: ColorScheme(
          brightness: Brightness.dark,
          primary: darkPrimary,
          onPrimary: Colors.white,
          secondary: yellow,
          onSecondary: Colors.white,
          error: Colors.red,
          onError: Colors.white,
          background: darkPrimary,
          onBackground: Colors.white,
          surface: darkPrimary,
          onSurface: Colors.white),
      appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(color: Colors.white,
            size: 30
        ),
        color: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          type:BottomNavigationBarType.shifting ,
          selectedItemColor: Color(0xffFACC1D),
          unselectedItemColor: Colors.white,
          backgroundColor: darkPrimary
      )

  );
}
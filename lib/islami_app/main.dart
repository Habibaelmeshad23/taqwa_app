import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_apps/islami_app/my_theme_data.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'hadeth_details.dart';
import 'home.dart';
import 'sura_datails.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:carousel_slider/carousel_slider.dart';
void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale("en"),
      debugShowCheckedModeBanner: false,
      initialRoute:SplashScreen.routeName ,
      routes: {
        SplashScreen.routeName:(context) => SplashScreen(),
        HomeScreen.routeName:(context) => HomeScreen(),
        SuraDetails.routeName:(context) => SuraDetails(),
        HadethDetails.routeName:(context) => HadethDetails(),




      },
      theme: MyThemeData.lightTheme,
      darkTheme: MyThemeData.darkTheme
    );
  }
}

class SplashScreen extends StatefulWidget {
static const String routeName= "splash";
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (context) => HomeScreen()));
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Image.asset("assets/images/splash_screen.png",
          width: double.infinity,
          fit: BoxFit.fill,)),
    );
  }
}

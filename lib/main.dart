import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_apps/islami_app/my_theme_data.dart';
import 'package:flutter_apps/providers/my_provider.dart';
import 'package:provider/provider.dart';
import 'islami_app/hadeth_details.dart';
import 'islami_app/home.dart';
import 'islami_app/sura_datails.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
void main(){
  runApp(ChangeNotifierProvider(
create: (context) => MyProvider(),
    child: const MyApp(),),);
}
class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var pro=Provider.of<MyProvider>(context);
    return MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(pro.languageCode),
      debugShowCheckedModeBanner: false,
      initialRoute:SplashScreen.routeName ,
      routes: {
        SplashScreen.routeName:(context) => const SplashScreen(),
        HomeScreen.routeName:(context) => const HomeScreen(),
        SuraDetails.routeName:(context) => const SuraDetails(),
        HadethDetails.routeName:(context) => const HadethDetails(),

      },
        themeMode: pro.modeApp,
      theme: MyThemeData.lightTheme,
      darkTheme: MyThemeData.darkTheme
    );
  }
}

class SplashScreen extends StatefulWidget {
static const String routeName= "splash";

  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacement(context , MaterialPageRoute(
          builder: (context) => const HomeScreen()));
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

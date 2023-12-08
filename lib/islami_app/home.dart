import 'package:flutter/material.dart';
import 'package:flutter_apps/islami_app/my_theme_data.dart';
import 'package:flutter_apps/islami_app/tabs/ahadeth_tab.dart';
import 'package:flutter_apps/islami_app/tabs/quran_tab.dart';
import 'package:flutter_apps/islami_app/tabs/radio_tab.dart';
import 'package:flutter_apps/islami_app/tabs/sebha_tab.dart';
import 'package:flutter_apps/islami_app/tabs/settings_tab.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../providers/my_provider.dart';

class HomeScreen extends StatefulWidget {
static const String routeName= "Home";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
int index= 0;

  @override
  Widget build(BuildContext context) {
    var pro=Provider.of<MyProvider> (context);
    var provider = Provider.of<MyProvider> (context);

    return Stack(
      children:[
        Image.asset(
          pro.getBackground(),
        width: double.infinity,
        fit: BoxFit.fill,),
        Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: index,
            onTap: (value){
              index=value;
              setState(() {

              });
            },
            items: [
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage("assets/images/quran.png")),
                  label: "Quran",
              backgroundColor: provider.modeApp==ThemeMode.dark?
              Theme.of(context).bottomNavigationBarTheme.backgroundColor:
              MyThemeData.primaryColor ),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage("assets/images/ahadeth.png")),
                  label: AppLocalizations.of(context)!.ahadeth,
                  backgroundColor: provider.modeApp==ThemeMode.dark?
                  Theme.of(context).bottomNavigationBarTheme.backgroundColor:
                  MyThemeData.primaryColor),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage("assets/images/sebha.png")),
                  label: "Sebha",
                  backgroundColor: provider.modeApp==ThemeMode.dark?
                  Theme.of(context).bottomNavigationBarTheme.backgroundColor:
                  MyThemeData.primaryColor),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage("assets/images/radio.png")),
                  label: "Radio",
                  backgroundColor: provider.modeApp==ThemeMode.dark?
                  Theme.of(context).bottomNavigationBarTheme.backgroundColor:
                  MyThemeData.primaryColor),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: "Settings",
                  backgroundColor:provider.modeApp==ThemeMode.dark?
              Theme.of(context).bottomNavigationBarTheme.backgroundColor:
              MyThemeData.primaryColor),

            ],),
          appBar: AppBar(
            title: Text(AppLocalizations.of(context)!.appTitle,
              style: Theme.of(context).
              textTheme.bodyLarge,),
          ),
          body:tabs[index] ,

        ),
      ]
    );
  }
  List<Widget>tabs=[
    QuranTab(),
    AhadethTab(),
    SebhaTab(),
    RadioTab(),
    SettingsTab()];
}

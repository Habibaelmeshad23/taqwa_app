import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_apps/islami_app/my_theme_data.dart';
import 'package:flutter_apps/islami_app/tabs/ahadeth_tab.dart';
import 'package:flutter_apps/islami_app/tabs/quran_tab.dart';
import 'package:flutter_apps/islami_app/tabs/radio_tab.dart';
import 'package:flutter_apps/islami_app/tabs/sebha_tab.dart';
import 'package:flutter_apps/islami_app/tabs/settings_tab.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
static const String routeName= "Home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
int index= 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children:[
        Image.asset("assets/images/background.png",
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
              backgroundColor: MyThemeData.primaryColor ),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage("assets/images/ahadeth.png")),
                  label: "Ahadeth",
                  backgroundColor: MyThemeData.primaryColor),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage("assets/images/sebha.png")),
                  label: "Sebha",
                  backgroundColor: MyThemeData.primaryColor),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage("assets/images/radio.png")),
                  label: "Radio",
                  backgroundColor: MyThemeData.primaryColor),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: "Settings",
                  backgroundColor: MyThemeData.primaryColor),

            ],),
          appBar: AppBar(
            title: Text("Islami",style: Theme.of(context).
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

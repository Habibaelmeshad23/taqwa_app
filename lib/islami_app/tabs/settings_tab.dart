import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_apps/islami_app/my_theme_data.dart';

class SettingsTab extends StatefulWidget {
  const SettingsTab({super.key});

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Language",
          style: TextStyle(
            color: MyThemeData.blackColor
          ),),
          InkWell(
            onTap: () {
              showLanguageBottomSheet();
            },
            child: Container(
              margin:EdgeInsets.symmetric(
                  horizontal: 20),
              padding: EdgeInsets.symmetric(
                horizontal: 20),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: MyThemeData.primaryColor)
              ),
              child: Text("English",
                style: TextStyle(
                    color: MyThemeData.blackColor
                ),),
            ),
          ),
          SizedBox(
            height: 25,),
          Text("Theming",
            style: TextStyle(
                color: MyThemeData.blackColor
            ),),
          InkWell(
            onTap: () {
              showThemingBottomSheet();
            },
            child: Container(
              margin:EdgeInsets.symmetric(
                  horizontal: 20),
              padding: EdgeInsets.symmetric(
                  horizontal: 20),
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: MyThemeData.primaryColor)
              ),
              child: Text("Light",
                style: TextStyle(
                    color: MyThemeData.blackColor
                ),),
            ),
          )
        ],
      ),
    );
  }

  showLanguageBottomSheet(){
    showModalBottomSheet(context: context,
        isScrollControlled: true,
        shape: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.transparent
          ),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),topRight: Radius.circular(15)
          )
        ),
        builder:(context) => Container(
         height: MediaQuery.of(context).size.height*.5,
        ));
  }
  showThemingBottomSheet(){
    showModalBottomSheet(context: context,
        isScrollControlled: true,
        shape: OutlineInputBorder(
            borderSide: BorderSide(
                color: Colors.transparent
            ),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),topRight: Radius.circular(15)
            )
        ),
        builder:(context) => Container(
          height: MediaQuery.of(context).size.height*.5,
        ));
  }

}

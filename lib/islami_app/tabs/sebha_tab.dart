import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_apps/islami_app/my_theme_data.dart';
import 'package:provider/provider.dart';

import '../../providers/my_provider.dart';

class SebhaTab extends StatefulWidget {
static const String routeName= "sebha";


  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {

  int counter=0;
  int index=0;
  bool click = true;
  List<String>zekr=["سبحان الله","الحمدلله","الله اكبر"];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider> (context);

    return Center(
      child: Column(
        children: [
          InkWell(
            onTap: (){
              counter++;
              if(counter==34){
                counter=0;
                ResetZekr();
              }
              setState(() {
                click=!click;
              });
            },

              child:
              Image.asset("assets/images/sebha.png",
              color: (click==false) ?
              Colors.orange.shade100 : MyThemeData.primaryColor,)),
          SizedBox(height: 25,),
          Text("عدد التسبيحات",
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: provider.modeApp==ThemeMode.dark?
                Theme.of(context).colorScheme.onSecondary:MyThemeData.blackColor
            ),),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color:  provider.modeApp==ThemeMode.dark?
              Theme.of(context).colorScheme.primary:MyThemeData.primaryColor,
            ),
            padding: EdgeInsets.all(18),

            child: Text("$counter",
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: provider.modeApp == ThemeMode.dark
                      ? Theme.of(context).colorScheme.onBackground
                      : MyThemeData.blackColor)),
          ),
          SizedBox(height: 15,),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: provider.modeApp==ThemeMode.dark?
              Theme.of(context).colorScheme.secondary:MyThemeData.primaryColor,
            ),
            padding: EdgeInsets.all(12),

            child: Text(zekr[index],
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: provider.modeApp == ThemeMode.dark
                      ? Theme.of(context).colorScheme.primary
                      : MyThemeData.blackColor),),
          ),

        ],
      ),
    );
  }

  ResetZekr(){
    setState(() {
     index++;
     if(index==3){
       index=0;
     }
    });
  }

}

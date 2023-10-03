import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_apps/islami_app/my_theme_data.dart';

class SebhaTab extends StatefulWidget {
static const String routeName= "sebha";

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {

  int counter=0;
  int index=0;
  List<String>zekr=["سبحان الله","الحمدلله","الله اكبر"];

  @override
  Widget build(BuildContext context) {
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

              });
            },
              splashColor: MyThemeData.primaryColor,
              highlightColor:Colors.orange[50],
              child:
              Image.asset("assets/images/sebha.png")),

          SizedBox(height: 25,),
          Text("عدد التسبيحات",
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: MyThemeData.blackColor
            ),),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: MyThemeData.primaryColor,
            ),
            padding: EdgeInsets.all(18),

            child: Text("$counter",
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: MyThemeData.blackColor
              ),),
          ),
          SizedBox(height: 15,),
          Container(


            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: MyThemeData.primaryColor,
            ),
            padding: EdgeInsets.all(12),

            child: Text(zekr[index],
              style: Theme.of(context).textTheme.bodyMedium,),
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

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_apps/islami_app/hadeth_details.dart';
import 'package:flutter_apps/islami_app/hadeth_model.dart';

import '../my_theme_data.dart';

class AhadethTab extends StatefulWidget {

  @override
  State<AhadethTab> createState() => _AhadethTabState();
}

class _AhadethTabState extends State<AhadethTab> {
  List<HadethModel>allAhadeth=[];



  @override
  Widget build(BuildContext context) {
    loadHadeth();
    return Center(
      child: Column(
        children: [
          Image.asset("assets/images/head_ahadeth.png"),
          Divider(
            color: MyThemeData.primaryColor,
            thickness: 3,
          ),
          Text("Ahadeth",
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: MyThemeData.blackColor
            ),),
          Divider(
            color: MyThemeData.primaryColor,
            thickness: 3,
          ),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context,index) => Divider(
                indent: 40, endIndent: 40,
                thickness: 1,
                color: MyThemeData.primaryColor,
              ),
                itemBuilder: (context,index){
              return Center(
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, HadethDetails.routeName,
                      arguments: allAhadeth[index]
                      );
                    },
                    child: Text(allAhadeth[index].title,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: MyThemeData.blackColor
                ),),
                  )
              );
            }, itemCount: allAhadeth.length)
          )
        ],
      ),
    );
  }

  void loadHadeth(){
    rootBundle.loadString("assets/files/ahadeth.txt")
    .then((ahadeth){
     List<String> ahadethList= ahadeth.split("#");
     for(int i=0;i<ahadethList.length;i++){
       String HadethOne=ahadethList[i];
       List<String>hadethOneLines=HadethOne.trim().split("\n");
       String title=hadethOneLines[0];
       hadethOneLines.removeAt(0);
       List<String>contents=hadethOneLines;
       HadethModel hadethModel=HadethModel(title, contents);
       allAhadeth.add(hadethModel);
     }
     setState(() {

     });

    }).catchError((e){
      print(e.toString());
    });
  }
}

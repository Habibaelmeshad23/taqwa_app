import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_apps/islami_app/sura_model.dart';

import 'my_theme_data.dart';

class SuraDetails extends StatefulWidget {
static const String routeName="suraDetails";

  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {
List<String>verses=[];

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as SuraModel;
    if(verses.isEmpty){
      loadFile(args.index);
    }

    return Stack(
      children: [
        Image.asset("assets/images/background.png",
          width: double.infinity,
          fit: BoxFit.fill,),
        Scaffold(
          appBar: AppBar(

            title: Text(args.name,style: Theme.of(context).
            textTheme.bodyLarge,),
          ),
          body:Padding(
            padding: const EdgeInsets.all(15.0),
            child: Card(
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15)
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.separated(
                  separatorBuilder: (context,index) => Divider(
                    thickness: 1,
                    color: MyThemeData.primaryColor,
                    endIndent: 40, indent: 40,
                  ),
                  itemBuilder: (context,index){
                  return Center(
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: Text("${verses[index]}(${index+1}",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodySmall,),
                    ),
                  );
                },
                  itemCount:verses.length ,
                ),
              ),
            ),
          ),

        )
      ],
      );
  }

 void loadFile(int index)async{
   String file=await rootBundle.loadString("assets/files/${index+1}.txt");
   List<String>lines=file.split("/n");
   print(lines);
   verses=lines;
   setState(() {

   });
  }
}

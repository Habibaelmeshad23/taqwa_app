import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_apps/islami_app/sura_model.dart';
import 'package:provider/provider.dart';

import '../providers/my_provider.dart';
import '../providers/sura_details_provider.dart';
import 'my_theme_data.dart';

class SuraDetails extends StatefulWidget {
static const String routeName="suraDetails";

  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider> (context);
    var pro=Provider.of<SuraDetailsProvider>(context);
    var args = ModalRoute.of(context)?.settings.arguments as SuraModel;
    if(pro.verses.isEmpty){
     pro.loadFile(args.index);
    }

    return Stack(
      children: [
        Image.asset("assets/images/background.png",
          width: double.infinity,
          fit: BoxFit.fill,),
        Scaffold(
          appBar: AppBar(

            title: Text(args.name,style: Theme.of(context).
            textTheme.bodyLarge!.copyWith(
                color: provider.modeApp==ThemeMode.dark?
                Theme.of(context).colorScheme.secondary:MyThemeData.blackColor
            ),),
          ),
          body:Padding(
            padding: const EdgeInsets.all(15.0),
            child: Card(
              elevation: 15,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
                side: BorderSide(color: MyThemeData.primaryColor,width: 2)
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
                      child: Text("${pro.verses[index]}(${index+1})",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: provider.modeApp==ThemeMode.dark?
                            Theme.of(context).colorScheme.secondary:MyThemeData.blackColor
                        ),),
                    ),
                  );
                },
                  itemCount:pro.verses.length ,
                ),
              ),
            ),
          ),

        )
      ],
      );
  }


}

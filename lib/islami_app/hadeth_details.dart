import 'package:flutter/material.dart';
import 'package:flutter_apps/islami_app/hadeth_model.dart';
import 'package:provider/provider.dart';

import '../providers/my_provider.dart';
import 'my_theme_data.dart';

class HadethDetails extends StatefulWidget {
  static const String routeName="hadethDetails";

  const HadethDetails({super.key});

  @override
  State<HadethDetails> createState() => _HadethDetailsState();
}

class _HadethDetailsState extends State<HadethDetails> {
  @override
  Widget build(BuildContext context) {
    var args= ModalRoute.of(context)?.settings.arguments as HadethModel;
    var provider = Provider.of<MyProvider> (context);

    return Stack(
      children: [
        provider.modeApp==ThemeMode.light?
        Image.asset(
          "assets/images/background.png",
          width: double.infinity,
          fit: BoxFit.fill,
        ):Image.asset(
          "assets/images/background_dark.png",
          width: double.infinity,
          fit: BoxFit.fill,
        ),
    Scaffold(
    appBar: AppBar(

    title: Text(args.title,style: Theme.of(context).
    textTheme.bodyLarge!.copyWith(
      color: provider.modeApp==ThemeMode.dark?
          Theme.of(context).colorScheme.secondary:MyThemeData.blackColor
    ),),
    ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Card(
          color: provider.modeApp==ThemeMode.light?
          Theme.of(context).colorScheme.onPrimary:MyThemeData.darkPrimary,
          elevation: 10,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            side: BorderSide(color: MyThemeData.primaryColor,width: 2)
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.separated(
              separatorBuilder: (context,index)=>Divider(
                thickness: 1,
                color: MyThemeData.primaryColor,
                indent: 40,endIndent: 40,
              ),
              itemBuilder: (context,index){
              return Center(
                child: Text(args.contents[index],
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: provider.modeApp==ThemeMode.dark?
                      Theme.of(context).colorScheme.secondary:MyThemeData.blackColor
                  ),),
              );
            },
              itemCount:args.contents.length ,
            ),
          ),
        ),
      ),
    ),
      ],
    );
  }

}

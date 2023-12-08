import 'package:flutter/material.dart';
import 'package:flutter_apps/islami_app/sura_model.dart';
import 'package:provider/provider.dart';
import '../providers/my_provider.dart';
import '../providers/sura_details_provider.dart';
import 'my_theme_data.dart';

class SuraDetails extends StatelessWidget {
  static const String routeName = "suraDetails";
  const SuraDetails({super.key});
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    var args = ModalRoute.of(context)?.settings.arguments as SuraModel;
    return ChangeNotifierProvider(
        create: (context) => SuraDetailsProvider()..loadFile(args.index),
        builder: (context, child) {
          SuraDetailsProvider pro = Provider.of<SuraDetailsProvider>(context);
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
                  title: Text(
                    args.name,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: provider.modeApp == ThemeMode.dark
                            ? Theme.of(context).colorScheme.secondary
                            : MyThemeData.blackColor),
                  ),
                ),
                body: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Card(
                    color: provider.modeApp==ThemeMode.light?
                    Theme.of(context).colorScheme.onPrimary:MyThemeData.darkPrimary,
                    elevation: 15,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                        side: BorderSide(
                            color: MyThemeData.primaryColor, width: 2)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView.separated(
                        separatorBuilder: (context, index) => Divider(
                          thickness: 1,
                          color: MyThemeData.primaryColor,
                          endIndent: 40,
                          indent: 40,
                        ),
                        itemBuilder: (context, index) {
                          return Center(
                            child: Directionality(
                              textDirection: TextDirection.rtl,
                              child: Text(
                                "${pro.verses[index]}(${index + 1})",
                                textAlign: TextAlign.center,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                        color:
                                            provider.modeApp == ThemeMode.dark
                                                ? Theme.of(context)
                                                    .colorScheme
                                                    .secondary
                                                : MyThemeData.blackColor),
                              ),
                            ),
                          );
                        },
                        itemCount: pro.verses.length,
                      ),
                    ),
                  ),
                ),
              )
            ],
          );
        });
  }

}

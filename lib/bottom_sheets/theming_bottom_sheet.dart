import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../islami_app/my_theme_data.dart';
import '../providers/my_provider.dart';

class ThemingBottomSheet extends StatelessWidget {
  const ThemingBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<MyProvider>(context);
    var provider = Provider.of<MyProvider> (context);
    return Container(
      color: provider.modeApp==ThemeMode.light?
      Theme.of(context).colorScheme.onPrimary:MyThemeData.darkPrimary,
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            InkWell(
              onTap: (){
                provider.changeTheme(ThemeMode.light);
              },
              child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  height: 45,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color:  provider.modeApp==ThemeMode.light?
                      Theme.of(context).colorScheme.onBackground:Colors.yellow)),
                child: Row(
                  children: [
                    Text( pro.languageCode == "en"
                        ? AppLocalizations.of(context)!.light
                        : AppLocalizations.of(context)!.light,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: provider.modeApp==ThemeMode.light?
                          Theme.of(context).colorScheme.primary:Colors.white
                        )
                           ),
                    Spacer(),
                    
                    provider.modeApp== ThemeMode.dark
                        ?SizedBox.shrink()
                    :Container(
                      height: 30,
                      decoration: BoxDecoration(
                        color: MyThemeData.primaryColor,
                          borderRadius: BorderRadius.circular(40),
                          border: Border.all(color: MyThemeData.blackColor)
                      ),
                      child: Icon(Icons.done,size: 28,
                        color:  Colors.white,),
                    )

                  ],
                ),
              ),
            ),
            SizedBox(height: 25,),
            InkWell(
              onTap: (){
                provider.changeTheme(ThemeMode.dark);
              },
              child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  height: 45,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color:provider.modeApp==ThemeMode.dark?
                      Theme.of(context).colorScheme.secondary:MyThemeData.blackColor)),
                child: Row(
                  children: [
                    Text(pro.languageCode == "en"
                        ? AppLocalizations.of(context)!.dark
                        : AppLocalizations.of(context)!.dark,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color:provider.modeApp==ThemeMode.dark?
                        Theme.of(context).colorScheme.secondary:MyThemeData.blackColor
                      )),
                    Spacer(),
                    provider.modeApp== ThemeMode.dark
                    ?Container(
                      height: 30,
                      decoration: BoxDecoration(
                        color:provider.modeApp==ThemeMode.light?
                        Theme.of(context).colorScheme.primary:MyThemeData.yellow,
                        borderRadius: BorderRadius.circular(40),
                          border: Border.all(color: MyThemeData.primaryColor)
                      ),
                      child: Icon(Icons.done  ,size: 28,
                        color:  MyThemeData.darkPrimary,),
                    ):
                        SizedBox.shrink()
                  ],),
              ),
            )
          ],
        ),
      ),
    );
  }
}

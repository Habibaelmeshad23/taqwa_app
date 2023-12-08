import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_apps/islami_app/my_theme_data.dart';
import 'package:flutter_apps/providers/my_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class LanguageBottomSheet extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<MyProvider>(context);
    return Container(
      color: provider.modeApp==ThemeMode.light?
      Theme.of(context).colorScheme.onPrimary:MyThemeData.darkPrimary,
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            InkWell(
              onTap: (){
                provider.changeLanguage("en");
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
                    Text(AppLocalizations.of(context)!.eng,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith( color: provider.modeApp==ThemeMode.light?
                        Theme.of(context).colorScheme.primary:Colors.yellow)),
                    Spacer(),
                    provider.languageCode=="en"
                        ? Container(
                      height: 30,
                      decoration: BoxDecoration(
                          color: provider.modeApp==ThemeMode.light?
                          Theme.of(context).colorScheme.primary:MyThemeData.yellow,
                          borderRadius: BorderRadius.circular(40),
                          border: Border.all(color: MyThemeData.blackColor)
                      ),
                          child: Icon(
                              Icons.done,
                              weight: 30,
                              color:  provider.modeApp==ThemeMode.light?
                              Theme.of(context).colorScheme.onPrimary:MyThemeData.darkPrimary,
                              size: 28,
                            ),
                        )
                          : SizedBox.shrink()
                    ],
                  ),
              ),
              ),

            SizedBox(height: 25,),
            InkWell(
              onTap: (){
                provider.changeLanguage("ar");
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
                    Text(AppLocalizations.of(context)!.arabic,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color:provider.modeApp==ThemeMode.light?
                      Theme.of(context).colorScheme.primary:MyThemeData.yellow
                    ),),
                    Spacer(),
                   provider.languageCode=="en"?
                       SizedBox.shrink()
                   :Container(
                     height: 30,
                     decoration: BoxDecoration(
                         color:  provider.modeApp==ThemeMode.light?
                         Theme.of(context).colorScheme.primary:MyThemeData.yellow,
                         borderRadius: BorderRadius.circular(40),
                         border: Border.all(color: MyThemeData.blackColor)
                     ),
                     child: Icon(
                        Icons.done,
                        weight: 30,
                        size: 28,
                       color: provider.modeApp==ThemeMode.light?
                       Theme.of(context).colorScheme.onPrimary:MyThemeData.darkPrimary,
                      ),
                   )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

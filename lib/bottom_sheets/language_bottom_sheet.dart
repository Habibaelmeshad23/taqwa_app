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
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            InkWell(
              onTap: (){
                provider.changeLanguage("en");
              },
              child: Row(
                children: [
                  Text(AppLocalizations.of(context)!.eng,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith( color: provider.languageCode=="en"?
                      MyThemeData.primaryColor:Colors.black54)),
                  Spacer(),
                  provider.languageCode=="en"
                      ? Icon(
                          Icons.done,
                          color:  MyThemeData.primaryColor,
                          size: 35,
                        )
                      : SizedBox.shrink()
                ],
              ),
            ),
            InkWell(
              onTap: (){
                provider.changeLanguage("ar");
              },
              child: Row(
                children: [
                  Text(AppLocalizations.of(context)!.arabic,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: provider.languageCode=="ar"?
                        MyThemeData.primaryColor:Colors.black54
                  ),),
                  Spacer(),
                 provider.languageCode=="en"?
                     SizedBox.shrink()
                 :Icon(
                    Icons.done,
                    size: 35,
                   color: MyThemeData.primaryColor,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

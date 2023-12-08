import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_apps/islami_app/my_theme_data.dart';
import 'package:flutter_apps/providers/my_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../bottom_sheets/language_bottom_sheet.dart';
import '../../bottom_sheets/theming_bottom_sheet.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class SettingsTab extends StatefulWidget {
  const SettingsTab({super.key});

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<MyProvider>(context);
    var provider = Provider.of<MyProvider>(context);

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context)!.lang,
            style: Theme.of(context)
                .textTheme
                .bodyMedium?.copyWith(
                color: provider.modeApp == ThemeMode.dark
                    ? Theme.of(context).colorScheme.onBackground
                    : MyThemeData.blackColor),
          ),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsets.symmetric(horizontal: 20),
              height: 45,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: MyThemeData.primaryColor)),
              child: Row(
                children: [
                  Text(
                      pro.languageCode == "en"
                          ? AppLocalizations.of(context)!.eng
                          : AppLocalizations.of(context)!.arabic,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: provider.modeApp == ThemeMode.dark
                              ? Theme.of(context).colorScheme.onBackground
                              : MyThemeData.blackColor)),
                  Spacer(),
                  InkWell(
                    onTap: () {
                      showLanguageBottomSheet();
                    },
                    child: Icon(
                      Icons.arrow_drop_down,
                      color: MyThemeData.primaryColor,
                    ),
                  )
                ],
              )),
          SizedBox(
            height: 25,
          ),
          Text(
            AppLocalizations.of(context)!.theme,
            style: Theme.of(context)
                .textTheme
                .bodyMedium?.copyWith(
                color: provider.modeApp == ThemeMode.dark
                    ? Theme.of(context).colorScheme.onBackground
                    : MyThemeData.blackColor),
          ),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsets.symmetric(horizontal: 20),
              height: 45,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: MyThemeData.primaryColor)),
              child: Row(
                children: [
                  Text(
                    pro.modeApp== ThemeMode.light
                        ?AppLocalizations.of(context)!.light
                        : AppLocalizations.of(context)!.dark,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium?.copyWith(
                        color: provider.modeApp == ThemeMode.dark
                            ? Theme.of(context).colorScheme.onBackground
                            : MyThemeData.blackColor),
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () {
                      showThemingBottomSheet();
                    },
                    child: Icon(
                      Icons.arrow_drop_down,
                      color: MyThemeData.primaryColor,
                    ),
                  )
                ],
              )),
        ],
      ),
    );
  }

  showLanguageBottomSheet() {
    showModalBottomSheet(

        context: context,
        shape: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15), topRight: Radius.circular(15))),
        builder: (context) => LanguageBottomSheet());
  }

  showThemingBottomSheet() {
    showModalBottomSheet(
        context: context,
        shape: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15), topRight: Radius.circular(15))),
        builder: (context) => ThemingBottomSheet());
  }
}

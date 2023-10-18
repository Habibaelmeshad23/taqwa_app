import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../islami_app/my_theme_data.dart';
import '../providers/my_provider.dart';

class ThemingBottomSheet extends StatelessWidget {
  const ThemingBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider> (context);
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            InkWell(
              onTap: (){
                provider.changeTheme(ThemeMode.light);
              },
              child: Row(
                children: [
                  Text("Light",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: provider.modeApp==ThemeMode.light?
                        Theme.of(context).colorScheme.background:Colors.white
                      )
                         ),
                  Spacer(),
                  provider.modeApp== ThemeMode.dark
                      ?SizedBox.shrink()
                  :Icon(Icons.done,size: 35,
                    color:  MyThemeData.primaryColor,)

                ],
              ),
            ),
            InkWell(
              onTap: (){
                provider.changeTheme(ThemeMode.dark);
              },
              child: Row(
                children: [
                  Text("Dark",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color:provider.modeApp==ThemeMode.dark?
                      Theme.of(context).colorScheme.background:MyThemeData.blackColor
                    )),
                  Spacer(),
                  provider.modeApp== ThemeMode.dark
                  ?Icon(Icons.done,size: 35,
                    color:  MyThemeData.primaryColor,):
                      SizedBox.shrink()
                ],),
            )
          ],
        ),
      ),
    );
  }
}

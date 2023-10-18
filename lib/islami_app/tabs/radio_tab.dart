import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/my_provider.dart';
import '../my_theme_data.dart';

class RadioTab extends StatelessWidget {
  const RadioTab({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider> (context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset("assets/images/head_radio.png"),
        Text("إذاعة القرآن الكريم",
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(
                color: provider.modeApp == ThemeMode.dark
                    ? Theme.of(context).colorScheme.onBackground
                    : MyThemeData.blackColor)),
        SizedBox(height: 18,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.skip_previous,color: MyThemeData.primaryColor,size: 45,),
            SizedBox(width: 10,),
            Icon(Icons.play_arrow,color: MyThemeData.primaryColor,size: 45),
            SizedBox(width: 10,),
            Icon(Icons.skip_next,color: MyThemeData.primaryColor,size: 45),
          ],
        )


      ],
    );
  }
}

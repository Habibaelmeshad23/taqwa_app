import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' hide Radio;
import 'package:provider/provider.dart';
import '../../providers/my_provider.dart';
import '../my_theme_data.dart';
import '../radios_response.dart';

class RadioItem extends StatelessWidget {
  Radio radio;
  AudioPlayer audioPlayer;
  RadioItem({required this.radio, required this.audioPlayer});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Text(radio.name ?? "",
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: provider.modeApp == ThemeMode.dark
                      ? Theme.of(context).colorScheme.onBackground
                      : MyThemeData.blackColor)),
          SizedBox(
            height: 24,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 65,
                height: 65,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    boxShadow: [
                      BoxShadow(
                          color: MyThemeData.primaryColor,
                          blurRadius: 9,
                          spreadRadius: 1,
                          offset: Offset(7, 7)
                      )
                    ]
                ),
                child: IconButton(
                  onPressed: () {audioPlayer.stop();},
                  icon: Icon(
                    Icons.pause_circle, size: 65,
                    color: Colors.white70,),
                ),
              ),
              SizedBox(
                width: 18,
              ),
              Container(
                width: 65,
                height: 65,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    boxShadow: [
                      BoxShadow(
                          color: MyThemeData.primaryColor,
                          blurRadius: 8,
                          spreadRadius: 1,
                          offset: Offset(7, 7)
                      )
                    ]
                ),
                child: IconButton(
                  onPressed: () {
                     audioPlayer.play(UrlSource(radio.url!));
                  },
                  icon: Icon(
                  Icons.play_circle, size: 65,
                  color: Colors.white70,),

                 ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

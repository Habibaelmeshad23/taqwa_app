import 'dart:convert';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_apps/islami_app/radios_response.dart';
import 'package:flutter_apps/islami_app/tabs/radio_item.dart';
import 'package:provider/provider.dart';
import '../../providers/my_provider.dart';
import 'package:http/http.dart' as http;

class RadioTab extends StatefulWidget {

  @override
  State<RadioTab> createState() => _RadioTabState();
}

class _RadioTabState extends State<RadioTab> {
  final audioPlayer = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);

    return FutureBuilder(
        future: getRadios(),
        builder: (context, snapshot) {
          if(snapshot.hasData) {
            var radios =snapshot.data?.radios??[];
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 40,),
                Expanded(child: Image.asset("assets/images/head_radio.png")),
                SizedBox(height: 30,),
                Expanded(child: ListView.builder(
                  physics: PageScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_,index) => RadioItem(radio:radios[index],audioPlayer:audioPlayer),
                  itemCount: radios.length,)),

              ],
            );
          }else if(snapshot.hasError){
            return Center(child: Text('Something went wrong'));
          }else{
            return Center(child: CircularProgressIndicator(),);
          }
        });
  }

  Future<RadiosResponse> getRadios() async {
    var uri = Uri.parse('https://mp3quran.net/api/v3/radios');
    var response = await http.get(uri);
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      return RadiosResponse.fromJson(json);
    } else {
      throw Exception("Failed to load");
    }
  }
}

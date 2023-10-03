import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_apps/islami_app/my_theme_data.dart';
import 'package:flutter_apps/islami_app/sura_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../sura_datails.dart';

class QuranTab extends StatelessWidget {

  List<String>suraNames=["الفاتحه","البقرة","آل عمران","النساء","المائدة","الأنعام","الأعراف","الأنفال","التوبة","يونس","هود"
  ,"يوسف","الرعد","إبراهيم","الحجر","النحل","الإسراء","الكهف","مريم","طه","الأنبياء","الحج","المؤمنون"
  ,"النّور","الفرقان","الشعراء","النّمل","القصص","العنكبوت","الرّوم","لقمان","السجدة","الأحزاب","سبأ"
  ,"فاطر","يس","الصافات","ص","الزمر","غافر","فصّلت","الشورى","الزخرف","الدّخان","الجاثية","الأحقاف"
  ,"محمد","الفتح","الحجرات","ق","الذاريات","الطور","النجم","القمر","الرحمن","الواقعة","الحديد","المجادلة"
  ,"الحشر","الممتحنة","الصف","الجمعة","المنافقون","التغابن","الطلاق","التحريم","الملك","القلم","الحاقة","المعارج"
  ,"نوح","الجن","المزّمّل","المدّثر","القيامة","الإنسان","المرسلات","النبأ","النازعات","عبس","التكوير","الإنفطار"
  ,"المطفّفين","الإنشقاق","البروج","الطارق","الأعلى","الغاشية","الفجر","البلد","الشمس","الليل","الضحى","الشرح"
  ,"التين","العلق","القدر","البينة","الزلزلة","العاديات","القارعة","التكاثر","العصر",
  "الهمزة","الفيل","قريش","الماعون","الكوثر","الكافرون","النصر","المسد","الإخلاص","الفلق","الناس"];
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Image.asset("assets/images/head_quran_bg.png"),
          Divider(
            color: MyThemeData.primaryColor,
            thickness: 3,
          ),
          Text(AppLocalizations.of(context)!.suraNames,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: MyThemeData.blackColor
            ),),
          Divider(
            color: MyThemeData.primaryColor,
            thickness: 3,
          ),
          Expanded(
            child: ListView.separated(
              separatorBuilder:(context, index) =>  Divider(
                thickness: 1,
                color: MyThemeData.primaryColor,
                endIndent: 40, indent: 40,
              ),
              itemBuilder: (context,index){
              return InkWell(
                onTap: () {
                  Navigator.pushNamed(context, SuraDetails.routeName,
                    arguments: SuraModel(suraNames[index], index)
                  );
                },
                child: Center(
                  child: Text(suraNames[index],
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: MyThemeData.blackColor
                    ),),
                ),
              );
            },
              itemCount: suraNames.length,
            ),
          )
        ],
      ),
    );

    

  }
}

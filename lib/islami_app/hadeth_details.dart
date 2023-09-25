import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_apps/islami_app/hadeth_model.dart';

class HadethDetails extends StatelessWidget {
  static const String routeName="hadethDetails";

  @override
  Widget build(BuildContext context) {
    var args= ModalRoute.of(context)?.settings.arguments as HadethModel;
    return Stack(
      children: [
      Image.asset("assets/images/background.png",
      width: double.infinity,
      fit: BoxFit.fill,),
    Scaffold(
    appBar: AppBar(

    title: Text(args.title,style: Theme.of(context).
    textTheme.bodyLarge,),
    ),
      body: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15)
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(itemBuilder: (context,index){
            return Center(
              child: Text(args.contents[index],
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodySmall,),
            );
          },
            itemCount:args.contents.length ,
          ),
        ),
      ),
    ),
      ],
    );
  }
}

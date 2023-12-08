import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SuraDetailsProvider extends ChangeNotifier {
  List<String> verses = [];

  void loadFile(int index) async {
    if (verses.isEmpty) {
      String file =
          await rootBundle.loadString("assets/files/${index + 1}.txt");
      List<String> lines = file.trim().split("\n");
      print(lines);
      verses = lines;
      notifyListeners();
    }
  }
}

import 'package:flutter/material.dart';

class BottomProvider extends ChangeNotifier {

   int currentIndex = 0;
   int initIndex=0;

  void onTap( index) {
    currentIndex = index;
    notifyListeners();
  }

  void setInitIndex(int index) {
    initIndex = index;
    currentIndex=index;
    notifyListeners();
  }
  
  
}
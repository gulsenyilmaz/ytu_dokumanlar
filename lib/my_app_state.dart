import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyAppState extends ChangeNotifier {

  
  var content = [];
  var currentGalleryItemIndex = 0;

  void setContent(cList) {
    print("appState.setContent");
    content = cList;
  }

  void setCurrentGalleryItemIndex(index){
    
    currentGalleryItemIndex = index;
    
    notifyListeners();
  }

  int getCurrentGalleryItemIndex(){
    
    return currentGalleryItemIndex;
    
    
  }

}
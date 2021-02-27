import 'package:flutter/cupertino.dart';

class Notify extends ChangeNotifier{

   bool _flag= true;

   void switchToGrid(){
     _flag= false;
     notifyListeners();
   }

   void switchToList(){
     _flag= true;
     notifyListeners();
   }

   bool get flag => _flag;


}
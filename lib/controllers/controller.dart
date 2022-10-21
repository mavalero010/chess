
import 'package:get/get.dart';

class Controller extends GetxController{
  final _navIndex = 0.obs;
  
  //increment() => count++;

  int get getNavIndex => _navIndex.value;

  void updateNavIndex(int index){
    _navIndex.value = index;
  }

}
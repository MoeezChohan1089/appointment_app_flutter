// import 'dart:io';

// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainProvider extends ChangeNotifier{
  bool isLoading = false;
  bool isToggle = false;
  int tapIndex =0;
  toggleDone(){
    isToggle != isToggle;
    notifyListeners();
  }

  changeIsLoading(bool value){
    isLoading = value;
    notifyListeners();
  }


TabController? controller;

  tabFuncation(TickerProvider vsync){
  controller = TabController(length: 4, vsync: vsync);
  if(controller!.index==1||controller!.previousIndex==0) {
     controller!.addListener(tabIndexChange);
  }

  }

  tabIndexChange(){
    notifyListeners();
  }

  //

  TabController? calendarScreenTabController;
  calendarScreenTabFuncation(length,TickerProvider vsync){
    calendarScreenTabController = TabController(length: length, vsync: vsync);
    calendarScreenTabController!.addListener(calendarScreenTabIndexChange);
  }

  calendarScreenTabIndexChange(){
    notifyListeners();
  }
  //
  TabController? arrivalScreenTabController;
  arrivalScreenTabFuncation(TickerProvider vsync){
    arrivalScreenTabController = TabController(length: 3, vsync: vsync);
    arrivalScreenTabController!.addListener(arrivalScreenTabIndexChange);
  }

  arrivalScreenTabIndexChange(){
    notifyListeners();
  }

  //
//
  TabController? reservationScreenTabController;
  reservationScreenTabFuncation(TickerProvider vsync){
    reservationScreenTabController = TabController(length: 3, vsync: vsync);
    reservationScreenTabController!.addListener(reservationScreenTabIndexChange);
  }

  reservationScreenTabIndexChange(){
    notifyListeners();
  }
}
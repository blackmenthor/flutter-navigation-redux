import 'package:flutter/material.dart';
import 'package:flutter_redux_navigation/redux/destination.dart';
import 'package:flutter_redux_navigation/ui/page_1.dart';
import 'package:flutter_redux_navigation/ui/page_2.dart';
import 'package:flutter_redux_navigation/ui/page_3.dart';

class DestinationToWidgetConverter {

  Widget convert(Destination input) {
    switch (input) {
      case Destination.PAGE_1:
        return Page1();
      case Destination.PAGE_2:
        return Page2();
      case Destination.PAGE_3:
        return Page3();
      default: return Page1();
    }
  }

}
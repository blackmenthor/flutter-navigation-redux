import 'package:flutter/material.dart';
import 'package:flutter_redux_navigation/redux/destination.dart';

class NavigateToNext {

  NavigateToNext({@required this.destination});

  final Destination destination;

}

class NavigateToNextAndReplace {

  NavigateToNextAndReplace({@required this.destination});

  final Destination destination;

}

class NavigateBack {}
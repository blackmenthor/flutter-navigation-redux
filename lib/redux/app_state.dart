import 'dart:collection';

import 'package:flutter_redux_navigation/redux/destination.dart';

class AppState {

  final Queue<Destination> activePages;

  AppState({this.activePages});

  factory AppState.create() => AppState(
    activePages: new Queue()..add(Destination.PAGE_1)
  );

  AppState copy({
    Queue activePages
  }) => AppState(
      activePages: activePages ?? this.activePages
  );

}
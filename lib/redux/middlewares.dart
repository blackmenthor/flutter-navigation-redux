import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux_navigation/converter/DestinationToWidgetConverter.dart';
import 'package:flutter_redux_navigation/redux/actions.dart';
import 'package:redux/redux.dart';

import 'app_state.dart';

class AppMiddleware {

  final GlobalKey<NavigatorState> navigatorKey;
  final DestinationToWidgetConverter _destinationToWidgetConverter = DestinationToWidgetConverter();
  AppMiddleware({@required this.navigatorKey});

  List<Middleware<AppState>> getMiddlewares() {
    return [
      TypedMiddleware<AppState, NavigateToNext>(_navigateToNextMiddleware()),
      TypedMiddleware<AppState, NavigateToNextAndReplace>(_navigateToNextAndReplaceMiddleware()),
      TypedMiddleware<AppState, NavigateBack>(_navigateBackMiddleware())
    ];
  }

  Middleware<AppState> _navigateToNextMiddleware() {
    return (Store<AppState> store, action, NextDispatcher next) {
      final currentDestination = (action as NavigateToNext).destination;
      navigatorKey.currentState.push(MaterialPageRoute(
          builder: (BuildContext context) => _destinationToWidgetConverter.convert(currentDestination)
      ));
      next(action);
    };
  }

  Middleware<AppState> _navigateToNextAndReplaceMiddleware() {
    return (Store<AppState> store, action, NextDispatcher next) {
      final currentDestination = (action as NavigateToNextAndReplace).destination;
      navigatorKey.currentState.pushReplacement(MaterialPageRoute(
          builder: (BuildContext context) => _destinationToWidgetConverter.convert(currentDestination)
      ));
      next(action);
    };
  }

  Middleware<AppState> _navigateBackMiddleware() {
    return (Store<AppState> store, action, NextDispatcher next) {
      final currentActivePages = store.state.activePages;
      if (currentActivePages.length == 1) SystemChannels.platform.invokeMethod('SystemNavigator.pop');
      navigatorKey.currentState.pop();
      next(action);
    };
  }

}
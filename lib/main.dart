import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_redux_navigation/redux/app_state.dart';
import 'package:flutter_redux_navigation/redux/middlewares.dart';
import 'package:flutter_redux_navigation/redux/reducer.dart';
import 'package:flutter_redux_navigation/ui/page_1.dart';
import 'package:redux/redux.dart';

final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  final Store store = Store<AppState>(
      reducer,
      initialState: AppState.create(),
      middleware: AppMiddleware(navigatorKey: navigatorKey).getMiddlewares()
  );

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(
        navigatorKey: navigatorKey,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Page1(),
      ),
    );
  }
}

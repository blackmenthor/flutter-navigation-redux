import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_redux_navigation/redux/actions.dart';
import 'package:flutter_redux_navigation/redux/destination.dart';

class Page2 extends StatelessWidget {

  Future<bool> onBackPressed(BuildContext context) {
    StoreProvider.of(context).dispatch(NavigateBack());
    return Future.value(false);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => onBackPressed(context),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text("Flutter Redux Navigation"),
        ),
        body: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text("This is Page 2"),
                RaisedButton(
                    child: Icon(Icons.navigate_next),
                    onPressed: () => StoreProvider.of(context).dispatch(NavigateToNext(destination: Destination.PAGE_3))
                ),
                RaisedButton(
                    child: Icon(Icons.arrow_back),
                    onPressed: () => StoreProvider.of(context).dispatch(NavigateBack())
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

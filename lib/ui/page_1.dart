import 'package:flutter/material.dart';
import 'package:flutter_redux_navigation/ui/page_2.dart';

class Page1 extends StatelessWidget {

  void navigateToNextPage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) => Page2()
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Redux Navigation"),
      ),
      body: Container(
        child: Center(
          child: Text("This is Page 1"),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.navigate_next),
        onPressed: () => navigateToNextPage(context),
      ),
    );
  }
}

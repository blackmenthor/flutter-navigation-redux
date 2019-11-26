import 'package:flutter/material.dart';
import 'package:flutter_redux_navigation/ui/page_3.dart';

class Page2 extends StatelessWidget {

  void navigateToNextPage(BuildContext context) {
    Navigator.of(context).push(
        MaterialPageRoute(
            builder: (BuildContext context) => Page3()
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
          child: Text("This is Page 2"),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.navigate_next),
        onPressed: () => navigateToNextPage(context),
      ),
    );
  }
}

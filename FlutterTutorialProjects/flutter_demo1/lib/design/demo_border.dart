import 'package:flutter/material.dart';

class DemoBorderScreen extends StatefulWidget {
  DemoBorderScreen() : super();

  final String title = "Widget Border Demo";

  @override
  _DemoBorderScreenState createState() => _DemoBorderScreenState();
}

class _DemoBorderScreenState extends State<DemoBorderScreen> {

  BoxDecoration myBoxDecoration() {
    return BoxDecoration(
      border: Border(
        left: BorderSide(
            width: 5.0,
            color: Colors.red,
        ),
        top: BorderSide(
            width: 5.0,
            color: Colors.red
        ),
        right: BorderSide(
            width: 5.0,
            color: Colors.red
        ),
        bottom: BorderSide(
            width: 10.0,
            color: Colors.green
        ),
      ),
     // borderRadius: BorderRadius.all(Radius.circular(10.0),),
    );
  }

  Widget myWidget() {
    return Container(
      margin: const EdgeInsets.all(30.0),
      padding: const EdgeInsets.all(10.0),
      decoration: myBoxDecoration(), //       <--- BoxDecoration here
      child: Text(
        "Hello",
        style: TextStyle(fontSize: 30.0),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          myWidget()
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Form Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final FocusNode focusNode =  FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            TextField(
              autofocus: true,
            ),
            TextField(
              focusNode: focusNode,
            )
          ],
        ),
      ),
     floatingActionButton: FloatingActionButton(
       child: Icon(
         Icons.add
       ),
       onPressed: ()=> FocusScope.of(context).requestFocus(focusNode),
     ),
     // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

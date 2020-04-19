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
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  final formKey = new GlobalKey<FormState>();

  String _email;
  String _password;

  void _submit() {
    final form = formKey.currentState;

    if(form.validate()){
      form.save();
      performLogin();
    }

  }
  void performLogin() {
    final snackBar = SnackBar(
      content: Text("Email : $_email, password : $_password"),
    );
    scaffoldKey.currentState.showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Padding(
          padding: EdgeInsets.all(20.0),
          child: Form(
            key: formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  validator: (val) =>
                      !val.contains("@") ? "Invalid Email" : null,
                  decoration: InputDecoration(labelText: "Email"),
                  onSaved: (val) => _email = val,
                ),
                TextFormField(
                  validator: (val) => val.length < 6 ? "password too short" : null,
                  decoration: InputDecoration(labelText: "Password"),
                  onSaved: (val) => _password = val,
                  obscureText: true,
                ),
                Padding(
                  padding: EdgeInsets.all(15.0),
                ),
                RaisedButton(
                  onPressed: _submit,
                  child: Text("Login"),
                )
              ],
            ),
          ),
        )

        // This trailing comma makes auto-formatting nicer for build methods.
        );
  }


}

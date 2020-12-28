import 'package:custom_cupertino_date_textbox/custom_cupertino_date_textbox.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Example());
}

class Example extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(title: 'Just a Demo 🤓'),
    );
  }
}

class Home extends StatefulWidget {

  Home({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(top: 64),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                'Pick a Date by clicking on the Text Field',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.normal,
                    fontSize: 16
                ),
              ),
              SizedBox(height: 18,),
              /// USAGE OF THE CUSTOMIZABLE DATE TEXT BOX / FIELD
              CustomizableCupertinoDateTextBox(
                initialValue: DateTime.now(),
                hintText: "Date",
              ),
              SizedBox(height: 18,),
              Text(
                'Developed by:\nAbdullah Benomar Shahen',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                  fontSize: 16
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

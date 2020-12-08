import 'package:flutter/material.dart';
import 'package:provider_webapp/Providers/tweetsProvider.dart';
import 'package:provider_webapp/homePage.dart';

class StartPage extends StatefulWidget {
  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  void initState() {

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FlatButton(child: Text("Go to Next Page",),onPressed: (){

          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomePage()));

        },color: Colors.green,),
      ),
    );
  }
}

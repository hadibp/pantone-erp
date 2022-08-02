import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'main.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class NoInternet extends StatefulWidget {
  @override
  State<NoInternet> createState() => _NoInternetState();
}

class _NoInternetState extends State<NoInternet> {
  void initTimer() async {
    Timer(Duration(seconds: 2), () {
      Navigator.popAndPushNamed(context, '/home');
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {'/home': (context) => WebViewExample()},
      debugShowCheckedModeBanner: false,
      home: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 200,
              width: 200,
              margin: EdgeInsets.fromLTRB(0, 0, 0, 25),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/no_internet.png"),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                "No Internet Access",
                style: TextStyle(
                  textBaseline: null,
                  fontSize: 20.0,
                  color: Colors.black,
                  fontStyle: FontStyle.italic,
                  decorationColor: Colors.white,
                ),
              ),
            ),
            RaisedButton(
              child: Text("try again"),
              onPressed: () {
                setState(() {
                  initTimer();
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

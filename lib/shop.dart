import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:user_interface_project1/Payment.dart';
import 'package:user_interface_project1/main.dart';
import 'package:confetti/confetti.dart';

class Congrats extends StatefulWidget {
  @override
  CongratsState createState() => CongratsState();
}

class CongratsState extends State<Congrats> {
  ConfettiController _controllerCenter;
  ConfettiController _controllerCenterRight;
  ConfettiController _controllerCenterLeft;
  ConfettiController _controllerTopCenter;
  ConfettiController _controllerBottomCenter;

  @override
  void initState() {
    _controllerCenter =
        ConfettiController(duration: const Duration(seconds: 10));
    _controllerCenterRight =
        ConfettiController(duration: const Duration(seconds: 10));
    _controllerCenterLeft =
        ConfettiController(duration: const Duration(seconds: 10));
    _controllerTopCenter =
        ConfettiController(duration: const Duration(seconds: 10));
    _controllerBottomCenter =
        ConfettiController(duration: const Duration(seconds: 10));
    super.initState();
  }

  @override
  void dispose() {
    _controllerCenter.dispose();
    _controllerCenterRight.dispose();
    _controllerCenterLeft.dispose();
    _controllerTopCenter.dispose();
    _controllerBottomCenter.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var widget = Scaffold(
        backgroundColor: Color(0xFF4F5B55),
        appBar: AppBar(
          backgroundColor: Color(0xFF1B9772),
          title: Text('BABY YODA MERCHANDISE'),
          actions: <Widget>[],
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [const Color(0xFF1B9772), const Color(0xFF0D4837)],
              ),
            ),
          ),
        ),
        body: Column(children: <Widget>[
          Card(
              shape: BeveledRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              color: Color(0xfff4f4e2),
              elevation: 100,
              margin: EdgeInsets.only(top: 30, bottom: 90, right: 60, left: 70),
              child: InkWell(
                  // splashColor: Colors.blue.withAlpha(30),
                  child: Container(
                      decoration: BoxDecoration(
          
                          borderRadius: BorderRadius.circular(100.0)),
                      margin: EdgeInsets.only(
                          top: 30, bottom: 40, right: 60, left: 50),
                      alignment: Alignment.topCenter,
                      width: 200,
                      height: 200,
                      child: Column(children: <Widget>[
                        Text(
                          'Congratulations!Your order is complete.Thank you for shopping with us!               ',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Ink(
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Color(0xFF159E94),
                                    Color(0xFF10DC4D),
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.centerRight,
                                ),
                                borderRadius: BorderRadius.circular(50.0)),
                            child: Container(
                                height: 60,
                                width: 60,
                                alignment: Alignment.bottomCenter,
                                child: Row(children: <Widget>[
                                  ConfettiWidget(

                                    confettiController: _controllerCenter,
                                    blastDirectionality: BlastDirectionality.explosive, 
                                    shouldLoop:
                                        true, 
                                    colors: [
                                      Colors.green,
                                      Colors.blue,
                                      Colors.pink,
                                      Colors.orange,
                                      Colors.purple,
                                      Colors.red,
                                      Colors.white,
                                      Colors.teal,

                                    ], 
                                  ),
                                  IconButton(
                                      icon: new Icon(Icons.redeem),
                                      iconSize: 40,
                                      onPressed: () {
                                        _controllerCenter.play();
                                      }),
                                ])))
                      ])))),
          Container(
            height: 210.0,
            width: 250.0,
            
            margin: EdgeInsets.fromLTRB(1, 2, 1, 1),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                image: DecorationImage(
                    alignment: Alignment.center,
                    fit: BoxFit.fitWidth,
                    image: NetworkImage(
                        "https://thewestnews.com/wp-content/uploads/2019/12/Baby-Yoda-meme.jpeg"))),
          ),
          new FlatButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MainPage()),
              );
            },
            child: Container(
              margin: const EdgeInsets.only(top: 20, right: 120, left: 130),
              height: 50,
              child: Ink(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFF159E94),
                        Color(0xFF10DC4D),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.circular(30.0)),
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    "Back to Home",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          )
        ])
        );
       _controllerCenter.play();
       return widget;

  }
}

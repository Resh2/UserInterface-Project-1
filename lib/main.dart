import 'package:flutter/material.dart';

void main() {
  runApp(new MainPage());
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(text: 'Plush'),
              Tab(
                text: 'Phone Case',
              ),
              Tab(text: 'Tees'),
            ],
          ),
          title: Text('BABY YODA MERCHANDISE'),
          backgroundColor: Color(0xFF1B9772),
          actions: <Widget>[
             Padding(
      padding: EdgeInsets.only(right: 20.0),
      child: GestureDetector(
        onTap: () {},
        child: Icon(
          Icons.shopping_cart,
          size: 26.0,
        ),
      )
    ),
  ],
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
        body: TabBarView(
          children: [PlushScreen(), PhoneCaseScreen(), TeesScreen()],
        ),
      ),
    ));
  }
}

class PlushScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Center(
            child: Text(
              'Display all the Plush',
              style: TextStyle(fontSize: 21),
            ),
          ),
          backgroundColor: Colors.white,//Color(0xFF4F5B55),
        ));
  }
}

class PhoneCaseScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Center(
              child: Text(
            'Display all the Phone Case',
            style: TextStyle(fontSize: 21),
          )),
          backgroundColor: Colors.white,//Color(0xFF4F5B55),
        ));
  }
}

class TeesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Center(
              child: Text(
            'Display all the Tees',
            style: TextStyle(fontSize: 21),
          )),
          backgroundColor: Colors.white,//Color(0xFF4F5B55),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:user_interface_project1/Payment.dart';
import 'package:user_interface_project1/shop.dart';



void main() {
  runApp(new HomeScreen());
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new MainPage(),
      routes: <String, WidgetBuilder>{
        '/setting': (BuildContext context) => new CheckoutPage(),
      },
    );
  }
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
              indicatorWeight: 1,
             indicatorColor: Colors.red[100],
             unselectedLabelColor: Colors.white,
            tabs: [
              Tab(text: 'Plush'),
              Tab(
                text: 'Phone Case',
              ),
              Tab(text: 'Tees'),
            ],
          ),
          title: Text('         BABY YODA MERCHANDISE'),
          backgroundColor: Color(0xFF1B9772),
          actions: <Widget>[
            Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                  onTap: () => Navigator.of(context).pushNamed('/setting'),
                  child: Icon(
                    Icons.shopping_cart,
                    size: 26.0,
                  ),
                )),
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
              style: TextStyle(fontSize: 21, color: Colors.white),
            ),
          ),
          backgroundColor: Color(0xFF4F5B55),
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
            style: TextStyle(fontSize: 21, color: Colors.white),
          )),
          backgroundColor: Color(0xFF4F5B55),
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
            style: TextStyle(fontSize: 21, color: Colors.white),
          )),
          backgroundColor: Color(0xFF4F5B55),
        ));
  }
}

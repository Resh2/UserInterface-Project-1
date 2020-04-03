import 'package:flutter/material.dart';

import 'package:user_interface_project1/checkout.dart';
import 'package:user_interface_project1/components/item-card.dart';

class YodaItem {
  YodaItem({
    this.title,
    this.imagePath,
    this.price
  });

  final String title;
  final String imagePath;
  final double price;
}

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
          title: Text('BABY YODA MERCHANDISE'),
          titleSpacing: 40.0,
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
        // body: TabBarView(
        //   children: [PlushScreen(), PhoneCaseScreen(), TeesScreen()],
        // ),
      ),
    ));
  }
}

class PlushScreen extends StatelessWidget {
  final List<YodaItem> plushItems = [
    YodaItem(
      title: 'The Child Plush',
      imagePath: 'assets/plush-1.PNG',
      price: 24.99
    ),
    YodaItem(
      title: 'Jedi Baby',
      imagePath: 'assets/plush-2.PNG',
      price: 19.99
    ),
    YodaItem(
      title: 'Yoda with Frog',
      imagePath: 'assets/plush-3.PNG',
      price: 24.99
    ),
    YodaItem(
      title: 'Yoda with Frog 2',
      imagePath: 'assets/plush-4.PNG',
      price: 33.99
    ),
    YodaItem(
      title: 'Baby Yoda Alone',
      imagePath: 'assets/plush-5.PNG',
      price: 24.99
    ),
    YodaItem(
      title: 'Yoda with Frog 2',
      imagePath: 'assets/plush-6.PNG',
      price: 15.99
    )
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: GridView.count(
            crossAxisSpacing: 5,
            crossAxisCount: 2,
            childAspectRatio: 0.8,
            children: plushItems.map<Widget>((item) {
              return ItemCard(
                title: item.title,
                price: item.price,
                imagePath: item.imagePath,
                cosmeticName: 'Color',
                cosmeticStartValue: 'Green',
                cosmeticDropdownItems: <DropdownMenuItem<String>>[
                  DropdownMenuItem(
                    child: Text('Green', style: TextStyle(color: Colors.green)),
                    value: 'Green',
                  ),
                  DropdownMenuItem(
                    child: Text('Pink', style: TextStyle(color: Colors.pink)),
                    value: 'Pink',
                  ),
                  DropdownMenuItem(
                    child: Text('Blue', style: TextStyle(color: Colors.blue)),
                    value: 'Blue',
                  ),
                ],
              );
            }).toList()
          ),
          backgroundColor: Color(0xFF4F5B55),
        ));
  }
}

class PhoneCaseScreen extends StatelessWidget {
  final List<YodaItem> caseItems = [
    YodaItem(
      title: 'Mandalorian',
      imagePath: 'assets/case-1.PNG',
      price: 24.99
    ),
    YodaItem(
      title: 'Shiny Baby Yoda',
      imagePath: 'assets/case-2.PNG',
      price: 9.99
    ),
    YodaItem(
      title: 'Yoda Clones',
      imagePath: 'assets/case-3.PNG',
      price: 4.99
    ),
    YodaItem(
      title: 'Bright Yodas',
      imagePath: 'assets/case-4.PNG',
      price: 13.84
    ),
    YodaItem(
      title: 'Desert Yoda',
      imagePath: 'assets/case-5.PNG',
      price: 8.49
    ),
    YodaItem(
      title: 'Chimken Yoda',
      imagePath: 'assets/case-6.PNG',
      price: 39.39
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: GridView.count(
          crossAxisSpacing: 5,
          crossAxisCount: 2,
          childAspectRatio: 0.8,
          children: caseItems.map<Widget>((item) {
            return ItemCard(
              title: item.title,
              price: item.price,
              imagePath: item.imagePath,
              cosmeticName: 'Phone Type',
              cosmeticStartValue: 'iPhone',
              cosmeticDropdownItems: <DropdownMenuItem<String>>[
                DropdownMenuItem(
                  child: Text('iPhone'),
                  value: 'iPhone',
                ),
                DropdownMenuItem(
                  child: Text('Samsung'),
                  value: 'Samsung',
                ),
                DropdownMenuItem(
                  child: Text('HTC'),
                  value: 'HTC',
                ),
              ],
            );
          }).toList()
        ),
        backgroundColor: Color(0xFF4F5B55),
      )
    );
  }
}

class TeesScreen extends StatelessWidget {
  final List<YodaItem> teeItems = [
    YodaItem(
      title: 'Yoda & Mando',
      imagePath: 'assets/tee-1.PNG',
      price: 14.49
    ),
    YodaItem(
      title: 'Adopt Yoda',
      imagePath: 'assets/tee-2.PNG',
      price: 13.74
    ),
    YodaItem(
      title: 'Sad Yoda',
      imagePath: 'assets/tee-3.PNG',
      price: 21.49
    ),
    YodaItem(
      title: 'Mando in Sunset',
      imagePath: 'assets/tee-4.PNG',
      price: 24.85
    ),
    YodaItem(
      title: 'Exploring',
      imagePath: 'assets/tee-5.PNG',
      price: 16.00
    ),
    YodaItem(
      title: 'Pira Yoda',
      imagePath: 'assets/tee-6.PNG',
      price: 25.87
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: GridView.count(
            crossAxisSpacing: 5,
            crossAxisCount: 2,
            childAspectRatio: 0.8,
            children: teeItems.map<Widget>((item) {
              return ItemCard(
                title: item.title,
                price: item.price,
                imagePath: item.imagePath,
                cosmeticName: 'Shirt Size',
                cosmeticStartValue: 'Small',
                cosmeticDropdownItems: <DropdownMenuItem<String>>[
                  DropdownMenuItem(
                    child: Text('Small'),
                    value: 'Small',
                  ),
                  DropdownMenuItem(
                    child: Text('Medium'),
                    value: 'Medium',
                  ),
                  DropdownMenuItem(
                    child: Text('Large'),
                    value: 'Large',
                  ),
                ],
              );
            }).toList()
          ),
          backgroundColor: Color(0xFF4F5B55),
        ));
  }
}

import 'package:flutter/rendering.dart';
import 'package:flutter_counter/flutter_counter.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(new CheckoutPage());
}

  int _counter = 0;

class CheckoutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new CheckoutPage(),
      // routes: <String, WidgetBuilder>{
      //   '/MyCounter': (BuildContext context) => new MyCounterpage(),
      //},
    );
  }
 

}

class CheckoutPage extends StatefulWidget {
  CheckoutPage({Key key, this.title}) : super(key: key);
  final String title;
  int count = 0;

  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  int _counter = 0;

   void increment(){
    setState((){
      _counter++;
    });
  }
   void decrement(){
    setState((){
      if(_counter != 0)
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 1,
        child: Scaffold(
            backgroundColor: Color(0xFF4F5B55),
            appBar: AppBar(
              backgroundColor: Color(0xFF1B9772),
              bottom: TabBar(
                indicatorWeight: 0.1,
                indicatorColor: Colors.red[100],
                tabs: [
                  Tab(
                    text: "Checkout     >     Payment Info     >   Review",
                    //icon: Icon(Icons.shopping_basket),
                  ),
                ],
              ),
              title: Text('BABY YODA MERCHANDISE'),
              actions: <Widget>[
                Padding(
                    padding: EdgeInsets.only(right: 20.0),
                    child: GestureDetector(
                      // onTap: () =>
                      //     Navigator.of(context).pushNamed('/MyCounter'),
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
            body: ListView(children: <Widget>[
              button2,
              paymentButton,   
              Row(children : <Widget>[
                    RaisedButton(
        onPressed: increment,
        child: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: <Color>[
                  Color(0xFF159E94),
                  Color(0xFF10DC4D),
                ],
              ),
              borderRadius: BorderRadius.all(Radius.circular(100.0))),
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
          child: Icon(Icons.add_circle),
        ),
      ),Text(
        '   $_counter  ',
        style: TextStyle(color: Colors.red, fontSize: 20),
      ),
      RaisedButton(
        onPressed: decrement,
        child: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: <Color>[
                  Color(0xFF159E94),
                  Color(0xFF10DC4D),
                ],
              ),
              borderRadius: BorderRadius.all(Radius.circular(100.0))),
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
          child: Icon(Icons.delete),
        ),
      ),

              ])
            ])));
  }

  Widget paymentButton = new Container(
    margin: const EdgeInsets.only(top: 300, right: 70, left: 80),
    child: Row(children: <Widget>[
      RaisedButton(
        onPressed: () {
         
        },
        textColor: Colors.white,
        padding: const EdgeInsets.all(0.0),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
        child: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: <Color>[
                  Color(0xFF159E94),
                  Color(0xFF10DC4D),
                ],
              ),
              borderRadius: BorderRadius.all(Radius.circular(80.0))),
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
          child:
              const Text('Proceed to Payment', style: TextStyle(fontSize: 20)),
        ),
      ),
    ]),
  );
}

Widget button2 = new Container(
    margin: const EdgeInsets.only(top: 10, right: 80, left: 6),
    width: 100,
    child: Card(
        margin: const EdgeInsets.only(top: 10, right: 100, left: 2),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: Colors.white,
        elevation: 10,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            // const ListTile(
            //   leading: Icon(Icons.album, size: 70),
            //   title: Text('The child plush',
            //       style: TextStyle(color: Colors.black, fontSize: 20)),
            //   subtitle: Text('\$45', style: TextStyle(color: Colors.black)),
            // ),

            Container(
              height: 116.0,
              width: 100.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(5),
                      topLeft: Radius.circular(5)),
                  image: DecorationImage(
                      alignment: Alignment.center,
                      fit: BoxFit.fitWidth,
                      image: NetworkImage(
                          "https://s.yimg.com/ny/api/res/1.2/hSoJ3LLzqA3PYmbazUpa7A--~A/YXBwaWQ9aGlnaGxhbmRlcjtzbT0xO3c9ODAw/https://media-mbst-pub-ue1.s3.amazonaws.com/creatr-uploaded-images/2019-12/de8af8b0-1d20-11ea-bafe-ddc47d923b23"))),
            ),
            counterButton,

            // Text('  The Child Plush  '),
            // Text(" \$24.99  "),
          ],
        )));




Widget counterButton = new Container(
  //margin: const EdgeInsets.only(top: 10, right: 130, left: 6),

  child: new Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>[
      FlatButton(
        onPressed:(){},
        child: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: <Color>[
                  Color(0xFF159E94),
                  Color(0xFF10DC4D),
                ],
              ),
              borderRadius: BorderRadius.all(Radius.circular(100.0))),
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
          child: Icon(Icons.add_circle),
        ),
      ),
      Text(
        '   $_counter  ',
        style: TextStyle(color: Colors.red, fontSize: 20),
      ),
      FlatButton(
        onPressed: () {
        
        },
        textColor: Colors.white,
        padding: const EdgeInsets.all(0.0),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
        child: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: <Color>[
                  Color(0xFF159E94),
                  Color(0xFF10DC4D),
                ],
              ),
              borderRadius: BorderRadius.all(Radius.circular(80.0))),
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
          child: Icon(Icons.delete),
        ),
      ),
    ],
  ),
);

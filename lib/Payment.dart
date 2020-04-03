import 'package:flutter/rendering.dart';
import 'package:flutter/material.dart';
import 'package:user_interface_project1/shop.dart';


class PaymentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new PaymentPage(),
      routes: <String, WidgetBuilder>{
        '/shop': (BuildContext context) => new Congrats()
      },
    );
  }
}

class PaymentPage extends StatefulWidget {
  PaymentPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: Color(0xFF4F5B55),
        appBar: AppBar(
          backgroundColor: Color(0xFF1B9772),
          title: Text('BABY YODA MERCHANDISE'),
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: Icon(
                Icons.shopping_cart,
                size: 26.0,
              ),
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
        body: Center(
          child: Column(children: <Widget>[
            Container(
              height: 50.0,
              margin: const EdgeInsets.only(top: 20, right: 50, left: 30),
              child: Ink(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xff1A936F), Color(0xff114B5F)],
                      begin: Alignment.topLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.circular(30.0)),
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    "Delivery Address",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  new Flexible(
                    fit: FlexFit.loose,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: BillingInfoField(
                        hintText: 'First Name',
                        icon: const Icon(Icons.person),
                      ),
                    ),
                  ),
                  new Flexible(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: BillingInfoField(
                        hintText: 'Last Name',
                        icon: const Icon(Icons.person),
                      ),
                    ),
                  ),
                ]),
            BillingInfoField(
              hintText: 'Street Address',
              icon: const Icon(Icons.streetview),
            ),
            new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  new Flexible(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: BillingInfoField(
                        hintText: 'City',
                        icon: const Icon(Icons.location_city),
                      ),
                    ),
                  ),
                  new Flexible(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: BillingInfoField(
                        hintText: 'State',
                        icon: const Icon(Icons.map),
                      ),
                    ),
                  ),
                  new Flexible(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: BillingInfoField(
                        hintText: 'Zip Code',
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ),
                ]),
            Container(
              margin: const EdgeInsets.only(top: 20, right: 50, left: 30),
              height: 50,
              child: Ink(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xff1A936F), Color(0xff114B5F)],
                      begin: Alignment.topLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.circular(30.0)),
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    "Payment information",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            BillingInfoField(
              hintText: 'Name on Card',
              icon: const Icon(Icons.input),
            ),
            BillingInfoField(
              hintText: 'Card Number',
              icon: const Icon(Icons.credit_card),
              keyboardType: TextInputType.number,
            ),
            new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  new Flexible(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: BillingInfoField(
                        icon: Icon(Icons.date_range),
                        hintText: ' MM/YY',
                        keyboardType: TextInputType.datetime,

                      ),
                    ),
                  ),
                  new Flexible(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: new BillingInfoField(
                        icon: Icon(Icons.dialpad),
                        hintText: 'CVV',
                         keyboardType: TextInputType.number,

                      ),
                    ),
                  ),
                  new Flexible(
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: BillingInfoField(
                        hintText: 'Zip Code',
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ),
                ]),
            new FlatButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Congrats()),
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
                      "Submit",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            )
          ]),
        ));
  }
}

class BillingInfoField extends StatelessWidget {
  final String hintText;
  final Icon icon;
  final TextInputType keyboardType;

  BillingInfoField(
      {Key key,
      this.hintText,
      this.icon,
      this.keyboardType = TextInputType.text});

  @override
  Widget build(BuildContext context) {
    return new TextFormField(
        scrollPadding: const EdgeInsets.symmetric(horizontal: 23.0),
        style: TextStyle(color: Color(0xfff4f4e2)),
        keyboardType: this.keyboardType,
        decoration: InputDecoration(
            icon: this.icon,
            hintText: this.hintText,
            hintStyle: TextStyle(color: Color(0xfff4f4e2)),
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xff159e94)))));
  }
}

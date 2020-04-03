import 'dart:ui';

import 'package:flutter/rendering.dart';
import 'package:flutter/material.dart';
import 'package:user_interface_project1/Payment.dart';

import 'package:user_interface_project1/main.dart';

class CartItem {
  CartItem({
    this.item,
    this.key,
    this.cosmeticText
  });

  final YodaItem item;
  final Key key;
  final String cosmeticText;
  int quantity = 1;
}

List<CartItem> shoppingCart = [];

class CheckoutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new CheckoutPage(),
      routes: <String, WidgetBuilder>{
        '/payment': (BuildContext context) => new PaymentPage()
      },
    );
  }
}

class CheckoutPage extends StatefulWidget {
  CheckoutPage({Key key}) : super(key: key);

  @override
  _CheckoutPageState createState() => _CheckoutPageState();

  static List<CartItem> getShoppingCart() => shoppingCart;
}

class _CheckoutPageState extends State<CheckoutPage> {
  List<CartItem> cart = CheckoutPage.getShoppingCart();
  double totalPrice = 0;

  void setTotalPrice() {
    this.totalPrice = this.cart.length > 0 ? this.cart
    .map((item) => item.item.price * item.quantity)
    .reduce((total, current) => total + current) : 0;
  }

  

  @override
  void initState() {
    setTotalPrice();
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF4F5B55),
      appBar: AppBar(
        title: Text('BABY YODA MERCHANDISE'),
        titleSpacing: 10.0,
        backgroundColor: Color(0xFF1B9772),
        actions: <Widget>[          
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () => {},
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
      body: ListView(
        children: cart.asMap().entries.map((entry) {
          var item = entry.value;
          var index = entry.key;
          return CartItemCard(
            imagePath: item.item.imagePath,
            price: item.item.price,
            title: item.item.title,
            cosmeticText: item.cosmeticText,
            quantity: item.quantity,
            index: index,
            onRemove: () {
              setState(() {
                cart.removeAt(index);
                setTotalPrice();
              });
            },
            onQuantityChange: (newQuantity) {
              setState(() {
                cart[index].quantity = newQuantity;
                setTotalPrice();
              });
            },
          );
        }).toList()
      ),
      bottomNavigationBar: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 10),
            child: Text(
              'Total: \$${this.totalPrice.toStringAsFixed(2)}',
              style: TextStyle(
                color: Color(0xFFF4F4E2),
                fontWeight: FontWeight.bold,
                fontSize: 24
              ),
            ),
          ),
          FlatButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PaymentPage()),
              );
            },
            padding: EdgeInsets.all(0.5),                                                                                           
            child: Ink(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [const Color(0xFF159E94), const Color(0xFF10DC4D)],
                ),
                borderRadius: BorderRadius.circular(45),
              ),
              child: Container(
                constraints: BoxConstraints(
                  minHeight: 30,
                  minWidth: 180
                ),
                margin: EdgeInsets.only(top: 10),
                child: Text(
                  'Proceed to Payment',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFFF4F4E2),
                    fontSize: 16
                  )
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CartItemCard extends StatefulWidget {
  CartItemCard({ 
    Key key,
    this.title,
    this.imagePath,
    this.price,
    this.quantity,
    this.cosmeticText,
    this.index,
    this.onRemove,
    this.onQuantityChange
  }): super(key: key);

  final String title;
  final String imagePath;
  final double price;
  final int quantity;
  final String cosmeticText;
  final int index;
  final void Function() onRemove;
  final void Function(int) onQuantityChange;

  _CartItemCardState createState() => _CartItemCardState(quantity: quantity);
}


class _CartItemCardState extends State<CartItemCard> {
  int quantity = 1;

  _CartItemCardState({this.quantity});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Card(
          shape: new RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0)
          ),
          color: Color(0xFFF4F4E2),
          child:Container(
            width: 155,
            height: 180,
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 10),
                  decoration: BoxDecoration(
                    boxShadow: [BoxShadow(blurRadius: 2)],
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      widget.imagePath,
                      height: 110,
                      width: 125,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Row(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.remove_circle),
                      color: Color(0xFF159E94),
                      onPressed: () { 
                        setState(() {
                          this.quantity--;
                          if (this.quantity < 1) this.quantity = 1;
                          widget.onQuantityChange(this.quantity);
                        });
                      },
                      iconSize: 36,
                    ),
                    Text('Qty. ${this.quantity}', 
                      style: TextStyle(
                        color: Color(0xFF1A936F),
                        fontWeight: FontWeight.bold,
                        fontSize: 16
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.add_circle),
                      color: Color(0xFF0FC928),
                      onPressed: () { 
                        setState(() {
                          this.quantity++;
                        });
                        widget.onQuantityChange(this.quantity);
                      },
                      iconSize: 36,
                    ),
                  ],
                )
              ],
            ),
          )
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 5.0
              ),
              child: Text(
                widget.title,
                style: TextStyle(
                  color: Color(0xFFFDFAFA),
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                vertical: 20.0,
                horizontal: 5.0
              ),
              child: Text(
                '\$${widget.price.toStringAsFixed(2)}',
                style: TextStyle(
                  color: Color(0xFFFDFAFA),
                  fontSize: 16,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                vertical: 5.0,
                horizontal: 5.0
              ),
              child: Text(
                widget.cosmeticText,
                style: TextStyle(
                  color: Color(0xFFFDFAFA),
                  fontSize: 16,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            FlatButton(
              onPressed: () {
                widget.onRemove();
              },
              textColor: Color(0xFFFDFAFA),
              padding: EdgeInsets.symmetric(horizontal: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Icon(
                    Icons.remove_shopping_cart,
                    size: 30,
                  ),
                  Text(
                    'Remove',
                    style: TextStyle(
                      fontSize: 16
                    ),
                  )
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}
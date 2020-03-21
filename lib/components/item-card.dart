import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemCard extends StatefulWidget {
  ItemCard({
    Key key,
    this.title,
    this.imagePath,
    this.cosmeticDropdownItems,
    this.price
  }): super(key: key);

  final String title;
  final String imagePath;
  final double price;
  final List<DropdownMenuItem<String>> cosmeticDropdownItems;

  @override
  ItemCardState createState() => ItemCardState();
}

class ItemCardState extends State<ItemCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: new RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0)
      ),
      elevation: 10,
      margin: EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10
      ),
      color: Color(0xFFF4F4E2),
      child: Container(
        width: 175,
        height: 220,
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(vertical: 6),
              child: Text(
                widget.title,
                style: TextStyle(
                  color: Color(0xFF1A936F),
                  fontSize: 14,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                widget.imagePath,
                height: 115,
                width: 115,
                fit: BoxFit.cover,
              ),
            ),
            DropdownButton<String>(
              elevation: 16,
              iconSize: 24,
              onChanged: (String value) { },
              style: TextStyle(
                fontSize: 12,
                color: Color(0xFF4F5B55)
              ),
              isDense: true,
              hint: Text('Color'),
              items: widget.cosmeticDropdownItems
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                FlatButton(
                  onPressed: () { },
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
                        minWidth: 100
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        'Add to Cart',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFFF4F4E2)
                        )
                      ),
                    ),
                  ),
                ),
                Text(
                  '\$${widget.price}',
                  style: TextStyle(
                    color: Color(0xFF1A936F),
                    fontSize: 14,
                    fontWeight: FontWeight.bold
                  ),
                )
              ],
            )
          ],
        )
      ),
    );
  }
}

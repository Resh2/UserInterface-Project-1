class Congrats extends StatefulWidget {
  @override
  CongratsState createState() => CongratsState();

}

class CongratsState extends State<Congrats> {
  @override
  Widget build(BuildContext context) {
    return  RichText(
    textAlign: TextAlign.center,     
    text: TextSpan(
     style: TextStyle(
      color: Color(0xFFF4F4E2),
      fontWeight: FontWeight.w900,
      fontStyle: FontStyle.italic,
      fontFamily: 'Open Sans',
      fontSize: 40),
    children: <TextSpan>[

      TextSpan(text: ' Congratulations, your order is successful !'),
    ],
  ),
);
  }
}

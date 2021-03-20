import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final Map currencies;
  HomePage(this.currencies);
  
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map currencies;
  final List<MaterialColor> _colors = [Colors.blue, Colors.indigo, Colors.red];
  
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Crypto Currency App"),
      ),
      body: _cryptoWidget(),
    );
  }

  Widget _cryptoWidget() {
    return new Container(
      child: new Column(children: <Widget>[
        new Flexible(
            child: new ListView.builder(
          itemCount: widget.currencies.length,
          itemBuilder: (BuildContext context, int index) {
            final Map currency = widget.currencies[index];
            final MaterialColor color = _colors[index % _colors.length];
            return _getListItemUi(currency, color);
          },
        )),
      ]),
    );
  }

  Widget _getListItemUi(Map currency, MaterialColor color) {
    return new ListTile(
      leading: new CircleAvatar(
        //A widget to display before the title.
        backgroundColor: color,
        child: new Text(currency["name"][0]),
      ),
      title: new Text(
        currency["name"],
        style: new TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: _getSubtitle(currency["symbol"], currency["id"]),
      isThreeLine: true,
    );
  }

  Widget _getSubtitle(String symbol, String id) {
    TextSpan priceTextWidget = new TextSpan(
        text: "$symbol\n", style: new TextStyle(color: Colors.black));
    String percentageChangeText = "1 hour : $id%";
    TextSpan percentageChangeTextWidget;
    
    if (double.parse(id) > 0) {
      //Accepts an optional sign (+ or -) )
      percentageChangeTextWidget = new TextSpan(
          text: percentageChangeText,
          style: new TextStyle(color: Colors.green));
    } else {
      percentageChangeTextWidget = new TextSpan(
          text: percentageChangeText, style: new TextStyle(color: Colors.red));
    }

    return new RichText(
        text: new TextSpan(
      children: [priceTextWidget, percentageChangeTextWidget],
    ));
  }
}

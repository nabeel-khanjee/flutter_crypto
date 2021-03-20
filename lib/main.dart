import 'package:flutter/material.dart';
import 'package:crypto_currency_app/home_page.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() async {
  Map currencies = await getCurrency();
  runApp(MyApp(currencies));
}

class MyApp extends StatelessWidget {
  final Map _currencies;
  MyApp(this._currencies);
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(primarySwatch: Colors.pink),
      home: new HomePage(_currencies),
    );
  }
}

Future<Map> getCurrency() async {
  String cryptoUrl =
      "https://fcsapi.com/api-v3/crypto/list?type=crypto&access_key=9S6lPPmiJsaQxFL8zPWrLrl";
  http.Response response = await http.get(cryptoUrl);
  return json.decode(response.body);
}

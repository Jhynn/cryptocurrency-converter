import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MainPage extends StatelessWidget {
  static var url = Uri.parse("https://blockchain.info/ticker");

  void getCurrencies() async {
    var res = await http.get(url);
    Map<String, dynamic> data = json.decode(res.body);
    print(data['BRL']['buy']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cyptocurrency Converter'),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('Crypto'),
              Text('Convencional'),
              TextButton(
                onPressed: getCurrencies,
                child: Text('R\$'),
              ),
            ],
          ),
          // ListView(),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import 'dart:convert';

class MainPage extends StatefulWidget {
  static var url = Uri.parse("https://blockchain.info/ticker");

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  String symbol = '';
  String country = 'USD';
  double price = 0.0;
  Map<String, dynamic> d = Map<String, dynamic>();

  void getCurrencies() async {
    http.Response response = await http.get(MainPage.url);
    Map<String, dynamic> data = json.decode(response.body);
    setState(() {
      d = data;
      symbol = data[country]['symbol'];
      price = data[country]['buy'];
    });
  }

  @override
  Widget build(BuildContext context) {
    getCurrencies();
    return Scaffold(
      appBar: AppBar(
        title: Text('Cyptocurrency Converter'),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              SizedBox(height: 17.0),
              Text('Crypto'),
            ],
          ),
          Column(
            children: [
              SizedBox(height: 17.0),
              Text('Convencional ─ $symbol'),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: ThemeData.dark().primaryColor,
        foregroundColor: ThemeData.dark().accentColor,
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (BuildContext bc) {
              return Container(
                color: ThemeData.dark().primaryColor,
                child: ListView.builder(
                  itemCount: d.length,
                  itemBuilder: (context, index) {
                    var k = d.keys.toList();
                    return ListTile(
                      leading: Icon(Icons.emoji_flags),
                      title: Text(k[index]),
                      onTap: () {
                        country = k[index];
                      },
                    );
                  },
                ),
              );
            },
          );
        },
        child: Icon(
          Icons.arrow_upward,
        ),
      ),
    );
  }
}

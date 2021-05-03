import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import 'dart:convert';

import '../model/data.dart';
// 9e8d236a372d8e3e64a86239d5d6d5509c0e82bbf086c6f72504714c28803846 API key

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  String currency = 'Selecione uma moeda';
  double price = 0.0;
  Data data = Data();

  Map<String, dynamic> d = {
    "BTC": {"BRL": 0},
    "ETH": {"BRL": 0},
    "XRP": {"BRL": 0},
  };

  void getCurrencies() async {
    var url = Uri.parse(
        "https://min-api.cryptocompare.com/data/pricemulti?fsyms=BTC,ETH,XRP&tsyms=$currency");
    http.Response response = await http.get(url);
    Map<String, dynamic> data = json.decode(response.body);
    setState(() {
      d = data;
    });
  }

  void bottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return Container(
          color: ThemeData.dark().primaryColor,
          child: ListView.builder(
            itemCount: data.currencies.length,
            itemBuilder: (context, index) {
              // var k = d.keys.toList();
              return ListTile(
                leading: Icon(Icons.emoji_flags),
                title: Text(data.currencies[index]),
                onTap: () {
                  currency = data.currencies[index];
                  getCurrencies();
                },
              );
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cyptocurrency Converter'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(30.0, 10, 30, 10),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('Bitcoin (BTC)'),
                    TextButton(
                      child: Text('$currency - ${d["BTC"][currency]}'),
                      onPressed: bottomSheet,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30.0, 10, 30, 10),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('Ethereum (ETH)'),
                    TextButton(
                      child: Text('$currency - ${d["ETH"][currency]}'),
                      onPressed: bottomSheet,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30.0, 10, 30, 10),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('Monero (XRP)'),
                    TextButton(
                      child: Text('$currency - ${d["XRP"][currency]}'),
                      onPressed: bottomSheet,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Column(
              children: [
                Text('Matheus Henrique Silva Miranda'),
                Text('Phillippy Cardelly Albuquerque dos Santos'),
                Text('Vitor Azevedo Silva'),
                Text('Wesley Costa da Silva'),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: ThemeData.dark().primaryColor,
        foregroundColor: ThemeData.dark().accentColor,
        onPressed: bottomSheet,
        child: Icon(
          Icons.arrow_upward,
        ),
      ),
    );
  }
}

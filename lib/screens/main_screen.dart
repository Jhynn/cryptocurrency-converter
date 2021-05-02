import 'package:flutter/material.dart';

// import 'package:http/http.dart' as http;

// import 'dart:convert';

class MainPage extends StatefulWidget {
  static var url = Uri.parse("https://blockchain.info/ticker");

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  // Future<Map<String, dynamic>> getCurrencies() async {
  //   http.Response response = await http.get(MainPage.url);
  //   Map<String, dynamic> data = json.decode(response.body);
  //   return data;
  // }

  // var auxiliar = getCurrencies();

  @override
  Widget build(BuildContext context) {
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
              Text('Convencional'),
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
                child: Wrap(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Center(
                        child: Container(
                          height: 10,
                          width: 70,
                          color: ThemeData.dark().accentColor,
                        ),
                      ),
                    ),
                    ListTile(
                        leading: new Icon(Icons.emoji_flags),
                        title: new Text('Brasil'),
                        onTap: () => {}),
                    ListTile(
                      leading: new Icon(Icons.emoji_flags),
                      title: new Text('England'),
                      onTap: () => {},
                    ),
                    ListTile(
                      leading: new Icon(Icons.emoji_flags),
                      title: new Text('UK'),
                      onTap: () => {},
                    ),
                  ],
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

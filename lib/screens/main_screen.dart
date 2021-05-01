import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
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
              ElevatedButton(
                onPressed: () {},
                child: Icon(Icons.add),
              ),
            ],
          ),
          // ListView(),
        ],
      ),
    );
  }
}

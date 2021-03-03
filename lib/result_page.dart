import 'package:flutter/material.dart';
import 'package:yasamtahmini/user_data.dart';
import './user_data.dart';
import './hesap.dart';

class ResultPage extends StatelessWidget {
  final UserData _userdata;
  ResultPage(this._userdata);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sonuç Sayfası"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 8,
            child: Center(
              child: Text(
                "Tahmini Yaşam Süreniz: ${Hesap(_userdata).hesaplama().round().toString()}",
                style: TextStyle(
                    color: Colors.black54,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: FlatButton(
                color: Colors.white,
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "Geri Dön",
                  style: TextStyle(
                      color: Colors.black54,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                )),
          )
        ],
      ),
    );
  }
}

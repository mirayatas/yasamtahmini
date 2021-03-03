import 'package:flutter/material.dart';

class IconCinsiyet extends StatelessWidget {
  final IconData icon;
  final String cinsiyet;
  IconCinsiyet({this.cinsiyet, this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 50,
          color: Colors.black54,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          cinsiyet,
          style: TextStyle(
              color: Colors.black54, fontSize: 20, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}

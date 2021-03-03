import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yasamtahmini/result_page.dart';
import 'package:yasamtahmini/user_data.dart';
import './icon_cinsiyet.dart';
import './my_container.dart';
import './result_page.dart';
import './user_data.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  double icilensigara = 15;
  String secilicinsiyet;
  double sporgunu = 3;
  int boy = 160;
  int kilo = 50;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'YAŞAM BEKLENTİSİ',
          style: TextStyle(color: Colors.black54),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: MyContainer(
                    child: buildRowOutlineButton("BOY"),
                  ),
                ),
                Expanded(
                  child: MyContainer(
                    child: buildRowOutlineButton("KİLO"),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: MyContainer(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Haftada Kaç Gün Spor Yapıyorsunuz?",
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "${sporgunu.round()}",
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  Slider(
                      value: sporgunu,
                      min: 0,
                      max: 7,
                      divisions: 7,
                      onChanged: (double newValue) {
                        setState(() {
                          sporgunu = newValue;
                        });
                      })
                ],
              ),
            ),
          ),
          Expanded(
            child: MyContainer(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Günde Kaç Sigara İçiyorsunuz?",
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "${icilensigara.round()}",
                    style: TextStyle(
                        color: Colors.lightBlue,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                  Slider(
                      value: icilensigara,
                      min: 0,
                      max: 30,
                      //divisions: 30,
                      onChanged: (double newValue) {
                        setState(() {
                          icilensigara = newValue;
                        });
                      })
                ],
              ),
            ),
          ),
          Expanded(
              child: Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      secilicinsiyet = "KADIN";
                    });
                  },
                  child: MyContainer(
                    renk: (secilicinsiyet == "KADIN")
                        ? Colors.lightBlue[100]
                        : Colors.white,
                    child: IconCinsiyet(
                      icon: FontAwesomeIcons.venus,
                      cinsiyet: "KADIN",
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      secilicinsiyet = "ERKEK";
                    });
                  },
                  child: MyContainer(
                    renk: (secilicinsiyet == "ERKEK")
                        ? Colors.lightBlue[100]
                        : Colors.white,
                    child: IconCinsiyet(
                      icon: FontAwesomeIcons.mars,
                      cinsiyet: "ERKEK",
                    ),
                  ),
                ),
              )
            ],
          )),
          ButtonTheme(
            height: 50,
            child: FlatButton(
                color: Colors.white,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ResultPage(UserData(
                                icilensigara: icilensigara,
                                secilicinsiyet: secilicinsiyet,
                                sporgunu: sporgunu,
                                boy: boy,
                                kilo: kilo,
                              ))));
                },
                child: Text(
                  "HESAPLA",
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

  Row buildRowOutlineButton(String isim) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RotatedBox(
            quarterTurns: 3,
            child: Text(
              isim,
              style: TextStyle(
                  color: Colors.black54,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            )),
        SizedBox(
          width: 10,
        ),
        RotatedBox(
            quarterTurns: 3,
            child: Text(
              isim == "BOY" ? boy.toString() : kilo.toString(),
              style: TextStyle(
                  color: Colors.lightBlue,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            )),
        SizedBox(
          width: 10,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ButtonTheme(
              minWidth: 36,
              child: OutlineButton(
                  child: Icon(
                    FontAwesomeIcons.plus,
                    size: 15,
                  ),
                  onPressed: () {
                    setState(() {
                      isim == "BOY" ? boy++ : kilo++;
                    });
                  }),
            ),
            SizedBox(
              height: 10,
            ),
            ButtonTheme(
              minWidth: 36,
              child: OutlineButton(
                  child: Icon(
                    FontAwesomeIcons.minus,
                    size: 15,
                  ),
                  onPressed: () {
                    setState(() {
                      isim == "BOY" ? boy-- : kilo--;
                    });
                  }),
            )
          ],
        )
      ],
    );
  }
}

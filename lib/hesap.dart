import 'package:yasamtahmini/user_data.dart';

class Hesap {
  UserData _userdata;

  Hesap(this._userdata);

  double hesaplama() {
    double sonuc = 0;

    sonuc = 90 + _userdata.sporgunu - _userdata.icilensigara;
    sonuc = sonuc + (_userdata.boy / _userdata.kilo);

    if (_userdata.secilicinsiyet == "KADIN") {
      return sonuc + 3;
    } else {
      return sonuc;
    }
  }
}

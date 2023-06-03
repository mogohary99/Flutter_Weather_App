import 'package:shared_preferences/shared_preferences.dart';


enum DegreeType {
  celsius('celsius'),
fahrenheit('fahrenheit');

const DegreeType(this.type);
final String type;
}

extension ConvertDegree on String{
  DegreeType? get toEnum {
    switch (this) {
      case 'celsius':
        return DegreeType.celsius;
      case 'fahrenheit':
        return DegreeType.fahrenheit;
      default:
        return null;
    }
  }
}


class SharedPreferenceModule {
  final String _keyDegreeType = 'degreeType';
  final SharedPreferences pref;

  SharedPreferenceModule({required this.pref});

  Future<void> clear() async {
    await pref.clear();
  }


  void setDegreeType(DegreeType degreeType) =>
      pref.setString(_keyDegreeType, degreeType.type,);


  String? get  getDegreeType => pref.getString(_keyDegreeType);
}


import 'package:shared_preferences/shared_preferences.dart';
import 'package:shp/models.dart';

class Preferences {
  void saveSetting(Settings settings) async {
    final preferences = await SharedPreferences.getInstance();

    await preferences.setString('username', settings.userName!);
    await preferences.setBool('isEmployed', settings.isEmployed!);
    await preferences.setInt('gender', settings.gender.index);
    await preferences.setStringList(
        'programming',
        settings.programminglaunguage!
            .map((lang) => lang.index.toString())
            .toList());

    print("Saved Settings");
  }

  Future<Settings> getSavedSetting() async {
    final preferences = await SharedPreferences.getInstance();
    final userName = preferences.getString('username');
    final isEmployed = preferences.getBool('isEmployed');
    final gender = Gender.values[preferences.getInt('gender') ?? 0];
    final programmingLaunguageIndices =
        preferences.getStringList('programming');
    final programmingLanguage = programmingLaunguageIndices!
        .map((strigIndex) => ProgrammingLanguage.values[int.parse(strigIndex)])
        .toSet();

    return Settings(
      userName: userName,
      gender: gender,
      isEmployed: isEmployed,
      programminglaunguage: programmingLanguage,
    );
  }
}

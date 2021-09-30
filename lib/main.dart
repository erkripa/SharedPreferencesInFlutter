import 'package:flutter/material.dart';
import 'package:shp/models.dart';
import 'package:shp/preferences_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _usernameController = TextEditingController();

  var _selectedGender = Gender.FEMALE;
  var _selectedLaunguage = Set<ProgrammingLanguage>();
  final _preferences = Preferences();
  bool _isEmployed = false;

  @override
  void initState() {
    super.initState();
    populates();
  }

  void populates() async {
    final settings = await Preferences().getSavedSetting();
    setState(() {
      _usernameController.text = settings.userName!;
      _selectedGender = settings.gender;
      _selectedLaunguage = settings.programminglaunguage!;
      _isEmployed = settings.isEmployed!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shp"),
      ),
      body: ListView(
        children: [
          ListTile(
            title: TextField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
          ),
          RadioListTile(
              title: Text('Female'),
              value: Gender.FEMALE,
              groupValue: _selectedGender,
              onChanged: (newvalue) =>
                  setState(() => _selectedGender = Gender.FEMALE)),
          RadioListTile(
              title: Text('Male'),
              value: Gender.MALE,
              groupValue: _selectedGender,
              onChanged: (newvalue) =>
                  setState(() => _selectedGender = Gender.MALE)),
          RadioListTile(
              title: Text('Other'),
              value: Gender.OTHER,
              groupValue: _selectedGender,
              onChanged: (newvalue) =>
                  setState(() => _selectedGender = Gender.OTHER)),
          CheckboxListTile(
              title: const Text('Kotlin'),
              value: _selectedLaunguage.contains(ProgrammingLanguage.kotlin),
              onChanged: (_) {
                setState(() {
                  setState(() {
                    _selectedLaunguage.contains(ProgrammingLanguage.kotlin)
                        ? _selectedLaunguage.remove(ProgrammingLanguage.kotlin)
                        : _selectedLaunguage.add(ProgrammingLanguage.kotlin);
                  });
                });
              }),
          CheckboxListTile(
            title: const Text("Java"),
            value: _selectedLaunguage.contains(ProgrammingLanguage.java),
            onChanged: (_) {
              setState(() {
                _selectedLaunguage.contains(ProgrammingLanguage.java)
                    ? _selectedLaunguage.remove(ProgrammingLanguage.java)
                    : _selectedLaunguage.add(ProgrammingLanguage.java);
              });
            },
          ),
          CheckboxListTile(
            title: const Text("Swift"),
            value: _selectedLaunguage.contains(ProgrammingLanguage.swift),
            onChanged: (_) {
              setState(() {
                _selectedLaunguage.contains(ProgrammingLanguage.swift)
                    ? _selectedLaunguage.remove(ProgrammingLanguage.swift)
                    : _selectedLaunguage.add(ProgrammingLanguage.swift);
              });
            },
          ),
          CheckboxListTile(
            title: const Text("JavaScript"),
            value: _selectedLaunguage.contains(ProgrammingLanguage.javaScript),
            onChanged: (_) {
              setState(() {
                _selectedLaunguage.contains(ProgrammingLanguage.javaScript)
                    ? _selectedLaunguage.remove(ProgrammingLanguage.javaScript)
                    : _selectedLaunguage.add(ProgrammingLanguage.javaScript);
              });
            },
          ),
          SwitchListTile(
            title: const Text("Empolyed"),
            value: _isEmployed,
            onChanged: (newvalue) => setState(() => _isEmployed = newvalue),
          ),
          TextButton(onPressed: _saveSetting, child: Text("Save Setting")),
        ],
      ),
    );
  }

  void _saveSetting() {
    final newSettings = Settings(
      userName: _usernameController.text,
      gender: _selectedGender,
      programminglaunguage: _selectedLaunguage,
      isEmployed: _isEmployed,
    );
    print(newSettings);
    _preferences.saveSetting(newSettings);
  }
}

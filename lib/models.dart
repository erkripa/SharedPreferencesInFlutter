enum Gender { FEMALE, MALE, OTHER }

enum ProgrammingLanguage{
  java,
  javaScript,swift,kotlin
  
}

class Settings{
  final String? userName;
  final Gender gender;
  final bool? isEmployed;
  final Set<ProgrammingLanguage>? programminglaunguage;

  Settings({required this.userName, required this.gender, required this.isEmployed,required this.programminglaunguage});


}
part of 'extensions.dart';

extension FirebaseUserExtension on User {
  UserClass convertToUser(
          {String name = "No Name",
          List<String> selectedGenres = const [],
          String selectedLanguage = "English",
          int balance = 50000}) =>
      UserClass(this.uid, this.email,
          name: name,
          balance: balance,
          selectedGenres: selectedGenres,
          selectedLanguage: selectedLanguage);

  Future<UserClass> fromFireStore() async =>
      await UserServices.getUser(this.uid);
}

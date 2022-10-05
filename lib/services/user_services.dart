part of 'services.dart';

class UserServices {
  static CollectionReference _userCollection =
      FirebaseFirestore.instance.collection('users');

  static Future<void> updateUser(UserClass user) async {
    _userCollection.doc(user.id).set({
      'email': user.email,
      'name': user.name,
      'balance': user.balance,
      'selectedGenres': user.selectedGenres,
      'selectedLanguage': user.selectedLanguage,
      'profilePicture': user.profilePicture ?? ""
    });
  }

  static Future<UserClass> getUser(String id) async {
    DocumentSnapshot snapshot = await _userCollection.doc(id).get();
    return UserClass(id, snapshot.get('email'),
        balance: snapshot.get('balance'),
        profilePicture: snapshot.get('profilePicture'),
        selectedLanguage: snapshot.get('selectedLanguage'),
        selectedGenres: (snapshot.get('selectedGenres') as List)
            .map((e) => e.toString())
            .toList(),
        name: snapshot.get('name'));
  }
}

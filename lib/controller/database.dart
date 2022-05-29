import 'package:bayouni_coffee/utils/shared_prefs.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class DBHelper {
  static void saveUserToDB({
    String name = '',
    String phoneNo = '',
    String imageURL = '',
    bool isSocialAuth = false,
  }) {
    print("iam in saveUserToDB  function");

    FirebaseDatabase.instance
        .ref()
        .child('Users')
        .child(FirebaseAuth.instance.currentUser!.uid)
        .update(
          isSocialAuth
              ? {
                  'email': FirebaseAuth.instance.currentUser!.email,
                }
              : {
                  'email': FirebaseAuth.instance.currentUser!.email,
                  'name': name,
                  'phoneNo': phoneNo,
                  'imageURL': imageURL,
                },
        );
  }

  static Future<void> setUserInfo() async {
    print("iam in set user info function");
    print(FirebaseAuth.instance.currentUser!.uid);
    sharedPrefs.userName = (await FirebaseDatabase.instance
            .ref()
            .child('Users')
            .child(FirebaseAuth.instance.currentUser!.uid)
            .child('name')
            .once())
        .snapshot
        .value
        .toString();
    print("sharedprefs.username: ${sharedPrefs.userName}");
    sharedPrefs.phoneNo = (await FirebaseDatabase.instance
            .ref()
            .child('Users')
            .child(FirebaseAuth.instance.currentUser!.uid)
            .child('phoneNo')
            .once())
        .snapshot
        .value
        .toString();
    print("sharedprefs.phone: ${sharedPrefs.phoneNo}");

    sharedPrefs.imageURL = (await FirebaseDatabase.instance
            .ref()
            .child('Users')
            .child(FirebaseAuth.instance.currentUser!.uid)
            .child('imageURL')
            .once())
        .snapshot
        .value
        .toString();
  }

  static void updateUserName(String username) {
    FirebaseDatabase.instance
        .ref()
        .child('Users')
        .child(FirebaseAuth.instance.currentUser!.uid)
        .update({'name': username});
  }

  static void updatePhoneNo(String phoneNo) {
    FirebaseDatabase.instance
        .ref()
        .child('Users')
        .child(FirebaseAuth.instance.currentUser!.uid)
        .update({'phoneNo': phoneNo});
  }

  static Future<void> updateImageURL(String imageURL) async {
    await FirebaseDatabase.instance
        .ref()
        .child('Users')
        .child(FirebaseAuth.instance.currentUser!.uid)
        .update({'imageURL': imageURL});
  }
}

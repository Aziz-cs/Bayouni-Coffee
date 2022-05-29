import 'package:bayouni_coffee/controller/database.dart';
import 'package:bayouni_coffee/controller/helper.dart';
import 'package:bayouni_coffee/utils/shared_prefs.dart';
import 'package:bayouni_coffee/view/navigator_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../utils/constants.dart';

class AuthController extends GetxController {
  final isLoadingEmail = false.obs;
  final isLoadingGoogle = false.obs;
  final isLoadingFacebook = false.obs;
  final isLoadingForgotPass = false.obs;
  Future<void> signInWithGoogle() async {
    isLoadingGoogle.value = true;
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    late final credential;
    try {
      credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
    } catch (e) {
      print('error on google credential $e');
      isLoadingGoogle.value = false;
      return;
    }
    // Once signed in, return the UserCredential
    await FirebaseAuth.instance.signInWithCredential(credential).then((value) {
      print("after signing in with google");
      isLoadingGoogle.value = false;
      DBHelper.saveUserToDB(isSocialAuth: true);
      DBHelper.setUserInfo();
      // Get.offAll(() => NavigatorPage());
    }).catchError((e) {
      isLoadingGoogle.value = false;
      showToast(kErrorSomethingWentWrong);
    });
    isLoadingGoogle.value = false;
  }

  void signInWithEmailNPassword({
    required String email,
    required String password,
  }) async {
    isLoadingEmail.value = true;
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password)
          .then((userCredentialValue) {
        isLoadingEmail.value = false;
        showToast('Welcome back!');
        DBHelper.setUserInfo();
        Get.offAll(() => NavigatorPage());
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showToast('This user is not registered');
      } else if (e.code == 'wrong-password') {
        showToast('Password is incorrect');
      } else {
        showToast(kErrorSomethingWentWrong);
        print(e);
      }
    }
    print('must reach end user email login');
    isLoadingEmail.value = false;
  }

  void createUser({
    required String email,
    required String password,
    required String name,
    required String phoneNo,
  }) async {
    isLoadingEmail.value = true;
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: email,
        password: password,
      )
          .then((value) {
        DBHelper.saveUserToDB(name: name, phoneNo: phoneNo);
        sharedPrefs.userName = name;
        sharedPrefs.phoneNo = phoneNo;
        isLoadingEmail.value = false;
        showToast('Account has been created successfully!');
        Get.offAll(() => NavigatorPage());
      });
      isLoadingEmail.value = false;
    } on FirebaseAuthException catch (e) {
      isLoadingEmail.value = false;
      if (e.code == 'weak-password') {
        showToast('Password is too weak');
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        showToast('Email is already registered');

        print('The account already exists for that email.');
      }
    } catch (e) {
      isLoadingEmail.value = true;
      print(e);
    }
  }

  void sendResetPasswordMail({required String email}) async {
    isLoadingForgotPass.value = true;
    await FirebaseAuth.instance
        .sendPasswordResetEmail(email: email)
        .then((value) {
      showToast('Password change link has been sent to the Email');
      isLoadingForgotPass.value = false;
    }).catchError((e) {
      print(e);
      showToast(kErrorSomethingWentWrong);
    });
  }

  void signInWithFacebook() async {
    isLoadingFacebook.value = true;
    final LoginResult result = await FacebookAuth.instance
        .login(); // by default we request the email and the public profile
// or FacebookAuth.i.login()
    if (result.status == LoginStatus.success) {
      // you are logged
      isLoadingFacebook.value = false;
      final AccessToken accessToken = result.accessToken!;
      Get.offAll(() => NavigatorPage());
    } else {
      isLoadingFacebook.value = false;
      print(result.status);
      print(result.message);
    }
  }
}

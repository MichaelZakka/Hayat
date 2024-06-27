import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hayat/data/constant/api_constant.dart';
import 'package:hayat/data/http/http_client.dart';
import 'package:hayat/data/models/body/login_body.dart';
import 'package:hayat/data/models/body/signup_body.dart';
import 'package:hayat/res/colors.dart';
import 'package:hayat/res/styles.dart';

class AuthRepo {
  MyHttpClient http = MyHttpClient();
  login(LoginBody loginBody) async {
    return await http.postRequest(LOGIN, loginBody.toJson(), {
      "Accept": "application/json",
    });
  }

  signup(SignUpBody signUpBody) async {
    return await http.postRequest(SIGN_UP, signUpBody.toJson(), {
      "Accept": "application/json",
    });
  }

  Future<dynamic> signupWithApple() async {
    try {
      final appleProvider = AppleAuthProvider();
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithProvider(appleProvider);
      print('===========================apple1===========================');
      print(userCredential);
      print('===========================apple2===========================');
      final idToken = await userCredential.user?.getIdToken();
      print(idToken);
      print('===========================apple3===========================');
      return await http.postRequest(APPLE_SIGNUP, {
        "idToken": idToken,
        "access_token": userCredential.credential!.accessToken
      }, {
        "Accept": "application/json"
      });
    } catch (e) {
      print(e);
    }
    return null;
  }

  Future<dynamic> updateToken(String fcmToken, String token) async {
    print(fcmToken);
    print(token);
    return await http.postRequest(UPDATE_TOKEN, {"fcm_token": fcmToken},
        {"Accept": "application/json", "Authorization": "Bearer $token"});
  }

  Future signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      print('============================google1============================');
      print(googleUser);
      if (googleUser != null) {
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;
        print(
            '============================google2============================');

        AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        await FirebaseAuth.instance.signInWithCredential(credential);

        print(
            '============================google3============================');

        print(credential.accessToken);
        final userCredential = await http.postRequest(
            GOOGLE_SIGNUP,
            {"provider": "google", "access_token": "${credential.accessToken}"},
            {"Accept": "application/json"});

        return userCredential;
      } else {
        print(
            '============================google4============================');
      }
    } on Exception catch (e) {
      print(e);
      validation('Network error', red);
    }
  }

  void validation(String message, Color color) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      backgroundColor: color,
      textColor: Colors.white,
      timeInSecForIosWeb: 3,
      fontSize: mediumText,
    );
  }
}

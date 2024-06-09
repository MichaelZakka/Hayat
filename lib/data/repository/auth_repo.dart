import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hayat/data/constant/api_constant.dart';
import 'package:hayat/data/http/http_client.dart';
import 'package:hayat/data/models/body/login_body.dart';
import 'package:hayat/data/models/body/signup_body.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
// import 'package:sign_in_with_apple/sign_in_with_apple.dart';

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

  // Future signupWithApple({List<Scope> scopes = const []}) async {
  //   final result = await TheAppleSignIn.performRequests(
  //       [AppleIdRequest(requestedScopes: scopes)]);
  //   switch (result.status) {
  //     case AuthorizationStatus.authorized:
  //       final AppleIdCredential = result.credential!;
  //       final oAuthProvider = OAuthProvider('apple.com');
  //       final credential = oAuthProvider.credential(
  //           idToken: String.fromCharCodes(AppleIdCredential.identityToken!));
  //       final UserCredential =
  //           await FirebaseAuth.instance.signInWithCredential(credential);
  //       final firebaseUser = UserCredential.user!;
  //       if (scopes.contains(Scope.fullName)) {
  //         final fullName = AppleIdCredential.fullName;
  //         if (fullName != null &&
  //             fullName.givenName != null &&
  //             fullName.familyName != null) {
  //           final displayName = '${fullName.givenName} ${fullName.familyName}';
  //           await firebaseUser.updateDisplayName(displayName);
  //         }
  //       }
  //       return firebaseUser;
  //     case AuthorizationStatus.error:
  //       throw PlatformException(
  //           code: 'ERROR_AUTHORIZATION_DENIED',
  //           message: result.error.toString());

  //     case AuthorizationStatus.cancelled:
  //       throw PlatformException(
  //           code: 'ERROR_ABORTED_BY_USER', message: 'Sign in aborted by user');

  //     default:
  //       throw UnimplementedError();
  //   }
  // }

  Future<UserCredential> signInWithApple() async {
    final appleCredential = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
    );

    final oauthCredential = OAuthProvider("apple.com").credential(
      idToken: appleCredential.identityToken,
      accessToken: appleCredential.authorizationCode,
    );

    return await FirebaseAuth.instance.signInWithCredential(oauthCredential);
  }

  Future signupWithApple() async {
    // final appleProvider = AppleAuthProvider();
    // return await FirebaseAuth.instance.signInWithProvider(appleProvider);

    // final credential = await SignInWithApple.getAppleIDCredential(
    //             scopes: [
    //               AppleIDAuthorizationScopes.email,
    //               AppleIDAuthorizationScopes.fullName,
    //             ],
    //           );
  }

  /////////////////////////////////////////////////////////////////////

  Future<dynamic> updateToken(String fcmToken, String token) async {
    print(fcmToken);
    print(token);
    return await http.postRequest(UPDATE_TOKEN, {"fcm_token": fcmToken},
        {"Accept": "application/json", "Authorization": "Bearer $token"});
  }

  Future signInWithGoogle() async {
    final GoogleSignInAccount? googleUser =
        await GoogleSignIn().signIn();
    print('============================google1============================');

    final GoogleSignInAuthentication? googleAuth =
        await googleUser!.authentication;
    print('============================google2============================');
    AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth!.accessToken,
      idToken: googleAuth.idToken,
    );
    print('============================google3============================');
    print(credential.accessToken);

    return await http.postRequest(
        GOOGLE_SIGNUP,
        {"provider": "google", "access_token": "${credential.accessToken}"},
        {"Accept": "application/json"});
  }

  // Future<UserCredential> signupWithApple() async {
  //   final appleProvider = AppleAuthProvider();
  //   print('apple');
  //   return await FirebaseAuth.instance.signInWithProvider(appleProvider);
  // }
}

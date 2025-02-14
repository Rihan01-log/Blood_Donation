import 'dart:developer';

import 'package:google_sign_in/google_sign_in.dart';

class AuthServices {
  Future<String> nativeGoogleSignIn() async {
    try {
      const webClientId =
          '887269246036-h1r11gpuo7ttf6kiohjmm0asjouvipct.apps.googleusercontent.com';

      const andClientId =
          '887269246036-h1r11gpuo7ttf6kiohjmm0asjouvipct.apps.googleusercontent.com';

      final GoogleSignIn googleSignIn = GoogleSignIn(
        clientId: andClientId,
        serverClientId: webClientId,
      );
      final googleUser = await googleSignIn.signIn();
      final googleAuth = await googleUser!.authentication;
      final accessToken = googleAuth.accessToken;
      final idToken = googleAuth.idToken;

      if (accessToken == null) {
        throw 'No Access Token found.';
      }
      if (idToken == null) {
        throw 'No ID Token found.';
      }
      return 'google auth success';
    } on Exception catch (e) {
      // TODO
      log("$e");
    }
    throw Exception();
  }
}

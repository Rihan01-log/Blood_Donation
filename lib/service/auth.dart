import 'dart:developer';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthServices {
  Future<AuthResponse> nativeGoogleSignIn() async {
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
      return Supabase.instance.client.auth.signInWithIdToken(
        provider: OAuthProvider.google,
        idToken: idToken,
        accessToken: accessToken,
      );
    } on Exception catch (e) {
      // TODO
      log("$e");
    }
    throw Exception();
  }
}

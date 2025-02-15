import 'dart:developer';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthServices {
  Future<String> nativeGoogleSignIn() async {
    try {
      const androidClientId =
          '887269246036-h1r11gpuo7ttf6kiohjmm0asjouvipct.apps.googleusercontent.com';

      final GoogleSignIn googleSignIn = GoogleSignIn(
        clientId: androidClientId,
      );
      final googleUser = await googleSignIn.signIn();
      final googleAuth = await googleUser!.authentication;

      final idToken = googleAuth.idToken;
      final response = await Supabase.instance.client.auth
          .signInWithIdToken(provider: OAuthProvider.google, idToken: idToken!);
      if (response.user == null) {
        throw Exception('Failed to sign in');
      }

      return 'google auth success';
    } on Exception catch (e) {
      // TODO
      log("$e");
    }
    throw Exception();
  }
}

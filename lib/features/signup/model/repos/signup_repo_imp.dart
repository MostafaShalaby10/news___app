import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:news_app/core/Utils/service_locator.dart';
import 'package:news_app/features/signup/model/repos/signup_repo_interface.dart';

class SignupRepoImp implements SignupRepoInterface {
  @override
  Future createAccountUsingEmailAndPassword({
    required String email,
    required String password,
  }) async {
    await getIt<FirebaseAuth>().createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  @override
  Future createAccountUsingGoogle() async {
    final GoogleSignInAccount? googleSignInAccount =
        await GoogleSignIn(
          scopes: [
            "ms2231710@gmail.com",
            'https://www.googleapis.com/auth/contacts.readonly',
          ],
        ).signIn();

    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount!.authentication;
    final crediantal = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );
   return await getIt<FirebaseAuth>().signInWithCredential(crediantal);
  }
}

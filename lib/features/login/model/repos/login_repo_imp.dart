import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:news_app/features/login/model/repos/login_repo_interface.dart';

import '../../../../core/Utils/service_locator.dart';

class LoginRepoImp implements LoginRepoInterface {
  @override
  Future loginUsingEmailAndPassword({
    required String email,
    required String password,
  }) async{
    await getIt<FirebaseAuth>().signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  @override
  Future loginUsingGoogle() async {
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

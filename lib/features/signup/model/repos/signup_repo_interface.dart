abstract class SignupRepoInterface {
  Future createAccountUsingEmailAndPassword({
    required String email,
    required String password,
  });

  Future createAccountUsingGoogle();
}

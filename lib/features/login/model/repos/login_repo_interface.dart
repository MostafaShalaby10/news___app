abstract class LoginRepoInterface {
  Future loginUsingEmailAndPassword({
    required String email,
    required String password,
  });

  Future loginUsingGoogle();



}
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/Utils/service_locator.dart';
import 'package:news_app/core/widgets/custom_button_widget.dart';
import 'package:news_app/core/widgets/custom_text_form_field.dart';
import 'package:news_app/core/widgets/custom_text_widget.dart';
import 'package:news_app/features/login/model/repos/login_repo_imp.dart';
import 'package:news_app/features/login/view_model/cubit/login_cubit.dart';
import 'package:news_app/features/signup/views/signup_view.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    var formKey = GlobalKey<FormState>();
    return BlocProvider(
      create: (context) => LoginCubit(getIt<LoginRepoImp>()),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is SuccessfullyLoginWithEmailAndPassword ||
              state is SuccessfullyLoginWithGoogle) {
            // Move to home page
          } else if (state is ErrorLoginWithEmailAndPassword ||
              state is ErrorLoginWithGoogle) {
            // Error message
          }
        },
        builder: (context, state) {
          LoginCubit loginCubit = LoginCubit.get(context);
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: Form(
                    key: formKey,
                    child: Column(
                      spacing: 10.h,
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CustomTextWidget(
                          text: "Login",
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                        const CustomTextWidget(
                          text: "Welcome in our app",
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                        CustomTextFormFieldWidget(
                          hintText: "Email",
                          prefixIcon: Icons.email,
                          controller: emailController,
                        ),
                        CustomTextFormFieldWidget(
                          hintText: "Password",
                          prefixIcon: Icons.lock,
                          obscureText: loginCubit.isPassword,
                          controller: passwordController,
                          suffixIcon:
                              loginCubit.isPassword
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined,
                          suffixOnPressed: () {
                            loginCubit.changePasswordVisibility();
                          },
                        ),

                        state is! LoadingLoginWithEmailAndPassword
                            ? SizedBox(
                              width: double.infinity,
                              child: CustomButtonWidget(
                                text: "Login",
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    loginCubit.loginUsingEmailAndPassword(
                                      email: emailController.text,
                                      password: passwordController.text,
                                    );
                                  }
                                },
                              ),
                            )
                            : const Center(child: CircularProgressIndicator()),

                        const Divider(
                          color: Colors.black,
                          thickness: 1,
                          height: 60,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const CustomTextWidget(
                              text: "Or login with",
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                            TextButton(
                              onPressed: () {
                                loginCubit.loginWithGoogle();
                              },
                              child: const CustomTextWidget(
                                text: "Google",
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const CustomTextWidget(
                              text: "Don't have an account?",
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const SignupView(),
                                  ),
                                );
                              },
                              child: const CustomTextWidget(
                                text: "Signup",
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

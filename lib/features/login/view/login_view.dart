import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/widgets/custom_button_widget.dart';
import 'package:news_app/core/widgets/custom_text_form_field.dart';
import 'package:news_app/core/widgets/custom_text_widget.dart';
import 'package:news_app/features/login/view_model/cubit/login_cubit.dart';
import 'package:news_app/features/signup/views/signup_view.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          log(state.toString());
        },
        builder: (context, state) {
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    spacing: 10.h,
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextWidget(
                        text: "Login",
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                      ),
                      CustomTextWidget(
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
                        obscureText: LoginCubit.get(context).isPassword,
                        controller: passwordController,
                        suffixIcon:
                            LoginCubit.get(context).isPassword
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                        suffixOnPressed: () {
                          LoginCubit.get(context).changePasswordVisibility();
                        },
                      ),

                      SizedBox(
                        width: double.infinity,
                        child: CustomButtonWidget(
                          text: "Login",
                          onPressed: () {
                            log(emailController.text);
                            log(passwordController.text);
                          },
                        ),
                      ),

                      Divider(color: Colors.black, thickness: 1, height: 60),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomTextWidget(
                            text: "Or login with",
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                          TextButton(
                            onPressed: () {},
                            child: CustomTextWidget(
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
                          CustomTextWidget(
                            text: "Don't have an account?",
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SignupView(),
                                ),
                              );
                            },
                            child: CustomTextWidget(
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
          );
        },
      ),
    );
  }
}

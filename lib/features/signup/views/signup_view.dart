import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/widgets/custom_text_widget.dart';
import 'package:news_app/features/login/view/login_view.dart';
import 'package:news_app/features/signup/view_model/cubit/signup_cubit.dart';

import '../../../core/widgets/custom_button_widget.dart';
import '../../../core/widgets/custom_text_form_field.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController confirmPasswordController = TextEditingController();
    return BlocProvider(
      create: (context) => SignupCubit(),
      child: BlocConsumer<SignupCubit, SignupState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          SignupCubit signupCubit = SignupCubit.get(context);
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
                        text: "Signup",
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                      ),
                      CustomTextWidget(
                        text: "Create an account",
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
                        obscureText: signupCubit.isPassword,
                        controller: passwordController,
                        suffixIcon:
                            signupCubit.isPassword
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                        suffixOnPressed: () {
                          // signupCubit.changePasswordVisibility();
                        },
                      ),
                      CustomTextFormFieldWidget(
                        hintText: "Confirm Password",
                        prefixIcon: Icons.lock,
                        obscureText: signupCubit.isConfirmPassword,
                        controller: confirmPasswordController,
                        suffixIcon:
                            signupCubit.isConfirmPassword
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                        suffixOnPressed: () {
                          // signupCubit.changeConfirmPasswordVisibility();
                        },
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: CustomButtonWidget(
                          text: "Signup",
                          onPressed: () {},
                        ),
                      ),

                      Divider(color: Colors.black, thickness: 1, height: 60),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomTextWidget(
                            text: "Or signup with",
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
                            text: "Have an account?",
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LoginView(),
                                ),
                              );
                            },
                            child: CustomTextWidget(
                              text: "Login",
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

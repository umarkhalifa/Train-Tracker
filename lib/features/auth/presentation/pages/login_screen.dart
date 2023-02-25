import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:train_tracking/app/styles/app_colors.dart';
import 'package:train_tracking/app/styles/fonts.dart';
import 'package:train_tracking/app/styles/ui_helpers.dart';
import 'package:train_tracking/app/view/form.dart';
import 'package:train_tracking/core/constants/spacing.dart';
import 'package:train_tracking/core/controllers/request_view_model.dart';
import 'package:train_tracking/core/navigators/route_names.dart';
import 'package:train_tracking/core/validation_extensions.dart';
import 'package:train_tracking/features/auth/domain/view_models/login_view_model.dart';

class LoginScreen extends StatefulHookWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SizedBox(
        height: screenHeight(context),
        width: screenWidth(context),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Heading(
                    "Sign In",
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 40.0),
                    child: TextBody(
                      "Please fill up email address and password to log in to your account",
                      color: AppColors.base.withOpacity(0.6),
                      softWrap: true,
                    ),
                  ),
                  gapMedium2,
                  Container(
                    width: screenWidth(context),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 25),
                    decoration: BoxDecoration(
                        color: AppColors.background,
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: TextSemiBold(
                            "Email Address",
                            fontSize: 17,
                          ),
                        ),
                        gapSmall,
                        InputForm(
                          hint: "mrkhan@gmail.com",
                          controller: emailController,
                          validation: context.validateEmailAddress,
                        ),
                        gapMedium2,
                        Align(
                          alignment: Alignment.centerLeft,
                          child: TextSemiBold(
                            "Password",
                            fontSize: 17,
                          ),
                        ),
                        gapSmall,
                        InputForm(
                          hint: "*********",
                          controller: passwordController,
                          validation: context.validateEmailAddress,
                        ),
                        gapSmall,
                      ],
                    ),
                  ),
                  gapMassive,
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextSemiBold(
                      "Forgot Password?",
                      color: AppColors.blue,
                    ),
                  ),
                  gapMedium2,
                  Consumer(
                    builder:
                        (BuildContext context, WidgetRef ref, Widget? child) {
                      final loginView = ref.watch(loginVMProvider);
                      ref.listen(
                        loginVMProvider,
                        (previous, next) {
                          if (next is Error) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  next.error.toString(),
                                ),
                                backgroundColor: AppColors.red,
                              ),
                            );
                          }
                        },
                      );
                      if (loginView is Loading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        return GestureDetector(
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              ref.read(loginVMProvider.notifier).login(
                                    email: emailController.text.trim(),
                                    password: passwordController.text.trim(),
                                  );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Fill all Fields"),
                                  backgroundColor: AppColors.red,
                                ),
                              );
                            }
                          },
                          child: Container(
                            height: 56,
                            width: screenWidth(context),
                            decoration: BoxDecoration(
                                color: AppColors.blue,
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                              child: TextSemiBold(
                                "SIGN IN",
                                color: AppColors.white,
                              ),
                            ),
                          ),
                        );
                      }
                    },
                  ),
                  gapMedium2,
                  gapMedium2,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextSemiBold("Don't have an account? "),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, Routes.signup);
                        },
                        child: TextSemiBold(
                          "Sign up",
                          color: AppColors.blue,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

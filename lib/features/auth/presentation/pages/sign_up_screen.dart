import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:train_tracking/app/styles/app_colors.dart';
import 'package:train_tracking/app/styles/fonts.dart';
import 'package:train_tracking/app/styles/ui_helpers.dart';
import 'package:train_tracking/app/view/form.dart';
import 'package:train_tracking/core/constants/spacing.dart';
import 'package:train_tracking/core/controllers/request_view_model.dart';
import 'package:train_tracking/core/navigators/route_names.dart';
import 'package:train_tracking/core/validation_extensions.dart';
import 'package:train_tracking/features/auth/domain/view_models/login_view_model.dart';
import 'package:train_tracking/features/auth/domain/view_models/signup_vm.dart';

class SignUpScreen extends StatefulHookWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final nameController = useTextEditingController();
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SizedBox(
        height: screenHeight(context),
        width: screenWidth(context),
        child: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    gapMassive,
                    Heading(
                      "Create New Account",
                    ),
                    TextBody(
                      "Please fill up all inputs to create an account",
                      color: AppColors.base.withOpacity(0.6),
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
                              "Full Name",
                              fontSize: 17,
                            ),
                          ),
                          gapSmall,
                          InputForm(
                            hint: "Enter your Full Name",
                            controller: nameController,
                            validation: context.validateFullName,
                          ),
                          gapMedium2,
                          Align(
                            alignment: Alignment.centerLeft,
                            child: TextSemiBold(
                              "Email",
                              fontSize: 17,
                            ),
                          ),
                          gapSmall,
                          InputForm(
                            hint: "Enter your email",
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
                            validation: context.validatePassword,
                          ),
                        ],
                      ),
                    ),
                    gapMedium2,
                    gapMedium2,
                    Consumer(
                      builder:
                          (BuildContext context, WidgetRef ref, Widget? child) {
                        final loginView = ref.watch(signUpVMProvider);
                        ref.listen(
                          signUpVMProvider,
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
                            }else if(next is Success){
                              Navigator.pushNamedAndRemoveUntil(context, Routes.home, (route) => false);
                            }
                          },
                        );
                        if (loginView is Loading) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else {
                          return GestureDetector(
                            onTap: () async{
                              if (_formKey.currentState!.validate()) {
                                await ref.read(signUpVMProvider.notifier).signUp(
                                      email: emailController.text.trim(),
                                      password: passwordController.text.trim(),
                                      name: nameController.text.trim(),
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
                                  "Sign Up",
                                  color: AppColors.white,
                                ),
                              ),
                            ),
                          );
                        }
                      },
                    ),
                    gapMedium2,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextSemiBold("Already have an account? "),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: TextSemiBold(
                            "Sign in",
                            color: AppColors.blue,
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
      ),
    );
  }
}

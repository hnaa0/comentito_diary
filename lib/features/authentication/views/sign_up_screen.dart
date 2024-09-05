import 'package:comentito_diary/constants/theme_colors.dart';
import 'package:comentito_diary/features/authentication/models/field_type.dart';
import 'package:comentito_diary/features/authentication/view_models/auth_view_model.dart';
import 'package:comentito_diary/features/authentication/views/sign_in_screen.dart';
import 'package:comentito_diary/features/authentication/views/widgets/auth_botttom_nav_button.dart';
import 'package:comentito_diary/features/authentication/views/widgets/auth_button.dart';
import 'package:comentito_diary/features/authentication/views/widgets/sign_up_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  static const routeUrl = "/sign-up";
  static const routeName = "sign-up";

  const SignUpScreen({super.key});

  @override
  ConsumerState<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _onSignUpTap() {
    if (_formKey.currentState != null) {
      if (_formKey.currentState!.validate()) {
        ref.read(authProvider.notifier).signUp(
              context: context,
              name: _nameController.text,
              email: _emailController.text,
              password: _passwordController.text,
            );
      }
    }
  }

  void _onBottomNavTap() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const SignInScreen(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: const Color(
          ThemeColors.mintCream,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const Gap(120),
              const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "COMENTITO",
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w100,
                      color: Color(
                        ThemeColors.green,
                      ),
                    ),
                  ),
                  Text(
                    "DIARY",
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w100,
                      color: Color(
                        ThemeColors.green,
                      ),
                    ),
                  ),
                ],
              ),
              const Gap(60),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Text(
                          "회원가입",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Color(
                              ThemeColors.green,
                            ),
                          ),
                        ),
                        const Gap(14),
                        Expanded(
                          child: Container(
                            height: 1.5,
                            color: const Color(ThemeColors.mintGreen),
                          ),
                        ),
                      ],
                    ),
                    const Gap(16),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          SignUpField(
                            controller: _nameController,
                            type: FieldType.name,
                          ),
                          const Gap(16),
                          SignUpField(
                            controller: _emailController,
                            type: FieldType.email,
                          ),
                          const Gap(16),
                          SignUpField(
                            controller: _passwordController,
                            type: FieldType.password,
                          ),
                        ],
                      ),
                    ),
                    const Gap(20),
                    AuthButton(
                      text: "회원가입",
                      buttonFunc: _onSignUpTap,
                    ),
                    const Gap(40),
                  ],
                ),
              )
            ],
          ),
        ),
        bottomNavigationBar: AuthBottomNavButton(
          text: "이미 계정이 있어요",
          onTapFunc: _onBottomNavTap,
        ),
      ),
    );
  }
}

import 'package:comentito_diary/constants/theme_colors.dart';
import 'package:comentito_diary/features/authentication/models/field_type.dart';
import 'package:comentito_diary/features/authentication/view_models/auth_view_model.dart';
import 'package:comentito_diary/features/authentication/views/sign_up_screen.dart';
import 'package:comentito_diary/features/authentication/views/widgets/auth_botttom_nav_button.dart';
import 'package:comentito_diary/features/authentication/views/widgets/auth_button.dart';
import 'package:comentito_diary/features/authentication/views/widgets/sign_in_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

class SignInScreen extends ConsumerStatefulWidget {
  static const routeUrl = "/sign-in";
  static const routeName = "sign-in";

  const SignInScreen({super.key});

  @override
  ConsumerState<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends ConsumerState<SignInScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _onSignInTap() {
    if (ref.watch(authProvider).isLoading) return;

    if (_formKey.currentState != null) {
      if (_formKey.currentState!.validate()) {
        ref.read(authProvider.notifier).signIn(
              context: context,
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
          builder: (context) => const SignUpScreen(),
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
                          "로그인",
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
                          SignInField(
                            controller: _emailController,
                            type: FieldType.email,
                          ),
                          const Gap(16),
                          SignInField(
                            controller: _passwordController,
                            type: FieldType.password,
                          ),
                        ],
                      ),
                    ),
                    const Gap(20),
                    AuthButton(
                      text: "로그인",
                      buttonFunc: _onSignInTap,
                    ),
                    const Gap(40),
                  ],
                ),
              )
            ],
          ),
        ),
        bottomNavigationBar: AuthBottomNavButton(
          text: "새로운 계정이 필요해요",
          onTapFunc: _onBottomNavTap,
        ),
      ),
    );
  }
}

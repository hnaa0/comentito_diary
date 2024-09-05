import 'package:comentito_diary/constants/theme_colors.dart';
import 'package:comentito_diary/features/authentication/view_models/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class AuthButton extends ConsumerWidget {
  const AuthButton({
    super.key,
    required this.text,
    required this.buttonFunc,
  });

  final String text;
  final Function buttonFunc;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () => buttonFunc(),
      child: Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,
        height: 52,
        constraints: const BoxConstraints(
          minHeight: 52,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color(
            ThemeColors.green,
          ),
          boxShadow: const [
            BoxShadow(
              color: Color(
                ThemeColors.grey_300,
              ),
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: ref.watch(authProvider).isLoading
            ? LoadingAnimationWidget.staggeredDotsWave(
                color: const Color(ThemeColors.white), size: 20)
            : Text(
                text,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Color(
                    ThemeColors.white,
                  ),
                ),
              ),
      ),
    );
  }
}

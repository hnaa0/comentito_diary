import 'package:comentito_diary/constants/theme_colors.dart';
import 'package:comentito_diary/features/authentication/models/field_type.dart';
import 'package:flutter/material.dart';

class SignInField extends StatelessWidget {
  const SignInField({
    super.key,
    required this.controller,
    required this.type,
  });

  final TextEditingController controller;
  final FieldType type;

  @override
  Widget build(BuildContext context) {
    bool emailValidCheck(String value) {
      var pattern =
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

      return RegExp(pattern).hasMatch(value);
    }

    return TextFormField(
      obscureText: type == FieldType.password ? true : false,
      controller: controller,
      decoration: InputDecoration(
        isDense: true,
        filled: true,
        fillColor: const Color(
          ThemeColors.white,
        ),
        hintText: type == FieldType.email ? "이메일" : "비밀번호",
        hintStyle: const TextStyle(
          fontSize: 14,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color(
              ThemeColors.mintGreen,
            ),
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color(
              ThemeColors.mintBlue,
            ),
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color(
              ThemeColors.mintGreen,
            ),
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color(
              ThemeColors.mintBlue,
            ),
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 14,
          horizontal: 18,
        ),
      ),
      validator: (value) {
        if (value != null) {
          if (type == FieldType.email && !emailValidCheck(value)) {
            return "유효한 이메일을 입력해주세요.";
          }
        }
        return null;
      },
    );
  }
}

import 'package:comentito_diary/constants/theme_colors.dart';
import 'package:comentito_diary/features/authentication/models/field_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignUpField extends StatefulWidget {
  const SignUpField({
    super.key,
    required this.controller,
    required this.type,
  });

  final TextEditingController controller;
  final FieldType type;

  @override
  State<SignUpField> createState() => _SignUpFieldState();
}

class _SignUpFieldState extends State<SignUpField> {
  bool _isHidden = true;

  void _onEyeTap() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  bool _nameValidCheck(String value) {
    return value.length < 2 || value.length > 11 ? false : true;
  }

  bool _emailValidCheck(String value) {
    var pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    return RegExp(pattern).hasMatch(value);
  }

  bool _passwordValidCheck(String value) {
    return value.length < 8 ? false : true;
  }

  @override
  Widget build(BuildContext context) {
    String hintText;
    switch (widget.type) {
      case FieldType.name:
        hintText = "이름";
        break;
      case FieldType.email:
        hintText = "이메일";
        break;
      case FieldType.password:
        hintText = "비밀번호";
        break;
      default:
        hintText = "";
    }
    return TextFormField(
      controller: widget.controller,
      obscureText:
          _isHidden && widget.type == FieldType.password ? true : false,
      textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
        isDense: true,
        filled: true,
        fillColor: const Color(
          ThemeColors.white,
        ),
        hintText: hintText,
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
        suffixIcon: widget.type == FieldType.password
            ? GestureDetector(
                onTap: _onEyeTap,
                behavior: HitTestBehavior.translucent,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 14,
                  ),
                  child: SizedBox(
                    width: 16,
                    height: 16,
                    child: SvgPicture.asset(
                      _isHidden
                          ? "assets/icons/lock.svg"
                          : "assets/icons/unlock.svg",
                      colorFilter: const ColorFilter.mode(
                        Color(ThemeColors.grey_600),
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),
              )
            : null,
      ),
      validator: (value) {
        if (value != null) {
          switch (widget.type) {
            case FieldType.name:
              if (!_nameValidCheck(value)) {
                return "이름은 2글자 이상, 11글자 미만이어야 합니다.";
              }
            case FieldType.email:
              if (!_emailValidCheck(value)) {
                return "유효한 이메일을 입력해주세요.";
              }
            case FieldType.password:
              if (!_passwordValidCheck(value)) {
                return "비밀번호는 8글자 이상이어야 합니다.";
              }
          }
        }
        return null;
      },
    );
  }
}

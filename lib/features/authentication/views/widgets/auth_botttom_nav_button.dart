import 'package:comentito_diary/constants/theme_colors.dart';
import 'package:flutter/material.dart';

class AuthBottomNavButton extends StatelessWidget {
  const AuthBottomNavButton({
    super.key,
    required this.text,
    required this.onTapFunc,
  });

  final String text;
  final Function onTapFunc;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      height: 60,
      color: Colors.transparent,
      elevation: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () => onTapFunc(),
            child: Text(
              text,
              style: const TextStyle(
                color: Color(
                  ThemeColors.grey_900,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

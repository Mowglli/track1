import 'package:track1/UI/global.dart';
import 'package:track1/src/core/theme/app_theme.dart';
import 'package:track1/src/widget/theme/theme_provider.dart';
import 'package:flutter/material.dart';

class OutlinedTextField extends StatelessWidget {
  const OutlinedTextField({
    Key? key,
    required this.hinText,
    required this.validator,
    required this.leadingIcon,
    required this.textEditingController,
    this.obscureText = false,
  }) : super(key: key);

  final String hinText;
  final FormFieldValidator<String> validator;
  final IconData leadingIcon;
  final TextEditingController textEditingController;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return ThemeProvider(
      builder: (BuildContext context, AppTheme theme) {
        OutlineInputBorder outlineInputBorder = OutlineInputBorder(
          borderSide: BorderSide(color: theme.colorTheme.primaryColor),
          borderRadius: BorderRadius.circular(30),
        );
        return Container(
          padding: const EdgeInsets.only(left: 10, right: 10, bottom: 20),
          child: TextFormField(
            controller: textEditingController,
            validator: validator,
            style: mediumTitleStyleWhite,
            obscureText: obscureText,
            decoration: InputDecoration(
              hintText: hinText,
              hintStyle: setHintStyle.copyWith(
                color: Colors.white.withOpacity(0.5),
              ),
              prefixIcon: Container(
                width: 40,
                child: Icon(
                  leadingIcon,
                  color: theme.colorTheme.primaryColor,
                ),
              ),
              contentPadding: const EdgeInsets.all(10),
              focusedErrorBorder: outlineInputBorder,
              focusedBorder: outlineInputBorder,
              errorBorder: outlineInputBorder,
              enabledBorder: outlineInputBorder,
            ),
          ),
        );
      },
    );
  }
}

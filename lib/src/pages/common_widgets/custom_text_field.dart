import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pregue_a_palavra/src/config/custom_colors.dart';

class CustomTextField extends StatefulWidget {
  final String? labelText;
  final bool isDarkMode;
  final String? hintText;
  final IconData prefixIcon;
  final bool isSecret;
  final TextInputType? textInputType;
  final List<TextInputFormatter>? inputFormatters;
  final Color? backgroundColor;
  final bool removeBorder;
  final String? initialValue;
  final bool isReadMode;
  final String? Function(String?)? validator;
  final TextEditingController? controller;

  const CustomTextField({
    Key? key,
    this.labelText,
    this.isDarkMode = true,
    this.hintText,
    required this.prefixIcon,
    this.isSecret = false,
    this.textInputType,
    this.inputFormatters,
    this.backgroundColor,
    this.removeBorder = false,
    this.initialValue,
    this.isReadMode = false,
    this.validator,
    this.controller,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isObscure = true;
  Color customColorIfDark() =>
      widget.isDarkMode ? CustomColors.backgroundColor : Colors.blue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: TextFormField(
        controller: widget.controller,
        validator: widget.validator,
        readOnly: widget.isReadMode,
        initialValue: widget.initialValue,
        decoration: InputDecoration(
            filled: widget.backgroundColor != null ? true : false,
            fillColor: widget.backgroundColor,
            isDense: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: widget.removeBorder
                  ? BorderSide.none
                  : BorderSide(color: customColorIfDark()),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide(
                color: customColorIfDark(),
                width: 2,
              ),
            ),
            hintText: widget.hintText,
            label: widget.labelText != null
                ? Text(
                    widget.labelText!,
                    style: TextStyle(
                      color: customColorIfDark(),
                    ),
                  )
                : null,
            prefixIcon: Icon(
              widget.prefixIcon,
              color: customColorIfDark(),
            ),
            hintStyle: TextStyle(color: customColorIfDark()),
            suffixIcon: widget.isSecret
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        isObscure ? isObscure = false : isObscure = true;
                      });
                    },
                    icon: Icon(
                        isObscure ? Icons.visibility : Icons.visibility_off),
                    color: customColorIfDark(),
                  )
                : null),
        style: TextStyle(
          color: customColorIfDark(),
        ),
        obscureText: widget.isSecret ? isObscure : false,
        keyboardType: widget.textInputType,
        inputFormatters: widget.inputFormatters,
      ),
    );
  }
}

import 'package:evently/core/resources/ColorManager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomField extends StatefulWidget {
  String? Function(String?) validation;
  TextEditingController controller;
  String hint;
  String prefixPath;
  TextInputType keyboard;
  bool obscure;

  CustomField({
    required this.validation,
    required this.controller,
    required this.hint,
    required this.prefixPath,
    required this.keyboard,
    this.obscure = false,
  });

  @override
  State<CustomField> createState() => _CustomFieldState();
}

class _CustomFieldState extends State<CustomField> {
  late bool isHidden;
  void initState() {
    super.initState();
    isHidden = widget.obscure;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.validation,
      controller: widget.controller,
      style: Theme.of(context).textTheme.titleSmall,
      keyboardType: widget.keyboard,
      obscureText: isHidden,
      decoration: InputDecoration(
        hintStyle: Theme.of(context).textTheme.titleSmall,
        hintText: widget.hint,
        prefixIconConstraints: BoxConstraints(
          minWidth: 24,
          minHeight: 24,
          maxHeight: 80,
          maxWidth: 80,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: ColorManager.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: ColorManager.grey),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: ColorManager.grey),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: ColorManager.grey),
        ),
        prefixIcon: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SvgPicture.asset(
            widget.prefixPath,
            height: 32,
            width: 32,
            colorFilter: ColorFilter.mode(
              Theme.of(context).colorScheme.onPrimaryContainer,
              BlendMode.srcIn,
            ),
          ),
        ),
        suffixIcon:
            widget.obscure
                ? IconButton(
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                  onPressed: () {
                    setState(() {
                      isHidden = !isHidden;
                    });
                  },
                  icon: Icon(
                    isHidden ? Icons.visibility_off : Icons.visibility,
                  ),
                )
                : null,
      ),
    );
  }
}

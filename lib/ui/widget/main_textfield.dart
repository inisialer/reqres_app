import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class MainTextFormField extends StatelessWidget {
  const MainTextFormField(
      {super.key,
      this.hintText,
      this.suffixIcon,
      this.readOnly,
      this.enabled,
      this.onTap,
      this.minLines = 1,
      this.obscureText,
      this.maxLines,
      this.controller,
      this.inputFormatters,
      this.validator,
      this.prefixIcon,
      this.onComplete,
      this.onChanged,
      this.border,
      this.hintStyle,
      this.keyboardType});
  final String? hintText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool? readOnly;
  final bool? enabled;
  final bool? obscureText;
  final int? minLines;
  final void Function()? onTap;
  final int? maxLines;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final void Function()? onComplete;
  final void Function(String)? onChanged;
  final InputBorder? border;
  final TextStyle? hintStyle;
  final TextInputType? keyboardType;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      controller: controller,
      minLines: minLines,
      onEditingComplete: onComplete,
      onChanged: onChanged,
      maxLines: maxLines ?? 5,
      obscureText: obscureText ?? false,
      enabled: enabled,
      onTap: onTap,
      readOnly: readOnly ?? false,
      style: TextStyle(
        color: Colors.grey[800],
      ),
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        errorMaxLines: 1,
        filled: true,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        isDense: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0),
          borderSide: const BorderSide(
            width: 0.50,
            strokeAlign: BorderSide.strokeAlignOutside,
            color: Color(0xFFA0AEBA),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0),
          borderSide: const BorderSide(
            width: 0.50,
            strokeAlign: BorderSide.strokeAlignOutside,
            color: Colors.grey,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0),
          borderSide: const BorderSide(
            width: 0.50,
            strokeAlign: BorderSide.strokeAlignOutside,
            color: Color(0xFFA0AEBA),
          ),
        ),
        hintText: hintText ?? "Masukkan password kamu",
        hintStyle: GoogleFonts.poppins(
          color: const Color(0xFFA0AEBA),
          fontSize: 14,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.01,
        ),
      ),
      validator: validator ??
          (value) {
            if (value == null || value == "") {
              return "This field is required";
            }
            return null;
          },
    );
  }
}

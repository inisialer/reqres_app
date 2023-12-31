import 'package:flutter/material.dart';
import 'package:regres_app/helper/color_helper.dart';

class MainButton extends StatelessWidget {
  const MainButton({
    super.key,
    this.title,
    this.onPressed,
  });
  final String? title;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: baseColor),
          onPressed: onPressed ?? () {},
          child: Text(title ?? 'Login')),
    );
  }
}

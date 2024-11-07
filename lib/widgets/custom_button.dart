import 'package:flutter/material.dart';
import 'package:houzeocontacts/constants/colors.dart';

class LoginButton extends StatelessWidget {
 final String content;
 final void Function()? ontap;
 const LoginButton({
    this.ontap,
    required this.content,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(7)),
        child: Center(
            child: Text(
          content,
          style:const TextStyle(color: AppColors.colorGray, fontWeight: FontWeight.w800),
        )),
      ),
    );
  }
}

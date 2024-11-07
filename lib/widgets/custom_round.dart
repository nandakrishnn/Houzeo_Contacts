import 'package:flutter/material.dart';
import 'package:houzeocontacts/constants/colors.dart';

import '../constants/height_width.dart';

class CustomRoundButton extends StatelessWidget {
  String buttontext;
  IconData icons;
  void Function()? onPressed;
  CustomRoundButton({
    required this.buttontext,
    required this.icons,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            foregroundColor: AppColors.whiteColor,
            backgroundColor: AppColors.colorLightGray,
            shape: const CircleBorder(),
            padding: const EdgeInsets.all(15),
            elevation: 10,
          ),
          child: Icon(
            icons,
            size: 27, // Icon size
            color: AppColors.whiteColor,
          ),
        ),
        AppConstants.kheight10,
        Text(
          buttontext,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}

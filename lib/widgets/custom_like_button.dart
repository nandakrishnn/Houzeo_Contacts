import 'package:flutter/material.dart';
import 'package:houzeocontacts/constants/colors.dart';
import 'package:like_button/like_button.dart';

class CustomLikeButton extends StatelessWidget {
  final bool isFavorited;
  final Future<bool> Function(bool) onLikeButtonTapped;

  CustomLikeButton({
    super.key,
    required this.isFavorited,
    required this.onLikeButtonTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.googleLightGray, // Set the background color to match CustomRoundButton
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      padding: const EdgeInsets.all(14), // Padding for a rounded appearance
      child: LikeButton(
        isLiked: isFavorited,
        circleColor: const CircleColor(
          start: Color(0xff00ddff),
          end: Color(0xff0099cc),
        ),
        bubblesColor: const BubblesColor(
          dotPrimaryColor: Colors.pink,
          dotSecondaryColor: Colors.white,
        ),
        likeBuilder: (bool isLiked) {
          return Icon(
            Icons.favorite,
            color: isLiked ? Colors.red : AppColors.whiteColor, // Match icon color with CustomRoundButton
            size: 27, // Adjust icon size to match
          );
        },
        onTap: onLikeButtonTapped,
      ),
    );
  }
}

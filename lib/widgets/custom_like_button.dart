import 'package:flutter/material.dart';
import 'package:houzeocontacts/constants/height_width.dart';
import 'package:like_button/like_button.dart';
import 'package:houzeocontacts/constants/colors.dart';

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
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: AppColors.googleLightGray, 
            shape: BoxShape.circle, 
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 6,
                offset: Offset(0, 2),
              ),
            ],
          ),
          padding: EdgeInsets.all(13), 
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
                color: isLiked ? Colors.red : AppColors.whiteColor,
                size: 27, 
              );
            },
            onTap: onLikeButtonTapped,
          ),
        ),
     AppConstants.kheight10,
          Text(
            'Favorite',
            style: const TextStyle(
              fontSize: 14,
              color: Colors.white,
            ),
          ),
      ],
    );
  }
}

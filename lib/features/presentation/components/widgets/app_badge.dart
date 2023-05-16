import 'package:badges/badges.dart' as badge;
import 'package:flutter/material.dart';
import 'package:sicpa_news/features/presentation/utils/common.dart';

class AppBadge extends StatelessWidget {
  final String text;
  final Color color;
  final double size;

  const AppBadge({
    super.key,
    required this.text,
    this.color = AppColors.red,
    this.size = 8,
  });

  @override
  Widget build(BuildContext context) {
    return badge.Badge(
      elevation: 0.0,
      toAnimate: false,
      shape: badge.BadgeShape.square,
      badgeColor: color,
      borderRadius: BorderRadius.circular(13),
      badgeContent: Text(
        text,
        style: TextStyle(
          color: AppColors.white,
          fontWeight: FontWeight.w600,
          fontSize: size,
        ),
      ),
    );
  }
}

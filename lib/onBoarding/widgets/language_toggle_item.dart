import 'package:event_app/utils/app_colors.dart';
import 'package:flutter/material.dart';

class LanguageToggleItem extends StatelessWidget {
  const LanguageToggleItem({
    super.key,
    required this.image,
    required this.isSelected,
    required this.onTap,
  });

  final String image;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical:6,horizontal: 10),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryLight
              : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Image.asset(
          image,
        width: 24,
          height: 24,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
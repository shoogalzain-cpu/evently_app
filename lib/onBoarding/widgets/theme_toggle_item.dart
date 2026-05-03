import 'package:event_app/utils/app_colors.dart';
import 'package:flutter/material.dart';

class ThemeToggleItem extends StatelessWidget {
  const ThemeToggleItem({
    super.key,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 6,horizontal: 10),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryLight
              : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Icon(
          icon,
          color: isSelected ? Colors.white : Colors.black,
        ),
      ),
    );
  }
}
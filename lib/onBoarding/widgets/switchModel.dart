import 'package:flutter/material.dart';
import 'package:animated_toggle_switch/animated_toggle_switch.dart';

class AppAnimatedToggle extends StatelessWidget {
  final int currentIndex;
  final Function(int index) onChanged;
  final List<Widget> icons;

  const AppAnimatedToggle({
    super.key,
    required this.currentIndex,
    required this.onChanged,
    required this.icons,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedToggleSwitch<int>.rolling(
      current: currentIndex,
      values: List.generate(icons.length, (index) => index),
      onChanged: onChanged,
      iconBuilder: (value, _) {
        return icons[value];
        },
      borderWidth: 2,
      indicatorSize: const Size(40, 40),
    );
  }
}
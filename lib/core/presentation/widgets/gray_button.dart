import 'package:flutter/material.dart';

class GrayButton extends StatelessWidget {
  final String title;
  final GestureTapCallback onTap;
  final double width;
  final double height;

  const GrayButton({
    super.key,
    required this.title,
    required this.onTap,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        constraints: BoxConstraints(minHeight: height, minWidth: width),
        decoration: ShapeDecoration(
          color: Theme.of(context).colorScheme.onTertiaryContainer,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(
          textAlign: TextAlign.center,
          title,
          style: Theme.of(context).textTheme.bodyLarge!,
        ),
      ),
    );
  }
}

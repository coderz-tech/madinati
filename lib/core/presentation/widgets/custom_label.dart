import 'package:flutter/material.dart';

class CustomLabel extends StatelessWidget {
  final String label;
  final String content;
  final double screenWidth;
  final double screenHeight;
  final TextDirection? textDirection;

  const CustomLabel({
    super.key,
    required this.label,
    required this.content,
    required this.screenHeight,
    required this.screenWidth,
    this.textDirection,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.displaySmall,
        ),
        SizedBox(
          width: screenWidth,
          height: screenHeight * 0.00428265524,
        ),
        Container(
          width: screenWidth,
          height: screenHeight * 0.05995717344,
          alignment: AlignmentDirectional.centerStart,
          padding: EdgeInsetsDirectional.only(
            start: screenWidth * 0.0600858369,
          ),
          decoration: BoxDecoration(
            color: const Color(0x337E7F83),
            border: Border.all(
              width: 1,
              color: Theme.of(context).colorScheme.secondaryContainer,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            content,
            textDirection: textDirection,
            style: Theme.of(context).textTheme.displayMedium,
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

class DisabledButton extends StatelessWidget {
  final String title;

  final double width;
  final double height;

  const DisabledButton({
    super.key,
    required this.title,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.50,
      child: Container(
        alignment: Alignment.center,
        constraints: BoxConstraints(minHeight: height, minWidth: width),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Theme.of(context).primaryColor,
              Theme.of(context).primaryColorLight,
            ],
          ),
        ),
        child: Text(
          textAlign: TextAlign.center,
          title,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Colors.white,
              ),
        ),
      ),
    );
  }
}

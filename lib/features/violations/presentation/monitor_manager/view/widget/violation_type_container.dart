import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:madinati/core/utils/responsive.dart';

class ViolationTypeContainer extends StatelessWidget {
  final String label;
  final String svg;
  final VoidCallback? onPressed;

  const ViolationTypeContainer({
    super.key,
    required this.label,
    required this.svg,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: responsiveWidth(context, 166),
        height: responsiveHeight(context, 132),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onPrimaryContainer,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              svg,
              color: Theme.of(context).colorScheme.onSecondary,
            ),
            Center(
              child: Text(
                label,
                style: Theme.of(context).textTheme.titleSmall,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

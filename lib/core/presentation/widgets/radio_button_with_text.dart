import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RadioButtonWidget extends StatelessWidget {
  bool isSelected;
  String name;
  GestureTapCallback? onTap;
  late Size size;

  RadioButtonWidget({
    super.key,
    required this.isSelected,
    required this.name,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return InkWell(
      onTap: onTap,
      child: Container(
        width: size.width,
        height: size.height * 0.0601,
        padding: const EdgeInsets.only(left: 20, right: 16),
        decoration: ShapeDecoration(
          // color: Theme.of(context).colorScheme.surfaceTint,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: isSelected ? 3 : 1,
              color: isSelected
                  ? Theme.of(context).colorScheme.primary
                  : const Color(0xFF80808D),
            ),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              name,
              textAlign: TextAlign.right,
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                fontSize: 16.sp
              ),
            ),
            const Spacer(),
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Theme.of(context).colorScheme.primary,
                  width: isSelected ? 7.5 : 1,
                ),
                borderRadius: BorderRadius.circular(500),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

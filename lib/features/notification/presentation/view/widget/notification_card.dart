import 'package:flutter/material.dart';

import '../../../../../core/utils/responsive.dart';

class NotificationCard extends StatelessWidget {
  final bool status;

  const NotificationCard({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: responsiveHeight(context, 122),
      width: responsiveWidth(context, 381),
      decoration: BoxDecoration(
        color: status
            ? Theme.of(
                context,
              ).colorScheme.onPrimaryContainer.withValues(alpha: 0.05)
            : Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: EdgeInsetsGeometry.symmetric(
          horizontal: responsiveWidth(context, 15),
          vertical: responsiveHeight(context, 16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "اسم التنبيه",
                  style: Theme.of(
                    context,
                  ).textTheme.labelLarge!.copyWith(fontSize: 12),
                ),
                Text(
                  "مقروء",
                  style: Theme.of(
                    context,
                  ).textTheme.labelLarge!.copyWith(fontSize: 12),
                ),
              ],
            ),
            Text(
              "اسم المركبة و رقمها",
              style: Theme.of(
                context,
              ).textTheme.headlineLarge!.copyWith(fontSize: 14),
            ),
            Expanded(
              child: Text(
                "وصف التنبيه (هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ)",
                style: Theme.of(
                  context,
                ).textTheme.headlineLarge!.copyWith(fontSize: 14),
              ),
            ),
            Text("2024/10/12 1:12 PM",style: Theme.of(
              context,
            ).textTheme.labelLarge!.copyWith(fontSize: 12))
          ],
        ),
      ),
    );
  }
}

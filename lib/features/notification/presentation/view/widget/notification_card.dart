import 'package:flutter/material.dart';
import 'package:madinati/l10n/app_localizations.dart';

import '../../../../../core/utils/responsive.dart';

class NotificationCard extends StatelessWidget {
  final bool status;

  const NotificationCard({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: responsiveWidth(context, 381),
      decoration: BoxDecoration(
        color: status
            ? Colors.white
            : Theme.of(
                context,
              ).colorScheme.onPrimaryContainer.withValues(alpha: 0.35),
        borderRadius: BorderRadius.circular(12),
        border: status
            ? Border.all(
                color: Theme.of(context).colorScheme.inverseSurface,
                width: 0.5,
              )
            : null, //Border.all(color: )
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
                  status
                      ? AppLocalizations.of(context)!.read
                      : AppLocalizations.of(context)!.unread,
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    fontSize: 12,
                    color: status
                        ? Theme.of(context).colorScheme.inverseSurface
                        : Theme.of(context).colorScheme.error,
                  ),
                ),
              ],
            ),
            Text(
              "اسم المركبة و رقمها",
              style: Theme.of(
                context,
              ).textTheme.headlineLarge!.copyWith(fontSize: 14),
            ),
            Text(
              "وصف التنبيه (هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ)",
              style: Theme.of(
                context,
              ).textTheme.headlineLarge!.copyWith(fontSize: 14),
            ),
            Text(
              "2024/10/12 1:12 PM",
              style: Theme.of(
                context,
              ).textTheme.labelLarge!.copyWith(fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}

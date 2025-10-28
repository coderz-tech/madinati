
import 'package:madinati/features/notification/domain/entity/notification_entity.dart';

class DriverNotificationModel extends NotificationEntity {
  DriverNotificationModel({
    super.title,
    super.body,
    super.code,
    super.createdOn,
    super.subTitle,
    super.isRead,
  });

  factory DriverNotificationModel.fromJson({
    required Map<dynamic, dynamic> json,
  }) {
    return DriverNotificationModel(
      title: json['title'],
      code: json['code'],
      subTitle: json['subTitle'],
      body: json['body'],
      isRead: json['isRead'] ?? false,
      createdOn: json['createdOn'],
    );
  }
}

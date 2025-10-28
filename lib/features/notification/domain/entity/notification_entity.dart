class NotificationEntity {
  String? code;
  String? title;
  String? subTitle;
  String? body;
  bool? isRead;
  String? createdOn;

  NotificationEntity({
    this.title,
    this.isRead,
    this.body,
    this.code,
    this.createdOn,
    this.subTitle,
  });
}

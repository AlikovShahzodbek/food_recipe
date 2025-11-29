class NotificationsCardModel {
  NotificationsCardModel({
    required this.type,
    required this.mealId,
    this.id,
    required this.title,
    required this.subtitle,
    required this.isRead,
    required this.createdAt,
  });

  final String type;
  final int? id;
  final int? mealId;
  final String title;
  final String subtitle;
  final bool isRead;
  final DateTime createdAt;

  Map<String, dynamic> toMap() {
    return {
      if (id != null) 'id': id,
      'title': title,
      'subtitle': subtitle,
      'isRead': isRead ? 1 : 0,
      'createdAt': createdAt.toIso8601String(),
      'type': type,
      'mealId': mealId,
    };
  }

  static NotificationsCardModel fromMap(Map<String, dynamic> map) {
    return NotificationsCardModel(
      mealId: map['mealId'],
      type: map['type'],
      id: map['id'],
      title: map['title'] ?? '',
      subtitle: map['subtitle'] ?? '',
      isRead: map['isRead'] == 1,
      createdAt: DateTime.parse(map['createdAt']),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:practick_project/db/models/notifications_card_model.dart';
import 'package:practick_project/db/repositorys/notifications_card_repository.dart';

class NotificationsCardController extends ChangeNotifier {
  static final NotificationsCardController instance =
      NotificationsCardController._internal();
  NotificationsCardController._internal();

  List<NotificationsCardModel> notifications = [];

  Future<void> load() async {
    notifications = await NotificationsCardRepository.getDatabase();
    notifyListeners();
  }

  Future<void> add(NotificationsCardModel notification) async {
    await NotificationsCardRepository.addNotification(notification);
    await load();
  }
}

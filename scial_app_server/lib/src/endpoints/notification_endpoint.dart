import 'package:scial_app_server/src/handlers/notification_handler.dart';
import 'package:scial_app_server/src/generated/notification/response/notification_read_response.dart';
import 'package:scial_app_server/src/generated/notification/response/notification_set_all_read_response.dart';
import 'package:scial_app_server/src/generated/notification/response/notification_set_read_response.dart';
import 'package:serverpod/serverpod.dart';

class NotificationEndpoint extends Endpoint {

  Future<NotificationReadResponse> read(Session session) async {
    return await NotificationHandler.read(session);
  }

  Future<NotificationSetReadResponse> setRead(Session session, int notificationId) async {
    return await NotificationHandler.setRead(session, notificationId);
  }

  Future<NotificationSetAllReadResponse> setAllRead(Session session) async {
    return await NotificationHandler.setAllRead(session);
  }
}
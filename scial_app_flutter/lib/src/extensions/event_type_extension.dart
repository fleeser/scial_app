import 'package:scial_app_client/scial_app_client.dart';

extension EventTypeExtension on EventType {

  String get emoji {
    switch (this) {
      case EventType.party: return '🎉';
      case EventType.gaming: return '🕹️';
      case EventType.sports: return '⚽';
      case EventType.netflixAndChill: return '📺';
      case EventType.other: return '❓';
    }
  }
}
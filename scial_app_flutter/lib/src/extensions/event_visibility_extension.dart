import 'package:scial_app_client/scial_app_client.dart';

extension EventVisibilityExtension on EventVisibility {

  String get emoji {
    switch (this) {
      case EventVisibility.public: return '🔓';
      case EventVisibility.protected: return '🔐';
      case EventVisibility.private: return '🔒';
    }
  }
}
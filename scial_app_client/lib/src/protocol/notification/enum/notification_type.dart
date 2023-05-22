/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

enum NotificationType with _i1.SerializableEntity {
  friendRequestCreated,
  friendRequestAccepted,
  friendRequestDenied,
  eventGuestInvitationCreated,
  eventGuestInvitationAccepted,
  eventGuestInvitationDenied,
  eventGuestRequestCreated,
  eventGuestRequestAccepted,
  eventGuestRequestDenied,
  eventGuestSuggestionCreated,
  eventGuestSuggestionAccepted,
  eventGuestSuggestionDenied,
  eventHostInvitationCreated,
  eventHostInvitationAccepted,
  eventHostInvitationDenied,
  eventHostRequestCreated,
  eventHostRequestAccepted,
  eventHostRequestDenied,
  eventHostSuggestionCreated,
  eventHostSuggestionAccepted,
  eventHostSuggestionDenied;

  static NotificationType? fromJson(int index) {
    switch (index) {
      case 0:
        return friendRequestCreated;
      case 1:
        return friendRequestAccepted;
      case 2:
        return friendRequestDenied;
      case 3:
        return eventGuestInvitationCreated;
      case 4:
        return eventGuestInvitationAccepted;
      case 5:
        return eventGuestInvitationDenied;
      case 6:
        return eventGuestRequestCreated;
      case 7:
        return eventGuestRequestAccepted;
      case 8:
        return eventGuestRequestDenied;
      case 9:
        return eventGuestSuggestionCreated;
      case 10:
        return eventGuestSuggestionAccepted;
      case 11:
        return eventGuestSuggestionDenied;
      case 12:
        return eventHostInvitationCreated;
      case 13:
        return eventHostInvitationAccepted;
      case 14:
        return eventHostInvitationDenied;
      case 15:
        return eventHostRequestCreated;
      case 16:
        return eventHostRequestAccepted;
      case 17:
        return eventHostRequestDenied;
      case 18:
        return eventHostSuggestionCreated;
      case 19:
        return eventHostSuggestionAccepted;
      case 20:
        return eventHostSuggestionDenied;
      default:
        return null;
    }
  }

  @override
  int toJson() => index;
}

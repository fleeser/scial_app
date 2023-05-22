/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

library protocol; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:serverpod/serverpod.dart' as _i1;
import 'auth/response/auth_change_password_response.dart' as _i2;
import 'auth/response/auth_change_password_response_code.dart' as _i3;
import 'auth/response/auth_delete_account_response.dart' as _i4;
import 'auth/response/auth_delete_account_response_code.dart' as _i5;
import 'auth/response/auth_forgot_password_response.dart' as _i6;
import 'auth/response/auth_forgot_password_response_code.dart' as _i7;
import 'auth/response/auth_forgot_password_submission_response.dart' as _i8;
import 'auth/response/auth_forgot_password_submission_response_code.dart'
    as _i9;
import 'auth/response/auth_forgot_password_verification_response.dart' as _i10;
import 'auth/response/auth_forgot_password_verification_response_code.dart'
    as _i11;
import 'auth/response/auth_sign_in_response.dart' as _i12;
import 'auth/response/auth_sign_in_response_code.dart' as _i13;
import 'auth/response/auth_sign_up_response.dart' as _i14;
import 'auth/response/auth_sign_up_response_code.dart' as _i15;
import 'auth/response/auth_sign_up_verification_response.dart' as _i16;
import 'auth/response/auth_sign_up_verification_response_code.dart' as _i17;
import 'auth/table/auth_email.dart' as _i18;
import 'auth/table/auth_forgot_password_request.dart' as _i19;
import 'auth/table/auth_sign_up_request.dart' as _i20;
import 'counter/table/counter.dart' as _i21;
import 'discover/response/discover_read_response.dart' as _i22;
import 'discover/response/discover_read_response_code.dart' as _i23;
import 'event/enum/event_invitation_status.dart' as _i24;
import 'event/enum/event_request_status.dart' as _i25;
import 'event/enum/event_type.dart' as _i26;
import 'event/enum/event_visibility.dart' as _i27;
import 'event/model/public_event.dart' as _i28;
import 'event/model/public_event_full_guest.dart' as _i29;
import 'event/model/public_event_full_guest_user.dart' as _i30;
import 'event/model/public_event_host.dart' as _i31;
import 'event/model/public_event_location.dart' as _i32;
import 'event/response/event_guests_response.dart' as _i33;
import 'event/response/event_guests_response_code.dart' as _i34;
import 'event/table/event.dart' as _i35;
import 'event/table/event_guest.dart' as _i36;
import 'event/table/event_guest_suggestion.dart' as _i37;
import 'event/table/event_invitation.dart' as _i38;
import 'event/table/event_request.dart' as _i39;
import 'friend_request/enum/friend_request_status.dart' as _i40;
import 'friend_request/response/friend_request_answer_response.dart' as _i41;
import 'friend_request/response/friend_request_answer_response_code.dart'
    as _i42;
import 'friend_request/response/friend_request_create_response.dart' as _i43;
import 'friend_request/response/friend_request_create_response_code.dart'
    as _i44;
import 'friend_request/response/friend_request_take_back_response.dart' as _i45;
import 'friend_request/response/friend_request_take_back_response_code.dart'
    as _i46;
import 'friend_request/table/friend_request.dart' as _i47;
import 'friendship/enum/friendship_badge.dart' as _i48;
import 'friendship/response/friendship_remove_response.dart' as _i49;
import 'friendship/response/friendship_remove_response_code.dart' as _i50;
import 'friendship/table/friendship.dart' as _i51;
import 'notification/enum/notification_type.dart' as _i52;
import 'notification/model/friend_request_accepted/public_notification_friend_request_accepted.dart'
    as _i53;
import 'notification/model/friend_request_accepted/public_notification_friend_request_accepted_sender.dart'
    as _i54;
import 'notification/model/friend_request_created/public_notification_friend_request_created.dart'
    as _i55;
import 'notification/model/friend_request_created/public_notification_friend_request_created_friend_request.dart'
    as _i56;
import 'notification/model/friend_request_created/public_notification_friend_request_created_friend_request_sender.dart'
    as _i57;
import 'notification/model/friend_request_denied/public_notification_friend_request_denied.dart'
    as _i58;
import 'notification/model/friend_request_denied/public_notification_friend_request_denied_sender.dart'
    as _i59;
import 'notification/model/public_notification.dart' as _i60;
import 'notification/response/notification_read_response.dart' as _i61;
import 'notification/response/notification_read_response_code.dart' as _i62;
import 'notification/response/notification_set_all_read_response.dart' as _i63;
import 'notification/response/notification_set_all_read_response_code.dart'
    as _i64;
import 'notification/response/notification_set_read_response.dart' as _i65;
import 'notification/response/notification_set_read_response_code.dart' as _i66;
import 'notification/table/notification.dart' as _i67;
import 'rating/enum/rating_type.dart' as _i68;
import 'rating/table/rating.dart' as _i69;
import 'user/enum/user_badge.dart' as _i70;
import 'user/model/public_user.dart' as _i71;
import 'user/model/public_user_friend_request.dart' as _i72;
import 'user/model/public_user_friendship.dart' as _i73;
import 'user/model/public_user_friendship_details.dart' as _i74;
import 'user/model/public_user_friendship_user.dart' as _i75;
import 'user/model/public_user_rating.dart' as _i76;
import 'user/model/public_user_rating_user.dart' as _i77;
import 'user/response/user_events_reponse_code.dart' as _i78;
import 'user/response/user_events_response.dart' as _i79;
import 'user/response/user_friendships_response.dart' as _i80;
import 'user/response/user_friendships_response_code.dart' as _i81;
import 'user/response/user_ratings_response.dart' as _i82;
import 'user/response/user_ratings_response_code.dart' as _i83;
import 'user/response/user_read_response.dart' as _i84;
import 'user/response/user_read_response_code.dart' as _i85;
import 'user/response/user_update_response.dart' as _i86;
import 'user/response/user_update_response_code.dart' as _i87;
import 'user/table/user.dart' as _i88;
import 'protocol.dart' as _i89;
import 'package:scial_app_server/src/generated/event/enum/event_type.dart'
    as _i90;
import 'package:scial_app_server/src/generated/event/enum/event_visibility.dart'
    as _i91;
import 'package:serverpod/protocol.dart' as _i92;
export 'auth/response/auth_change_password_response.dart';
export 'auth/response/auth_change_password_response_code.dart';
export 'auth/response/auth_delete_account_response.dart';
export 'auth/response/auth_delete_account_response_code.dart';
export 'auth/response/auth_forgot_password_response.dart';
export 'auth/response/auth_forgot_password_response_code.dart';
export 'auth/response/auth_forgot_password_submission_response.dart';
export 'auth/response/auth_forgot_password_submission_response_code.dart';
export 'auth/response/auth_forgot_password_verification_response.dart';
export 'auth/response/auth_forgot_password_verification_response_code.dart';
export 'auth/response/auth_sign_in_response.dart';
export 'auth/response/auth_sign_in_response_code.dart';
export 'auth/response/auth_sign_up_response.dart';
export 'auth/response/auth_sign_up_response_code.dart';
export 'auth/response/auth_sign_up_verification_response.dart';
export 'auth/response/auth_sign_up_verification_response_code.dart';
export 'auth/table/auth_email.dart';
export 'auth/table/auth_forgot_password_request.dart';
export 'auth/table/auth_sign_up_request.dart';
export 'counter/table/counter.dart';
export 'discover/response/discover_read_response.dart';
export 'discover/response/discover_read_response_code.dart';
export 'event/enum/event_invitation_status.dart';
export 'event/enum/event_request_status.dart';
export 'event/enum/event_type.dart';
export 'event/enum/event_visibility.dart';
export 'event/model/public_event.dart';
export 'event/model/public_event_full_guest.dart';
export 'event/model/public_event_full_guest_user.dart';
export 'event/model/public_event_host.dart';
export 'event/model/public_event_location.dart';
export 'event/response/event_guests_response.dart';
export 'event/response/event_guests_response_code.dart';
export 'event/table/event.dart';
export 'event/table/event_guest.dart';
export 'event/table/event_guest_suggestion.dart';
export 'event/table/event_invitation.dart';
export 'event/table/event_request.dart';
export 'friend_request/enum/friend_request_status.dart';
export 'friend_request/response/friend_request_answer_response.dart';
export 'friend_request/response/friend_request_answer_response_code.dart';
export 'friend_request/response/friend_request_create_response.dart';
export 'friend_request/response/friend_request_create_response_code.dart';
export 'friend_request/response/friend_request_take_back_response.dart';
export 'friend_request/response/friend_request_take_back_response_code.dart';
export 'friend_request/table/friend_request.dart';
export 'friendship/enum/friendship_badge.dart';
export 'friendship/response/friendship_remove_response.dart';
export 'friendship/response/friendship_remove_response_code.dart';
export 'friendship/table/friendship.dart';
export 'notification/enum/notification_type.dart';
export 'notification/model/friend_request_accepted/public_notification_friend_request_accepted.dart';
export 'notification/model/friend_request_accepted/public_notification_friend_request_accepted_sender.dart';
export 'notification/model/friend_request_created/public_notification_friend_request_created.dart';
export 'notification/model/friend_request_created/public_notification_friend_request_created_friend_request.dart';
export 'notification/model/friend_request_created/public_notification_friend_request_created_friend_request_sender.dart';
export 'notification/model/friend_request_denied/public_notification_friend_request_denied.dart';
export 'notification/model/friend_request_denied/public_notification_friend_request_denied_sender.dart';
export 'notification/model/public_notification.dart';
export 'notification/response/notification_read_response.dart';
export 'notification/response/notification_read_response_code.dart';
export 'notification/response/notification_set_all_read_response.dart';
export 'notification/response/notification_set_all_read_response_code.dart';
export 'notification/response/notification_set_read_response.dart';
export 'notification/response/notification_set_read_response_code.dart';
export 'notification/table/notification.dart';
export 'rating/enum/rating_type.dart';
export 'rating/table/rating.dart';
export 'user/enum/user_badge.dart';
export 'user/model/public_user.dart';
export 'user/model/public_user_friend_request.dart';
export 'user/model/public_user_friendship.dart';
export 'user/model/public_user_friendship_details.dart';
export 'user/model/public_user_friendship_user.dart';
export 'user/model/public_user_rating.dart';
export 'user/model/public_user_rating_user.dart';
export 'user/response/user_events_reponse_code.dart';
export 'user/response/user_events_response.dart';
export 'user/response/user_friendships_response.dart';
export 'user/response/user_friendships_response_code.dart';
export 'user/response/user_ratings_response.dart';
export 'user/response/user_ratings_response_code.dart';
export 'user/response/user_read_response.dart';
export 'user/response/user_read_response_code.dart';
export 'user/response/user_update_response.dart';
export 'user/response/user_update_response_code.dart';
export 'user/table/user.dart'; // ignore_for_file: equal_keys_in_map

class Protocol extends _i1.SerializationManagerServer {
  Protocol._();

  factory Protocol() => _instance;

  static final Map<Type, _i1.constructor> customConstructors = {};

  static final Protocol _instance = Protocol._();

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    if (customConstructors.containsKey(t)) {
      return customConstructors[t]!(data, this) as T;
    }
    if (t == _i2.AuthChangePasswordResponse) {
      return _i2.AuthChangePasswordResponse.fromJson(data, this) as T;
    }
    if (t == _i3.AuthChangePasswordResponseCode) {
      return _i3.AuthChangePasswordResponseCode.fromJson(data) as T;
    }
    if (t == _i4.AuthDeleteAccountResponse) {
      return _i4.AuthDeleteAccountResponse.fromJson(data, this) as T;
    }
    if (t == _i5.AuthDeleteAccountResponseCode) {
      return _i5.AuthDeleteAccountResponseCode.fromJson(data) as T;
    }
    if (t == _i6.AuthForgotPasswordResponse) {
      return _i6.AuthForgotPasswordResponse.fromJson(data, this) as T;
    }
    if (t == _i7.AuthForgotPasswordResponseCode) {
      return _i7.AuthForgotPasswordResponseCode.fromJson(data) as T;
    }
    if (t == _i8.AuthForgotPasswordSubmissionResponse) {
      return _i8.AuthForgotPasswordSubmissionResponse.fromJson(data, this) as T;
    }
    if (t == _i9.AuthForgotPasswordSubmissionResponseCode) {
      return _i9.AuthForgotPasswordSubmissionResponseCode.fromJson(data) as T;
    }
    if (t == _i10.AuthForgotPasswordVerificationResponse) {
      return _i10.AuthForgotPasswordVerificationResponse.fromJson(data, this)
          as T;
    }
    if (t == _i11.AuthForgotPasswordVerificationResponseCode) {
      return _i11.AuthForgotPasswordVerificationResponseCode.fromJson(data)
          as T;
    }
    if (t == _i12.AuthSignInResponse) {
      return _i12.AuthSignInResponse.fromJson(data, this) as T;
    }
    if (t == _i13.AuthSignInResponseCode) {
      return _i13.AuthSignInResponseCode.fromJson(data) as T;
    }
    if (t == _i14.AuthSignUpResponse) {
      return _i14.AuthSignUpResponse.fromJson(data, this) as T;
    }
    if (t == _i15.AuthSignUpResponseCode) {
      return _i15.AuthSignUpResponseCode.fromJson(data) as T;
    }
    if (t == _i16.AuthSignUpVerificationResponse) {
      return _i16.AuthSignUpVerificationResponse.fromJson(data, this) as T;
    }
    if (t == _i17.AuthSignUpVerificationResponseCode) {
      return _i17.AuthSignUpVerificationResponseCode.fromJson(data) as T;
    }
    if (t == _i18.AuthEmail) {
      return _i18.AuthEmail.fromJson(data, this) as T;
    }
    if (t == _i19.AuthForgotPasswordRequest) {
      return _i19.AuthForgotPasswordRequest.fromJson(data, this) as T;
    }
    if (t == _i20.AuthSignUpRequest) {
      return _i20.AuthSignUpRequest.fromJson(data, this) as T;
    }
    if (t == _i21.Counter) {
      return _i21.Counter.fromJson(data, this) as T;
    }
    if (t == _i22.DiscoverReadResponse) {
      return _i22.DiscoverReadResponse.fromJson(data, this) as T;
    }
    if (t == _i23.DiscoverReadResponseCode) {
      return _i23.DiscoverReadResponseCode.fromJson(data) as T;
    }
    if (t == _i24.EventInvitationStatus) {
      return _i24.EventInvitationStatus.fromJson(data) as T;
    }
    if (t == _i25.EventRequestStatus) {
      return _i25.EventRequestStatus.fromJson(data) as T;
    }
    if (t == _i26.EventType) {
      return _i26.EventType.fromJson(data) as T;
    }
    if (t == _i27.EventVisibility) {
      return _i27.EventVisibility.fromJson(data) as T;
    }
    if (t == _i28.PublicEvent) {
      return _i28.PublicEvent.fromJson(data, this) as T;
    }
    if (t == _i29.PublicEventFullGuest) {
      return _i29.PublicEventFullGuest.fromJson(data, this) as T;
    }
    if (t == _i30.PublicEventFullGuestUser) {
      return _i30.PublicEventFullGuestUser.fromJson(data, this) as T;
    }
    if (t == _i31.PublicEventHost) {
      return _i31.PublicEventHost.fromJson(data, this) as T;
    }
    if (t == _i32.PublicEventLocation) {
      return _i32.PublicEventLocation.fromJson(data, this) as T;
    }
    if (t == _i33.EventGuestsResponse) {
      return _i33.EventGuestsResponse.fromJson(data, this) as T;
    }
    if (t == _i34.EventGuestsResponseCode) {
      return _i34.EventGuestsResponseCode.fromJson(data) as T;
    }
    if (t == _i35.Event) {
      return _i35.Event.fromJson(data, this) as T;
    }
    if (t == _i36.EventGuest) {
      return _i36.EventGuest.fromJson(data, this) as T;
    }
    if (t == _i37.EventGuestSuggestion) {
      return _i37.EventGuestSuggestion.fromJson(data, this) as T;
    }
    if (t == _i38.EventInvitation) {
      return _i38.EventInvitation.fromJson(data, this) as T;
    }
    if (t == _i39.EventRequest) {
      return _i39.EventRequest.fromJson(data, this) as T;
    }
    if (t == _i40.FriendRequestStatus) {
      return _i40.FriendRequestStatus.fromJson(data) as T;
    }
    if (t == _i41.FriendRequestAnswerResponse) {
      return _i41.FriendRequestAnswerResponse.fromJson(data, this) as T;
    }
    if (t == _i42.FriendRequestAnswerResponseCode) {
      return _i42.FriendRequestAnswerResponseCode.fromJson(data) as T;
    }
    if (t == _i43.FriendRequestCreateResponse) {
      return _i43.FriendRequestCreateResponse.fromJson(data, this) as T;
    }
    if (t == _i44.FriendRequestCreateResponseCode) {
      return _i44.FriendRequestCreateResponseCode.fromJson(data) as T;
    }
    if (t == _i45.FriendRequestTakeBackResponse) {
      return _i45.FriendRequestTakeBackResponse.fromJson(data, this) as T;
    }
    if (t == _i46.FriendRequestTakeBackResponseCode) {
      return _i46.FriendRequestTakeBackResponseCode.fromJson(data) as T;
    }
    if (t == _i47.FriendRequest) {
      return _i47.FriendRequest.fromJson(data, this) as T;
    }
    if (t == _i48.FriendshipBadge) {
      return _i48.FriendshipBadge.fromJson(data) as T;
    }
    if (t == _i49.FriendshipRemoveResponse) {
      return _i49.FriendshipRemoveResponse.fromJson(data, this) as T;
    }
    if (t == _i50.FriendshipRemoveResponseCode) {
      return _i50.FriendshipRemoveResponseCode.fromJson(data) as T;
    }
    if (t == _i51.Friendship) {
      return _i51.Friendship.fromJson(data, this) as T;
    }
    if (t == _i52.NotificationType) {
      return _i52.NotificationType.fromJson(data) as T;
    }
    if (t == _i53.PublicNotificationFriendRequestAccepted) {
      return _i53.PublicNotificationFriendRequestAccepted.fromJson(data, this)
          as T;
    }
    if (t == _i54.PublicNotificationFriendRequestAcceptedSender) {
      return _i54.PublicNotificationFriendRequestAcceptedSender.fromJson(
          data, this) as T;
    }
    if (t == _i55.PublicNotificationFriendRequestCreated) {
      return _i55.PublicNotificationFriendRequestCreated.fromJson(data, this)
          as T;
    }
    if (t == _i56.PublicNotificationFriendRequestCreatedFriendRequest) {
      return _i56.PublicNotificationFriendRequestCreatedFriendRequest.fromJson(
          data, this) as T;
    }
    if (t == _i57.PublicNotificationFriendRequestCreatedFriendRequestSender) {
      return _i57.PublicNotificationFriendRequestCreatedFriendRequestSender
          .fromJson(data, this) as T;
    }
    if (t == _i58.PublicNotificationFriendRequestDenied) {
      return _i58.PublicNotificationFriendRequestDenied.fromJson(data, this)
          as T;
    }
    if (t == _i59.PublicNotificationFriendRequestDeniedSender) {
      return _i59.PublicNotificationFriendRequestDeniedSender.fromJson(
          data, this) as T;
    }
    if (t == _i60.PublicNotification) {
      return _i60.PublicNotification.fromJson(data, this) as T;
    }
    if (t == _i61.NotificationReadResponse) {
      return _i61.NotificationReadResponse.fromJson(data, this) as T;
    }
    if (t == _i62.NotificationReadResponseCode) {
      return _i62.NotificationReadResponseCode.fromJson(data) as T;
    }
    if (t == _i63.NotificationSetAllReadResponse) {
      return _i63.NotificationSetAllReadResponse.fromJson(data, this) as T;
    }
    if (t == _i64.NotificationSetAllReadResponseCode) {
      return _i64.NotificationSetAllReadResponseCode.fromJson(data) as T;
    }
    if (t == _i65.NotificationSetReadResponse) {
      return _i65.NotificationSetReadResponse.fromJson(data, this) as T;
    }
    if (t == _i66.NotificationSetReadResponseCode) {
      return _i66.NotificationSetReadResponseCode.fromJson(data) as T;
    }
    if (t == _i67.Notification) {
      return _i67.Notification.fromJson(data, this) as T;
    }
    if (t == _i68.RatingType) {
      return _i68.RatingType.fromJson(data) as T;
    }
    if (t == _i69.Rating) {
      return _i69.Rating.fromJson(data, this) as T;
    }
    if (t == _i70.UserBadge) {
      return _i70.UserBadge.fromJson(data) as T;
    }
    if (t == _i71.PublicUser) {
      return _i71.PublicUser.fromJson(data, this) as T;
    }
    if (t == _i72.PublicUserFriendRequest) {
      return _i72.PublicUserFriendRequest.fromJson(data, this) as T;
    }
    if (t == _i73.PublicUserFriendship) {
      return _i73.PublicUserFriendship.fromJson(data, this) as T;
    }
    if (t == _i74.PublicUserFriendshipDetails) {
      return _i74.PublicUserFriendshipDetails.fromJson(data, this) as T;
    }
    if (t == _i75.PublicUserFriendshipUser) {
      return _i75.PublicUserFriendshipUser.fromJson(data, this) as T;
    }
    if (t == _i76.PublicUserRating) {
      return _i76.PublicUserRating.fromJson(data, this) as T;
    }
    if (t == _i77.PublicUserRatingUser) {
      return _i77.PublicUserRatingUser.fromJson(data, this) as T;
    }
    if (t == _i78.UserEventsResponseCode) {
      return _i78.UserEventsResponseCode.fromJson(data) as T;
    }
    if (t == _i79.UserEventsResponse) {
      return _i79.UserEventsResponse.fromJson(data, this) as T;
    }
    if (t == _i80.UserFriendshipsResponse) {
      return _i80.UserFriendshipsResponse.fromJson(data, this) as T;
    }
    if (t == _i81.UserFriendshipsResponseCode) {
      return _i81.UserFriendshipsResponseCode.fromJson(data) as T;
    }
    if (t == _i82.UserRatingsResponse) {
      return _i82.UserRatingsResponse.fromJson(data, this) as T;
    }
    if (t == _i83.UserRatingsResponseCode) {
      return _i83.UserRatingsResponseCode.fromJson(data) as T;
    }
    if (t == _i84.UserReadResponse) {
      return _i84.UserReadResponse.fromJson(data, this) as T;
    }
    if (t == _i85.UserReadResponseCode) {
      return _i85.UserReadResponseCode.fromJson(data) as T;
    }
    if (t == _i86.UserUpdateResponse) {
      return _i86.UserUpdateResponse.fromJson(data, this) as T;
    }
    if (t == _i87.UserUpdateResponseCode) {
      return _i87.UserUpdateResponseCode.fromJson(data) as T;
    }
    if (t == _i88.User) {
      return _i88.User.fromJson(data, this) as T;
    }
    if (t == _i1.getType<_i2.AuthChangePasswordResponse?>()) {
      return (data != null
          ? _i2.AuthChangePasswordResponse.fromJson(data, this)
          : null) as T;
    }
    if (t == _i1.getType<_i3.AuthChangePasswordResponseCode?>()) {
      return (data != null
          ? _i3.AuthChangePasswordResponseCode.fromJson(data)
          : null) as T;
    }
    if (t == _i1.getType<_i4.AuthDeleteAccountResponse?>()) {
      return (data != null
          ? _i4.AuthDeleteAccountResponse.fromJson(data, this)
          : null) as T;
    }
    if (t == _i1.getType<_i5.AuthDeleteAccountResponseCode?>()) {
      return (data != null
          ? _i5.AuthDeleteAccountResponseCode.fromJson(data)
          : null) as T;
    }
    if (t == _i1.getType<_i6.AuthForgotPasswordResponse?>()) {
      return (data != null
          ? _i6.AuthForgotPasswordResponse.fromJson(data, this)
          : null) as T;
    }
    if (t == _i1.getType<_i7.AuthForgotPasswordResponseCode?>()) {
      return (data != null
          ? _i7.AuthForgotPasswordResponseCode.fromJson(data)
          : null) as T;
    }
    if (t == _i1.getType<_i8.AuthForgotPasswordSubmissionResponse?>()) {
      return (data != null
          ? _i8.AuthForgotPasswordSubmissionResponse.fromJson(data, this)
          : null) as T;
    }
    if (t == _i1.getType<_i9.AuthForgotPasswordSubmissionResponseCode?>()) {
      return (data != null
          ? _i9.AuthForgotPasswordSubmissionResponseCode.fromJson(data)
          : null) as T;
    }
    if (t == _i1.getType<_i10.AuthForgotPasswordVerificationResponse?>()) {
      return (data != null
          ? _i10.AuthForgotPasswordVerificationResponse.fromJson(data, this)
          : null) as T;
    }
    if (t == _i1.getType<_i11.AuthForgotPasswordVerificationResponseCode?>()) {
      return (data != null
          ? _i11.AuthForgotPasswordVerificationResponseCode.fromJson(data)
          : null) as T;
    }
    if (t == _i1.getType<_i12.AuthSignInResponse?>()) {
      return (data != null
          ? _i12.AuthSignInResponse.fromJson(data, this)
          : null) as T;
    }
    if (t == _i1.getType<_i13.AuthSignInResponseCode?>()) {
      return (data != null ? _i13.AuthSignInResponseCode.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i14.AuthSignUpResponse?>()) {
      return (data != null
          ? _i14.AuthSignUpResponse.fromJson(data, this)
          : null) as T;
    }
    if (t == _i1.getType<_i15.AuthSignUpResponseCode?>()) {
      return (data != null ? _i15.AuthSignUpResponseCode.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i16.AuthSignUpVerificationResponse?>()) {
      return (data != null
          ? _i16.AuthSignUpVerificationResponse.fromJson(data, this)
          : null) as T;
    }
    if (t == _i1.getType<_i17.AuthSignUpVerificationResponseCode?>()) {
      return (data != null
          ? _i17.AuthSignUpVerificationResponseCode.fromJson(data)
          : null) as T;
    }
    if (t == _i1.getType<_i18.AuthEmail?>()) {
      return (data != null ? _i18.AuthEmail.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i19.AuthForgotPasswordRequest?>()) {
      return (data != null
          ? _i19.AuthForgotPasswordRequest.fromJson(data, this)
          : null) as T;
    }
    if (t == _i1.getType<_i20.AuthSignUpRequest?>()) {
      return (data != null ? _i20.AuthSignUpRequest.fromJson(data, this) : null)
          as T;
    }
    if (t == _i1.getType<_i21.Counter?>()) {
      return (data != null ? _i21.Counter.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i22.DiscoverReadResponse?>()) {
      return (data != null
          ? _i22.DiscoverReadResponse.fromJson(data, this)
          : null) as T;
    }
    if (t == _i1.getType<_i23.DiscoverReadResponseCode?>()) {
      return (data != null
          ? _i23.DiscoverReadResponseCode.fromJson(data)
          : null) as T;
    }
    if (t == _i1.getType<_i24.EventInvitationStatus?>()) {
      return (data != null ? _i24.EventInvitationStatus.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i25.EventRequestStatus?>()) {
      return (data != null ? _i25.EventRequestStatus.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i26.EventType?>()) {
      return (data != null ? _i26.EventType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i27.EventVisibility?>()) {
      return (data != null ? _i27.EventVisibility.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i28.PublicEvent?>()) {
      return (data != null ? _i28.PublicEvent.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i29.PublicEventFullGuest?>()) {
      return (data != null
          ? _i29.PublicEventFullGuest.fromJson(data, this)
          : null) as T;
    }
    if (t == _i1.getType<_i30.PublicEventFullGuestUser?>()) {
      return (data != null
          ? _i30.PublicEventFullGuestUser.fromJson(data, this)
          : null) as T;
    }
    if (t == _i1.getType<_i31.PublicEventHost?>()) {
      return (data != null ? _i31.PublicEventHost.fromJson(data, this) : null)
          as T;
    }
    if (t == _i1.getType<_i32.PublicEventLocation?>()) {
      return (data != null
          ? _i32.PublicEventLocation.fromJson(data, this)
          : null) as T;
    }
    if (t == _i1.getType<_i33.EventGuestsResponse?>()) {
      return (data != null
          ? _i33.EventGuestsResponse.fromJson(data, this)
          : null) as T;
    }
    if (t == _i1.getType<_i34.EventGuestsResponseCode?>()) {
      return (data != null ? _i34.EventGuestsResponseCode.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i35.Event?>()) {
      return (data != null ? _i35.Event.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i36.EventGuest?>()) {
      return (data != null ? _i36.EventGuest.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i37.EventGuestSuggestion?>()) {
      return (data != null
          ? _i37.EventGuestSuggestion.fromJson(data, this)
          : null) as T;
    }
    if (t == _i1.getType<_i38.EventInvitation?>()) {
      return (data != null ? _i38.EventInvitation.fromJson(data, this) : null)
          as T;
    }
    if (t == _i1.getType<_i39.EventRequest?>()) {
      return (data != null ? _i39.EventRequest.fromJson(data, this) : null)
          as T;
    }
    if (t == _i1.getType<_i40.FriendRequestStatus?>()) {
      return (data != null ? _i40.FriendRequestStatus.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i41.FriendRequestAnswerResponse?>()) {
      return (data != null
          ? _i41.FriendRequestAnswerResponse.fromJson(data, this)
          : null) as T;
    }
    if (t == _i1.getType<_i42.FriendRequestAnswerResponseCode?>()) {
      return (data != null
          ? _i42.FriendRequestAnswerResponseCode.fromJson(data)
          : null) as T;
    }
    if (t == _i1.getType<_i43.FriendRequestCreateResponse?>()) {
      return (data != null
          ? _i43.FriendRequestCreateResponse.fromJson(data, this)
          : null) as T;
    }
    if (t == _i1.getType<_i44.FriendRequestCreateResponseCode?>()) {
      return (data != null
          ? _i44.FriendRequestCreateResponseCode.fromJson(data)
          : null) as T;
    }
    if (t == _i1.getType<_i45.FriendRequestTakeBackResponse?>()) {
      return (data != null
          ? _i45.FriendRequestTakeBackResponse.fromJson(data, this)
          : null) as T;
    }
    if (t == _i1.getType<_i46.FriendRequestTakeBackResponseCode?>()) {
      return (data != null
          ? _i46.FriendRequestTakeBackResponseCode.fromJson(data)
          : null) as T;
    }
    if (t == _i1.getType<_i47.FriendRequest?>()) {
      return (data != null ? _i47.FriendRequest.fromJson(data, this) : null)
          as T;
    }
    if (t == _i1.getType<_i48.FriendshipBadge?>()) {
      return (data != null ? _i48.FriendshipBadge.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i49.FriendshipRemoveResponse?>()) {
      return (data != null
          ? _i49.FriendshipRemoveResponse.fromJson(data, this)
          : null) as T;
    }
    if (t == _i1.getType<_i50.FriendshipRemoveResponseCode?>()) {
      return (data != null
          ? _i50.FriendshipRemoveResponseCode.fromJson(data)
          : null) as T;
    }
    if (t == _i1.getType<_i51.Friendship?>()) {
      return (data != null ? _i51.Friendship.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i52.NotificationType?>()) {
      return (data != null ? _i52.NotificationType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i53.PublicNotificationFriendRequestAccepted?>()) {
      return (data != null
          ? _i53.PublicNotificationFriendRequestAccepted.fromJson(data, this)
          : null) as T;
    }
    if (t ==
        _i1.getType<_i54.PublicNotificationFriendRequestAcceptedSender?>()) {
      return (data != null
          ? _i54.PublicNotificationFriendRequestAcceptedSender.fromJson(
              data, this)
          : null) as T;
    }
    if (t == _i1.getType<_i55.PublicNotificationFriendRequestCreated?>()) {
      return (data != null
          ? _i55.PublicNotificationFriendRequestCreated.fromJson(data, this)
          : null) as T;
    }
    if (t ==
        _i1.getType<
            _i56.PublicNotificationFriendRequestCreatedFriendRequest?>()) {
      return (data != null
          ? _i56.PublicNotificationFriendRequestCreatedFriendRequest.fromJson(
              data, this)
          : null) as T;
    }
    if (t ==
        _i1.getType<
            _i57.PublicNotificationFriendRequestCreatedFriendRequestSender?>()) {
      return (data != null
          ? _i57.PublicNotificationFriendRequestCreatedFriendRequestSender
              .fromJson(data, this)
          : null) as T;
    }
    if (t == _i1.getType<_i58.PublicNotificationFriendRequestDenied?>()) {
      return (data != null
          ? _i58.PublicNotificationFriendRequestDenied.fromJson(data, this)
          : null) as T;
    }
    if (t == _i1.getType<_i59.PublicNotificationFriendRequestDeniedSender?>()) {
      return (data != null
          ? _i59.PublicNotificationFriendRequestDeniedSender.fromJson(
              data, this)
          : null) as T;
    }
    if (t == _i1.getType<_i60.PublicNotification?>()) {
      return (data != null
          ? _i60.PublicNotification.fromJson(data, this)
          : null) as T;
    }
    if (t == _i1.getType<_i61.NotificationReadResponse?>()) {
      return (data != null
          ? _i61.NotificationReadResponse.fromJson(data, this)
          : null) as T;
    }
    if (t == _i1.getType<_i62.NotificationReadResponseCode?>()) {
      return (data != null
          ? _i62.NotificationReadResponseCode.fromJson(data)
          : null) as T;
    }
    if (t == _i1.getType<_i63.NotificationSetAllReadResponse?>()) {
      return (data != null
          ? _i63.NotificationSetAllReadResponse.fromJson(data, this)
          : null) as T;
    }
    if (t == _i1.getType<_i64.NotificationSetAllReadResponseCode?>()) {
      return (data != null
          ? _i64.NotificationSetAllReadResponseCode.fromJson(data)
          : null) as T;
    }
    if (t == _i1.getType<_i65.NotificationSetReadResponse?>()) {
      return (data != null
          ? _i65.NotificationSetReadResponse.fromJson(data, this)
          : null) as T;
    }
    if (t == _i1.getType<_i66.NotificationSetReadResponseCode?>()) {
      return (data != null
          ? _i66.NotificationSetReadResponseCode.fromJson(data)
          : null) as T;
    }
    if (t == _i1.getType<_i67.Notification?>()) {
      return (data != null ? _i67.Notification.fromJson(data, this) : null)
          as T;
    }
    if (t == _i1.getType<_i68.RatingType?>()) {
      return (data != null ? _i68.RatingType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i69.Rating?>()) {
      return (data != null ? _i69.Rating.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i70.UserBadge?>()) {
      return (data != null ? _i70.UserBadge.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i71.PublicUser?>()) {
      return (data != null ? _i71.PublicUser.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i72.PublicUserFriendRequest?>()) {
      return (data != null
          ? _i72.PublicUserFriendRequest.fromJson(data, this)
          : null) as T;
    }
    if (t == _i1.getType<_i73.PublicUserFriendship?>()) {
      return (data != null
          ? _i73.PublicUserFriendship.fromJson(data, this)
          : null) as T;
    }
    if (t == _i1.getType<_i74.PublicUserFriendshipDetails?>()) {
      return (data != null
          ? _i74.PublicUserFriendshipDetails.fromJson(data, this)
          : null) as T;
    }
    if (t == _i1.getType<_i75.PublicUserFriendshipUser?>()) {
      return (data != null
          ? _i75.PublicUserFriendshipUser.fromJson(data, this)
          : null) as T;
    }
    if (t == _i1.getType<_i76.PublicUserRating?>()) {
      return (data != null ? _i76.PublicUserRating.fromJson(data, this) : null)
          as T;
    }
    if (t == _i1.getType<_i77.PublicUserRatingUser?>()) {
      return (data != null
          ? _i77.PublicUserRatingUser.fromJson(data, this)
          : null) as T;
    }
    if (t == _i1.getType<_i78.UserEventsResponseCode?>()) {
      return (data != null ? _i78.UserEventsResponseCode.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i79.UserEventsResponse?>()) {
      return (data != null
          ? _i79.UserEventsResponse.fromJson(data, this)
          : null) as T;
    }
    if (t == _i1.getType<_i80.UserFriendshipsResponse?>()) {
      return (data != null
          ? _i80.UserFriendshipsResponse.fromJson(data, this)
          : null) as T;
    }
    if (t == _i1.getType<_i81.UserFriendshipsResponseCode?>()) {
      return (data != null
          ? _i81.UserFriendshipsResponseCode.fromJson(data)
          : null) as T;
    }
    if (t == _i1.getType<_i82.UserRatingsResponse?>()) {
      return (data != null
          ? _i82.UserRatingsResponse.fromJson(data, this)
          : null) as T;
    }
    if (t == _i1.getType<_i83.UserRatingsResponseCode?>()) {
      return (data != null ? _i83.UserRatingsResponseCode.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i84.UserReadResponse?>()) {
      return (data != null ? _i84.UserReadResponse.fromJson(data, this) : null)
          as T;
    }
    if (t == _i1.getType<_i85.UserReadResponseCode?>()) {
      return (data != null ? _i85.UserReadResponseCode.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i86.UserUpdateResponse?>()) {
      return (data != null
          ? _i86.UserUpdateResponse.fromJson(data, this)
          : null) as T;
    }
    if (t == _i1.getType<_i87.UserUpdateResponseCode?>()) {
      return (data != null ? _i87.UserUpdateResponseCode.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i88.User?>()) {
      return (data != null ? _i88.User.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<List<_i89.PublicEvent>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i89.PublicEvent>(e)).toList()
          : null) as dynamic;
    }
    if (t == List<_i89.PublicEventHost?>) {
      return (data as List)
          .map((e) => deserialize<_i89.PublicEventHost?>(e))
          .toList() as dynamic;
    }
    if (t == List<String?>) {
      return (data as List).map((e) => deserialize<String?>(e)).toList()
          as dynamic;
    }
    if (t == _i1.getType<List<_i89.PublicEventFullGuest>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i89.PublicEventFullGuest>(e))
              .toList()
          : null) as dynamic;
    }
    if (t == List<int>) {
      return (data as List).map((e) => deserialize<int>(e)).toList() as dynamic;
    }
    if (t == List<_i89.FriendshipBadge>) {
      return (data as List)
          .map((e) => deserialize<_i89.FriendshipBadge>(e))
          .toList() as dynamic;
    }
    if (t == _i1.getType<List<_i89.PublicNotification>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i89.PublicNotification>(e))
              .toList()
          : null) as dynamic;
    }
    if (t == List<_i89.UserBadge>) {
      return (data as List).map((e) => deserialize<_i89.UserBadge>(e)).toList()
          as dynamic;
    }
    if (t == _i1.getType<List<_i89.PublicEvent>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i89.PublicEvent>(e)).toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<_i89.PublicUserFriendship>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i89.PublicUserFriendship>(e))
              .toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<_i89.PublicUserRating>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i89.PublicUserRating>(e))
              .toList()
          : null) as dynamic;
    }
    if (t == List<_i90.EventType>) {
      return (data as List).map((e) => deserialize<_i90.EventType>(e)).toList()
          as dynamic;
    }
    if (t == List<_i91.EventVisibility>) {
      return (data as List)
          .map((e) => deserialize<_i91.EventVisibility>(e))
          .toList() as dynamic;
    }
    try {
      return _i92.Protocol().deserialize<T>(data, t);
    } catch (_) {}
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object data) {
    if (data is _i2.AuthChangePasswordResponse) {
      return 'AuthChangePasswordResponse';
    }
    if (data is _i3.AuthChangePasswordResponseCode) {
      return 'AuthChangePasswordResponseCode';
    }
    if (data is _i4.AuthDeleteAccountResponse) {
      return 'AuthDeleteAccountResponse';
    }
    if (data is _i5.AuthDeleteAccountResponseCode) {
      return 'AuthDeleteAccountResponseCode';
    }
    if (data is _i6.AuthForgotPasswordResponse) {
      return 'AuthForgotPasswordResponse';
    }
    if (data is _i7.AuthForgotPasswordResponseCode) {
      return 'AuthForgotPasswordResponseCode';
    }
    if (data is _i8.AuthForgotPasswordSubmissionResponse) {
      return 'AuthForgotPasswordSubmissionResponse';
    }
    if (data is _i9.AuthForgotPasswordSubmissionResponseCode) {
      return 'AuthForgotPasswordSubmissionResponseCode';
    }
    if (data is _i10.AuthForgotPasswordVerificationResponse) {
      return 'AuthForgotPasswordVerificationResponse';
    }
    if (data is _i11.AuthForgotPasswordVerificationResponseCode) {
      return 'AuthForgotPasswordVerificationResponseCode';
    }
    if (data is _i12.AuthSignInResponse) {
      return 'AuthSignInResponse';
    }
    if (data is _i13.AuthSignInResponseCode) {
      return 'AuthSignInResponseCode';
    }
    if (data is _i14.AuthSignUpResponse) {
      return 'AuthSignUpResponse';
    }
    if (data is _i15.AuthSignUpResponseCode) {
      return 'AuthSignUpResponseCode';
    }
    if (data is _i16.AuthSignUpVerificationResponse) {
      return 'AuthSignUpVerificationResponse';
    }
    if (data is _i17.AuthSignUpVerificationResponseCode) {
      return 'AuthSignUpVerificationResponseCode';
    }
    if (data is _i18.AuthEmail) {
      return 'AuthEmail';
    }
    if (data is _i19.AuthForgotPasswordRequest) {
      return 'AuthForgotPasswordRequest';
    }
    if (data is _i20.AuthSignUpRequest) {
      return 'AuthSignUpRequest';
    }
    if (data is _i21.Counter) {
      return 'Counter';
    }
    if (data is _i22.DiscoverReadResponse) {
      return 'DiscoverReadResponse';
    }
    if (data is _i23.DiscoverReadResponseCode) {
      return 'DiscoverReadResponseCode';
    }
    if (data is _i24.EventInvitationStatus) {
      return 'EventInvitationStatus';
    }
    if (data is _i25.EventRequestStatus) {
      return 'EventRequestStatus';
    }
    if (data is _i26.EventType) {
      return 'EventType';
    }
    if (data is _i27.EventVisibility) {
      return 'EventVisibility';
    }
    if (data is _i28.PublicEvent) {
      return 'PublicEvent';
    }
    if (data is _i29.PublicEventFullGuest) {
      return 'PublicEventFullGuest';
    }
    if (data is _i30.PublicEventFullGuestUser) {
      return 'PublicEventFullGuestUser';
    }
    if (data is _i31.PublicEventHost) {
      return 'PublicEventHost';
    }
    if (data is _i32.PublicEventLocation) {
      return 'PublicEventLocation';
    }
    if (data is _i33.EventGuestsResponse) {
      return 'EventGuestsResponse';
    }
    if (data is _i34.EventGuestsResponseCode) {
      return 'EventGuestsResponseCode';
    }
    if (data is _i35.Event) {
      return 'Event';
    }
    if (data is _i36.EventGuest) {
      return 'EventGuest';
    }
    if (data is _i37.EventGuestSuggestion) {
      return 'EventGuestSuggestion';
    }
    if (data is _i38.EventInvitation) {
      return 'EventInvitation';
    }
    if (data is _i39.EventRequest) {
      return 'EventRequest';
    }
    if (data is _i40.FriendRequestStatus) {
      return 'FriendRequestStatus';
    }
    if (data is _i41.FriendRequestAnswerResponse) {
      return 'FriendRequestAnswerResponse';
    }
    if (data is _i42.FriendRequestAnswerResponseCode) {
      return 'FriendRequestAnswerResponseCode';
    }
    if (data is _i43.FriendRequestCreateResponse) {
      return 'FriendRequestCreateResponse';
    }
    if (data is _i44.FriendRequestCreateResponseCode) {
      return 'FriendRequestCreateResponseCode';
    }
    if (data is _i45.FriendRequestTakeBackResponse) {
      return 'FriendRequestTakeBackResponse';
    }
    if (data is _i46.FriendRequestTakeBackResponseCode) {
      return 'FriendRequestTakeBackResponseCode';
    }
    if (data is _i47.FriendRequest) {
      return 'FriendRequest';
    }
    if (data is _i48.FriendshipBadge) {
      return 'FriendshipBadge';
    }
    if (data is _i49.FriendshipRemoveResponse) {
      return 'FriendshipRemoveResponse';
    }
    if (data is _i50.FriendshipRemoveResponseCode) {
      return 'FriendshipRemoveResponseCode';
    }
    if (data is _i51.Friendship) {
      return 'Friendship';
    }
    if (data is _i52.NotificationType) {
      return 'NotificationType';
    }
    if (data is _i53.PublicNotificationFriendRequestAccepted) {
      return 'PublicNotificationFriendRequestAccepted';
    }
    if (data is _i54.PublicNotificationFriendRequestAcceptedSender) {
      return 'PublicNotificationFriendRequestAcceptedSender';
    }
    if (data is _i55.PublicNotificationFriendRequestCreated) {
      return 'PublicNotificationFriendRequestCreated';
    }
    if (data is _i56.PublicNotificationFriendRequestCreatedFriendRequest) {
      return 'PublicNotificationFriendRequestCreatedFriendRequest';
    }
    if (data
        is _i57.PublicNotificationFriendRequestCreatedFriendRequestSender) {
      return 'PublicNotificationFriendRequestCreatedFriendRequestSender';
    }
    if (data is _i58.PublicNotificationFriendRequestDenied) {
      return 'PublicNotificationFriendRequestDenied';
    }
    if (data is _i59.PublicNotificationFriendRequestDeniedSender) {
      return 'PublicNotificationFriendRequestDeniedSender';
    }
    if (data is _i60.PublicNotification) {
      return 'PublicNotification';
    }
    if (data is _i61.NotificationReadResponse) {
      return 'NotificationReadResponse';
    }
    if (data is _i62.NotificationReadResponseCode) {
      return 'NotificationReadResponseCode';
    }
    if (data is _i63.NotificationSetAllReadResponse) {
      return 'NotificationSetAllReadResponse';
    }
    if (data is _i64.NotificationSetAllReadResponseCode) {
      return 'NotificationSetAllReadResponseCode';
    }
    if (data is _i65.NotificationSetReadResponse) {
      return 'NotificationSetReadResponse';
    }
    if (data is _i66.NotificationSetReadResponseCode) {
      return 'NotificationSetReadResponseCode';
    }
    if (data is _i67.Notification) {
      return 'Notification';
    }
    if (data is _i68.RatingType) {
      return 'RatingType';
    }
    if (data is _i69.Rating) {
      return 'Rating';
    }
    if (data is _i70.UserBadge) {
      return 'UserBadge';
    }
    if (data is _i71.PublicUser) {
      return 'PublicUser';
    }
    if (data is _i72.PublicUserFriendRequest) {
      return 'PublicUserFriendRequest';
    }
    if (data is _i73.PublicUserFriendship) {
      return 'PublicUserFriendship';
    }
    if (data is _i74.PublicUserFriendshipDetails) {
      return 'PublicUserFriendshipDetails';
    }
    if (data is _i75.PublicUserFriendshipUser) {
      return 'PublicUserFriendshipUser';
    }
    if (data is _i76.PublicUserRating) {
      return 'PublicUserRating';
    }
    if (data is _i77.PublicUserRatingUser) {
      return 'PublicUserRatingUser';
    }
    if (data is _i78.UserEventsResponseCode) {
      return 'UserEventsResponseCode';
    }
    if (data is _i79.UserEventsResponse) {
      return 'UserEventsResponse';
    }
    if (data is _i80.UserFriendshipsResponse) {
      return 'UserFriendshipsResponse';
    }
    if (data is _i81.UserFriendshipsResponseCode) {
      return 'UserFriendshipsResponseCode';
    }
    if (data is _i82.UserRatingsResponse) {
      return 'UserRatingsResponse';
    }
    if (data is _i83.UserRatingsResponseCode) {
      return 'UserRatingsResponseCode';
    }
    if (data is _i84.UserReadResponse) {
      return 'UserReadResponse';
    }
    if (data is _i85.UserReadResponseCode) {
      return 'UserReadResponseCode';
    }
    if (data is _i86.UserUpdateResponse) {
      return 'UserUpdateResponse';
    }
    if (data is _i87.UserUpdateResponseCode) {
      return 'UserUpdateResponseCode';
    }
    if (data is _i88.User) {
      return 'User';
    }
    return super.getClassNameForObject(data);
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    if (data['className'] == 'AuthChangePasswordResponse') {
      return deserialize<_i2.AuthChangePasswordResponse>(data['data']);
    }
    if (data['className'] == 'AuthChangePasswordResponseCode') {
      return deserialize<_i3.AuthChangePasswordResponseCode>(data['data']);
    }
    if (data['className'] == 'AuthDeleteAccountResponse') {
      return deserialize<_i4.AuthDeleteAccountResponse>(data['data']);
    }
    if (data['className'] == 'AuthDeleteAccountResponseCode') {
      return deserialize<_i5.AuthDeleteAccountResponseCode>(data['data']);
    }
    if (data['className'] == 'AuthForgotPasswordResponse') {
      return deserialize<_i6.AuthForgotPasswordResponse>(data['data']);
    }
    if (data['className'] == 'AuthForgotPasswordResponseCode') {
      return deserialize<_i7.AuthForgotPasswordResponseCode>(data['data']);
    }
    if (data['className'] == 'AuthForgotPasswordSubmissionResponse') {
      return deserialize<_i8.AuthForgotPasswordSubmissionResponse>(
          data['data']);
    }
    if (data['className'] == 'AuthForgotPasswordSubmissionResponseCode') {
      return deserialize<_i9.AuthForgotPasswordSubmissionResponseCode>(
          data['data']);
    }
    if (data['className'] == 'AuthForgotPasswordVerificationResponse') {
      return deserialize<_i10.AuthForgotPasswordVerificationResponse>(
          data['data']);
    }
    if (data['className'] == 'AuthForgotPasswordVerificationResponseCode') {
      return deserialize<_i11.AuthForgotPasswordVerificationResponseCode>(
          data['data']);
    }
    if (data['className'] == 'AuthSignInResponse') {
      return deserialize<_i12.AuthSignInResponse>(data['data']);
    }
    if (data['className'] == 'AuthSignInResponseCode') {
      return deserialize<_i13.AuthSignInResponseCode>(data['data']);
    }
    if (data['className'] == 'AuthSignUpResponse') {
      return deserialize<_i14.AuthSignUpResponse>(data['data']);
    }
    if (data['className'] == 'AuthSignUpResponseCode') {
      return deserialize<_i15.AuthSignUpResponseCode>(data['data']);
    }
    if (data['className'] == 'AuthSignUpVerificationResponse') {
      return deserialize<_i16.AuthSignUpVerificationResponse>(data['data']);
    }
    if (data['className'] == 'AuthSignUpVerificationResponseCode') {
      return deserialize<_i17.AuthSignUpVerificationResponseCode>(data['data']);
    }
    if (data['className'] == 'AuthEmail') {
      return deserialize<_i18.AuthEmail>(data['data']);
    }
    if (data['className'] == 'AuthForgotPasswordRequest') {
      return deserialize<_i19.AuthForgotPasswordRequest>(data['data']);
    }
    if (data['className'] == 'AuthSignUpRequest') {
      return deserialize<_i20.AuthSignUpRequest>(data['data']);
    }
    if (data['className'] == 'Counter') {
      return deserialize<_i21.Counter>(data['data']);
    }
    if (data['className'] == 'DiscoverReadResponse') {
      return deserialize<_i22.DiscoverReadResponse>(data['data']);
    }
    if (data['className'] == 'DiscoverReadResponseCode') {
      return deserialize<_i23.DiscoverReadResponseCode>(data['data']);
    }
    if (data['className'] == 'EventInvitationStatus') {
      return deserialize<_i24.EventInvitationStatus>(data['data']);
    }
    if (data['className'] == 'EventRequestStatus') {
      return deserialize<_i25.EventRequestStatus>(data['data']);
    }
    if (data['className'] == 'EventType') {
      return deserialize<_i26.EventType>(data['data']);
    }
    if (data['className'] == 'EventVisibility') {
      return deserialize<_i27.EventVisibility>(data['data']);
    }
    if (data['className'] == 'PublicEvent') {
      return deserialize<_i28.PublicEvent>(data['data']);
    }
    if (data['className'] == 'PublicEventFullGuest') {
      return deserialize<_i29.PublicEventFullGuest>(data['data']);
    }
    if (data['className'] == 'PublicEventFullGuestUser') {
      return deserialize<_i30.PublicEventFullGuestUser>(data['data']);
    }
    if (data['className'] == 'PublicEventHost') {
      return deserialize<_i31.PublicEventHost>(data['data']);
    }
    if (data['className'] == 'PublicEventLocation') {
      return deserialize<_i32.PublicEventLocation>(data['data']);
    }
    if (data['className'] == 'EventGuestsResponse') {
      return deserialize<_i33.EventGuestsResponse>(data['data']);
    }
    if (data['className'] == 'EventGuestsResponseCode') {
      return deserialize<_i34.EventGuestsResponseCode>(data['data']);
    }
    if (data['className'] == 'Event') {
      return deserialize<_i35.Event>(data['data']);
    }
    if (data['className'] == 'EventGuest') {
      return deserialize<_i36.EventGuest>(data['data']);
    }
    if (data['className'] == 'EventGuestSuggestion') {
      return deserialize<_i37.EventGuestSuggestion>(data['data']);
    }
    if (data['className'] == 'EventInvitation') {
      return deserialize<_i38.EventInvitation>(data['data']);
    }
    if (data['className'] == 'EventRequest') {
      return deserialize<_i39.EventRequest>(data['data']);
    }
    if (data['className'] == 'FriendRequestStatus') {
      return deserialize<_i40.FriendRequestStatus>(data['data']);
    }
    if (data['className'] == 'FriendRequestAnswerResponse') {
      return deserialize<_i41.FriendRequestAnswerResponse>(data['data']);
    }
    if (data['className'] == 'FriendRequestAnswerResponseCode') {
      return deserialize<_i42.FriendRequestAnswerResponseCode>(data['data']);
    }
    if (data['className'] == 'FriendRequestCreateResponse') {
      return deserialize<_i43.FriendRequestCreateResponse>(data['data']);
    }
    if (data['className'] == 'FriendRequestCreateResponseCode') {
      return deserialize<_i44.FriendRequestCreateResponseCode>(data['data']);
    }
    if (data['className'] == 'FriendRequestTakeBackResponse') {
      return deserialize<_i45.FriendRequestTakeBackResponse>(data['data']);
    }
    if (data['className'] == 'FriendRequestTakeBackResponseCode') {
      return deserialize<_i46.FriendRequestTakeBackResponseCode>(data['data']);
    }
    if (data['className'] == 'FriendRequest') {
      return deserialize<_i47.FriendRequest>(data['data']);
    }
    if (data['className'] == 'FriendshipBadge') {
      return deserialize<_i48.FriendshipBadge>(data['data']);
    }
    if (data['className'] == 'FriendshipRemoveResponse') {
      return deserialize<_i49.FriendshipRemoveResponse>(data['data']);
    }
    if (data['className'] == 'FriendshipRemoveResponseCode') {
      return deserialize<_i50.FriendshipRemoveResponseCode>(data['data']);
    }
    if (data['className'] == 'Friendship') {
      return deserialize<_i51.Friendship>(data['data']);
    }
    if (data['className'] == 'NotificationType') {
      return deserialize<_i52.NotificationType>(data['data']);
    }
    if (data['className'] == 'PublicNotificationFriendRequestAccepted') {
      return deserialize<_i53.PublicNotificationFriendRequestAccepted>(
          data['data']);
    }
    if (data['className'] == 'PublicNotificationFriendRequestAcceptedSender') {
      return deserialize<_i54.PublicNotificationFriendRequestAcceptedSender>(
          data['data']);
    }
    if (data['className'] == 'PublicNotificationFriendRequestCreated') {
      return deserialize<_i55.PublicNotificationFriendRequestCreated>(
          data['data']);
    }
    if (data['className'] ==
        'PublicNotificationFriendRequestCreatedFriendRequest') {
      return deserialize<
              _i56.PublicNotificationFriendRequestCreatedFriendRequest>(
          data['data']);
    }
    if (data['className'] ==
        'PublicNotificationFriendRequestCreatedFriendRequestSender') {
      return deserialize<
              _i57.PublicNotificationFriendRequestCreatedFriendRequestSender>(
          data['data']);
    }
    if (data['className'] == 'PublicNotificationFriendRequestDenied') {
      return deserialize<_i58.PublicNotificationFriendRequestDenied>(
          data['data']);
    }
    if (data['className'] == 'PublicNotificationFriendRequestDeniedSender') {
      return deserialize<_i59.PublicNotificationFriendRequestDeniedSender>(
          data['data']);
    }
    if (data['className'] == 'PublicNotification') {
      return deserialize<_i60.PublicNotification>(data['data']);
    }
    if (data['className'] == 'NotificationReadResponse') {
      return deserialize<_i61.NotificationReadResponse>(data['data']);
    }
    if (data['className'] == 'NotificationReadResponseCode') {
      return deserialize<_i62.NotificationReadResponseCode>(data['data']);
    }
    if (data['className'] == 'NotificationSetAllReadResponse') {
      return deserialize<_i63.NotificationSetAllReadResponse>(data['data']);
    }
    if (data['className'] == 'NotificationSetAllReadResponseCode') {
      return deserialize<_i64.NotificationSetAllReadResponseCode>(data['data']);
    }
    if (data['className'] == 'NotificationSetReadResponse') {
      return deserialize<_i65.NotificationSetReadResponse>(data['data']);
    }
    if (data['className'] == 'NotificationSetReadResponseCode') {
      return deserialize<_i66.NotificationSetReadResponseCode>(data['data']);
    }
    if (data['className'] == 'Notification') {
      return deserialize<_i67.Notification>(data['data']);
    }
    if (data['className'] == 'RatingType') {
      return deserialize<_i68.RatingType>(data['data']);
    }
    if (data['className'] == 'Rating') {
      return deserialize<_i69.Rating>(data['data']);
    }
    if (data['className'] == 'UserBadge') {
      return deserialize<_i70.UserBadge>(data['data']);
    }
    if (data['className'] == 'PublicUser') {
      return deserialize<_i71.PublicUser>(data['data']);
    }
    if (data['className'] == 'PublicUserFriendRequest') {
      return deserialize<_i72.PublicUserFriendRequest>(data['data']);
    }
    if (data['className'] == 'PublicUserFriendship') {
      return deserialize<_i73.PublicUserFriendship>(data['data']);
    }
    if (data['className'] == 'PublicUserFriendshipDetails') {
      return deserialize<_i74.PublicUserFriendshipDetails>(data['data']);
    }
    if (data['className'] == 'PublicUserFriendshipUser') {
      return deserialize<_i75.PublicUserFriendshipUser>(data['data']);
    }
    if (data['className'] == 'PublicUserRating') {
      return deserialize<_i76.PublicUserRating>(data['data']);
    }
    if (data['className'] == 'PublicUserRatingUser') {
      return deserialize<_i77.PublicUserRatingUser>(data['data']);
    }
    if (data['className'] == 'UserEventsResponseCode') {
      return deserialize<_i78.UserEventsResponseCode>(data['data']);
    }
    if (data['className'] == 'UserEventsResponse') {
      return deserialize<_i79.UserEventsResponse>(data['data']);
    }
    if (data['className'] == 'UserFriendshipsResponse') {
      return deserialize<_i80.UserFriendshipsResponse>(data['data']);
    }
    if (data['className'] == 'UserFriendshipsResponseCode') {
      return deserialize<_i81.UserFriendshipsResponseCode>(data['data']);
    }
    if (data['className'] == 'UserRatingsResponse') {
      return deserialize<_i82.UserRatingsResponse>(data['data']);
    }
    if (data['className'] == 'UserRatingsResponseCode') {
      return deserialize<_i83.UserRatingsResponseCode>(data['data']);
    }
    if (data['className'] == 'UserReadResponse') {
      return deserialize<_i84.UserReadResponse>(data['data']);
    }
    if (data['className'] == 'UserReadResponseCode') {
      return deserialize<_i85.UserReadResponseCode>(data['data']);
    }
    if (data['className'] == 'UserUpdateResponse') {
      return deserialize<_i86.UserUpdateResponse>(data['data']);
    }
    if (data['className'] == 'UserUpdateResponseCode') {
      return deserialize<_i87.UserUpdateResponseCode>(data['data']);
    }
    if (data['className'] == 'User') {
      return deserialize<_i88.User>(data['data']);
    }
    return super.deserializeByClassName(data);
  }

  @override
  _i1.Table? getTableForType(Type t) {
    {
      var table = _i92.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    switch (t) {
      case _i18.AuthEmail:
        return _i18.AuthEmail.t;
      case _i19.AuthForgotPasswordRequest:
        return _i19.AuthForgotPasswordRequest.t;
      case _i20.AuthSignUpRequest:
        return _i20.AuthSignUpRequest.t;
      case _i21.Counter:
        return _i21.Counter.t;
      case _i35.Event:
        return _i35.Event.t;
      case _i36.EventGuest:
        return _i36.EventGuest.t;
      case _i37.EventGuestSuggestion:
        return _i37.EventGuestSuggestion.t;
      case _i38.EventInvitation:
        return _i38.EventInvitation.t;
      case _i39.EventRequest:
        return _i39.EventRequest.t;
      case _i47.FriendRequest:
        return _i47.FriendRequest.t;
      case _i51.Friendship:
        return _i51.Friendship.t;
      case _i67.Notification:
        return _i67.Notification.t;
      case _i69.Rating:
        return _i69.Rating.t;
      case _i88.User:
        return _i88.User.t;
    }
    return null;
  }
}

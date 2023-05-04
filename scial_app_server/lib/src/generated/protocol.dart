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
import 'friend_request/enum/friend_request_status.dart' as _i21;
import 'friend_request/response/friend_request_answer_response.dart' as _i22;
import 'friend_request/response/friend_request_answer_response_code.dart'
    as _i23;
import 'friend_request/table/friend_request.dart' as _i24;
import 'friendship/enum/friendship_badge.dart' as _i25;
import 'friendship/response/friendship_remove_response.dart' as _i26;
import 'friendship/response/friendship_remove_response_code.dart' as _i27;
import 'friendship/table/friendship.dart' as _i28;
import 'rating/enum/rating_type.dart' as _i29;
import 'rating/table/rating.dart' as _i30;
import 'user/enum/user_badge.dart' as _i31;
import 'user/model/public_user.dart' as _i32;
import 'user/model/public_user_friend_request.dart' as _i33;
import 'user/model/public_user_friendship_details.dart' as _i34;
import 'user/model/public_user_rating.dart' as _i35;
import 'user/model/public_user_rating_user.dart' as _i36;
import 'user/response/user_ratings_response.dart' as _i37;
import 'user/response/user_ratings_response_code.dart' as _i38;
import 'user/response/user_read_response.dart' as _i39;
import 'user/response/user_read_response_code.dart' as _i40;
import 'user/table/user.dart' as _i41;
import 'protocol.dart' as _i42;
import 'package:serverpod/protocol.dart' as _i43;
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
export 'friend_request/enum/friend_request_status.dart';
export 'friend_request/response/friend_request_answer_response.dart';
export 'friend_request/response/friend_request_answer_response_code.dart';
export 'friend_request/table/friend_request.dart';
export 'friendship/enum/friendship_badge.dart';
export 'friendship/response/friendship_remove_response.dart';
export 'friendship/response/friendship_remove_response_code.dart';
export 'friendship/table/friendship.dart';
export 'rating/enum/rating_type.dart';
export 'rating/table/rating.dart';
export 'user/enum/user_badge.dart';
export 'user/model/public_user.dart';
export 'user/model/public_user_friend_request.dart';
export 'user/model/public_user_friendship_details.dart';
export 'user/model/public_user_rating.dart';
export 'user/model/public_user_rating_user.dart';
export 'user/response/user_ratings_response.dart';
export 'user/response/user_ratings_response_code.dart';
export 'user/response/user_read_response.dart';
export 'user/response/user_read_response_code.dart';
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
    if (t == _i21.FriendRequestStatus) {
      return _i21.FriendRequestStatus.fromJson(data) as T;
    }
    if (t == _i22.FriendRequestAnswerResponse) {
      return _i22.FriendRequestAnswerResponse.fromJson(data, this) as T;
    }
    if (t == _i23.FriendRequestAnswerResponseCode) {
      return _i23.FriendRequestAnswerResponseCode.fromJson(data) as T;
    }
    if (t == _i24.FriendRequest) {
      return _i24.FriendRequest.fromJson(data, this) as T;
    }
    if (t == _i25.FriendshipBadge) {
      return _i25.FriendshipBadge.fromJson(data) as T;
    }
    if (t == _i26.FriendshipRemoveResponse) {
      return _i26.FriendshipRemoveResponse.fromJson(data, this) as T;
    }
    if (t == _i27.FriendshipRemoveResponseCode) {
      return _i27.FriendshipRemoveResponseCode.fromJson(data) as T;
    }
    if (t == _i28.Friendship) {
      return _i28.Friendship.fromJson(data, this) as T;
    }
    if (t == _i29.RatingType) {
      return _i29.RatingType.fromJson(data) as T;
    }
    if (t == _i30.Rating) {
      return _i30.Rating.fromJson(data, this) as T;
    }
    if (t == _i31.UserBadge) {
      return _i31.UserBadge.fromJson(data) as T;
    }
    if (t == _i32.PublicUser) {
      return _i32.PublicUser.fromJson(data, this) as T;
    }
    if (t == _i33.PublicUserFriendRequest) {
      return _i33.PublicUserFriendRequest.fromJson(data, this) as T;
    }
    if (t == _i34.PublicUserFriendshipDetails) {
      return _i34.PublicUserFriendshipDetails.fromJson(data, this) as T;
    }
    if (t == _i35.PublicUserRating) {
      return _i35.PublicUserRating.fromJson(data, this) as T;
    }
    if (t == _i36.PublicUserRatingUser) {
      return _i36.PublicUserRatingUser.fromJson(data, this) as T;
    }
    if (t == _i37.UserRatingsResponse) {
      return _i37.UserRatingsResponse.fromJson(data, this) as T;
    }
    if (t == _i38.UserRatingsResponseCode) {
      return _i38.UserRatingsResponseCode.fromJson(data) as T;
    }
    if (t == _i39.UserReadResponse) {
      return _i39.UserReadResponse.fromJson(data, this) as T;
    }
    if (t == _i40.UserReadResponseCode) {
      return _i40.UserReadResponseCode.fromJson(data) as T;
    }
    if (t == _i41.User) {
      return _i41.User.fromJson(data, this) as T;
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
    if (t == _i1.getType<_i21.FriendRequestStatus?>()) {
      return (data != null ? _i21.FriendRequestStatus.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i22.FriendRequestAnswerResponse?>()) {
      return (data != null
          ? _i22.FriendRequestAnswerResponse.fromJson(data, this)
          : null) as T;
    }
    if (t == _i1.getType<_i23.FriendRequestAnswerResponseCode?>()) {
      return (data != null
          ? _i23.FriendRequestAnswerResponseCode.fromJson(data)
          : null) as T;
    }
    if (t == _i1.getType<_i24.FriendRequest?>()) {
      return (data != null ? _i24.FriendRequest.fromJson(data, this) : null)
          as T;
    }
    if (t == _i1.getType<_i25.FriendshipBadge?>()) {
      return (data != null ? _i25.FriendshipBadge.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i26.FriendshipRemoveResponse?>()) {
      return (data != null
          ? _i26.FriendshipRemoveResponse.fromJson(data, this)
          : null) as T;
    }
    if (t == _i1.getType<_i27.FriendshipRemoveResponseCode?>()) {
      return (data != null
          ? _i27.FriendshipRemoveResponseCode.fromJson(data)
          : null) as T;
    }
    if (t == _i1.getType<_i28.Friendship?>()) {
      return (data != null ? _i28.Friendship.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i29.RatingType?>()) {
      return (data != null ? _i29.RatingType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i30.Rating?>()) {
      return (data != null ? _i30.Rating.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i31.UserBadge?>()) {
      return (data != null ? _i31.UserBadge.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i32.PublicUser?>()) {
      return (data != null ? _i32.PublicUser.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i33.PublicUserFriendRequest?>()) {
      return (data != null
          ? _i33.PublicUserFriendRequest.fromJson(data, this)
          : null) as T;
    }
    if (t == _i1.getType<_i34.PublicUserFriendshipDetails?>()) {
      return (data != null
          ? _i34.PublicUserFriendshipDetails.fromJson(data, this)
          : null) as T;
    }
    if (t == _i1.getType<_i35.PublicUserRating?>()) {
      return (data != null ? _i35.PublicUserRating.fromJson(data, this) : null)
          as T;
    }
    if (t == _i1.getType<_i36.PublicUserRatingUser?>()) {
      return (data != null
          ? _i36.PublicUserRatingUser.fromJson(data, this)
          : null) as T;
    }
    if (t == _i1.getType<_i37.UserRatingsResponse?>()) {
      return (data != null
          ? _i37.UserRatingsResponse.fromJson(data, this)
          : null) as T;
    }
    if (t == _i1.getType<_i38.UserRatingsResponseCode?>()) {
      return (data != null ? _i38.UserRatingsResponseCode.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i39.UserReadResponse?>()) {
      return (data != null ? _i39.UserReadResponse.fromJson(data, this) : null)
          as T;
    }
    if (t == _i1.getType<_i40.UserReadResponseCode?>()) {
      return (data != null ? _i40.UserReadResponseCode.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i41.User?>()) {
      return (data != null ? _i41.User.fromJson(data, this) : null) as T;
    }
    if (t == List<int>) {
      return (data as List).map((e) => deserialize<int>(e)).toList() as dynamic;
    }
    if (t == List<_i42.FriendshipBadge>) {
      return (data as List)
          .map((e) => deserialize<_i42.FriendshipBadge>(e))
          .toList() as dynamic;
    }
    if (t == List<_i42.UserBadge>) {
      return (data as List).map((e) => deserialize<_i42.UserBadge>(e)).toList()
          as dynamic;
    }
    if (t == _i1.getType<List<_i42.PublicUserRating>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i42.PublicUserRating>(e))
              .toList()
          : null) as dynamic;
    }
    try {
      return _i43.Protocol().deserialize<T>(data, t);
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
    if (data is _i21.FriendRequestStatus) {
      return 'FriendRequestStatus';
    }
    if (data is _i22.FriendRequestAnswerResponse) {
      return 'FriendRequestAnswerResponse';
    }
    if (data is _i23.FriendRequestAnswerResponseCode) {
      return 'FriendRequestAnswerResponseCode';
    }
    if (data is _i24.FriendRequest) {
      return 'FriendRequest';
    }
    if (data is _i25.FriendshipBadge) {
      return 'FriendshipBadge';
    }
    if (data is _i26.FriendshipRemoveResponse) {
      return 'FriendshipRemoveResponse';
    }
    if (data is _i27.FriendshipRemoveResponseCode) {
      return 'FriendshipRemoveResponseCode';
    }
    if (data is _i28.Friendship) {
      return 'Friendship';
    }
    if (data is _i29.RatingType) {
      return 'RatingType';
    }
    if (data is _i30.Rating) {
      return 'Rating';
    }
    if (data is _i31.UserBadge) {
      return 'UserBadge';
    }
    if (data is _i32.PublicUser) {
      return 'PublicUser';
    }
    if (data is _i33.PublicUserFriendRequest) {
      return 'PublicUserFriendRequest';
    }
    if (data is _i34.PublicUserFriendshipDetails) {
      return 'PublicUserFriendshipDetails';
    }
    if (data is _i35.PublicUserRating) {
      return 'PublicUserRating';
    }
    if (data is _i36.PublicUserRatingUser) {
      return 'PublicUserRatingUser';
    }
    if (data is _i37.UserRatingsResponse) {
      return 'UserRatingsResponse';
    }
    if (data is _i38.UserRatingsResponseCode) {
      return 'UserRatingsResponseCode';
    }
    if (data is _i39.UserReadResponse) {
      return 'UserReadResponse';
    }
    if (data is _i40.UserReadResponseCode) {
      return 'UserReadResponseCode';
    }
    if (data is _i41.User) {
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
    if (data['className'] == 'FriendRequestStatus') {
      return deserialize<_i21.FriendRequestStatus>(data['data']);
    }
    if (data['className'] == 'FriendRequestAnswerResponse') {
      return deserialize<_i22.FriendRequestAnswerResponse>(data['data']);
    }
    if (data['className'] == 'FriendRequestAnswerResponseCode') {
      return deserialize<_i23.FriendRequestAnswerResponseCode>(data['data']);
    }
    if (data['className'] == 'FriendRequest') {
      return deserialize<_i24.FriendRequest>(data['data']);
    }
    if (data['className'] == 'FriendshipBadge') {
      return deserialize<_i25.FriendshipBadge>(data['data']);
    }
    if (data['className'] == 'FriendshipRemoveResponse') {
      return deserialize<_i26.FriendshipRemoveResponse>(data['data']);
    }
    if (data['className'] == 'FriendshipRemoveResponseCode') {
      return deserialize<_i27.FriendshipRemoveResponseCode>(data['data']);
    }
    if (data['className'] == 'Friendship') {
      return deserialize<_i28.Friendship>(data['data']);
    }
    if (data['className'] == 'RatingType') {
      return deserialize<_i29.RatingType>(data['data']);
    }
    if (data['className'] == 'Rating') {
      return deserialize<_i30.Rating>(data['data']);
    }
    if (data['className'] == 'UserBadge') {
      return deserialize<_i31.UserBadge>(data['data']);
    }
    if (data['className'] == 'PublicUser') {
      return deserialize<_i32.PublicUser>(data['data']);
    }
    if (data['className'] == 'PublicUserFriendRequest') {
      return deserialize<_i33.PublicUserFriendRequest>(data['data']);
    }
    if (data['className'] == 'PublicUserFriendshipDetails') {
      return deserialize<_i34.PublicUserFriendshipDetails>(data['data']);
    }
    if (data['className'] == 'PublicUserRating') {
      return deserialize<_i35.PublicUserRating>(data['data']);
    }
    if (data['className'] == 'PublicUserRatingUser') {
      return deserialize<_i36.PublicUserRatingUser>(data['data']);
    }
    if (data['className'] == 'UserRatingsResponse') {
      return deserialize<_i37.UserRatingsResponse>(data['data']);
    }
    if (data['className'] == 'UserRatingsResponseCode') {
      return deserialize<_i38.UserRatingsResponseCode>(data['data']);
    }
    if (data['className'] == 'UserReadResponse') {
      return deserialize<_i39.UserReadResponse>(data['data']);
    }
    if (data['className'] == 'UserReadResponseCode') {
      return deserialize<_i40.UserReadResponseCode>(data['data']);
    }
    if (data['className'] == 'User') {
      return deserialize<_i41.User>(data['data']);
    }
    return super.deserializeByClassName(data);
  }

  @override
  _i1.Table? getTableForType(Type t) {
    {
      var table = _i43.Protocol().getTableForType(t);
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
      case _i24.FriendRequest:
        return _i24.FriendRequest.t;
      case _i28.Friendship:
        return _i28.Friendship.t;
      case _i30.Rating:
        return _i30.Rating.t;
      case _i41.User:
        return _i41.User.t;
    }
    return null;
  }
}

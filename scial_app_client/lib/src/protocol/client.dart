/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'dart:async' as _i2;
import 'package:scial_app_client/src/protocol/auth/response/auth_sign_up_response.dart'
    as _i3;
import 'package:scial_app_client/src/protocol/auth/response/auth_sign_up_verification_response.dart'
    as _i4;
import 'package:scial_app_client/src/protocol/auth/response/auth_forgot_password_response.dart'
    as _i5;
import 'package:scial_app_client/src/protocol/auth/response/auth_forgot_password_verification_response.dart'
    as _i6;
import 'package:scial_app_client/src/protocol/auth/response/auth_forgot_password_submission_response.dart'
    as _i7;
import 'package:scial_app_client/src/protocol/auth/response/auth_sign_in_response.dart'
    as _i8;
import 'package:scial_app_client/src/protocol/auth/response/auth_change_password_response.dart'
    as _i9;
import 'package:scial_app_client/src/protocol/auth/response/auth_delete_account_response.dart'
    as _i10;
import 'package:scial_app_client/src/protocol/friend_request/response/friend_request_create_response.dart'
    as _i11;
import 'package:scial_app_client/src/protocol/friend_request/response/friend_request_answer_response.dart'
    as _i12;
import 'package:scial_app_client/src/protocol/friend_request/response/friend_request_take_back_response.dart'
    as _i13;
import 'package:scial_app_client/src/protocol/friendship/response/friendship_remove_response.dart'
    as _i14;
import 'package:scial_app_client/src/protocol/user/response/user_read_response.dart'
    as _i15;
import 'package:scial_app_client/src/protocol/user/response/user_update_response.dart'
    as _i16;
import 'package:scial_app_client/src/protocol/user/response/user_events_response.dart'
    as _i17;
import 'package:scial_app_client/src/protocol/user/response/user_friendships_response.dart'
    as _i18;
import 'package:scial_app_client/src/protocol/user/response/user_ratings_response.dart'
    as _i19;
import 'dart:io' as _i20;
import 'protocol.dart' as _i21;

class _EndpointAuth extends _i1.EndpointRef {
  _EndpointAuth(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'auth';

  _i2.Future<_i3.AuthSignUpResponse> signUp(
    String email,
    String password,
  ) =>
      caller.callServerEndpoint<_i3.AuthSignUpResponse>(
        'auth',
        'signUp',
        {
          'email': email,
          'password': password,
        },
      );

  _i2.Future<_i4.AuthSignUpVerificationResponse> signUpVerification(
    String email,
    String verificationCode,
  ) =>
      caller.callServerEndpoint<_i4.AuthSignUpVerificationResponse>(
        'auth',
        'signUpVerification',
        {
          'email': email,
          'verificationCode': verificationCode,
        },
      );

  _i2.Future<_i5.AuthForgotPasswordResponse> forgotPassword(String email) =>
      caller.callServerEndpoint<_i5.AuthForgotPasswordResponse>(
        'auth',
        'forgotPassword',
        {'email': email},
      );

  _i2.Future<_i6.AuthForgotPasswordVerificationResponse>
      forgotPasswordVerification(
    String email,
    String verificationCode,
  ) =>
          caller.callServerEndpoint<_i6.AuthForgotPasswordVerificationResponse>(
            'auth',
            'forgotPasswordVerification',
            {
              'email': email,
              'verificationCode': verificationCode,
            },
          );

  _i2.Future<_i7.AuthForgotPasswordSubmissionResponse> forgotPasswordSubmission(
    String email,
    String verificationCode,
    String password,
  ) =>
      caller.callServerEndpoint<_i7.AuthForgotPasswordSubmissionResponse>(
        'auth',
        'forgotPasswordSubmission',
        {
          'email': email,
          'verificationCode': verificationCode,
          'password': password,
        },
      );

  _i2.Future<_i8.AuthSignInResponse> signIn(
    String email,
    String password,
  ) =>
      caller.callServerEndpoint<_i8.AuthSignInResponse>(
        'auth',
        'signIn',
        {
          'email': email,
          'password': password,
        },
      );

  _i2.Future<_i9.AuthChangePasswordResponse> changePassword(
    String oldPassword,
    String newPassword,
  ) =>
      caller.callServerEndpoint<_i9.AuthChangePasswordResponse>(
        'auth',
        'changePassword',
        {
          'oldPassword': oldPassword,
          'newPassword': newPassword,
        },
      );

  _i2.Future<_i10.AuthDeleteAccountResponse> deleteAccount(String password) =>
      caller.callServerEndpoint<_i10.AuthDeleteAccountResponse>(
        'auth',
        'deleteAccount',
        {'password': password},
      );
}

class _EndpointFriendRequest extends _i1.EndpointRef {
  _EndpointFriendRequest(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'friendRequest';

  _i2.Future<_i11.FriendRequestCreateResponse> create(
    int userId,
    String? text,
  ) =>
      caller.callServerEndpoint<_i11.FriendRequestCreateResponse>(
        'friendRequest',
        'create',
        {
          'userId': userId,
          'text': text,
        },
      );

  _i2.Future<_i12.FriendRequestAnswerResponse> answer(
    int friendRequestId,
    bool answer,
  ) =>
      caller.callServerEndpoint<_i12.FriendRequestAnswerResponse>(
        'friendRequest',
        'answer',
        {
          'friendRequestId': friendRequestId,
          'answer': answer,
        },
      );

  _i2.Future<_i13.FriendRequestTakeBackResponse> takeBack(
          int friendRequestId) =>
      caller.callServerEndpoint<_i13.FriendRequestTakeBackResponse>(
        'friendRequest',
        'takeBack',
        {'friendRequestId': friendRequestId},
      );
}

class _EndpointFriendship extends _i1.EndpointRef {
  _EndpointFriendship(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'friendship';

  _i2.Future<_i14.FriendshipRemoveResponse> remove(int friendshipId) =>
      caller.callServerEndpoint<_i14.FriendshipRemoveResponse>(
        'friendship',
        'remove',
        {'friendshipId': friendshipId},
      );
}

class _EndpointTest extends _i1.EndpointRef {
  _EndpointTest(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'test';

  _i2.Future<void> test() => caller.callServerEndpoint<void>(
        'test',
        'test',
        {},
      );
}

class _EndpointUser extends _i1.EndpointRef {
  _EndpointUser(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'user';

  _i2.Future<_i15.UserReadResponse> read(int userId) =>
      caller.callServerEndpoint<_i15.UserReadResponse>(
        'user',
        'read',
        {'userId': userId},
      );

  _i2.Future<_i16.UserUpdateResponse> update({
    String? name,
    bool? isPrivate,
    required bool updateName,
    required bool updateIsPrivate,
  }) =>
      caller.callServerEndpoint<_i16.UserUpdateResponse>(
        'user',
        'update',
        {
          'name': name,
          'isPrivate': isPrivate,
          'updateName': updateName,
          'updateIsPrivate': updateIsPrivate,
        },
      );

  _i2.Future<_i17.UserEventsResponse> events(
    int userId,
    double? lat,
    double? long, {
    int? limit,
    int? offset,
  }) =>
      caller.callServerEndpoint<_i17.UserEventsResponse>(
        'user',
        'events',
        {
          'userId': userId,
          'lat': lat,
          'long': long,
          'limit': limit,
          'offset': offset,
        },
      );

  _i2.Future<_i18.UserFriendshipsResponse> friendships(
    int userId, {
    int? limit,
    int? offset,
  }) =>
      caller.callServerEndpoint<_i18.UserFriendshipsResponse>(
        'user',
        'friendships',
        {
          'userId': userId,
          'limit': limit,
          'offset': offset,
        },
      );

  _i2.Future<_i19.UserRatingsResponse> ratings(
    int userId, {
    int? limit,
    int? offset,
  }) =>
      caller.callServerEndpoint<_i19.UserRatingsResponse>(
        'user',
        'ratings',
        {
          'userId': userId,
          'limit': limit,
          'offset': offset,
        },
      );
}

class Client extends _i1.ServerpodClient {
  Client(
    String host, {
    _i20.SecurityContext? context,
    _i1.AuthenticationKeyManager? authenticationKeyManager,
  }) : super(
          host,
          _i21.Protocol(),
          context: context,
          authenticationKeyManager: authenticationKeyManager,
        ) {
    auth = _EndpointAuth(this);
    friendRequest = _EndpointFriendRequest(this);
    friendship = _EndpointFriendship(this);
    test = _EndpointTest(this);
    user = _EndpointUser(this);
  }

  late final _EndpointAuth auth;

  late final _EndpointFriendRequest friendRequest;

  late final _EndpointFriendship friendship;

  late final _EndpointTest test;

  late final _EndpointUser user;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {
        'auth': auth,
        'friendRequest': friendRequest,
        'friendship': friendship,
        'test': test,
        'user': user,
      };
  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup => {};
}

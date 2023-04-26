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
import 'package:scial_app_client/src/protocol/user/response/user_read_response.dart'
    as _i11;
import 'dart:io' as _i12;
import 'protocol.dart' as _i13;

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

class _EndpointUser extends _i1.EndpointRef {
  _EndpointUser(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'user';

  _i2.Future<_i11.UserReadResponse> read(int userId) =>
      caller.callServerEndpoint<_i11.UserReadResponse>(
        'user',
        'read',
        {'userId': userId},
      );
}

class Client extends _i1.ServerpodClient {
  Client(
    String host, {
    _i12.SecurityContext? context,
    _i1.AuthenticationKeyManager? authenticationKeyManager,
  }) : super(
          host,
          _i13.Protocol(),
          context: context,
          authenticationKeyManager: authenticationKeyManager,
        ) {
    auth = _EndpointAuth(this);
    user = _EndpointUser(this);
  }

  late final _EndpointAuth auth;

  late final _EndpointUser user;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {
        'auth': auth,
        'user': user,
      };
  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup => {};
}

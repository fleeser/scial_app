/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../endpoints/auth_endpoint.dart' as _i2;
import '../endpoints/friend_request_endpoint.dart' as _i3;
import '../endpoints/friendship_endpoint.dart' as _i4;
import '../endpoints/notification_endpoint.dart' as _i5;
import '../endpoints/test_endpoint.dart' as _i6;
import '../endpoints/user_endpoint.dart' as _i7;

class Endpoints extends _i1.EndpointDispatch {
  @override
  void initializeEndpoints(_i1.Server server) {
    var endpoints = <String, _i1.Endpoint>{
      'auth': _i2.AuthEndpoint()
        ..initialize(
          server,
          'auth',
          null,
        ),
      'friendRequest': _i3.FriendRequestEndpoint()
        ..initialize(
          server,
          'friendRequest',
          null,
        ),
      'friendship': _i4.FriendshipEndpoint()
        ..initialize(
          server,
          'friendship',
          null,
        ),
      'notification': _i5.NotificationEndpoint()
        ..initialize(
          server,
          'notification',
          null,
        ),
      'test': _i6.TestEndpoint()
        ..initialize(
          server,
          'test',
          null,
        ),
      'user': _i7.UserEndpoint()
        ..initialize(
          server,
          'user',
          null,
        ),
    };
    connectors['auth'] = _i1.EndpointConnector(
      name: 'auth',
      endpoint: endpoints['auth']!,
      methodConnectors: {
        'signUp': _i1.MethodConnector(
          name: 'signUp',
          params: {
            'email': _i1.ParameterDescription(
              name: 'email',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'password': _i1.ParameterDescription(
              name: 'password',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['auth'] as _i2.AuthEndpoint).signUp(
            session,
            params['email'],
            params['password'],
          ),
        ),
        'signUpVerification': _i1.MethodConnector(
          name: 'signUpVerification',
          params: {
            'email': _i1.ParameterDescription(
              name: 'email',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'verificationCode': _i1.ParameterDescription(
              name: 'verificationCode',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['auth'] as _i2.AuthEndpoint).signUpVerification(
            session,
            params['email'],
            params['verificationCode'],
          ),
        ),
        'forgotPassword': _i1.MethodConnector(
          name: 'forgotPassword',
          params: {
            'email': _i1.ParameterDescription(
              name: 'email',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['auth'] as _i2.AuthEndpoint).forgotPassword(
            session,
            params['email'],
          ),
        ),
        'forgotPasswordVerification': _i1.MethodConnector(
          name: 'forgotPasswordVerification',
          params: {
            'email': _i1.ParameterDescription(
              name: 'email',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'verificationCode': _i1.ParameterDescription(
              name: 'verificationCode',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['auth'] as _i2.AuthEndpoint)
                  .forgotPasswordVerification(
            session,
            params['email'],
            params['verificationCode'],
          ),
        ),
        'forgotPasswordSubmission': _i1.MethodConnector(
          name: 'forgotPasswordSubmission',
          params: {
            'email': _i1.ParameterDescription(
              name: 'email',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'verificationCode': _i1.ParameterDescription(
              name: 'verificationCode',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'password': _i1.ParameterDescription(
              name: 'password',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['auth'] as _i2.AuthEndpoint).forgotPasswordSubmission(
            session,
            params['email'],
            params['verificationCode'],
            params['password'],
          ),
        ),
        'signIn': _i1.MethodConnector(
          name: 'signIn',
          params: {
            'email': _i1.ParameterDescription(
              name: 'email',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'password': _i1.ParameterDescription(
              name: 'password',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['auth'] as _i2.AuthEndpoint).signIn(
            session,
            params['email'],
            params['password'],
          ),
        ),
        'changePassword': _i1.MethodConnector(
          name: 'changePassword',
          params: {
            'oldPassword': _i1.ParameterDescription(
              name: 'oldPassword',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'newPassword': _i1.ParameterDescription(
              name: 'newPassword',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['auth'] as _i2.AuthEndpoint).changePassword(
            session,
            params['oldPassword'],
            params['newPassword'],
          ),
        ),
        'deleteAccount': _i1.MethodConnector(
          name: 'deleteAccount',
          params: {
            'password': _i1.ParameterDescription(
              name: 'password',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['auth'] as _i2.AuthEndpoint).deleteAccount(
            session,
            params['password'],
          ),
        ),
      },
    );
    connectors['friendRequest'] = _i1.EndpointConnector(
      name: 'friendRequest',
      endpoint: endpoints['friendRequest']!,
      methodConnectors: {
        'create': _i1.MethodConnector(
          name: 'create',
          params: {
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'text': _i1.ParameterDescription(
              name: 'text',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['friendRequest'] as _i3.FriendRequestEndpoint).create(
            session,
            params['userId'],
            params['text'],
          ),
        ),
        'answer': _i1.MethodConnector(
          name: 'answer',
          params: {
            'friendRequestId': _i1.ParameterDescription(
              name: 'friendRequestId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'answer': _i1.ParameterDescription(
              name: 'answer',
              type: _i1.getType<bool>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['friendRequest'] as _i3.FriendRequestEndpoint).answer(
            session,
            params['friendRequestId'],
            params['answer'],
          ),
        ),
        'takeBack': _i1.MethodConnector(
          name: 'takeBack',
          params: {
            'friendRequestId': _i1.ParameterDescription(
              name: 'friendRequestId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['friendRequest'] as _i3.FriendRequestEndpoint)
                  .takeBack(
            session,
            params['friendRequestId'],
          ),
        ),
      },
    );
    connectors['friendship'] = _i1.EndpointConnector(
      name: 'friendship',
      endpoint: endpoints['friendship']!,
      methodConnectors: {
        'remove': _i1.MethodConnector(
          name: 'remove',
          params: {
            'friendshipId': _i1.ParameterDescription(
              name: 'friendshipId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['friendship'] as _i4.FriendshipEndpoint).remove(
            session,
            params['friendshipId'],
          ),
        )
      },
    );
    connectors['notification'] = _i1.EndpointConnector(
      name: 'notification',
      endpoint: endpoints['notification']!,
      methodConnectors: {
        'read': _i1.MethodConnector(
          name: 'read',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['notification'] as _i5.NotificationEndpoint)
                  .read(session),
        ),
        'setRead': _i1.MethodConnector(
          name: 'setRead',
          params: {
            'notificationId': _i1.ParameterDescription(
              name: 'notificationId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['notification'] as _i5.NotificationEndpoint).setRead(
            session,
            params['notificationId'],
          ),
        ),
        'setAllRead': _i1.MethodConnector(
          name: 'setAllRead',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['notification'] as _i5.NotificationEndpoint)
                  .setAllRead(session),
        ),
      },
    );
    connectors['test'] = _i1.EndpointConnector(
      name: 'test',
      endpoint: endpoints['test']!,
      methodConnectors: {
        'test': _i1.MethodConnector(
          name: 'test',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['test'] as _i6.TestEndpoint).test(session),
        )
      },
    );
    connectors['user'] = _i1.EndpointConnector(
      name: 'user',
      endpoint: endpoints['user']!,
      methodConnectors: {
        'read': _i1.MethodConnector(
          name: 'read',
          params: {
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['user'] as _i7.UserEndpoint).read(
            session,
            params['userId'],
          ),
        ),
        'update': _i1.MethodConnector(
          name: 'update',
          params: {
            'name': _i1.ParameterDescription(
              name: 'name',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
            'isPrivate': _i1.ParameterDescription(
              name: 'isPrivate',
              type: _i1.getType<bool?>(),
              nullable: true,
            ),
            'updateName': _i1.ParameterDescription(
              name: 'updateName',
              type: _i1.getType<bool>(),
              nullable: false,
            ),
            'updateIsPrivate': _i1.ParameterDescription(
              name: 'updateIsPrivate',
              type: _i1.getType<bool>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['user'] as _i7.UserEndpoint).update(
            session,
            name: params['name'],
            isPrivate: params['isPrivate'],
            updateName: params['updateName'],
            updateIsPrivate: params['updateIsPrivate'],
          ),
        ),
        'events': _i1.MethodConnector(
          name: 'events',
          params: {
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'lat': _i1.ParameterDescription(
              name: 'lat',
              type: _i1.getType<double?>(),
              nullable: true,
            ),
            'long': _i1.ParameterDescription(
              name: 'long',
              type: _i1.getType<double?>(),
              nullable: true,
            ),
            'limit': _i1.ParameterDescription(
              name: 'limit',
              type: _i1.getType<int?>(),
              nullable: true,
            ),
            'offset': _i1.ParameterDescription(
              name: 'offset',
              type: _i1.getType<int?>(),
              nullable: true,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['user'] as _i7.UserEndpoint).events(
            session,
            params['userId'],
            params['lat'],
            params['long'],
            limit: params['limit'],
            offset: params['offset'],
          ),
        ),
        'friendships': _i1.MethodConnector(
          name: 'friendships',
          params: {
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'limit': _i1.ParameterDescription(
              name: 'limit',
              type: _i1.getType<int?>(),
              nullable: true,
            ),
            'offset': _i1.ParameterDescription(
              name: 'offset',
              type: _i1.getType<int?>(),
              nullable: true,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['user'] as _i7.UserEndpoint).friendships(
            session,
            params['userId'],
            limit: params['limit'],
            offset: params['offset'],
          ),
        ),
        'ratings': _i1.MethodConnector(
          name: 'ratings',
          params: {
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'limit': _i1.ParameterDescription(
              name: 'limit',
              type: _i1.getType<int?>(),
              nullable: true,
            ),
            'offset': _i1.ParameterDescription(
              name: 'offset',
              type: _i1.getType<int?>(),
              nullable: true,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['user'] as _i7.UserEndpoint).ratings(
            session,
            params['userId'],
            limit: params['limit'],
            offset: params['offset'],
          ),
        ),
      },
    );
  }
}

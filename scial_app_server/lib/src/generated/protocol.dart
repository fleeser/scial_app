/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

library protocol; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:serverpod/serverpod.dart' as _i1;
import 'package:serverpod/protocol.dart' as _i2;
import 'auth/response/auth_change_password_response.dart' as _i3;
import 'auth/response/auth_change_password_response_code.dart' as _i4;
import 'auth/response/auth_delete_account_response.dart' as _i5;
import 'auth/response/auth_delete_account_response_code.dart' as _i6;
import 'auth/response/auth_forgot_password_response.dart' as _i7;
import 'auth/response/auth_forgot_password_response_code.dart' as _i8;
import 'auth/response/auth_forgot_password_submission_response.dart' as _i9;
import 'auth/response/auth_forgot_password_submission_response_code.dart'
    as _i10;
import 'auth/response/auth_forgot_password_verification_response.dart' as _i11;
import 'auth/response/auth_forgot_password_verification_response_code.dart'
    as _i12;
import 'auth/response/auth_sign_in_response.dart' as _i13;
import 'auth/response/auth_sign_in_response_code.dart' as _i14;
import 'auth/response/auth_sign_up_response.dart' as _i15;
import 'auth/response/auth_sign_up_response_code.dart' as _i16;
import 'auth/response/auth_sign_up_verification_response.dart' as _i17;
import 'auth/response/auth_sign_up_verification_response_code.dart' as _i18;
import 'auth/table/auth_email.dart' as _i19;
import 'auth/table/auth_forgot_password_request.dart' as _i20;
import 'auth/table/auth_sign_up_request.dart' as _i21;
import 'counter/table/counter.dart' as _i22;
import 'discover/response/discover_read_response.dart' as _i23;
import 'discover/response/discover_read_response_code.dart' as _i24;
import 'event/enum/event_guest_invitation_status.dart' as _i25;
import 'event/enum/event_guest_request_status.dart' as _i26;
import 'event/enum/event_guest_suggestion_status.dart' as _i27;
import 'event/enum/event_host_invitation_status.dart' as _i28;
import 'event/enum/event_host_request_status.dart' as _i29;
import 'event/enum/event_host_suggestion_status.dart' as _i30;
import 'event/enum/event_type.dart' as _i31;
import 'event/enum/event_visibility.dart' as _i32;
import 'event/model/public_event.dart' as _i33;
import 'event/model/public_event_full_guest.dart' as _i34;
import 'event/model/public_event_full_guest_user.dart' as _i35;
import 'event/model/public_event_host.dart' as _i36;
import 'event/model/public_event_location.dart' as _i37;
import 'event/response/event_create_response.dart' as _i38;
import 'event/response/event_create_response_code.dart' as _i39;
import 'event/response/event_guests_response.dart' as _i40;
import 'event/response/event_guests_response_code.dart' as _i41;
import 'event/table/event.dart' as _i42;
import 'event/table/event_guest.dart' as _i43;
import 'event/table/event_guest_invitation.dart' as _i44;
import 'event/table/event_guest_request.dart' as _i45;
import 'event/table/event_guest_suggestion.dart' as _i46;
import 'event/table/event_host.dart' as _i47;
import 'event/table/event_host_invitation.dart' as _i48;
import 'event/table/event_host_request.dart' as _i49;
import 'event/table/event_host_suggestion.dart' as _i50;
import 'friend_request/enum/friend_request_status.dart' as _i51;
import 'friend_request/response/friend_request_answer_response.dart' as _i52;
import 'friend_request/response/friend_request_answer_response_code.dart'
    as _i53;
import 'friend_request/response/friend_request_create_response.dart' as _i54;
import 'friend_request/response/friend_request_create_response_code.dart'
    as _i55;
import 'friend_request/response/friend_request_take_back_response.dart' as _i56;
import 'friend_request/response/friend_request_take_back_response_code.dart'
    as _i57;
import 'friend_request/table/friend_request.dart' as _i58;
import 'friendship/enum/friendship_badge.dart' as _i59;
import 'friendship/response/friendship_remove_response.dart' as _i60;
import 'friendship/response/friendship_remove_response_code.dart' as _i61;
import 'friendship/table/friendship.dart' as _i62;
import 'notification/enum/notification_type.dart' as _i63;
import 'notification/model/public_notification.dart' as _i64;
import 'notification/model/public_notification_data_friend_request_accepted.dart'
    as _i65;
import 'notification/model/public_notification_data_friend_request_accepted_sender.dart'
    as _i66;
import 'notification/model/public_notification_data_friend_request_created.dart'
    as _i67;
import 'notification/model/public_notification_data_friend_request_created_sender.dart'
    as _i68;
import 'notification/model/public_notification_data_friend_request_denied.dart'
    as _i69;
import 'notification/model/public_notification_data_friend_request_denied_sender.dart'
    as _i70;
import 'notification/response/notification_read_response.dart' as _i71;
import 'notification/response/notification_read_response_code.dart' as _i72;
import 'notification/response/notification_set_all_read_response.dart' as _i73;
import 'notification/response/notification_set_all_read_response_code.dart'
    as _i74;
import 'notification/response/notification_set_read_response.dart' as _i75;
import 'notification/response/notification_set_read_response_code.dart' as _i76;
import 'notification/table/notification.dart' as _i77;
import 'rating/enum/rating_type.dart' as _i78;
import 'rating/table/rating.dart' as _i79;
import 'user/enum/user_badge.dart' as _i80;
import 'user/model/public_user.dart' as _i81;
import 'user/model/public_user_friend_request.dart' as _i82;
import 'user/model/public_user_friendship.dart' as _i83;
import 'user/model/public_user_friendship_details.dart' as _i84;
import 'user/model/public_user_friendship_user.dart' as _i85;
import 'user/model/public_user_rating.dart' as _i86;
import 'user/model/public_user_rating_user.dart' as _i87;
import 'user/model/public_user_search_user.dart' as _i88;
import 'user/response/user_events_reponse_code.dart' as _i89;
import 'user/response/user_events_response.dart' as _i90;
import 'user/response/user_friendships_response.dart' as _i91;
import 'user/response/user_friendships_response_code.dart' as _i92;
import 'user/response/user_ratings_response.dart' as _i93;
import 'user/response/user_ratings_response_code.dart' as _i94;
import 'user/response/user_read_response.dart' as _i95;
import 'user/response/user_read_response_code.dart' as _i96;
import 'user/response/user_search_response.dart' as _i97;
import 'user/response/user_search_response_code.dart' as _i98;
import 'user/response/user_update_response.dart' as _i99;
import 'user/response/user_update_response_code.dart' as _i100;
import 'user/table/user.dart' as _i101;
import 'protocol.dart' as _i102;
import 'package:scial_app_server/src/generated/event/enum/event_type.dart'
    as _i103;
import 'package:scial_app_server/src/generated/event/enum/event_visibility.dart'
    as _i104;
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
export 'event/enum/event_guest_invitation_status.dart';
export 'event/enum/event_guest_request_status.dart';
export 'event/enum/event_guest_suggestion_status.dart';
export 'event/enum/event_host_invitation_status.dart';
export 'event/enum/event_host_request_status.dart';
export 'event/enum/event_host_suggestion_status.dart';
export 'event/enum/event_type.dart';
export 'event/enum/event_visibility.dart';
export 'event/model/public_event.dart';
export 'event/model/public_event_full_guest.dart';
export 'event/model/public_event_full_guest_user.dart';
export 'event/model/public_event_host.dart';
export 'event/model/public_event_location.dart';
export 'event/response/event_create_response.dart';
export 'event/response/event_create_response_code.dart';
export 'event/response/event_guests_response.dart';
export 'event/response/event_guests_response_code.dart';
export 'event/table/event.dart';
export 'event/table/event_guest.dart';
export 'event/table/event_guest_invitation.dart';
export 'event/table/event_guest_request.dart';
export 'event/table/event_guest_suggestion.dart';
export 'event/table/event_host.dart';
export 'event/table/event_host_invitation.dart';
export 'event/table/event_host_request.dart';
export 'event/table/event_host_suggestion.dart';
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
export 'notification/model/public_notification.dart';
export 'notification/model/public_notification_data_friend_request_accepted.dart';
export 'notification/model/public_notification_data_friend_request_accepted_sender.dart';
export 'notification/model/public_notification_data_friend_request_created.dart';
export 'notification/model/public_notification_data_friend_request_created_sender.dart';
export 'notification/model/public_notification_data_friend_request_denied.dart';
export 'notification/model/public_notification_data_friend_request_denied_sender.dart';
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
export 'user/model/public_user_search_user.dart';
export 'user/response/user_events_reponse_code.dart';
export 'user/response/user_events_response.dart';
export 'user/response/user_friendships_response.dart';
export 'user/response/user_friendships_response_code.dart';
export 'user/response/user_ratings_response.dart';
export 'user/response/user_ratings_response_code.dart';
export 'user/response/user_read_response.dart';
export 'user/response/user_read_response_code.dart';
export 'user/response/user_search_response.dart';
export 'user/response/user_search_response_code.dart';
export 'user/response/user_update_response.dart';
export 'user/response/user_update_response_code.dart';
export 'user/table/user.dart';

class Protocol extends _i1.SerializationManagerServer {
  Protocol._();

  factory Protocol() => _instance;

  static final Map<Type, _i1.constructor> customConstructors = {};

  static final Protocol _instance = Protocol._();

  static final targetDatabaseDefinition = _i2.DatabaseDefinition(tables: [
    _i2.TableDefinition(
      name: 'auth_email',
      schema: 'public',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'auth_email_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'userId',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'email',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'hash',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'auth_email_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'auth_email_email_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'email',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'auth_forgot_password_request',
      schema: 'public',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int?',
          columnDefault:
              'nextval(\'auth_forgot_password_request_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'email',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'verificationCode',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'auth_forgot_password_request_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'auth_forgot_password_request_email_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'email',
            )
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
        _i2.IndexDefinition(
          indexName: 'auth_forgot_password_request_verification_code_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'verificationCode',
            )
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'auth_sign_up_request',
      schema: 'public',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'auth_sign_up_request_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'email',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'hash',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'verificationCode',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'auth_sign_up_request_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'auth_sign_up_request_email_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'email',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'counters',
      schema: 'public',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'counters_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'value',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'counters_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'events',
      schema: 'public',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'events_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'type',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'protocol:EventType',
        ),
        _i2.ColumnDefinition(
          name: 'visibility',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'protocol:EventVisibility',
        ),
        _i2.ColumnDefinition(
          name: 'created',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'title',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'verified',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
        ),
        _i2.ColumnDefinition(
          name: 'lat',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: false,
          dartType: 'double',
        ),
        _i2.ColumnDefinition(
          name: 'long',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: false,
          dartType: 'double',
        ),
        _i2.ColumnDefinition(
          name: 'description',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'start',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'end',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'imageUrl',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'events_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'event_guests',
      schema: 'public',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'event_guests_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'user',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'event',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'created',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'event_guests_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'event_guest_invitations',
      schema: 'public',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int?',
          columnDefault:
              'nextval(\'event_guest_invitations_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'user',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'sender',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'event',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'created',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'text',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'status',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'protocol:EventGuestInvitationStatus',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'event_guest_invitations_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'event_guest_requests',
      schema: 'public',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'event_guest_requests_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'user',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'companions',
          columnType: _i2.ColumnType.json,
          isNullable: false,
          dartType: 'List<int>',
        ),
        _i2.ColumnDefinition(
          name: 'event',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'created',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'text',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'status',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'protocol:EventGuestRequestStatus',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'event_guest_requests_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'event_guest_suggestions',
      schema: 'public',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int?',
          columnDefault:
              'nextval(\'event_guest_suggestions_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'sender',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'users',
          columnType: _i2.ColumnType.json,
          isNullable: false,
          dartType: 'List<int>',
        ),
        _i2.ColumnDefinition(
          name: 'event',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'created',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'text',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'status',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'protocol:EventGuestSuggestionStatus',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'event_guest_suggestions_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'event_hosts',
      schema: 'public',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'event_hosts_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'user',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'event',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'event_hosts_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'event_host_invitations',
      schema: 'public',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'event_host_invitations_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'user',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'sender',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'event',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'created',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'text',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'status',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'protocol:EventHostInvitationStatus',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'event_host_invitations_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'event_host_requests',
      schema: 'public',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'event_host_requests_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'user',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'companions',
          columnType: _i2.ColumnType.json,
          isNullable: false,
          dartType: 'List<int>',
        ),
        _i2.ColumnDefinition(
          name: 'event',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'created',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'text',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'status',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'protocol:EventHostRequestStatus',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'event_host_requests_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'event_host_suggestions',
      schema: 'public',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'event_host_suggestions_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'sender',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'users',
          columnType: _i2.ColumnType.json,
          isNullable: false,
          dartType: 'List<int>',
        ),
        _i2.ColumnDefinition(
          name: 'event',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'created',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'text',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'status',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'protocol:EventHostSuggestionStatus',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'event_host_suggestions_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'friend_requests',
      schema: 'public',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'friend_requests_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'sender',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'receiver',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'text',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'status',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'protocol:FriendRequestStatus',
        ),
        _i2.ColumnDefinition(
          name: 'created',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'friend_requests_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'friendships',
      schema: 'public',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'friendships_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'users',
          columnType: _i2.ColumnType.json,
          isNullable: false,
          dartType: 'List<int>',
        ),
        _i2.ColumnDefinition(
          name: 'created',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'badges',
          columnType: _i2.ColumnType.json,
          isNullable: false,
          dartType: 'List<protocol:FriendshipBadge>',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'friendships_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'notifications',
      schema: 'public',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'notifications_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'created',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'type',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'protocol:NotificationType',
        ),
        _i2.ColumnDefinition(
          name: 'read',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
        ),
        _i2.ColumnDefinition(
          name: 'receiver',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'ref',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'notifications_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'ratings',
      schema: 'public',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'ratings_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'created',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'type',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'protocol:RatingType',
        ),
        _i2.ColumnDefinition(
          name: 'sender',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'receiver',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'stars',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'text',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'ratings_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'users',
      schema: 'public',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'users_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'name',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'created',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'imageUrl',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'verified',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
        ),
        _i2.ColumnDefinition(
          name: 'private',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
        ),
        _i2.ColumnDefinition(
          name: 'badges',
          columnType: _i2.ColumnType.json,
          isNullable: false,
          dartType: 'List<protocol:UserBadge>',
        ),
        _i2.ColumnDefinition(
          name: 'uniqueCode',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'users_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    ..._i2.Protocol.targetDatabaseDefinition.tables,
  ]);

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    if (customConstructors.containsKey(t)) {
      return customConstructors[t]!(data, this) as T;
    }
    if (t == _i3.AuthChangePasswordResponse) {
      return _i3.AuthChangePasswordResponse.fromJson(data, this) as T;
    }
    if (t == _i4.AuthChangePasswordResponseCode) {
      return _i4.AuthChangePasswordResponseCode.fromJson(data) as T;
    }
    if (t == _i5.AuthDeleteAccountResponse) {
      return _i5.AuthDeleteAccountResponse.fromJson(data, this) as T;
    }
    if (t == _i6.AuthDeleteAccountResponseCode) {
      return _i6.AuthDeleteAccountResponseCode.fromJson(data) as T;
    }
    if (t == _i7.AuthForgotPasswordResponse) {
      return _i7.AuthForgotPasswordResponse.fromJson(data, this) as T;
    }
    if (t == _i8.AuthForgotPasswordResponseCode) {
      return _i8.AuthForgotPasswordResponseCode.fromJson(data) as T;
    }
    if (t == _i9.AuthForgotPasswordSubmissionResponse) {
      return _i9.AuthForgotPasswordSubmissionResponse.fromJson(data, this) as T;
    }
    if (t == _i10.AuthForgotPasswordSubmissionResponseCode) {
      return _i10.AuthForgotPasswordSubmissionResponseCode.fromJson(data) as T;
    }
    if (t == _i11.AuthForgotPasswordVerificationResponse) {
      return _i11.AuthForgotPasswordVerificationResponse.fromJson(data, this)
          as T;
    }
    if (t == _i12.AuthForgotPasswordVerificationResponseCode) {
      return _i12.AuthForgotPasswordVerificationResponseCode.fromJson(data)
          as T;
    }
    if (t == _i13.AuthSignInResponse) {
      return _i13.AuthSignInResponse.fromJson(data, this) as T;
    }
    if (t == _i14.AuthSignInResponseCode) {
      return _i14.AuthSignInResponseCode.fromJson(data) as T;
    }
    if (t == _i15.AuthSignUpResponse) {
      return _i15.AuthSignUpResponse.fromJson(data, this) as T;
    }
    if (t == _i16.AuthSignUpResponseCode) {
      return _i16.AuthSignUpResponseCode.fromJson(data) as T;
    }
    if (t == _i17.AuthSignUpVerificationResponse) {
      return _i17.AuthSignUpVerificationResponse.fromJson(data, this) as T;
    }
    if (t == _i18.AuthSignUpVerificationResponseCode) {
      return _i18.AuthSignUpVerificationResponseCode.fromJson(data) as T;
    }
    if (t == _i19.AuthEmail) {
      return _i19.AuthEmail.fromJson(data, this) as T;
    }
    if (t == _i20.AuthForgotPasswordRequest) {
      return _i20.AuthForgotPasswordRequest.fromJson(data, this) as T;
    }
    if (t == _i21.AuthSignUpRequest) {
      return _i21.AuthSignUpRequest.fromJson(data, this) as T;
    }
    if (t == _i22.Counter) {
      return _i22.Counter.fromJson(data, this) as T;
    }
    if (t == _i23.DiscoverReadResponse) {
      return _i23.DiscoverReadResponse.fromJson(data, this) as T;
    }
    if (t == _i24.DiscoverReadResponseCode) {
      return _i24.DiscoverReadResponseCode.fromJson(data) as T;
    }
    if (t == _i25.EventGuestInvitationStatus) {
      return _i25.EventGuestInvitationStatus.fromJson(data) as T;
    }
    if (t == _i26.EventGuestRequestStatus) {
      return _i26.EventGuestRequestStatus.fromJson(data) as T;
    }
    if (t == _i27.EventGuestSuggestionStatus) {
      return _i27.EventGuestSuggestionStatus.fromJson(data) as T;
    }
    if (t == _i28.EventHostInvitationStatus) {
      return _i28.EventHostInvitationStatus.fromJson(data) as T;
    }
    if (t == _i29.EventHostRequestStatus) {
      return _i29.EventHostRequestStatus.fromJson(data) as T;
    }
    if (t == _i30.EventHostSuggestionStatus) {
      return _i30.EventHostSuggestionStatus.fromJson(data) as T;
    }
    if (t == _i31.EventType) {
      return _i31.EventType.fromJson(data) as T;
    }
    if (t == _i32.EventVisibility) {
      return _i32.EventVisibility.fromJson(data) as T;
    }
    if (t == _i33.PublicEvent) {
      return _i33.PublicEvent.fromJson(data, this) as T;
    }
    if (t == _i34.PublicEventFullGuest) {
      return _i34.PublicEventFullGuest.fromJson(data, this) as T;
    }
    if (t == _i35.PublicEventFullGuestUser) {
      return _i35.PublicEventFullGuestUser.fromJson(data, this) as T;
    }
    if (t == _i36.PublicEventHost) {
      return _i36.PublicEventHost.fromJson(data, this) as T;
    }
    if (t == _i37.PublicEventLocation) {
      return _i37.PublicEventLocation.fromJson(data, this) as T;
    }
    if (t == _i38.EventCreateResponse) {
      return _i38.EventCreateResponse.fromJson(data, this) as T;
    }
    if (t == _i39.EventCreateResponseCode) {
      return _i39.EventCreateResponseCode.fromJson(data) as T;
    }
    if (t == _i40.EventGuestsResponse) {
      return _i40.EventGuestsResponse.fromJson(data, this) as T;
    }
    if (t == _i41.EventGuestsResponseCode) {
      return _i41.EventGuestsResponseCode.fromJson(data) as T;
    }
    if (t == _i42.Event) {
      return _i42.Event.fromJson(data, this) as T;
    }
    if (t == _i43.EventGuest) {
      return _i43.EventGuest.fromJson(data, this) as T;
    }
    if (t == _i44.EventGuestInvitation) {
      return _i44.EventGuestInvitation.fromJson(data, this) as T;
    }
    if (t == _i45.EventGuestRequest) {
      return _i45.EventGuestRequest.fromJson(data, this) as T;
    }
    if (t == _i46.EventGuestSuggestion) {
      return _i46.EventGuestSuggestion.fromJson(data, this) as T;
    }
    if (t == _i47.EventHost) {
      return _i47.EventHost.fromJson(data, this) as T;
    }
    if (t == _i48.EventHostInvitation) {
      return _i48.EventHostInvitation.fromJson(data, this) as T;
    }
    if (t == _i49.EventHostRequest) {
      return _i49.EventHostRequest.fromJson(data, this) as T;
    }
    if (t == _i50.EventHostSuggestion) {
      return _i50.EventHostSuggestion.fromJson(data, this) as T;
    }
    if (t == _i51.FriendRequestStatus) {
      return _i51.FriendRequestStatus.fromJson(data) as T;
    }
    if (t == _i52.FriendRequestAnswerResponse) {
      return _i52.FriendRequestAnswerResponse.fromJson(data, this) as T;
    }
    if (t == _i53.FriendRequestAnswerResponseCode) {
      return _i53.FriendRequestAnswerResponseCode.fromJson(data) as T;
    }
    if (t == _i54.FriendRequestCreateResponse) {
      return _i54.FriendRequestCreateResponse.fromJson(data, this) as T;
    }
    if (t == _i55.FriendRequestCreateResponseCode) {
      return _i55.FriendRequestCreateResponseCode.fromJson(data) as T;
    }
    if (t == _i56.FriendRequestTakeBackResponse) {
      return _i56.FriendRequestTakeBackResponse.fromJson(data, this) as T;
    }
    if (t == _i57.FriendRequestTakeBackResponseCode) {
      return _i57.FriendRequestTakeBackResponseCode.fromJson(data) as T;
    }
    if (t == _i58.FriendRequest) {
      return _i58.FriendRequest.fromJson(data, this) as T;
    }
    if (t == _i59.FriendshipBadge) {
      return _i59.FriendshipBadge.fromJson(data) as T;
    }
    if (t == _i60.FriendshipRemoveResponse) {
      return _i60.FriendshipRemoveResponse.fromJson(data, this) as T;
    }
    if (t == _i61.FriendshipRemoveResponseCode) {
      return _i61.FriendshipRemoveResponseCode.fromJson(data) as T;
    }
    if (t == _i62.Friendship) {
      return _i62.Friendship.fromJson(data, this) as T;
    }
    if (t == _i63.NotificationType) {
      return _i63.NotificationType.fromJson(data) as T;
    }
    if (t == _i64.PublicNotification) {
      return _i64.PublicNotification.fromJson(data, this) as T;
    }
    if (t == _i65.PublicNotificationDataFriendRequestAccepted) {
      return _i65.PublicNotificationDataFriendRequestAccepted.fromJson(
          data, this) as T;
    }
    if (t == _i66.PublicNotificationDataFriendRequestAcceptedSender) {
      return _i66.PublicNotificationDataFriendRequestAcceptedSender.fromJson(
          data, this) as T;
    }
    if (t == _i67.PublicNotificationDataFriendRequestCreated) {
      return _i67.PublicNotificationDataFriendRequestCreated.fromJson(
          data, this) as T;
    }
    if (t == _i68.PublicNotificationDataFriendRequestCreatedSender) {
      return _i68.PublicNotificationDataFriendRequestCreatedSender.fromJson(
          data, this) as T;
    }
    if (t == _i69.PublicNotificationDataFriendRequestDenied) {
      return _i69.PublicNotificationDataFriendRequestDenied.fromJson(data, this)
          as T;
    }
    if (t == _i70.PublicNotificationDataFriendRequestDeniedSender) {
      return _i70.PublicNotificationDataFriendRequestDeniedSender.fromJson(
          data, this) as T;
    }
    if (t == _i71.NotificationReadResponse) {
      return _i71.NotificationReadResponse.fromJson(data, this) as T;
    }
    if (t == _i72.NotificationReadResponseCode) {
      return _i72.NotificationReadResponseCode.fromJson(data) as T;
    }
    if (t == _i73.NotificationSetAllReadResponse) {
      return _i73.NotificationSetAllReadResponse.fromJson(data, this) as T;
    }
    if (t == _i74.NotificationSetAllReadResponseCode) {
      return _i74.NotificationSetAllReadResponseCode.fromJson(data) as T;
    }
    if (t == _i75.NotificationSetReadResponse) {
      return _i75.NotificationSetReadResponse.fromJson(data, this) as T;
    }
    if (t == _i76.NotificationSetReadResponseCode) {
      return _i76.NotificationSetReadResponseCode.fromJson(data) as T;
    }
    if (t == _i77.Notification) {
      return _i77.Notification.fromJson(data, this) as T;
    }
    if (t == _i78.RatingType) {
      return _i78.RatingType.fromJson(data) as T;
    }
    if (t == _i79.Rating) {
      return _i79.Rating.fromJson(data, this) as T;
    }
    if (t == _i80.UserBadge) {
      return _i80.UserBadge.fromJson(data) as T;
    }
    if (t == _i81.PublicUser) {
      return _i81.PublicUser.fromJson(data, this) as T;
    }
    if (t == _i82.PublicUserFriendRequest) {
      return _i82.PublicUserFriendRequest.fromJson(data, this) as T;
    }
    if (t == _i83.PublicUserFriendship) {
      return _i83.PublicUserFriendship.fromJson(data, this) as T;
    }
    if (t == _i84.PublicUserFriendshipDetails) {
      return _i84.PublicUserFriendshipDetails.fromJson(data, this) as T;
    }
    if (t == _i85.PublicUserFriendshipUser) {
      return _i85.PublicUserFriendshipUser.fromJson(data, this) as T;
    }
    if (t == _i86.PublicUserRating) {
      return _i86.PublicUserRating.fromJson(data, this) as T;
    }
    if (t == _i87.PublicUserRatingUser) {
      return _i87.PublicUserRatingUser.fromJson(data, this) as T;
    }
    if (t == _i88.PublicUserSearchUser) {
      return _i88.PublicUserSearchUser.fromJson(data, this) as T;
    }
    if (t == _i89.UserEventsResponseCode) {
      return _i89.UserEventsResponseCode.fromJson(data) as T;
    }
    if (t == _i90.UserEventsResponse) {
      return _i90.UserEventsResponse.fromJson(data, this) as T;
    }
    if (t == _i91.UserFriendshipsResponse) {
      return _i91.UserFriendshipsResponse.fromJson(data, this) as T;
    }
    if (t == _i92.UserFriendshipsResponseCode) {
      return _i92.UserFriendshipsResponseCode.fromJson(data) as T;
    }
    if (t == _i93.UserRatingsResponse) {
      return _i93.UserRatingsResponse.fromJson(data, this) as T;
    }
    if (t == _i94.UserRatingsResponseCode) {
      return _i94.UserRatingsResponseCode.fromJson(data) as T;
    }
    if (t == _i95.UserReadResponse) {
      return _i95.UserReadResponse.fromJson(data, this) as T;
    }
    if (t == _i96.UserReadResponseCode) {
      return _i96.UserReadResponseCode.fromJson(data) as T;
    }
    if (t == _i97.UserSearchResponse) {
      return _i97.UserSearchResponse.fromJson(data, this) as T;
    }
    if (t == _i98.UserSearchResponseCode) {
      return _i98.UserSearchResponseCode.fromJson(data) as T;
    }
    if (t == _i99.UserUpdateResponse) {
      return _i99.UserUpdateResponse.fromJson(data, this) as T;
    }
    if (t == _i100.UserUpdateResponseCode) {
      return _i100.UserUpdateResponseCode.fromJson(data) as T;
    }
    if (t == _i101.User) {
      return _i101.User.fromJson(data, this) as T;
    }
    if (t == _i1.getType<_i3.AuthChangePasswordResponse?>()) {
      return (data != null
          ? _i3.AuthChangePasswordResponse.fromJson(data, this)
          : null) as T;
    }
    if (t == _i1.getType<_i4.AuthChangePasswordResponseCode?>()) {
      return (data != null
          ? _i4.AuthChangePasswordResponseCode.fromJson(data)
          : null) as T;
    }
    if (t == _i1.getType<_i5.AuthDeleteAccountResponse?>()) {
      return (data != null
          ? _i5.AuthDeleteAccountResponse.fromJson(data, this)
          : null) as T;
    }
    if (t == _i1.getType<_i6.AuthDeleteAccountResponseCode?>()) {
      return (data != null
          ? _i6.AuthDeleteAccountResponseCode.fromJson(data)
          : null) as T;
    }
    if (t == _i1.getType<_i7.AuthForgotPasswordResponse?>()) {
      return (data != null
          ? _i7.AuthForgotPasswordResponse.fromJson(data, this)
          : null) as T;
    }
    if (t == _i1.getType<_i8.AuthForgotPasswordResponseCode?>()) {
      return (data != null
          ? _i8.AuthForgotPasswordResponseCode.fromJson(data)
          : null) as T;
    }
    if (t == _i1.getType<_i9.AuthForgotPasswordSubmissionResponse?>()) {
      return (data != null
          ? _i9.AuthForgotPasswordSubmissionResponse.fromJson(data, this)
          : null) as T;
    }
    if (t == _i1.getType<_i10.AuthForgotPasswordSubmissionResponseCode?>()) {
      return (data != null
          ? _i10.AuthForgotPasswordSubmissionResponseCode.fromJson(data)
          : null) as T;
    }
    if (t == _i1.getType<_i11.AuthForgotPasswordVerificationResponse?>()) {
      return (data != null
          ? _i11.AuthForgotPasswordVerificationResponse.fromJson(data, this)
          : null) as T;
    }
    if (t == _i1.getType<_i12.AuthForgotPasswordVerificationResponseCode?>()) {
      return (data != null
          ? _i12.AuthForgotPasswordVerificationResponseCode.fromJson(data)
          : null) as T;
    }
    if (t == _i1.getType<_i13.AuthSignInResponse?>()) {
      return (data != null
          ? _i13.AuthSignInResponse.fromJson(data, this)
          : null) as T;
    }
    if (t == _i1.getType<_i14.AuthSignInResponseCode?>()) {
      return (data != null ? _i14.AuthSignInResponseCode.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i15.AuthSignUpResponse?>()) {
      return (data != null
          ? _i15.AuthSignUpResponse.fromJson(data, this)
          : null) as T;
    }
    if (t == _i1.getType<_i16.AuthSignUpResponseCode?>()) {
      return (data != null ? _i16.AuthSignUpResponseCode.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i17.AuthSignUpVerificationResponse?>()) {
      return (data != null
          ? _i17.AuthSignUpVerificationResponse.fromJson(data, this)
          : null) as T;
    }
    if (t == _i1.getType<_i18.AuthSignUpVerificationResponseCode?>()) {
      return (data != null
          ? _i18.AuthSignUpVerificationResponseCode.fromJson(data)
          : null) as T;
    }
    if (t == _i1.getType<_i19.AuthEmail?>()) {
      return (data != null ? _i19.AuthEmail.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i20.AuthForgotPasswordRequest?>()) {
      return (data != null
          ? _i20.AuthForgotPasswordRequest.fromJson(data, this)
          : null) as T;
    }
    if (t == _i1.getType<_i21.AuthSignUpRequest?>()) {
      return (data != null ? _i21.AuthSignUpRequest.fromJson(data, this) : null)
          as T;
    }
    if (t == _i1.getType<_i22.Counter?>()) {
      return (data != null ? _i22.Counter.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i23.DiscoverReadResponse?>()) {
      return (data != null
          ? _i23.DiscoverReadResponse.fromJson(data, this)
          : null) as T;
    }
    if (t == _i1.getType<_i24.DiscoverReadResponseCode?>()) {
      return (data != null
          ? _i24.DiscoverReadResponseCode.fromJson(data)
          : null) as T;
    }
    if (t == _i1.getType<_i25.EventGuestInvitationStatus?>()) {
      return (data != null
          ? _i25.EventGuestInvitationStatus.fromJson(data)
          : null) as T;
    }
    if (t == _i1.getType<_i26.EventGuestRequestStatus?>()) {
      return (data != null ? _i26.EventGuestRequestStatus.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i27.EventGuestSuggestionStatus?>()) {
      return (data != null
          ? _i27.EventGuestSuggestionStatus.fromJson(data)
          : null) as T;
    }
    if (t == _i1.getType<_i28.EventHostInvitationStatus?>()) {
      return (data != null
          ? _i28.EventHostInvitationStatus.fromJson(data)
          : null) as T;
    }
    if (t == _i1.getType<_i29.EventHostRequestStatus?>()) {
      return (data != null ? _i29.EventHostRequestStatus.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i30.EventHostSuggestionStatus?>()) {
      return (data != null
          ? _i30.EventHostSuggestionStatus.fromJson(data)
          : null) as T;
    }
    if (t == _i1.getType<_i31.EventType?>()) {
      return (data != null ? _i31.EventType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i32.EventVisibility?>()) {
      return (data != null ? _i32.EventVisibility.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i33.PublicEvent?>()) {
      return (data != null ? _i33.PublicEvent.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i34.PublicEventFullGuest?>()) {
      return (data != null
          ? _i34.PublicEventFullGuest.fromJson(data, this)
          : null) as T;
    }
    if (t == _i1.getType<_i35.PublicEventFullGuestUser?>()) {
      return (data != null
          ? _i35.PublicEventFullGuestUser.fromJson(data, this)
          : null) as T;
    }
    if (t == _i1.getType<_i36.PublicEventHost?>()) {
      return (data != null ? _i36.PublicEventHost.fromJson(data, this) : null)
          as T;
    }
    if (t == _i1.getType<_i37.PublicEventLocation?>()) {
      return (data != null
          ? _i37.PublicEventLocation.fromJson(data, this)
          : null) as T;
    }
    if (t == _i1.getType<_i38.EventCreateResponse?>()) {
      return (data != null
          ? _i38.EventCreateResponse.fromJson(data, this)
          : null) as T;
    }
    if (t == _i1.getType<_i39.EventCreateResponseCode?>()) {
      return (data != null ? _i39.EventCreateResponseCode.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i40.EventGuestsResponse?>()) {
      return (data != null
          ? _i40.EventGuestsResponse.fromJson(data, this)
          : null) as T;
    }
    if (t == _i1.getType<_i41.EventGuestsResponseCode?>()) {
      return (data != null ? _i41.EventGuestsResponseCode.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i42.Event?>()) {
      return (data != null ? _i42.Event.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i43.EventGuest?>()) {
      return (data != null ? _i43.EventGuest.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i44.EventGuestInvitation?>()) {
      return (data != null
          ? _i44.EventGuestInvitation.fromJson(data, this)
          : null) as T;
    }
    if (t == _i1.getType<_i45.EventGuestRequest?>()) {
      return (data != null ? _i45.EventGuestRequest.fromJson(data, this) : null)
          as T;
    }
    if (t == _i1.getType<_i46.EventGuestSuggestion?>()) {
      return (data != null
          ? _i46.EventGuestSuggestion.fromJson(data, this)
          : null) as T;
    }
    if (t == _i1.getType<_i47.EventHost?>()) {
      return (data != null ? _i47.EventHost.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i48.EventHostInvitation?>()) {
      return (data != null
          ? _i48.EventHostInvitation.fromJson(data, this)
          : null) as T;
    }
    if (t == _i1.getType<_i49.EventHostRequest?>()) {
      return (data != null ? _i49.EventHostRequest.fromJson(data, this) : null)
          as T;
    }
    if (t == _i1.getType<_i50.EventHostSuggestion?>()) {
      return (data != null
          ? _i50.EventHostSuggestion.fromJson(data, this)
          : null) as T;
    }
    if (t == _i1.getType<_i51.FriendRequestStatus?>()) {
      return (data != null ? _i51.FriendRequestStatus.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i52.FriendRequestAnswerResponse?>()) {
      return (data != null
          ? _i52.FriendRequestAnswerResponse.fromJson(data, this)
          : null) as T;
    }
    if (t == _i1.getType<_i53.FriendRequestAnswerResponseCode?>()) {
      return (data != null
          ? _i53.FriendRequestAnswerResponseCode.fromJson(data)
          : null) as T;
    }
    if (t == _i1.getType<_i54.FriendRequestCreateResponse?>()) {
      return (data != null
          ? _i54.FriendRequestCreateResponse.fromJson(data, this)
          : null) as T;
    }
    if (t == _i1.getType<_i55.FriendRequestCreateResponseCode?>()) {
      return (data != null
          ? _i55.FriendRequestCreateResponseCode.fromJson(data)
          : null) as T;
    }
    if (t == _i1.getType<_i56.FriendRequestTakeBackResponse?>()) {
      return (data != null
          ? _i56.FriendRequestTakeBackResponse.fromJson(data, this)
          : null) as T;
    }
    if (t == _i1.getType<_i57.FriendRequestTakeBackResponseCode?>()) {
      return (data != null
          ? _i57.FriendRequestTakeBackResponseCode.fromJson(data)
          : null) as T;
    }
    if (t == _i1.getType<_i58.FriendRequest?>()) {
      return (data != null ? _i58.FriendRequest.fromJson(data, this) : null)
          as T;
    }
    if (t == _i1.getType<_i59.FriendshipBadge?>()) {
      return (data != null ? _i59.FriendshipBadge.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i60.FriendshipRemoveResponse?>()) {
      return (data != null
          ? _i60.FriendshipRemoveResponse.fromJson(data, this)
          : null) as T;
    }
    if (t == _i1.getType<_i61.FriendshipRemoveResponseCode?>()) {
      return (data != null
          ? _i61.FriendshipRemoveResponseCode.fromJson(data)
          : null) as T;
    }
    if (t == _i1.getType<_i62.Friendship?>()) {
      return (data != null ? _i62.Friendship.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i63.NotificationType?>()) {
      return (data != null ? _i63.NotificationType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i64.PublicNotification?>()) {
      return (data != null
          ? _i64.PublicNotification.fromJson(data, this)
          : null) as T;
    }
    if (t == _i1.getType<_i65.PublicNotificationDataFriendRequestAccepted?>()) {
      return (data != null
          ? _i65.PublicNotificationDataFriendRequestAccepted.fromJson(
              data, this)
          : null) as T;
    }
    if (t ==
        _i1.getType<
            _i66.PublicNotificationDataFriendRequestAcceptedSender?>()) {
      return (data != null
          ? _i66.PublicNotificationDataFriendRequestAcceptedSender.fromJson(
              data, this)
          : null) as T;
    }
    if (t == _i1.getType<_i67.PublicNotificationDataFriendRequestCreated?>()) {
      return (data != null
          ? _i67.PublicNotificationDataFriendRequestCreated.fromJson(data, this)
          : null) as T;
    }
    if (t ==
        _i1.getType<_i68.PublicNotificationDataFriendRequestCreatedSender?>()) {
      return (data != null
          ? _i68.PublicNotificationDataFriendRequestCreatedSender.fromJson(
              data, this)
          : null) as T;
    }
    if (t == _i1.getType<_i69.PublicNotificationDataFriendRequestDenied?>()) {
      return (data != null
          ? _i69.PublicNotificationDataFriendRequestDenied.fromJson(data, this)
          : null) as T;
    }
    if (t ==
        _i1.getType<_i70.PublicNotificationDataFriendRequestDeniedSender?>()) {
      return (data != null
          ? _i70.PublicNotificationDataFriendRequestDeniedSender.fromJson(
              data, this)
          : null) as T;
    }
    if (t == _i1.getType<_i71.NotificationReadResponse?>()) {
      return (data != null
          ? _i71.NotificationReadResponse.fromJson(data, this)
          : null) as T;
    }
    if (t == _i1.getType<_i72.NotificationReadResponseCode?>()) {
      return (data != null
          ? _i72.NotificationReadResponseCode.fromJson(data)
          : null) as T;
    }
    if (t == _i1.getType<_i73.NotificationSetAllReadResponse?>()) {
      return (data != null
          ? _i73.NotificationSetAllReadResponse.fromJson(data, this)
          : null) as T;
    }
    if (t == _i1.getType<_i74.NotificationSetAllReadResponseCode?>()) {
      return (data != null
          ? _i74.NotificationSetAllReadResponseCode.fromJson(data)
          : null) as T;
    }
    if (t == _i1.getType<_i75.NotificationSetReadResponse?>()) {
      return (data != null
          ? _i75.NotificationSetReadResponse.fromJson(data, this)
          : null) as T;
    }
    if (t == _i1.getType<_i76.NotificationSetReadResponseCode?>()) {
      return (data != null
          ? _i76.NotificationSetReadResponseCode.fromJson(data)
          : null) as T;
    }
    if (t == _i1.getType<_i77.Notification?>()) {
      return (data != null ? _i77.Notification.fromJson(data, this) : null)
          as T;
    }
    if (t == _i1.getType<_i78.RatingType?>()) {
      return (data != null ? _i78.RatingType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i79.Rating?>()) {
      return (data != null ? _i79.Rating.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i80.UserBadge?>()) {
      return (data != null ? _i80.UserBadge.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i81.PublicUser?>()) {
      return (data != null ? _i81.PublicUser.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i82.PublicUserFriendRequest?>()) {
      return (data != null
          ? _i82.PublicUserFriendRequest.fromJson(data, this)
          : null) as T;
    }
    if (t == _i1.getType<_i83.PublicUserFriendship?>()) {
      return (data != null
          ? _i83.PublicUserFriendship.fromJson(data, this)
          : null) as T;
    }
    if (t == _i1.getType<_i84.PublicUserFriendshipDetails?>()) {
      return (data != null
          ? _i84.PublicUserFriendshipDetails.fromJson(data, this)
          : null) as T;
    }
    if (t == _i1.getType<_i85.PublicUserFriendshipUser?>()) {
      return (data != null
          ? _i85.PublicUserFriendshipUser.fromJson(data, this)
          : null) as T;
    }
    if (t == _i1.getType<_i86.PublicUserRating?>()) {
      return (data != null ? _i86.PublicUserRating.fromJson(data, this) : null)
          as T;
    }
    if (t == _i1.getType<_i87.PublicUserRatingUser?>()) {
      return (data != null
          ? _i87.PublicUserRatingUser.fromJson(data, this)
          : null) as T;
    }
    if (t == _i1.getType<_i88.PublicUserSearchUser?>()) {
      return (data != null
          ? _i88.PublicUserSearchUser.fromJson(data, this)
          : null) as T;
    }
    if (t == _i1.getType<_i89.UserEventsResponseCode?>()) {
      return (data != null ? _i89.UserEventsResponseCode.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i90.UserEventsResponse?>()) {
      return (data != null
          ? _i90.UserEventsResponse.fromJson(data, this)
          : null) as T;
    }
    if (t == _i1.getType<_i91.UserFriendshipsResponse?>()) {
      return (data != null
          ? _i91.UserFriendshipsResponse.fromJson(data, this)
          : null) as T;
    }
    if (t == _i1.getType<_i92.UserFriendshipsResponseCode?>()) {
      return (data != null
          ? _i92.UserFriendshipsResponseCode.fromJson(data)
          : null) as T;
    }
    if (t == _i1.getType<_i93.UserRatingsResponse?>()) {
      return (data != null
          ? _i93.UserRatingsResponse.fromJson(data, this)
          : null) as T;
    }
    if (t == _i1.getType<_i94.UserRatingsResponseCode?>()) {
      return (data != null ? _i94.UserRatingsResponseCode.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i95.UserReadResponse?>()) {
      return (data != null ? _i95.UserReadResponse.fromJson(data, this) : null)
          as T;
    }
    if (t == _i1.getType<_i96.UserReadResponseCode?>()) {
      return (data != null ? _i96.UserReadResponseCode.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i97.UserSearchResponse?>()) {
      return (data != null
          ? _i97.UserSearchResponse.fromJson(data, this)
          : null) as T;
    }
    if (t == _i1.getType<_i98.UserSearchResponseCode?>()) {
      return (data != null ? _i98.UserSearchResponseCode.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i99.UserUpdateResponse?>()) {
      return (data != null
          ? _i99.UserUpdateResponse.fromJson(data, this)
          : null) as T;
    }
    if (t == _i1.getType<_i100.UserUpdateResponseCode?>()) {
      return (data != null ? _i100.UserUpdateResponseCode.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i101.User?>()) {
      return (data != null ? _i101.User.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<List<_i102.PublicEvent>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i102.PublicEvent>(e))
              .toList()
          : null) as dynamic;
    }
    if (t == List<_i102.PublicEventHost?>) {
      return (data as List)
          .map((e) => deserialize<_i102.PublicEventHost?>(e))
          .toList() as dynamic;
    }
    if (t == List<String?>) {
      return (data as List).map((e) => deserialize<String?>(e)).toList()
          as dynamic;
    }
    if (t == _i1.getType<List<_i102.PublicEventFullGuest>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i102.PublicEventFullGuest>(e))
              .toList()
          : null) as dynamic;
    }
    if (t == List<int>) {
      return (data as List).map((e) => deserialize<int>(e)).toList() as dynamic;
    }
    if (t == List<_i102.FriendshipBadge>) {
      return (data as List)
          .map((e) => deserialize<_i102.FriendshipBadge>(e))
          .toList() as dynamic;
    }
    if (t == _i1.getType<List<_i102.PublicNotification>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i102.PublicNotification>(e))
              .toList()
          : null) as dynamic;
    }
    if (t == List<_i102.UserBadge>) {
      return (data as List).map((e) => deserialize<_i102.UserBadge>(e)).toList()
          as dynamic;
    }
    if (t == _i1.getType<List<_i102.PublicEvent>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i102.PublicEvent>(e))
              .toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<_i102.PublicUserFriendship>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i102.PublicUserFriendship>(e))
              .toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<_i102.PublicUserRating>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i102.PublicUserRating>(e))
              .toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<_i102.PublicUserSearchUser>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i102.PublicUserSearchUser>(e))
              .toList()
          : null) as dynamic;
    }
    if (t == List<_i103.EventType>) {
      return (data as List).map((e) => deserialize<_i103.EventType>(e)).toList()
          as dynamic;
    }
    if (t == List<_i104.EventVisibility>) {
      return (data as List)
          .map((e) => deserialize<_i104.EventVisibility>(e))
          .toList() as dynamic;
    }
    if (t == List<int>) {
      return (data as List).map((e) => deserialize<int>(e)).toList() as dynamic;
    }
    try {
      return _i2.Protocol().deserialize<T>(data, t);
    } catch (_) {}
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object data) {
    if (data is _i3.AuthChangePasswordResponse) {
      return 'AuthChangePasswordResponse';
    }
    if (data is _i4.AuthChangePasswordResponseCode) {
      return 'AuthChangePasswordResponseCode';
    }
    if (data is _i5.AuthDeleteAccountResponse) {
      return 'AuthDeleteAccountResponse';
    }
    if (data is _i6.AuthDeleteAccountResponseCode) {
      return 'AuthDeleteAccountResponseCode';
    }
    if (data is _i7.AuthForgotPasswordResponse) {
      return 'AuthForgotPasswordResponse';
    }
    if (data is _i8.AuthForgotPasswordResponseCode) {
      return 'AuthForgotPasswordResponseCode';
    }
    if (data is _i9.AuthForgotPasswordSubmissionResponse) {
      return 'AuthForgotPasswordSubmissionResponse';
    }
    if (data is _i10.AuthForgotPasswordSubmissionResponseCode) {
      return 'AuthForgotPasswordSubmissionResponseCode';
    }
    if (data is _i11.AuthForgotPasswordVerificationResponse) {
      return 'AuthForgotPasswordVerificationResponse';
    }
    if (data is _i12.AuthForgotPasswordVerificationResponseCode) {
      return 'AuthForgotPasswordVerificationResponseCode';
    }
    if (data is _i13.AuthSignInResponse) {
      return 'AuthSignInResponse';
    }
    if (data is _i14.AuthSignInResponseCode) {
      return 'AuthSignInResponseCode';
    }
    if (data is _i15.AuthSignUpResponse) {
      return 'AuthSignUpResponse';
    }
    if (data is _i16.AuthSignUpResponseCode) {
      return 'AuthSignUpResponseCode';
    }
    if (data is _i17.AuthSignUpVerificationResponse) {
      return 'AuthSignUpVerificationResponse';
    }
    if (data is _i18.AuthSignUpVerificationResponseCode) {
      return 'AuthSignUpVerificationResponseCode';
    }
    if (data is _i19.AuthEmail) {
      return 'AuthEmail';
    }
    if (data is _i20.AuthForgotPasswordRequest) {
      return 'AuthForgotPasswordRequest';
    }
    if (data is _i21.AuthSignUpRequest) {
      return 'AuthSignUpRequest';
    }
    if (data is _i22.Counter) {
      return 'Counter';
    }
    if (data is _i23.DiscoverReadResponse) {
      return 'DiscoverReadResponse';
    }
    if (data is _i24.DiscoverReadResponseCode) {
      return 'DiscoverReadResponseCode';
    }
    if (data is _i25.EventGuestInvitationStatus) {
      return 'EventGuestInvitationStatus';
    }
    if (data is _i26.EventGuestRequestStatus) {
      return 'EventGuestRequestStatus';
    }
    if (data is _i27.EventGuestSuggestionStatus) {
      return 'EventGuestSuggestionStatus';
    }
    if (data is _i28.EventHostInvitationStatus) {
      return 'EventHostInvitationStatus';
    }
    if (data is _i29.EventHostRequestStatus) {
      return 'EventHostRequestStatus';
    }
    if (data is _i30.EventHostSuggestionStatus) {
      return 'EventHostSuggestionStatus';
    }
    if (data is _i31.EventType) {
      return 'EventType';
    }
    if (data is _i32.EventVisibility) {
      return 'EventVisibility';
    }
    if (data is _i33.PublicEvent) {
      return 'PublicEvent';
    }
    if (data is _i34.PublicEventFullGuest) {
      return 'PublicEventFullGuest';
    }
    if (data is _i35.PublicEventFullGuestUser) {
      return 'PublicEventFullGuestUser';
    }
    if (data is _i36.PublicEventHost) {
      return 'PublicEventHost';
    }
    if (data is _i37.PublicEventLocation) {
      return 'PublicEventLocation';
    }
    if (data is _i38.EventCreateResponse) {
      return 'EventCreateResponse';
    }
    if (data is _i39.EventCreateResponseCode) {
      return 'EventCreateResponseCode';
    }
    if (data is _i40.EventGuestsResponse) {
      return 'EventGuestsResponse';
    }
    if (data is _i41.EventGuestsResponseCode) {
      return 'EventGuestsResponseCode';
    }
    if (data is _i42.Event) {
      return 'Event';
    }
    if (data is _i43.EventGuest) {
      return 'EventGuest';
    }
    if (data is _i44.EventGuestInvitation) {
      return 'EventGuestInvitation';
    }
    if (data is _i45.EventGuestRequest) {
      return 'EventGuestRequest';
    }
    if (data is _i46.EventGuestSuggestion) {
      return 'EventGuestSuggestion';
    }
    if (data is _i47.EventHost) {
      return 'EventHost';
    }
    if (data is _i48.EventHostInvitation) {
      return 'EventHostInvitation';
    }
    if (data is _i49.EventHostRequest) {
      return 'EventHostRequest';
    }
    if (data is _i50.EventHostSuggestion) {
      return 'EventHostSuggestion';
    }
    if (data is _i51.FriendRequestStatus) {
      return 'FriendRequestStatus';
    }
    if (data is _i52.FriendRequestAnswerResponse) {
      return 'FriendRequestAnswerResponse';
    }
    if (data is _i53.FriendRequestAnswerResponseCode) {
      return 'FriendRequestAnswerResponseCode';
    }
    if (data is _i54.FriendRequestCreateResponse) {
      return 'FriendRequestCreateResponse';
    }
    if (data is _i55.FriendRequestCreateResponseCode) {
      return 'FriendRequestCreateResponseCode';
    }
    if (data is _i56.FriendRequestTakeBackResponse) {
      return 'FriendRequestTakeBackResponse';
    }
    if (data is _i57.FriendRequestTakeBackResponseCode) {
      return 'FriendRequestTakeBackResponseCode';
    }
    if (data is _i58.FriendRequest) {
      return 'FriendRequest';
    }
    if (data is _i59.FriendshipBadge) {
      return 'FriendshipBadge';
    }
    if (data is _i60.FriendshipRemoveResponse) {
      return 'FriendshipRemoveResponse';
    }
    if (data is _i61.FriendshipRemoveResponseCode) {
      return 'FriendshipRemoveResponseCode';
    }
    if (data is _i62.Friendship) {
      return 'Friendship';
    }
    if (data is _i63.NotificationType) {
      return 'NotificationType';
    }
    if (data is _i64.PublicNotification) {
      return 'PublicNotification';
    }
    if (data is _i65.PublicNotificationDataFriendRequestAccepted) {
      return 'PublicNotificationDataFriendRequestAccepted';
    }
    if (data is _i66.PublicNotificationDataFriendRequestAcceptedSender) {
      return 'PublicNotificationDataFriendRequestAcceptedSender';
    }
    if (data is _i67.PublicNotificationDataFriendRequestCreated) {
      return 'PublicNotificationDataFriendRequestCreated';
    }
    if (data is _i68.PublicNotificationDataFriendRequestCreatedSender) {
      return 'PublicNotificationDataFriendRequestCreatedSender';
    }
    if (data is _i69.PublicNotificationDataFriendRequestDenied) {
      return 'PublicNotificationDataFriendRequestDenied';
    }
    if (data is _i70.PublicNotificationDataFriendRequestDeniedSender) {
      return 'PublicNotificationDataFriendRequestDeniedSender';
    }
    if (data is _i71.NotificationReadResponse) {
      return 'NotificationReadResponse';
    }
    if (data is _i72.NotificationReadResponseCode) {
      return 'NotificationReadResponseCode';
    }
    if (data is _i73.NotificationSetAllReadResponse) {
      return 'NotificationSetAllReadResponse';
    }
    if (data is _i74.NotificationSetAllReadResponseCode) {
      return 'NotificationSetAllReadResponseCode';
    }
    if (data is _i75.NotificationSetReadResponse) {
      return 'NotificationSetReadResponse';
    }
    if (data is _i76.NotificationSetReadResponseCode) {
      return 'NotificationSetReadResponseCode';
    }
    if (data is _i77.Notification) {
      return 'Notification';
    }
    if (data is _i78.RatingType) {
      return 'RatingType';
    }
    if (data is _i79.Rating) {
      return 'Rating';
    }
    if (data is _i80.UserBadge) {
      return 'UserBadge';
    }
    if (data is _i81.PublicUser) {
      return 'PublicUser';
    }
    if (data is _i82.PublicUserFriendRequest) {
      return 'PublicUserFriendRequest';
    }
    if (data is _i83.PublicUserFriendship) {
      return 'PublicUserFriendship';
    }
    if (data is _i84.PublicUserFriendshipDetails) {
      return 'PublicUserFriendshipDetails';
    }
    if (data is _i85.PublicUserFriendshipUser) {
      return 'PublicUserFriendshipUser';
    }
    if (data is _i86.PublicUserRating) {
      return 'PublicUserRating';
    }
    if (data is _i87.PublicUserRatingUser) {
      return 'PublicUserRatingUser';
    }
    if (data is _i88.PublicUserSearchUser) {
      return 'PublicUserSearchUser';
    }
    if (data is _i89.UserEventsResponseCode) {
      return 'UserEventsResponseCode';
    }
    if (data is _i90.UserEventsResponse) {
      return 'UserEventsResponse';
    }
    if (data is _i91.UserFriendshipsResponse) {
      return 'UserFriendshipsResponse';
    }
    if (data is _i92.UserFriendshipsResponseCode) {
      return 'UserFriendshipsResponseCode';
    }
    if (data is _i93.UserRatingsResponse) {
      return 'UserRatingsResponse';
    }
    if (data is _i94.UserRatingsResponseCode) {
      return 'UserRatingsResponseCode';
    }
    if (data is _i95.UserReadResponse) {
      return 'UserReadResponse';
    }
    if (data is _i96.UserReadResponseCode) {
      return 'UserReadResponseCode';
    }
    if (data is _i97.UserSearchResponse) {
      return 'UserSearchResponse';
    }
    if (data is _i98.UserSearchResponseCode) {
      return 'UserSearchResponseCode';
    }
    if (data is _i99.UserUpdateResponse) {
      return 'UserUpdateResponse';
    }
    if (data is _i100.UserUpdateResponseCode) {
      return 'UserUpdateResponseCode';
    }
    if (data is _i101.User) {
      return 'User';
    }
    return super.getClassNameForObject(data);
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    if (data['className'] == 'AuthChangePasswordResponse') {
      return deserialize<_i3.AuthChangePasswordResponse>(data['data']);
    }
    if (data['className'] == 'AuthChangePasswordResponseCode') {
      return deserialize<_i4.AuthChangePasswordResponseCode>(data['data']);
    }
    if (data['className'] == 'AuthDeleteAccountResponse') {
      return deserialize<_i5.AuthDeleteAccountResponse>(data['data']);
    }
    if (data['className'] == 'AuthDeleteAccountResponseCode') {
      return deserialize<_i6.AuthDeleteAccountResponseCode>(data['data']);
    }
    if (data['className'] == 'AuthForgotPasswordResponse') {
      return deserialize<_i7.AuthForgotPasswordResponse>(data['data']);
    }
    if (data['className'] == 'AuthForgotPasswordResponseCode') {
      return deserialize<_i8.AuthForgotPasswordResponseCode>(data['data']);
    }
    if (data['className'] == 'AuthForgotPasswordSubmissionResponse') {
      return deserialize<_i9.AuthForgotPasswordSubmissionResponse>(
          data['data']);
    }
    if (data['className'] == 'AuthForgotPasswordSubmissionResponseCode') {
      return deserialize<_i10.AuthForgotPasswordSubmissionResponseCode>(
          data['data']);
    }
    if (data['className'] == 'AuthForgotPasswordVerificationResponse') {
      return deserialize<_i11.AuthForgotPasswordVerificationResponse>(
          data['data']);
    }
    if (data['className'] == 'AuthForgotPasswordVerificationResponseCode') {
      return deserialize<_i12.AuthForgotPasswordVerificationResponseCode>(
          data['data']);
    }
    if (data['className'] == 'AuthSignInResponse') {
      return deserialize<_i13.AuthSignInResponse>(data['data']);
    }
    if (data['className'] == 'AuthSignInResponseCode') {
      return deserialize<_i14.AuthSignInResponseCode>(data['data']);
    }
    if (data['className'] == 'AuthSignUpResponse') {
      return deserialize<_i15.AuthSignUpResponse>(data['data']);
    }
    if (data['className'] == 'AuthSignUpResponseCode') {
      return deserialize<_i16.AuthSignUpResponseCode>(data['data']);
    }
    if (data['className'] == 'AuthSignUpVerificationResponse') {
      return deserialize<_i17.AuthSignUpVerificationResponse>(data['data']);
    }
    if (data['className'] == 'AuthSignUpVerificationResponseCode') {
      return deserialize<_i18.AuthSignUpVerificationResponseCode>(data['data']);
    }
    if (data['className'] == 'AuthEmail') {
      return deserialize<_i19.AuthEmail>(data['data']);
    }
    if (data['className'] == 'AuthForgotPasswordRequest') {
      return deserialize<_i20.AuthForgotPasswordRequest>(data['data']);
    }
    if (data['className'] == 'AuthSignUpRequest') {
      return deserialize<_i21.AuthSignUpRequest>(data['data']);
    }
    if (data['className'] == 'Counter') {
      return deserialize<_i22.Counter>(data['data']);
    }
    if (data['className'] == 'DiscoverReadResponse') {
      return deserialize<_i23.DiscoverReadResponse>(data['data']);
    }
    if (data['className'] == 'DiscoverReadResponseCode') {
      return deserialize<_i24.DiscoverReadResponseCode>(data['data']);
    }
    if (data['className'] == 'EventGuestInvitationStatus') {
      return deserialize<_i25.EventGuestInvitationStatus>(data['data']);
    }
    if (data['className'] == 'EventGuestRequestStatus') {
      return deserialize<_i26.EventGuestRequestStatus>(data['data']);
    }
    if (data['className'] == 'EventGuestSuggestionStatus') {
      return deserialize<_i27.EventGuestSuggestionStatus>(data['data']);
    }
    if (data['className'] == 'EventHostInvitationStatus') {
      return deserialize<_i28.EventHostInvitationStatus>(data['data']);
    }
    if (data['className'] == 'EventHostRequestStatus') {
      return deserialize<_i29.EventHostRequestStatus>(data['data']);
    }
    if (data['className'] == 'EventHostSuggestionStatus') {
      return deserialize<_i30.EventHostSuggestionStatus>(data['data']);
    }
    if (data['className'] == 'EventType') {
      return deserialize<_i31.EventType>(data['data']);
    }
    if (data['className'] == 'EventVisibility') {
      return deserialize<_i32.EventVisibility>(data['data']);
    }
    if (data['className'] == 'PublicEvent') {
      return deserialize<_i33.PublicEvent>(data['data']);
    }
    if (data['className'] == 'PublicEventFullGuest') {
      return deserialize<_i34.PublicEventFullGuest>(data['data']);
    }
    if (data['className'] == 'PublicEventFullGuestUser') {
      return deserialize<_i35.PublicEventFullGuestUser>(data['data']);
    }
    if (data['className'] == 'PublicEventHost') {
      return deserialize<_i36.PublicEventHost>(data['data']);
    }
    if (data['className'] == 'PublicEventLocation') {
      return deserialize<_i37.PublicEventLocation>(data['data']);
    }
    if (data['className'] == 'EventCreateResponse') {
      return deserialize<_i38.EventCreateResponse>(data['data']);
    }
    if (data['className'] == 'EventCreateResponseCode') {
      return deserialize<_i39.EventCreateResponseCode>(data['data']);
    }
    if (data['className'] == 'EventGuestsResponse') {
      return deserialize<_i40.EventGuestsResponse>(data['data']);
    }
    if (data['className'] == 'EventGuestsResponseCode') {
      return deserialize<_i41.EventGuestsResponseCode>(data['data']);
    }
    if (data['className'] == 'Event') {
      return deserialize<_i42.Event>(data['data']);
    }
    if (data['className'] == 'EventGuest') {
      return deserialize<_i43.EventGuest>(data['data']);
    }
    if (data['className'] == 'EventGuestInvitation') {
      return deserialize<_i44.EventGuestInvitation>(data['data']);
    }
    if (data['className'] == 'EventGuestRequest') {
      return deserialize<_i45.EventGuestRequest>(data['data']);
    }
    if (data['className'] == 'EventGuestSuggestion') {
      return deserialize<_i46.EventGuestSuggestion>(data['data']);
    }
    if (data['className'] == 'EventHost') {
      return deserialize<_i47.EventHost>(data['data']);
    }
    if (data['className'] == 'EventHostInvitation') {
      return deserialize<_i48.EventHostInvitation>(data['data']);
    }
    if (data['className'] == 'EventHostRequest') {
      return deserialize<_i49.EventHostRequest>(data['data']);
    }
    if (data['className'] == 'EventHostSuggestion') {
      return deserialize<_i50.EventHostSuggestion>(data['data']);
    }
    if (data['className'] == 'FriendRequestStatus') {
      return deserialize<_i51.FriendRequestStatus>(data['data']);
    }
    if (data['className'] == 'FriendRequestAnswerResponse') {
      return deserialize<_i52.FriendRequestAnswerResponse>(data['data']);
    }
    if (data['className'] == 'FriendRequestAnswerResponseCode') {
      return deserialize<_i53.FriendRequestAnswerResponseCode>(data['data']);
    }
    if (data['className'] == 'FriendRequestCreateResponse') {
      return deserialize<_i54.FriendRequestCreateResponse>(data['data']);
    }
    if (data['className'] == 'FriendRequestCreateResponseCode') {
      return deserialize<_i55.FriendRequestCreateResponseCode>(data['data']);
    }
    if (data['className'] == 'FriendRequestTakeBackResponse') {
      return deserialize<_i56.FriendRequestTakeBackResponse>(data['data']);
    }
    if (data['className'] == 'FriendRequestTakeBackResponseCode') {
      return deserialize<_i57.FriendRequestTakeBackResponseCode>(data['data']);
    }
    if (data['className'] == 'FriendRequest') {
      return deserialize<_i58.FriendRequest>(data['data']);
    }
    if (data['className'] == 'FriendshipBadge') {
      return deserialize<_i59.FriendshipBadge>(data['data']);
    }
    if (data['className'] == 'FriendshipRemoveResponse') {
      return deserialize<_i60.FriendshipRemoveResponse>(data['data']);
    }
    if (data['className'] == 'FriendshipRemoveResponseCode') {
      return deserialize<_i61.FriendshipRemoveResponseCode>(data['data']);
    }
    if (data['className'] == 'Friendship') {
      return deserialize<_i62.Friendship>(data['data']);
    }
    if (data['className'] == 'NotificationType') {
      return deserialize<_i63.NotificationType>(data['data']);
    }
    if (data['className'] == 'PublicNotification') {
      return deserialize<_i64.PublicNotification>(data['data']);
    }
    if (data['className'] == 'PublicNotificationDataFriendRequestAccepted') {
      return deserialize<_i65.PublicNotificationDataFriendRequestAccepted>(
          data['data']);
    }
    if (data['className'] ==
        'PublicNotificationDataFriendRequestAcceptedSender') {
      return deserialize<
          _i66.PublicNotificationDataFriendRequestAcceptedSender>(data['data']);
    }
    if (data['className'] == 'PublicNotificationDataFriendRequestCreated') {
      return deserialize<_i67.PublicNotificationDataFriendRequestCreated>(
          data['data']);
    }
    if (data['className'] ==
        'PublicNotificationDataFriendRequestCreatedSender') {
      return deserialize<_i68.PublicNotificationDataFriendRequestCreatedSender>(
          data['data']);
    }
    if (data['className'] == 'PublicNotificationDataFriendRequestDenied') {
      return deserialize<_i69.PublicNotificationDataFriendRequestDenied>(
          data['data']);
    }
    if (data['className'] ==
        'PublicNotificationDataFriendRequestDeniedSender') {
      return deserialize<_i70.PublicNotificationDataFriendRequestDeniedSender>(
          data['data']);
    }
    if (data['className'] == 'NotificationReadResponse') {
      return deserialize<_i71.NotificationReadResponse>(data['data']);
    }
    if (data['className'] == 'NotificationReadResponseCode') {
      return deserialize<_i72.NotificationReadResponseCode>(data['data']);
    }
    if (data['className'] == 'NotificationSetAllReadResponse') {
      return deserialize<_i73.NotificationSetAllReadResponse>(data['data']);
    }
    if (data['className'] == 'NotificationSetAllReadResponseCode') {
      return deserialize<_i74.NotificationSetAllReadResponseCode>(data['data']);
    }
    if (data['className'] == 'NotificationSetReadResponse') {
      return deserialize<_i75.NotificationSetReadResponse>(data['data']);
    }
    if (data['className'] == 'NotificationSetReadResponseCode') {
      return deserialize<_i76.NotificationSetReadResponseCode>(data['data']);
    }
    if (data['className'] == 'Notification') {
      return deserialize<_i77.Notification>(data['data']);
    }
    if (data['className'] == 'RatingType') {
      return deserialize<_i78.RatingType>(data['data']);
    }
    if (data['className'] == 'Rating') {
      return deserialize<_i79.Rating>(data['data']);
    }
    if (data['className'] == 'UserBadge') {
      return deserialize<_i80.UserBadge>(data['data']);
    }
    if (data['className'] == 'PublicUser') {
      return deserialize<_i81.PublicUser>(data['data']);
    }
    if (data['className'] == 'PublicUserFriendRequest') {
      return deserialize<_i82.PublicUserFriendRequest>(data['data']);
    }
    if (data['className'] == 'PublicUserFriendship') {
      return deserialize<_i83.PublicUserFriendship>(data['data']);
    }
    if (data['className'] == 'PublicUserFriendshipDetails') {
      return deserialize<_i84.PublicUserFriendshipDetails>(data['data']);
    }
    if (data['className'] == 'PublicUserFriendshipUser') {
      return deserialize<_i85.PublicUserFriendshipUser>(data['data']);
    }
    if (data['className'] == 'PublicUserRating') {
      return deserialize<_i86.PublicUserRating>(data['data']);
    }
    if (data['className'] == 'PublicUserRatingUser') {
      return deserialize<_i87.PublicUserRatingUser>(data['data']);
    }
    if (data['className'] == 'PublicUserSearchUser') {
      return deserialize<_i88.PublicUserSearchUser>(data['data']);
    }
    if (data['className'] == 'UserEventsResponseCode') {
      return deserialize<_i89.UserEventsResponseCode>(data['data']);
    }
    if (data['className'] == 'UserEventsResponse') {
      return deserialize<_i90.UserEventsResponse>(data['data']);
    }
    if (data['className'] == 'UserFriendshipsResponse') {
      return deserialize<_i91.UserFriendshipsResponse>(data['data']);
    }
    if (data['className'] == 'UserFriendshipsResponseCode') {
      return deserialize<_i92.UserFriendshipsResponseCode>(data['data']);
    }
    if (data['className'] == 'UserRatingsResponse') {
      return deserialize<_i93.UserRatingsResponse>(data['data']);
    }
    if (data['className'] == 'UserRatingsResponseCode') {
      return deserialize<_i94.UserRatingsResponseCode>(data['data']);
    }
    if (data['className'] == 'UserReadResponse') {
      return deserialize<_i95.UserReadResponse>(data['data']);
    }
    if (data['className'] == 'UserReadResponseCode') {
      return deserialize<_i96.UserReadResponseCode>(data['data']);
    }
    if (data['className'] == 'UserSearchResponse') {
      return deserialize<_i97.UserSearchResponse>(data['data']);
    }
    if (data['className'] == 'UserSearchResponseCode') {
      return deserialize<_i98.UserSearchResponseCode>(data['data']);
    }
    if (data['className'] == 'UserUpdateResponse') {
      return deserialize<_i99.UserUpdateResponse>(data['data']);
    }
    if (data['className'] == 'UserUpdateResponseCode') {
      return deserialize<_i100.UserUpdateResponseCode>(data['data']);
    }
    if (data['className'] == 'User') {
      return deserialize<_i101.User>(data['data']);
    }
    return super.deserializeByClassName(data);
  }

  @override
  _i1.Table? getTableForType(Type t) {
    {
      var table = _i2.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    switch (t) {
      case _i19.AuthEmail:
        return _i19.AuthEmail.t;
      case _i20.AuthForgotPasswordRequest:
        return _i20.AuthForgotPasswordRequest.t;
      case _i21.AuthSignUpRequest:
        return _i21.AuthSignUpRequest.t;
      case _i22.Counter:
        return _i22.Counter.t;
      case _i42.Event:
        return _i42.Event.t;
      case _i43.EventGuest:
        return _i43.EventGuest.t;
      case _i44.EventGuestInvitation:
        return _i44.EventGuestInvitation.t;
      case _i45.EventGuestRequest:
        return _i45.EventGuestRequest.t;
      case _i46.EventGuestSuggestion:
        return _i46.EventGuestSuggestion.t;
      case _i47.EventHost:
        return _i47.EventHost.t;
      case _i48.EventHostInvitation:
        return _i48.EventHostInvitation.t;
      case _i49.EventHostRequest:
        return _i49.EventHostRequest.t;
      case _i50.EventHostSuggestion:
        return _i50.EventHostSuggestion.t;
      case _i58.FriendRequest:
        return _i58.FriendRequest.t;
      case _i62.Friendship:
        return _i62.Friendship.t;
      case _i77.Notification:
        return _i77.Notification.t;
      case _i79.Rating:
        return _i79.Rating.t;
      case _i101.User:
        return _i101.User.t;
    }
    return null;
  }

  @override
  _i2.DatabaseDefinition getTargetDatabaseDefinition() =>
      targetDatabaseDefinition;
}

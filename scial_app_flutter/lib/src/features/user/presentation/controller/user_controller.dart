import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:scial_app_client/scial_app_client.dart';
import 'package:scial_app_flutter/src/features/user/domain/use_cases/user_answer_friend_request_use_case.dart';
import 'package:scial_app_flutter/src/features/user/domain/use_cases/user_create_friend_request_use_case.dart';
import 'package:scial_app_flutter/src/features/user/domain/use_cases/user_read_use_case.dart';
import 'package:scial_app_flutter/src/features/user/domain/use_cases/user_remove_friendship_use_case.dart';
import 'package:scial_app_flutter/src/features/user/domain/use_cases/user_take_back_friend_request_use_case.dart';
import 'package:scial_app_flutter/src/features/user/domain/use_cases/user_update_use_case.dart';
import 'package:scial_app_flutter/src/features/user/presentation/widgets/user_update_user_switch.dart';
import 'package:scial_app_ui/scial_app_ui.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

part 'user_controller.g.dart';

@riverpod
class UserController extends _$UserController {

  @override
  FutureOr<PublicUser> build(int userId) async {
    return await _read(userId);
  }

  Future<PublicUser> _read(int userId) async {
    return await ref.read(userReadUseCaseProvider).call(UserReadUseCaseParams(userId: userId));
  }

  Future<void> updateUser(BuildContext context) async {
    TextEditingController controller = TextEditingController(text: state.value!.name);
    bool shouldBePrivate = state.value!.private;

    await showSCSheet(
      context, 
      title: AppLocalizations.of(context)!.user_update_user_title,
      button: SCSheetButton(
        onPressed: () async {
          String trimmedText = controller.text.trim();
          String? newName = trimmedText == "" ? null : trimmedText;
          bool updateName = newName != state.value!.name;

          bool updateIsPrivate = shouldBePrivate != state.value!.private;

          bool updateAnything = updateName || updateIsPrivate;

          if (!updateName) {
            return true;
          }

          try {
            await ref.read(userUpdateUseCaseProvider).call(UserUpdateUseCaseParams(
              name: newName,
              isPrivate: updateIsPrivate ? shouldBePrivate : null,
              updateName: updateName,
              updateIsPrivate: updateIsPrivate
            ));

          } catch (e) {
            return false;
          }

          if (updateAnything) {
            state = AsyncValue.data(
              PublicUser(
                id: state.value!.id, 
                name: updateName ? newName : state.value!.name,
                imageUrl: state.value!.imageUrl,
                verified: state.value!.verified,
                private: updateIsPrivate ? shouldBePrivate : state.value!.private,
                badges: state.value!.badges,
                friendship: state.value!.friendship,
                friendRequest: state.value!.friendRequest
              )
            );
          }

          return true;
        },
        title: AppLocalizations.of(context)!.user_update_user_save_button_title
      ),
      children: (bool isLoading) => [
        SCPadding(
          padding: const SCEdgeInsets.symmetric(horizontal: SCGapSize.semiBig),
          child: Row(
            children: [
              Expanded(child: SCText.editUserIsPrivate(AppLocalizations.of(context)!.user_update_user_private)),
              const SCGap.semiBig(),
              UserUpdateUserSwitch(
                initialIsOn: state.value!.private,
                onChanged: (bool isOn) {
                  shouldBePrivate = isOn;
                }
              )
            ]
          )
        ),
        const SCGap.semiBig(),
        SCPadding(
          padding: const SCEdgeInsets.symmetric(horizontal: SCGapSize.semiBig),
          child: SCTextInputField.name(
            controller: controller,
            hint: AppLocalizations.of(context)!.user_name,
            enabled: !isLoading
          )
        )
      ]
    ); 
  }

  Future<void> handleFriendship(BuildContext context) async {
    PublicUser user = state.value!;

    if (user.friendship != null) {
      return await _removeFriendship(context);
    }

    if (user.friendRequest != null) {
      if (user.friendRequest!.isSender) {
        return await _takeBackFriendRequest(context);
      }

      return await _answerFriendRequest(context);
    }

    return await _createFriendRequest(context);
  }

  Future<void> _removeFriendship(BuildContext context) async {
    await showSCDialog(
      context, 
      title: AppLocalizations.of(context)!.user_friendship_dialog_title, 
      text: AppLocalizations.of(context)!.user_friendship_dialog_text, 
      buttons: [
        SCDialogButton(
          isPrimary: true,
          title: AppLocalizations.of(context)!.user_friendship_dialog_remove,
          onPressed: () async {
            try {
              await ref.read(userRemoveFriendshipUseCaseProvider).call(UserRemoveFriendshipUseCaseParams(friendshipId: state.value!.friendship!.id));
            } catch (e) {
              return false;
            }

            return true;

            // TODO: Remove all info if isnotpublic because no longer friends
          }
        ),
        SCDialogButton(title: AppLocalizations.of(context)!.user_friendship_dialog_cancel)
      ]
    );
  }

  Future<void> _answerFriendRequest(BuildContext context) async {
    await showSCDialog(
      context, 
      title: AppLocalizations.of(context)!.user_answer_friend_request_dialog_title, 
      text: state.value!.friendRequest!.text ?? AppLocalizations.of(context)!.friend_request_text, 
      buttons: [
        SCDialogButton(
          isPrimary: true,
          title: AppLocalizations.of(context)!.user_answer_friend_request_dialog_accept,
          onPressed: () async {
            try {
              await ref.read(userAnswerFriendRequestUseCaseProvider).call(UserAnswerFriendRequestUseCaseParams(friendRequestId: state.value!.friendRequest!.id, answer: true));
            } catch (e) {
              return false;
            }

            return true;
          }
        ),
        SCDialogButton(
          title: AppLocalizations.of(context)!.user_answer_friend_request_dialog_deny,
          onPressed: () async {
            try {
              await ref.read(userAnswerFriendRequestUseCaseProvider).call(UserAnswerFriendRequestUseCaseParams(friendRequestId: state.value!.friendRequest!.id, answer: false));
            } catch (e) {
              return false;
            }

            return true;
          }
        ),
        SCDialogButton(title: AppLocalizations.of(context)!.user_answer_friend_request_dialog_cancel)
      ]
    );

    // TODO
  }

  Future<void> _createFriendRequest(BuildContext context) async {
    TextEditingController controller = TextEditingController();

    await showSCSheet(
      context, 
      title: AppLocalizations.of(context)!.user_create_friend_request_title,
      button: SCSheetButton(
        onPressed: () async {
          String trimmedText = controller.text.trim();

          try {
            await ref.read(userCreateFriendRequestUseCaseProvider).call(UserCreateFriendRequestUseCaseParams(userId: state.value!.id, text: trimmedText != "" ? trimmedText : null));
          } catch (e) {
            return false;
          }

          return true;
        },
        title: AppLocalizations.of(context)!.user_create_friend_request_send_button_title
      ),
      children: (bool isLoading) => [
        SCPadding(
          padding: const SCEdgeInsets.symmetric(horizontal: SCGapSize.semiBig),
          child: SCTextInputBox(
            controller: controller,
            hint: AppLocalizations.of(context)!.friend_request_text,
            enabled: !isLoading
          )
        )
      ]
    );
  }

  Future<void> _takeBackFriendRequest(BuildContext context) async {
    await showSCDialog(
      context, 
      title: AppLocalizations.of(context)!.user_take_back_friend_request_dialog_title, 
      text: state.value!.friendRequest!.text ?? AppLocalizations.of(context)!.friend_request_text, 
      buttons: [
        SCDialogButton(
          isPrimary: true,
          title: AppLocalizations.of(context)!.user_take_back_friend_request_dialog_take_back,
          onPressed: () async {
            try {
              await ref.read(userTakeBackFriendRequestUseCaseProvider).call(UserTakeBackFriendRequestUseCaseParams(friendRequestId: state.value!.friendRequest!.id));
            } catch (e) {
              return false;
            }

            return true;

            // TODO
          }
        ),
        SCDialogButton(title: AppLocalizations.of(context)!.user_take_back_friend_request_dialog_cancel)
      ]
    );
  }
}
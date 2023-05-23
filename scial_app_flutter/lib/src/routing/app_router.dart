import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:scial_app_flutter/src/common/main_builder.dart';
import 'package:scial_app_flutter/src/features/auth/presentation/pages/forgot_password_page.dart';
import 'package:scial_app_flutter/src/features/auth/presentation/pages/forgot_password_submission_page.dart';
import 'package:scial_app_flutter/src/features/auth/presentation/pages/forgot_password_verification_page.dart';
import 'package:scial_app_flutter/src/features/auth/presentation/pages/sign_in_page.dart';
import 'package:scial_app_flutter/src/features/auth/presentation/pages/sign_up_page.dart';
import 'package:scial_app_flutter/src/features/auth/presentation/pages/sign_up_verification_page.dart';
import 'package:scial_app_flutter/src/features/discover/presentation/pages/discover_page.dart';
import 'package:scial_app_flutter/src/features/event/presentation/pages/event_page.dart';
import 'package:scial_app_flutter/src/features/home/presentation/pages/home_page.dart';
import 'package:scial_app_flutter/src/features/localization/presentation/pages/change_language_page.dart';
import 'package:scial_app_flutter/src/features/location/presentation/pages/location_page.dart';
import 'package:scial_app_flutter/src/features/notifications/presentation/pages/notifications_page.dart';
import 'package:scial_app_flutter/src/features/scial_day/presentation/pages/scial_day_page.dart';
import 'package:scial_app_flutter/src/features/settings/presentation/pages/settings_page.dart';
import 'package:scial_app_flutter/src/features/theme/presentation/pages/change_theme_page.dart';
import 'package:scial_app_flutter/src/features/user/presentation/pages/user_page.dart';
import 'package:scial_app_flutter/src/services/key_value_storage.dart';

part 'app_router.g.dart';

enum AppRoute {
  initial('/'),
  signIn('/sign-in'),
  signUp('/sign-up'),
  signUpVerification('/sign-up-verification'),
  forgotPassword('/forgot-password'),
  forgotPasswordVerification('/forgot-password-verification'),
  forgotPasswordSubmission('/forgot-password-submission'),
  home('/home'),
  discover('/discover'),
  notifications('/notifications'),
  profile('/profile'),
  location('/location'),
  settings('/settings'),
  scialDay('/scial-day');

  const AppRoute(this.path);

  final String path;
}

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _shellNavigatorKey = GlobalKey<NavigatorState>();

@Riverpod(keepAlive: true)
GoRouter appRouter(AppRouterRef ref) {
  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: AppRoute.initial.path,
    redirect: (context, state) {
      final bool isSplash = state.location == AppRoute.initial.path;
      if (isSplash) return KeyValueStorage.isAuthenticated ? AppRoute.home.path : AppRoute.signIn.path;

      final bool isAuthenticating = state.location == AppRoute.signIn.path || state.subloc == AppRoute.signUp.path || state.subloc == AppRoute.signUpVerification.path || state.subloc == AppRoute.forgotPassword.path || state.subloc == AppRoute.forgotPasswordVerification.path || state.subloc == AppRoute.forgotPasswordSubmission.path;
      if (isAuthenticating && KeyValueStorage.isAuthenticated) return AppRoute.home.path;

      if (!isAuthenticating && !KeyValueStorage.isAuthenticated) return AppRoute.signIn.path;

      return null;
    },
    refreshListenable: KeyValueStorage.authState,
    routes: [
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: AppRoute.initial.path,
        pageBuilder: (BuildContext context, GoRouterState state) => NoTransitionPage(child: Container()) // TODO: Add splash
      ),
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        pageBuilder: (BuildContext context, GoRouterState state, Widget child) {
          return NoTransitionPage(
            child: MainBuilder(
              location: state.location,
              child: child
            )
          );
        },
        routes: [
          GoRoute(
            path: AppRoute.home.path,
            parentNavigatorKey: _shellNavigatorKey,
            pageBuilder: (BuildContext context, GoRouterState state) {
              return const NoTransitionPage(child: HomePage());
            }
          ),
          GoRoute(
            path: AppRoute.discover.path,
            parentNavigatorKey: _shellNavigatorKey,
            pageBuilder: (BuildContext context, GoRouterState state) {
              return const NoTransitionPage(child: DiscoverPage());
            }
          ),
          GoRoute(
            path: AppRoute.notifications.path,
            parentNavigatorKey: _shellNavigatorKey,
            pageBuilder: (BuildContext context, GoRouterState state) {
              return const NoTransitionPage(child: NotificationsPage());
            }
          ),
          GoRoute(
            path: AppRoute.profile.path,
            parentNavigatorKey: _shellNavigatorKey,
            pageBuilder: (BuildContext context, GoRouterState state) {
              return NoTransitionPage(child: UserPage(id: KeyValueStorage.getUserId()!));
            }
          )
        ]
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: AppRoute.signIn.path,
        pageBuilder: (BuildContext context, GoRouterState state) => const NoTransitionPage(child: SignInPage())
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: AppRoute.signUp.path,
        builder: (BuildContext context, GoRouterState state) => const SignUpPage()
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: AppRoute.signUpVerification.path,
        builder: (BuildContext context, GoRouterState state) {
          String? email = state.extra as String?;
          return SignUpVerificationPage(email: email);
        }
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: AppRoute.forgotPassword.path,
        builder: (BuildContext context, GoRouterState state) => const ForgotPasswordPage()
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: AppRoute.forgotPasswordVerification.path,
        builder: (BuildContext context, GoRouterState state) {
          String? email = state.extra as String?;
          return ForgotPasswordVerificationPage(email: email);
        }
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: AppRoute.forgotPasswordSubmission.path,
        builder: (BuildContext context, GoRouterState state) {
          ({ String email, String verificationCode })? data = state.extra as ({ String email, String verificationCode })?;
          return ForgotPasswordSubmissionPage(
            email: data?.email,
            verificationCode: data?.verificationCode
          );
        }
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: '/user/:id',
        builder: (BuildContext context, GoRouterState state) {
          // TODO: What if is not a number in params
          int userId = int.parse(state.params['id']!);
          return UserPage(id: userId);
        }
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: '/event/:id',
        builder: (BuildContext context, GoRouterState state) {
          // TODO: What if is not a number in params
          int eventId = int.parse(state.params['id']!);
          return EventPage(id: eventId);
        }
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: AppRoute.location.path,
        builder: (BuildContext context, GoRouterState state) => const LocationPage()
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: AppRoute.settings.path,
        builder: (BuildContext context, GoRouterState state) => const SettingsPage(),
        routes: [
          GoRoute(
            parentNavigatorKey: _rootNavigatorKey,
            path: 'change-theme',
            builder: (BuildContext context, GoRouterState state) => const ChangeThemePage()
          ),
          GoRoute(
            parentNavigatorKey: _rootNavigatorKey,
            path: 'change-language',
            builder: (BuildContext context, GoRouterState state) => const ChangeLanguagePage()
          )
        ]
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: AppRoute.scialDay.path,
        builder: (BuildContext context, GoRouterState state) => const ScialDayPage()
      )
    ],
    errorBuilder: (BuildContext context, GoRouterState state) => Container() // TODO add error
  );
}

extension AppRouterExtension on BuildContext {

  void navigateToSignUpPage() {
    push(AppRoute.signUp.path);
  }

  void navigateToSignUpVerificationPage(String email) {
    push(AppRoute.signUpVerification.path, extra: email);
  }

  void navigateToForgotPasswordPage() {
    push(AppRoute.forgotPassword.path);
  }

  void navigateToForgotPasswordVerificationPage(String email) {
    push(AppRoute.forgotPasswordVerification.path, extra: email);
  }

  void navigateToForgotPasswordSubmissionPage(String email, String verificationCode) {
    push(AppRoute.forgotPasswordSubmission.path, extra: (email, verificationCode));
  }

  void navigateToHomePage() {
    go(AppRoute.home.path);
  }

  void navigateToDiscoverPage() {
    go(AppRoute.discover.path);
  }

  void navigateToNotificationsPage() {
    go(AppRoute.notifications.path);
  }

  void navigateToProfilePage() {
    go(AppRoute.profile.path);
  }

  void navigateToUserPage(int userId) {
    push('/user/$userId');
  }

  void navigateToEventPage(int eventId) {
    push('/event/$eventId');
  }

  void navigateToLocationPage() {
    push(AppRoute.location.path);
  }

  void navigateToSettingsPage() {
    push(AppRoute.settings.path);
  }

  void navigateToChangeThemePage() {
    push('${AppRoute.settings.path}/change-theme');
  }

  void navigateToChangeLanguagePage() {
    push('${AppRoute.settings.path}/change-language');
  }

  void navigateToScialDayPage() {
    push(AppRoute.scialDay.path);
  }
}
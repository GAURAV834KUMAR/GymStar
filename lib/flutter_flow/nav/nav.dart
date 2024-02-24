import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';

import '/auth/base_auth_user_provider.dart';

import '/index.dart';
import '/flutter_flow/flutter_flow_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, state) =>
          appStateNotifier.loggedIn ? const HomePageWidget() : const IntroWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? const HomePageWidget() : const IntroWidget(),
          routes: [
            FFRoute(
              name: 'Feed',
              path: 'feed',
              builder: (context, params) => const FeedWidget(),
            ),
            FFRoute(
              name: 'Notifications',
              path: 'notifications',
              builder: (context, params) => const NotificationsWidget(),
            ),
            FFRoute(
              name: 'Search',
              path: 'search',
              builder: (context, params) => const SearchWidget(),
            ),
            FFRoute(
              name: 'Profile',
              path: 'profile',
              builder: (context, params) => const ProfileWidget(),
            ),
            FFRoute(
              name: 'Comments',
              path: 'comments',
              builder: (context, params) => CommentsWidget(
                post: params.getParam(
                    'post', ParamType.DocumentReference, false, ['posts']),
              ),
            ),
            FFRoute(
              name: 'PostDetails',
              path: 'postDetails',
              builder: (context, params) => PostDetailsWidget(
                post: params.getParam(
                    'post', ParamType.DocumentReference, false, ['posts']),
              ),
            ),
            FFRoute(
              name: 'NewPost',
              path: 'newPost',
              builder: (context, params) => const NewPostWidget(),
            ),
            FFRoute(
              name: 'CallToAction',
              path: 'callToAction',
              builder: (context, params) => const CallToActionWidget(),
            ),
            FFRoute(
              name: 'Location',
              path: 'location',
              builder: (context, params) => const LocationWidget(),
            ),
            FFRoute(
              name: 'SignUp_Name',
              path: 'signUpName',
              builder: (context, params) => SignUpNameWidget(
                gender: params.getParam('gender', ParamType.String),
                age: params.getParam('age', ParamType.double),
                weight: params.getParam('weight', ParamType.double),
              ),
            ),
            FFRoute(
              name: 'SignUp_Username',
              path: 'signUpUsername',
              builder: (context, params) => SignUpUsernameWidget(
                gender: params.getParam('gender', ParamType.String),
                age: params.getParam('age', ParamType.double),
                weight: params.getParam('weight', ParamType.double),
              ),
            ),
            FFRoute(
              name: 'SignUp_UsernameConfirmation',
              path: 'signUpUsernameConfirmation',
              builder: (context, params) => SignUpUsernameConfirmationWidget(
                gender: params.getParam('gender', ParamType.String),
                age: params.getParam('age', ParamType.double),
                weight: params.getParam('weight', ParamType.double),
              ),
            ),
            FFRoute(
              name: 'TagUsers',
              path: 'tagUsers',
              builder: (context, params) => const TagUsersWidget(),
            ),
            FFRoute(
              name: 'SelectTaggedUsers',
              path: 'selectTaggedUsers',
              builder: (context, params) => const SelectTaggedUsersWidget(),
            ),
            FFRoute(
              name: 'ProfileOther',
              path: 'profileOther',
              builder: (context, params) => ProfileOtherWidget(
                username: params.getParam('username', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'EditProfile',
              path: 'editProfile',
              builder: (context, params) => const EditProfileWidget(),
            ),
            FFRoute(
              name: 'FollowersFollowing',
              path: 'followersFollowing',
              builder: (context, params) => const FollowersFollowingWidget(),
            ),
            FFRoute(
              name: 'FollowersFollowingOther',
              path: 'followersFollowingOther',
              builder: (context, params) => FollowersFollowingOtherWidget(
                userRef: params.getParam(
                    'userRef', ParamType.DocumentReference, false, ['users']),
              ),
            ),
            FFRoute(
              name: 'EditPost',
              path: 'editPost',
              asyncParams: {
                'post': getDoc(['posts'], PostsRecord.fromSnapshot),
              },
              builder: (context, params) => EditPostWidget(
                post: params.getParam('post', ParamType.Document),
              ),
            ),
            FFRoute(
              name: 'Messages',
              path: 'messages',
              builder: (context, params) => const MessagesWidget(),
            ),
            FFRoute(
              name: 'NewMessage',
              path: 'newMessage',
              builder: (context, params) => const NewMessageWidget(),
            ),
            FFRoute(
              name: 'IndividualMessage',
              path: 'individualMessage',
              builder: (context, params) => IndividualMessageWidget(
                chat: params.getParam(
                    'chat', ParamType.DocumentReference, false, ['chats']),
              ),
            ),
            FFRoute(
              name: 'Reels',
              path: 'reels',
              builder: (context, params) => const ReelsWidget(),
            ),
            FFRoute(
              name: 'Intro',
              path: 'intro',
              builder: (context, params) => const IntroWidget(),
            ),
            FFRoute(
              name: 'Gender',
              path: 'gender',
              builder: (context, params) => const GenderWidget(),
            ),
            FFRoute(
              name: 'Agee',
              path: 'agee',
              builder: (context, params) => AgeeWidget(
                gender: params.getParam('gender', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'Weight',
              path: 'weight',
              builder: (context, params) => WeightWidget(
                gender: params.getParam('gender', ParamType.String),
                age: params.getParam('age', ParamType.double),
              ),
            ),
            FFRoute(
              name: 'Login',
              path: 'login',
              builder: (context, params) => LoginWidget(
                gender: params.getParam('gender', ParamType.String),
                age: params.getParam('age', ParamType.double),
                weight: params.getParam('weight', ParamType.double),
              ),
            ),
            FFRoute(
              name: 'SighnUp',
              path: 'sighnUp',
              builder: (context, params) => SighnUpWidget(
                gender: params.getParam('gender', ParamType.String),
                age: params.getParam('age', ParamType.double),
                weight: params.getParam('weight', ParamType.double),
              ),
            ),
            FFRoute(
              name: 'Statics',
              path: 'statics',
              builder: (context, params) => const StaticsWidget(),
            ),
            FFRoute(
              name: 'MealPlanner',
              path: 'mealPlanner',
              builder: (context, params) => const MealPlannerWidget(),
            ),
            FFRoute(
              name: 'WorkOutPlanner',
              path: 'workOutPlanner',
              builder: (context, params) => const WorkOutPlannerWidget(),
            ),
            FFRoute(
              name: 'Home',
              path: 'home',
              builder: (context, params) => const HomeWidget(),
            ),
            FFRoute(
              name: 'friends',
              path: 'friends',
              builder: (context, params) => const FriendsWidget(),
            ),
            FFRoute(
              name: 'community',
              path: 'community',
              builder: (context, params) => const CommunityWidget(),
            ),
            FFRoute(
              name: 'community_message',
              path: 'communityMessage',
              builder: (context, params) => const CommunityMessageWidget(),
            ),
            FFRoute(
              name: 'HomePage',
              path: 'homePage',
              builder: (context, params) => const HomePageWidget(),
            ),
            FFRoute(
              name: 'meal_deatils',
              path: 'mealDeatils',
              builder: (context, params) => const MealDeatilsWidget(),
            ),
            FFRoute(
              name: 'Exercise',
              path: 'exercise',
              builder: (context, params) => const ExerciseWidget(),
            ),
            FFRoute(
              name: 'Exercise_detals',
              path: 'Exercise_details',
              builder: (context, params) => const ExerciseDetalsWidget(),
            ),
            FFRoute(
              name: 'Reel_comment',
              path: 'reel_comments',
              builder: (context, params) => ReelCommentWidget(
                reels: params.getParam(
                    'reels', ParamType.DocumentReference, false, ['Reels']),
              ),
            )
          ].map((r) => r.toRoute(appStateNotifier)).toList(),
        ),
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
      observers: [routeObserver],
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.extraMap.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, [
    bool isList = false,
    List<String>? collectionNamePath,
  ]) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(param, type, isList,
        collectionNamePath: collectionNamePath);
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.location);
            return '/intro';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? const Center(
                  child: SizedBox(
                    width: 12.0,
                    height: 12.0,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Colors.white,
                      ),
                    ),
                  ),
                )
              : page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => const TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouter.of(context).location;
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

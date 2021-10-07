// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:flutter/material.dart' as _i2;

import '../../../auth/presentation/authorization_page.dart' as _i5;
import '../../../auth/presentation/sign_in_page.dart' as _i4;
import '../../../splash/presentation/splash_page.dart' as _i3;
import '../../../starred_repo/presentation/starred_repo_page.dart' as _i6;

class AppRouter extends _i1.RootStackRouter {
  AppRouter([_i2.GlobalKey<_i2.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    SplashPageRoute.name: (routeData) {
      return _i1.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.SplashPage());
    },
    SignInPageRoute.name: (routeData) {
      return _i1.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.SignInPage());
    },
    AuthorizationPageRoute.name: (routeData) {
      final args = routeData.argsAs<AuthorizationPageRouteArgs>();
      return _i1.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i5.AuthorizationPage(
              key: args.key,
              authorizationUrl: args.authorizationUrl,
              onAuthorizationAttempt: args.onAuthorizationAttempt));
    },
    StarredRepoRoute.name: (routeData) {
      return _i1.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.StarredRepo());
    }
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig(SplashPageRoute.name, path: '/'),
        _i1.RouteConfig(SignInPageRoute.name, path: '/sign-in'),
        _i1.RouteConfig(AuthorizationPageRoute.name, path: '/auth'),
        _i1.RouteConfig(StarredRepoRoute.name, path: '/starred')
      ];
}

class SplashPageRoute extends _i1.PageRouteInfo<void> {
  const SplashPageRoute() : super(name, path: '/');

  static const String name = 'SplashPageRoute';
}

class SignInPageRoute extends _i1.PageRouteInfo<void> {
  const SignInPageRoute() : super(name, path: '/sign-in');

  static const String name = 'SignInPageRoute';
}

class AuthorizationPageRoute
    extends _i1.PageRouteInfo<AuthorizationPageRouteArgs> {
  AuthorizationPageRoute(
      {_i2.Key? key,
      required Uri authorizationUrl,
      required dynamic Function(Uri) onAuthorizationAttempt})
      : super(name,
            path: '/auth',
            args: AuthorizationPageRouteArgs(
                key: key,
                authorizationUrl: authorizationUrl,
                onAuthorizationAttempt: onAuthorizationAttempt));

  static const String name = 'AuthorizationPageRoute';
}

class AuthorizationPageRouteArgs {
  const AuthorizationPageRouteArgs(
      {this.key,
      required this.authorizationUrl,
      required this.onAuthorizationAttempt});

  final _i2.Key? key;

  final Uri authorizationUrl;

  final dynamic Function(Uri) onAuthorizationAttempt;
}

class StarredRepoRoute extends _i1.PageRouteInfo<void> {
  const StarredRepoRoute() : super(name, path: '/starred');

  static const String name = 'StarredRepoRoute';
}

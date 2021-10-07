import 'package:auto_route/annotations.dart';
import 'package:repo_viewer/auth/presentation/authorization_page.dart';
import 'package:repo_viewer/auth/presentation/sign_in_page.dart';
import 'package:repo_viewer/splash/presentation/splash_page.dart';
import 'package:repo_viewer/starred_repo/presentation/starred_repo_page.dart';

@MaterialAutoRouter(
  routes: [
    AutoRoute(page: SplashPage, initial: true),
    AutoRoute(page: SignInPage, path: '/sign-in'),
    AutoRoute(page: AuthorizationPage, path: '/auth'),
    AutoRoute(page: StarredRepo, path: '/starred'),
  ],
  // replaceInRouteName: 'Page,Route',
)
class $AppRouter {}

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:repo_viewer/auth/application/auth_state.dart';
import 'package:repo_viewer/auth/shared/providers.dart';
import 'package:repo_viewer/core/presentation/routes/router.gr.dart';

class AppWidget extends StatelessWidget {
  final initializationProvider = FutureProvider<Unit>((ref) async {
    final auth = ref.read(authNotifierProvider.notifier);
    await auth.checkAndUpdateAuthStatus();
    return unit;
  });
  final router = AppRouter();
  @override
  Widget build(BuildContext context) {
    return ProviderListener(
      onChange: (context, value) {},
      provider: initializationProvider,
      child: ProviderListener<AuthState>(
        provider: authNotifierProvider,
        onChange: (context, state) {
          state.maybeMap(
            authenticated: (_) {
              router.pushAndPopUntil(
                const StarredRepoRoute(),
                predicate: (_) => false,
              );
            },
            unAuthenticated: (_) {
              router.pushAndPopUntil(
                const SignInPageRoute(),
                predicate: (_) => false,
              );
            },
            orElse: () {},
          );
        },
        child: MaterialApp.router(
          routerDelegate: router.delegate(),
          routeInformationParser: router.defaultRouteParser(),
          title: 'Material App',
        ),
      ),
    );
  }
}

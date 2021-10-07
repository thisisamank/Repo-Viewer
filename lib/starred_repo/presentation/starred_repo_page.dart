import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:repo_viewer/auth/application/auth_state.dart';
import 'package:repo_viewer/auth/shared/providers.dart';

class StarredRepo extends ConsumerWidget {
  const StarredRepo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return Scaffold(
      body: Center(
        child: Container(
          child: ElevatedButton(
            onPressed: () {
              context
                  .read<AuthNotifier>(authNotifierProvider.notifier)
                  .signOut();
            },
            child: const Text("Sign out"),
          ),
        ),
      ),
    );
  }
}

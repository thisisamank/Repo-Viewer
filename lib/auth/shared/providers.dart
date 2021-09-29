import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:repo_viewer/auth/application/auth_state.dart';
import 'package:repo_viewer/auth/infrastructure/credentials_storage.dart/credential_storage.dart';
import 'package:repo_viewer/auth/infrastructure/credentials_storage.dart/secure_credentials_storage.dart';
import 'package:repo_viewer/auth/infrastructure/github_authenticator.dart';

final flutterSecureStorageProvider =
    Provider((ref) => const FlutterSecureStorage());

final dioProvider = Provider((ref) => Dio());

final credentialsSecureStorage = Provider<CredentialStorage>(
  (ref) => SecureCredentialStorage(ref.watch(flutterSecureStorageProvider)),
);

final githubAuthenticatorProvider = Provider(
  (ref) => GithubAuthenticator(
    ref.watch(credentialsSecureStorage),
    ref.watch(dioProvider),
  ),
);

final authNotifierProvider = StateNotifierProvider<AuthNotifier, AuthState>(
  (ref) => AuthNotifier(ref.watch(githubAuthenticatorProvider)),
);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:repo_viewer/auth/domain/auth_failure.dart';
import 'package:repo_viewer/auth/infrastructure/github_authenticator.dart';
part 'auth_state.freezed.dart';

@freezed
abstract class AuthState with _$AuthState {
  const factory AuthState.initial() = _Initial;
  const factory AuthState.authenticated() = _Authenticated;
  const factory AuthState.unAuthenticated() = _UnAuthenticated;
  const factory AuthState.failure(AuthFailure failure) = _Failure;
}

typedef AuthUriCallback = Future<Uri> Function(Uri authorizationUrl);

class AuthNotifier extends StateNotifier<AuthState> {
  final GithubAuthenticator _githubAuthenticator;
  AuthNotifier(this._githubAuthenticator) : super(const AuthState.initial());

  Future<void> checkAndUpdateAuthStatus() async {
    state = (await _githubAuthenticator.isSignedIn())
        ? const AuthState.authenticated()
        : const AuthState.unAuthenticated();
  }

  Future<void> signIn(AuthUriCallback authorizationUriCallback) async {
    final grant = _githubAuthenticator.createGrant();
    final redirectUrl = await authorizationUriCallback(
      _githubAuthenticator.getAuthorizationCodeGrant(grant),
    );
    final successOrFailure =
        await _githubAuthenticator.handleAuthorizationResponse(
      grant,
      redirectUrl.queryParameters,
    );
    state = successOrFailure.fold(
      (l) => AuthState.failure(l),
      (r) => const AuthState.authenticated(),
    );
    grant.close();
  }

  Future<void> signOut() async {
    final successOrFailure = await _githubAuthenticator.signOut();
    state = successOrFailure.fold(
      (l) => AuthState.failure(l),
      (r) => const AuthState.unAuthenticated(),
    );
  }
}

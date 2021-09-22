import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:repo_viewer/auth/domain/auth_failure.dart';
part 'auth_state.freezed.dart';

@freezed
abstract class AuthState with _$AuthState {
  const factory AuthState.initial() = _Initial;
  const factory AuthState.authenticated() = _Authenticated;
  const factory AuthState.unAuthenticated() = _UnAuthenticated;
  const factory AuthState.failure(AuthFailure failure) = _Failure;
}

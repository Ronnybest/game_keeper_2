part of 'auth_bloc.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = _Initial;

  const factory AuthState.emailLoginLoading() = _EmailLoginLoading;
  const factory AuthState.emailLoginLoaded(User user) = _EmailLoginLoaded;
  const factory AuthState.emailLoginError(dynamic error) = _EmailLoginError;
  const factory AuthState.emailLoginUserNotFound() = _EmailLoginUserNotFound;
}

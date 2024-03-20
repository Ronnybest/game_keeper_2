part of 'auth_bloc.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = _Initial;

  const factory AuthState.emailLoginLoading() = _EmailLoginLoading;
  const factory AuthState.emailLoginLoaded(User user) = _EmailLoginLoaded;
  const factory AuthState.emailLoginError(dynamic error) = _EmailLoginError;
  const factory AuthState.emailLoginUserNotFound() = _EmailLoginUserNotFound;

  const factory AuthState.emailRegisterLoading() = _EmailRegisterLoading;
  const factory AuthState.emailRegisterLoaded(User user) = _EmailRegisterLoaded;
  const factory AuthState.emailRegisterError(dynamic error) = _EmailRegisterError;

  const factory AuthState.emailRestorePasswordLoading() = _EmailRestorePasswordLoading;
  const factory AuthState.emailRestorePasswordLoaded() = _EmailRestorePasswordLoaded;
  const factory AuthState.emailRestorePasswordError(dynamic error) = _EmailRestorePasswordError;
}

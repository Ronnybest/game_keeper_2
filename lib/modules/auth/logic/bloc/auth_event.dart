part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.emailLogIn(String login, String pass) = _EmailLogIn;

  const factory AuthEvent.emailRegister(String login, String pass) = _EmailRegister;

  const factory AuthEvent.emailRestorePassword(String email) = _EmailRestorePassword;
}

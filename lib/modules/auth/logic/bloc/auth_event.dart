part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.emailLogIn(String login, String pass) = _EmailLogIn;
}

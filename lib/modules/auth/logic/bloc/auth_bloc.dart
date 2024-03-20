import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'auth_state.dart';
part 'auth_event.dart';
part 'auth_bloc.freezed.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(const AuthState.initial()) {
    on<AuthEvent>(
      (event, emit) => event.map(
        emailLogIn: (value) async {
          emit(const AuthState.emailLoginLoading());
          try {
            final user = await FirebaseAuth.instance.signInWithEmailAndPassword(
              email: value.login,
              password: value.pass,
            );
            if (user.user == null) {
              emit(const AuthState.emailLoginUserNotFound());
              return;
            }
            emit(AuthState.emailLoginLoaded(user.user!));
          } on FirebaseAuthException catch (e) {
            emit(AuthState.emailLoginError(e));
          }
          return null;
        },
      ),
    );
  }
}

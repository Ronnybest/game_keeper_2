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
        emailRegister: (_EmailRegister value) async {
          try {
            emit(const AuthState.emailRegisterLoading());
            final user =
                await FirebaseAuth.instance.createUserWithEmailAndPassword(
              email: value.login,
              password: value.pass,
            );
            emit(AuthState.emailRegisterLoaded(user.user!));
          } on FirebaseAuthException catch (e) {
            emit(
              AuthState.emailRegisterError(e),
            );
          }
          return null;
        },
        emailRestorePassword: (_EmailRestorePassword value) async {
          try {
            emit(const AuthState.emailRestorePasswordLoading());
            await FirebaseAuth.instance
                .sendPasswordResetEmail(email: value.email);
            emit(const AuthState.emailRestorePasswordLoaded());
          } on FirebaseAuthException catch (e) {
            emit(AuthState.emailRestorePasswordError(e));
          }
          return null;
        },
      ),
    );
  }
}

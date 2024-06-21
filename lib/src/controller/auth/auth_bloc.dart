import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_problem/src/data/repos/auth_repo.dart';
import 'package:flutter_problem/src/utils/constants/enums.dart';
import 'package:flutter_problem/src/utils/helpers/helpers_function.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(const AuthState()) {
    on<EmailChanged>((event, emit) => _emailChanged(event, emit));
    on<PassWordChanged>((event, emit) => _passwordChanged(event, emit));
    on<GoogleSignInEvent>((event, emit) => _googleSignInEvent(event, emit));
    on<AppStarted>((event, emit) => _appStarted(event, emit));

    AuthRepo.authState.listen(
      (user) {
        add(
          AppStarted(
            currUser: user,
          ),
        );
      },
    );
  }

  _emailChanged(EmailChanged event, Emitter<AuthState> emit) {
    final email = event.email;
    if (email.isEmpty) {
      emit(
        state.copyWith(
          email: email,
          isValidEmail: EmailState.init,
        ),
      );
    } else {
      emit(
        state.copyWith(
          email: email,
          isValidEmail: HelpersFunction.isEmailValid(email)
              ? EmailState.valid
              : EmailState.invalid,
        ),
      );
    }
  }

  _passwordChanged(PassWordChanged event, Emitter<AuthState> emit) {
    final password = event.password;
    if (password.isEmpty) {
      emit(
        state.copyWith(
          password: password,
          isValidPassWord: PasswordState.init,
        ),
      );
    } else {
      emit(
        state.copyWith(
          password: password,
          isValidPassWord: HelpersFunction.isPasswordValid(password)
              ? PasswordState.valid
              : PasswordState.invalid,
        ),
      );
    }
  }

  _googleSignInEvent(GoogleSignInEvent event, Emitter<AuthState> emit) async {
    emit(
      state.copyWith(
        isLoading: true,
      ),
    );
    try {
      UserCredential? userCredential = await AuthRepo.signInWithGoogle();
      if (userCredential != null) {
        emit(
          state.copyWith(
            isLoading: false,
            signInState: SignInState.success,
          ),
        );
      }
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          signInState: SignInState.failure,
        ),
      );
    }
  }

  _appStarted(AppStarted event, Emitter<AuthState> emit) {
    emit(
      state.copyWith(
        currentUser: event.currUser,
      ),
    );
  }
}

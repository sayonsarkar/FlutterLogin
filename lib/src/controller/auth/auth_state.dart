part of 'auth_bloc.dart';

class AuthState extends Equatable {
  const AuthState({
    this.email = '',
    this.password = '',
    this.isValidEmail = EmailState.init,
    this.isValidPassWord = PasswordState.init,
    this.isLoading = false,
    this.signInState = SignInState.init,
    this.currentUser,
  });

  final String email;
  final String password;
  final EmailState isValidEmail;
  final PasswordState isValidPassWord;
  final bool isLoading;
  final SignInState signInState;
  final User? currentUser;

  @override
  List<Object?> get props => [
        email,
        password,
        isValidEmail,
        isValidPassWord,
        isLoading,
        signInState,
        currentUser,
      ];

  AuthState copyWith({
    final String? email,
    final String? password,
    final EmailState? isValidEmail,
    final PasswordState? isValidPassWord,
    final bool? isLoading,
    final SignInState? signInState,
    final User? currentUser,
  }) {
    return AuthState(
      email: email ?? this.email,
      isValidEmail: isValidEmail ?? this.isValidEmail,
      isValidPassWord: isValidPassWord ?? this.isValidPassWord,
      password: password ?? this.password,
      isLoading: isLoading ?? this.isLoading,
      signInState: signInState ?? this.signInState,
      currentUser: currentUser ?? this.currentUser,
    );
  }
}

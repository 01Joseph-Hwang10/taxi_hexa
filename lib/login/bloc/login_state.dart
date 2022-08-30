part of 'login_bloc.dart';

class LoginState extends Equatable {
  const LoginState({
    required this.isLoggedIn,
    required this.userInfo,
  });

  const LoginState.initial()
      : this(
          isLoggedIn: false,
          userInfo: null,
        );

  final bool isLoggedIn;
  final UserModel? userInfo;

  LoginState copyWith({
    bool? isLoggedIn,
    UserModel? userInfo,
  }) {
    return LoginState(
      isLoggedIn: isLoggedIn ?? this.isLoggedIn,
      userInfo: userInfo ?? this.userInfo,
    );
  }

  @override
  List<Object?> get props => [isLoggedIn, userInfo];
}

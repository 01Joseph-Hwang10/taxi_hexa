part of 'login_bloc.dart';

class LoginState extends Equatable {
  const LoginState({
    required this.isLoggedIn,
    required this.userInfo,
  });

  const LoginState.initial()
      : this(
          isLoggedIn: false,
          userInfo: "",
        );

  final bool isLoggedIn;
  final Object userInfo;

  LoginState copyWith({
    bool? isLoggedIn,
    Object? userInfo,
  }) {
    return LoginState(
      isLoggedIn: isLoggedIn ?? this.isLoggedIn,
      userInfo: userInfo ?? this.userInfo,
    );
  }

  @override
  List<Object> get props => [isLoggedIn, userInfo];
}

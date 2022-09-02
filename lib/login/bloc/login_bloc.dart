import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:taxi_hexa/login/models/user.dart';

part 'login_event.dart';
part 'login_state.dart';

UserCredential? currentuser;

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginState.initial()) {
    on<LoggedIn>(_onLoggedIn);
    on<LoggedOut>(_onLoggedOut);
    on<UpdateUserInfo>(_onUpdateUserInfo);
  }

  void _onLoggedIn(
    LoggedIn event,
    Emitter<LoginState> emit,
  ) {
    emit(
      state.copyWith(
        isLoggedIn: true,
        userInfo: event.userInfo,
      ),
    );
  }

  void _onLoggedOut(
    LoggedOut event,
    Emitter<LoginState> emit,
  ) {
    emit(
      state.copyWith(
        isLoggedIn: false,
      ),
    );
  }

  void _onUpdateUserInfo(
    UpdateUserInfo event,
    Emitter<LoginState> emit,
  ) {
    emit(
      state.copyWith(
        userInfo: event.userInfo,
      ),
    );
  }
}

part of 'user_bloc.dart';

@immutable
abstract class UserState {

  final bool existeUser;
  final Usuario? user;

  const UserState({
    this.existeUser = false,
    this.user
  });

}

class UserInitialState extends UserState {

  const UserInitialState(): super(existeUser: false, user: null);

}

class UserSetSaste extends UserState{

  final Usuario newUser;
  UserSetSaste(
    this.newUser
  ): super(existeUser: true, user: newUser);

}
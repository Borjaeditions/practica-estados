import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:estados/models/usuario.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(const UserInitialState()) {
    on<ActivateUser>((event, emit) {
      //similar a node, el event recibe los datos y el emit es el que devuelve
      print("ActivatedUser Call");
      emit(UserSetSaste(event.user));
    });
  }
}

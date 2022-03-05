import 'package:bloc/bloc.dart';
import 'package:bwafm/cubit/cubits.dart';
import 'package:bwafm/models/models.dart';
import 'package:bwafm/services/services.dart';
import 'package:equatable/equatable.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());

  Future<void> signIn(String email, String password) async {
   var result = await UserServices.signIn(email, password);
    if (result.value != null) {
      emit(UserLoaded(result.value));
    } else {
      emit(UserLoadFailed(result.message));
    }
  }
}

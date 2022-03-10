import 'dart:io';
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

  Future<void> signUp(User user, String password, {File picturePath}) async {
    ApiresultValue<User> result =
        await UserServices.signUp(user, password, picturePath: picturePath);
    if (result.value != null) {
      emit(UserLoaded(result.value));
    } else {
      emit(UserLoadFailed(result.message));
    }
  }

  Future<void> uploadFilePicture(File filePicture) async {
    ApiresultValue<String> result =
        await UserServices.uploadPicture(filePicture);

    if (result.value != null) {
      emit(UserLoaded((state as UserLoaded).user.copyWith(
          picturePath: "http://foodmarket-backend.buildwithangga.id/storege" +
              result.value)));
    }
  }
}

import 'package:bloc/bloc.dart';
import 'package:bwafm/models/models.dart';
import 'package:bwafm/services/services.dart';
import 'package:equatable/equatable.dart';

part 'food_state.dart';

class FoodCubit extends Cubit<FoodState> {
  FoodCubit() : super(FoodInitial());

  Future<void> getFood() async {
    ApiresultValue<List<Food>> result = await FoodServices.getFood();

    if (result.value != null) {
      emit(FoodLoaded(result.value));
    } else {
      emit(FoodLoadFailed(result.message));
    }
  }
}

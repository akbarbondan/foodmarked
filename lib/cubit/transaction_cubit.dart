import 'package:bloc/bloc.dart';
import 'package:bwafm/models/models.dart';
import 'package:bwafm/services/services.dart';
import 'package:equatable/equatable.dart';

part 'transaction_state.dart';

class TransactionCubit extends Cubit<TransactionState> {
  TransactionCubit() : super(TransactionInitial());

  Future<void> getTransaction() async {
    ApiresultValue<List<Transaction>> result =
        await TransactionServices.getTransaction();

    if (result.value != null) {
      emit(TransactionLoaded(result.value));
    } else {
      emit(TransactionLoadedFailed(result.message));
    }
  }

  Future<bool> submitTransaction(Transaction transaction) async {
    ApiresultValue<Transaction> result =
        await TransactionServices.submitTransaction(transaction);

    if (result.value != null) {
      emit(TransactionLoaded(
          (state as TransactionLoaded).transaction + [result.value]));
      print(transaction);
      return true;
    } else {
      return false;
    }
  }
}

part of 'services.dart';

class TransactionServices {
  static Future<ApiresultValue<List<Transaction>>> getTransaction() async {
    Future.delayed(Duration(milliseconds: 500));
    return ApiresultValue(value: mockTransaction);
  }

  static Future<ApiresultValue<Transaction>> submitTransaction(
      Transaction transaction) async {
    await Future.delayed(Duration(milliseconds: 500));

    return ApiresultValue(
        value: transaction.copyWith(
            id: 123, transactionStatus: TransactionStatus.pending));
  }
}

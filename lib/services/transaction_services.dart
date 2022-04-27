part of 'services.dart';

class TransactionServices {
  static Future<ApiresultValue<List<Transaction>>> getTransaction(
      {https.Client client}) async {
    client ??= https.Client();
    String url = baseUrl + 'transaction';
    var respond = await client.get(
      url,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer ${User.token}"
      },
    );
    if (respond.statusCode != 200) {
      return ApiresultValue(message: "Please try again");
    }
    var data = jsonDecode(respond.body);
    List<Transaction> transactions = (data['data']['data'] as Iterable)
        .map((e) => Transaction.fromJson(e))
        .toList();
    return ApiresultValue(value: transactions);
  }

  static Future<ApiresultValue<Transaction>> submitTransaction(
      Transaction transaction) async {
    await Future.delayed(Duration(milliseconds: 500));

    return ApiresultValue(
        value: transaction.copyWith(
            id: 123, transactionStatus: TransactionStatus.pending));
  }
}

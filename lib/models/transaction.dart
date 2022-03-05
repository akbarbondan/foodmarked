part of 'models.dart';

enum TransactionStatus { delivered, on_delivery, pending, cancelled }

class Transaction extends Equatable {
  final int id;
  final Food food;
  final int quantity;
  final int total;
  final DateTime dateTime;
  final TransactionStatus transactionStatus;
  final User user;

  Transaction(
      {this.id,
      this.food,
      this.quantity,
      this.total,
      this.dateTime,
      this.transactionStatus,
      this.user});

  Transaction copyWith(
      {int id,
      Food food,
      int quantity,
      int total,
      DateTime dateTime,
      TransactionStatus transactionStatus,
      User user}) {
    return Transaction(
        id: id ?? this.id,
        food: food ?? this.food,
        quantity: quantity ?? this.quantity,
        total: total ?? this.total,
        dateTime: dateTime ?? this.dateTime,
        transactionStatus: transactionStatus ?? this.transactionStatus,
        user: user ?? this.user);
  }

  @override
  List<Object> get props =>
      [id, food, quantity, total, dateTime, transactionStatus, user];
}

List<Transaction> mockTransaction = [
  Transaction(
      id: 1,
      food: mockFood[1],
      quantity: 10,
      total: (mockFood[1].price * 10 * 1.1).round() + 500000,
      dateTime: DateTime.now(),
      transactionStatus: TransactionStatus.delivered,
      user: mockUser),
  Transaction(
      id: 2,
      food: mockFood[2],
      quantity: 10,
      total: (mockFood[2].price * 10 * 1.1).round() + 500000,
      dateTime: DateTime.now(),
      transactionStatus: TransactionStatus.on_delivery,
      user: mockUser),
  Transaction(
      id: 3,
      food: mockFood[3],
      quantity: 10,
      total: (mockFood[3].price * 10 * 1.1).round() + 500000,
      dateTime: DateTime.now(),
      transactionStatus: TransactionStatus.cancelled,
      user: mockUser)
];

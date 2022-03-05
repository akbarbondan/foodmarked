part of 'widgets.dart';

class OrderList extends StatelessWidget {
  final Transaction transaction;
  final double itemWidth;
  OrderList({@required this.transaction, this.itemWidth});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 60,
          width: 60,
          margin: EdgeInsets.only(right: 12),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                  image: NetworkImage(transaction.food.pictureFood),
                  fit: BoxFit.cover)),
        ),
        SizedBox(
          width: itemWidth - 182,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                transaction.food.nameFood,
                style: blackFontStyle2,
                maxLines: 1,
                overflow: TextOverflow.clip,
              ),
              Text(
                '${transaction.quantity} Item(s) ' +
                    '• ' +
                    NumberFormat.currency(
                            symbol: 'IDR ', decimalDigits: 0, locale: 'id-ID')
                        .format(transaction.total),
                style: greyTextFont.copyWith(fontSize: 13),
              )
            ],
          ),
        ),
        SizedBox(
          width: 110,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(convertMont(transaction.dateTime)),
              (transaction.transactionStatus == TransactionStatus.cancelled)
                  ? Text("Cancelled",
                      style: GoogleFonts.poppins(
                        color: 'D9435E'.toColor(),
                        fontSize: 10,
                      ))
                  : (transaction.transactionStatus == TransactionStatus.pending)
                      ? Text("Pendding",
                          style: GoogleFonts.poppins(
                            color: 'D9435E'.toColor(),
                            fontSize: 10,
                          ))
                      : (transaction.transactionStatus ==
                              TransactionStatus.on_delivery)
                          ? Text("On Delivery",
                              style: GoogleFonts.poppins(
                                color: "1ABC9C".toColor(),
                                fontSize: 10,
                              ))
                          : SizedBox()
            ],
          ),
        )
      ],
    );
  }
}

String convertMont(DateTime dateTime) {
  String month;

  switch (dateTime.month) {
    case 1:
      month = "Jan";
      break;
    case 2:
      month = "Feb";
      break;
    case 3:
      month = "Mar";
      break;
    case 4:
      month = "Apr";
      break;
    case 5:
      month = "Mei";
      break;
    case 6:
      month = "Jun";
      break;
    case 7:
      month = "Jul";
      break;
    case 8:
      month = "Agt";
      break;
    case 9:
      month = "Sep";
      break;
    case 10:
      month = "Okt";
      break;
    case 11:
      month = "Nov";
      break;

    default:
      month = "Des";
  }

  return month + '${dateTime.day}, ${dateTime.hour}:${dateTime.minute} ';
}

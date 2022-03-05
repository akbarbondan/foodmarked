part of 'pages.dart';

class PaymentPage extends StatefulWidget {
  final Transaction transaction;

  PaymentPage({this.transaction});

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  bool isloaded = false;
  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      onBackButton: () {},
      title: "Payment",
      subTitle: "You deserve better meal",
      backColor: 'FAFAFA'.toColor(),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.fromLTRB(defaultMargin, 16, defaultMargin, 16),
            decoration: BoxDecoration(color: Colors.white),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Item Order",
                  style: blackFontStyle2,
                ),
                Container(
                  margin: EdgeInsets.only(top: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                image: DecorationImage(
                                    image: NetworkImage(
                                        widget.transaction.food.pictureFood),
                                    fit: BoxFit.cover)),
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width -
                                    2 * defaultMargin -
                                    60 -
                                    12 -
                                    78,
                                child: Text(
                                  widget.transaction.food.nameFood,
                                  style: blackFontStyle2,
                                  maxLines: 1,
                                  overflow: TextOverflow.clip,
                                ),
                              ),
                              Text(
                                NumberFormat.currency(
                                        locale: 'id-ID',
                                        decimalDigits: 0,
                                        symbol: 'IDR ')
                                    .format(widget.transaction.food.price),
                                style: greyTextFont.copyWith(fontSize: 13),
                              )
                            ],
                          ),
                        ],
                      ),
                      Text(
                        '${widget.transaction.quantity} Item(s)',
                        style: greyTextFont.copyWith(fontSize: 13),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16, bottom: 8),
                  child: Text(
                    "Details Transaction",
                    style: blackFontStyle3,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2 -
                          defaultMargin -
                          5,
                      child: Text(
                        widget.transaction.food.nameFood,
                        style: greyTextFont,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2 -
                          defaultMargin -
                          5,
                      child: Text(
                        NumberFormat.currency(
                                locale: 'id-ID',
                                symbol: 'IDR ',
                                decimalDigits: 0)
                            .format(widget.transaction.total),
                        style: blackFontStyle3,
                        textAlign: TextAlign.right,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 6,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2 -
                          defaultMargin -
                          5,
                      child: Text(
                        'Driver',
                        style: greyTextFont,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2 -
                          defaultMargin -
                          5,
                      child: Text(
                        NumberFormat.currency(
                                locale: 'id-ID',
                                symbol: 'IDR ',
                                decimalDigits: 0)
                            .format(50000),
                        style: blackFontStyle3,
                        textAlign: TextAlign.right,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 6,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2 -
                          defaultMargin -
                          5,
                      child: Text(
                        'Tax 10%',
                        style: greyTextFont,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2 -
                          defaultMargin -
                          5,
                      child: Text(
                        NumberFormat.currency(
                                locale: 'id-ID',
                                symbol: 'IDR ',
                                decimalDigits: 0)
                            .format(widget.transaction.total * 0.1),
                        style: blackFontStyle3,
                        textAlign: TextAlign.right,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 6,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2 -
                          defaultMargin -
                          5,
                      child: Text(
                        'Total',
                        style: greyTextFont,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2 -
                          defaultMargin -
                          5,
                      child: Text(
                        NumberFormat.currency(
                                locale: 'id-ID',
                                symbol: 'IDR ',
                                decimalDigits: 0)
                            .format(widget.transaction.total * 1.1 + 50000),
                        style: blackFontStyle3.copyWith(
                            fontWeight: FontWeight.w500,
                            color: '1ABC9C'.toColor()),
                        textAlign: TextAlign.right,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Container(
            color: Colors.white,
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            margin: EdgeInsets.only(top: defaultMargin),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 16, bottom: 8),
                  child: Text(
                    "Deliver to:",
                    style: blackFontStyle3,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2 -
                          defaultMargin -
                          5,
                      child: Text(
                        'Name',
                        style: greyTextFont,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2 -
                          defaultMargin -
                          5,
                      child: Text(
                        widget.transaction.user.name,
                        style: blackFontStyle3,
                        textAlign: TextAlign.right,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 6,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2 -
                          defaultMargin -
                          5,
                      child: Text(
                        'Phone No.',
                        style: greyTextFont,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2 -
                          defaultMargin -
                          5,
                      child: Text(
                        widget.transaction.user.phoneNumber,
                        style: blackFontStyle3,
                        textAlign: TextAlign.right,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 6,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2 -
                          defaultMargin -
                          5,
                      child: Text(
                        'Address',
                        style: greyTextFont,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2 -
                          defaultMargin -
                          5,
                      child: Text(
                        widget.transaction.user.address,
                        style: blackFontStyle3,
                        textAlign: TextAlign.right,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 6,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2 -
                          defaultMargin -
                          5,
                      child: Text(
                        'House No.',
                        style: greyTextFont,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2 -
                          defaultMargin -
                          5,
                      child: Text(
                        widget.transaction.user.houseNumber,
                        style: blackFontStyle3,
                        textAlign: TextAlign.right,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 6,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2 -
                          defaultMargin -
                          5,
                      child: Text(
                        'City',
                        style: greyTextFont,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2 -
                          defaultMargin -
                          5,
                      child: Text(
                        widget.transaction.user.city,
                        style: blackFontStyle3,
                        textAlign: TextAlign.right,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 6,
                )
              ],
            ),
          ),
          (isloaded)
              ? Center(
                  child: loadingIndikator,
                )
              : Container(
                  margin: EdgeInsets.only(top: defaultMargin),
                  height: 45,
                  width: 312,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(8)),
                  child: RaisedButton(
                    onPressed: () async {
                      bool result = await context
                          .bloc<TransactionCubit>()
                          .submitTransaction(widget.transaction.copyWith(
                              dateTime: DateTime.now(),
                              total: (widget.transaction.total * 1.1).toInt() +
                                  50000));

                      if (result == true) {
                        Get.to(SuccessOrderPage());
                        
                      } else {
                        setState(() {
                          isloaded == false;
                        });
                        Get.snackbar("", "Message",
                            backgroundColor: 'D9435E'.toColor(),
                            titleText: Text(
                              "Transaction Failed",
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                            icon: Icon(
                              MdiIcons.closeCircleOutline,
                              color: Colors.white,
                            ),
                            messageText: Text(
                              "Please try again later.",
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                              ),
                            ));
                      }
                    },
                    color: mainColor,
                    child: Text(
                      "Checkout Now",
                      style: blackFontStyle2,
                    ),
                  ),
                ),
          SizedBox(
            height: 60,
          )
        ],
      ),
    );
  }
}

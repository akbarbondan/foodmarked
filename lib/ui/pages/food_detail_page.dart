part of 'pages.dart';

class FoodDetailPage extends StatefulWidget {
  final Function onBackButton;
  final Transaction transaction;
  FoodDetailPage({this.onBackButton, this.transaction});

  @override
  _FoodDetailPageState createState() => _FoodDetailPageState();
}

class _FoodDetailPageState extends State<FoodDetailPage> {
  int quantity = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(color: mainColor),
          SafeArea(
              child: Container(
            color: Colors.white,
          )),
          SafeArea(
              child: Container(
            height: 300,
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(widget.transaction.food.pictureFood),
                    fit: BoxFit.cover)),
            child: Container(
              height: 100,
              padding: EdgeInsets.fromLTRB(defaultMargin, 30, defaultMargin, 0),
              child: Align(
                alignment: Alignment.topLeft,
                child: GestureDetector(
                  onTap: () {
                    if (widget.onBackButton != null) {
                      widget.onBackButton();
                    }
                  },
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        color: Colors.black26,
                        borderRadius: BorderRadius.circular(8)),
                    child: const Center(
                        child: Icon(
                      Icons.arrow_back_ios_new,
                      size: 32,
                      color: Colors.white,
                    )),
                  ),
                ),
              ),
            ),
          )),
          SafeArea(
              child: Container(
            margin: EdgeInsets.only(top: 250),
            child: ListView(
              children: [
                Column(
                  children: [
                    //// OnBackButton
                    ///
                    //// BODY
                    Container(
                      width: double.infinity,
                      padding:
                          EdgeInsets.symmetric(vertical: 26, horizontal: 16),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width - 134,
                                    child: Text(
                                      widget.transaction.food.nameFood,
                                      style: blackFontStyle2,
                                      overflow: TextOverflow.clip,
                                      maxLines: 1,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 6,
                                  ),
                                  Rating(widget.transaction.food.rate)
                                ],
                              ),
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        quantity = max(1, quantity - 1);
                                      });
                                    },
                                    child: Container(
                                      width: 26,
                                      height: 26,
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.black),
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      child: Icon(MdiIcons.minus),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 50,
                                    child: Center(
                                      child: Text(
                                        quantity.toString(),
                                        style: blackFontStyle2,
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        quantity = min(999, quantity + 1);
                                      });
                                    },
                                    child: Container(
                                      width: 26,
                                      height: 26,
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.black),
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      child: Icon(MdiIcons.plus),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 14, 0, 16),
                            child: Text(
                              widget.transaction.food.deskripsiFood,
                              style: greyTextFont,
                            ),
                          ),
                          Text(
                            "Ingredients:",
                            style: blackFontStyle2,
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 4, 0, 41),
                            child: Text(
                              widget.transaction.food.ingredients,
                              style: greyTextFont,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Total Price',
                                      style:
                                          greyTextFont.copyWith(fontSize: 13)),
                                  SizedBox(
                                      width: MediaQuery.of(context).size.width -
                                          240,
                                      child: Text(
                                        NumberFormat.currency(
                                                symbol: 'IDR ',
                                                locale: 'id-ID',
                                                decimalDigits: 0)
                                            .format(quantity *
                                                widget.transaction.food.price),
                                        style: blackFontStyle2.copyWith(
                                            fontSize: 18),
                                        overflow: TextOverflow.clip,
                                        maxLines: 1,
                                      ))
                                ],
                              ),
                              SizedBox(
                                height: 45,
                                width: 163,
                                child: RaisedButton(
                                  onPressed: () {
                                    Get.to(() => PaymentPage(
                                        transaction: widget.transaction
                                            .copyWith(
                                                quantity: quantity,
                                                total: quantity *
                                                    widget.transaction.food
                                                        .price)));
                                  },
                                  color: mainColor,
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Text(
                                    'Order Now',
                                    style: blackFontStyle3.copyWith(
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ))
        ],
      ),
    );
  }
}

part of 'pages.dart';

class OrderHistoryPage extends StatefulWidget {
  @override
  _OrderHistoryPageState createState() => _OrderHistoryPageState();
}

class _OrderHistoryPageState extends State<OrderHistoryPage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionCubit, TransactionState>(
        builder: (_, transactionState) {
      if (transactionState is TransactionLoaded) {
        if (transactionState.transaction.length == 0) {
          return IlustrationPage(
            picturepath: "assets/image2.png",
            title: "Ouch! Hungry",
            subTitle: "Seems like you have not\nordered any food yet",
            buttonTap1: () {},
            buttonTitle1: "Find Foods",
          );
        } else {
          double listwidthItem =
              MediaQuery.of(context).size.width - 2 * defaultMargin;
          return ListView(
            children: [
              Column(
                children: [
                  Container(
                    height: 100,
                    width: double.infinity,
                    margin: EdgeInsets.only(bottom: defaultMargin),
                    padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Your Orders",
                          style: GoogleFonts.poppins(
                              fontSize: 22, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "Wait for the best meal",
                          style: GoogleFonts.poppins(
                              color: "8D92A3".toColor(),
                              fontWeight: FontWeight.w300),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    color: Colors.white,
                    child: Column(
                      children: [
                        CustomeTabbar(
                          titles: ["In Progress", "Past Orders"],
                          selectedIndex: selectedIndex,
                          onTap: (index) {
                            setState(() {
                              selectedIndex = index;
                            });
                          },
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Builder(builder: (_) {
                          List<Transaction> transactions = (selectedIndex == 0)
                              ? transactionState.transaction
                                  .where((element) =>
                                      element.transactionStatus ==
                                          TransactionStatus.on_delivery ||
                                      element.transactionStatus ==
                                          TransactionStatus.pending)
                                  .toList()
                              : transactionState.transaction
                                  .where((element) =>
                                      element.transactionStatus ==
                                          TransactionStatus.delivered ||
                                      element.transactionStatus ==
                                          TransactionStatus.cancelled)
                                  .toList();

                          return Column(
                              children: transactions
                                  .map((e) => Padding(
                                        padding: const EdgeInsets.only(
                                            right: defaultMargin,
                                            left: defaultMargin,
                                            bottom: 16),
                                        child: OrderList(
                                          transaction: e,
                                          itemWidth: listwidthItem,
                                        ),
                                      ))
                                  .toList());
                        })
                      ],
                    ),
                  ),
                ],
              )
            ],
          );
        }
      } else {
        return Center(
          child: loadingIndikator,
        );
      }
    });
  }
}

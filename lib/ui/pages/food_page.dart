part of 'pages.dart';

class FoodPage extends StatefulWidget {
  @override
  _FoodPageState createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  int selectIndext = 0;
  @override
  Widget build(BuildContext context) {
    double listWidht = MediaQuery.of(context).size.width - 2 * defaultMargin;
    return ListView(
      children: [
        Column(
          children: [
            /// HEADER
            Container(
              padding: EdgeInsets.symmetric(horizontal: defaultMargin),
              width: double.infinity,
              height: 108,
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "FoodMarket",
                        style: blackFontStyle1,
                      ),
                      Text(
                        "Let’s get some foods",
                        style: greyTextFont,
                      )
                    ],
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                            image: NetworkImage(
                                (context.bloc<UserCubit>().state as UserLoaded)
                                    .user
                                    .picturePath),
                            fit: BoxFit.cover)),
                  )
                ],
              ),
            ),

            /// LIST OF FOOD
            Container(
              height: 258,
              width: double.infinity,
              child: BlocBuilder<FoodCubit, FoodState>(
                  builder: (context, foodState) => (foodState is FoodLoaded)
                      ? ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            Row(
                              children: foodState.food
                                  .map((e) => Padding(
                                      padding: EdgeInsets.only(
                                          left: (e == mockFood.first)
                                              ? defaultMargin
                                              : 0,
                                          right: defaultMargin),
                                      child: GestureDetector(
                                          onTap: () {
                                            Get.to(FoodDetailPage(
                                              transaction: Transaction(
                                                  food: e,
                                                  user: (context
                                                          .bloc<UserCubit>()
                                                          .state as UserLoaded)
                                                      .user),
                                              onBackButton: () {
                                                Get.back();
                                              },
                                            ));
                                          },
                                          child: FoodCard(e))))
                                  .toList(),
                            )
                          ],
                        )
                      : Center(
                          child: loadingIndikator,
                        )),
            ),

            /// LIST OF FOOD (Tabs)
            Container(
              width: double.infinity,
              color: Colors.white,
              child: Column(
                children: [
                  CustomeTabbar(
                    titles: ['New Taste', 'Popular', 'Recommended'],
                    selectedIndex: selectIndext,
                    onTap: (index) {
                      setState(() {
                        selectIndext = index;
                      });
                    },
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  BlocBuilder<FoodCubit, FoodState>(
                      builder: (context, foodState) {
                    if (foodState is FoodLoaded) {
                      List<Food> foods = foodState.food
                          .where((element) =>
                              element.types.contains((selectIndext == 0)
                                  ? FoodType.new_food
                                  : (selectIndext == 1)
                                      ? FoodType.popular
                                      : FoodType.recomended))
                          .toList();

                      return Column(
                        children: foods
                            .map((e) => Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      defaultMargin, 0, defaultMargin, 16),
                                  child: FoodList(
                                    food: e,
                                    itemWidth: listWidht,
                                  ),
                                ))
                            .toList(),
                      );
                    } else {
                      return Center(
                        child: loadingIndikator,
                      );
                    }
                  })
                ],
              ),
            ),
            SizedBox(
              height: 30,
            )
          ],
        ),
      ],
    );
  }
}

part of 'pages.dart';

class ProfilePage extends StatefulWidget {
  final User user;
  ProfilePage({this.user});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int selectIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          color: Colors.white,
        ),
        SafeArea(
          child: Container(
            color: 'FAFAFC'.toColor(),
          ),
        ),
        ListView(children: [
          Column(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: defaultMargin),
                height: 232,
                width: double.infinity,
                decoration: BoxDecoration(color: Colors.white),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 16, top: 26),
                      height: 110,
                      width: 110,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/ellipse_6.png'))),
                      child: Stack(
                        children: [
                          Center(
                            child: Container(
                              height: 90,
                              width: 90,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: NetworkImage((context
                                              .bloc<UserCubit>()
                                              .state as UserLoaded)
                                          .user
                                          .picturePath),
                                      fit: BoxFit.cover)),
                            ),
                          )
                        ],
                      ),
                    ),
                    Text(
                        (context.bloc<UserCubit>().state as UserLoaded)
                            .user
                            .name,
                        style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.w300,
                            color: Colors.black)),
                    Text(
                      (context.bloc<UserCubit>().state as UserLoaded)
                          .user
                          .email,
                      style: greyTextFont,
                    )
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(color: Colors.white),
                child: Column(
                  children: [
                    CustomeTabbar(
                      titles: ["Account", "FoodMarket"],
                      selectedIndex: selectIndex,
                      onTap: (index) {
                        setState(() {
                          selectIndex = index;
                        });
                      },
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    (selectIndex == 0)
                        ? Container(
                            padding:
                                EdgeInsets.symmetric(horizontal: defaultMargin),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Edit Profile",
                                      style: blackFontStyle3,
                                    ),
                                    Icon(Icons.arrow_forward_ios)
                                  ],
                                ),
                                SizedBox(
                                  height: 11,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Home Address",
                                      style: blackFontStyle3,
                                    ),
                                    Icon(Icons.arrow_forward_ios)
                                  ],
                                ),
                                SizedBox(
                                  height: 11,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Security",
                                      style: blackFontStyle3,
                                    ),
                                    Icon(Icons.arrow_forward_ios)
                                  ],
                                ),
                                SizedBox(
                                  height: 11,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Payments",
                                      style: blackFontStyle3,
                                    ),
                                    Icon(Icons.arrow_forward_ios)
                                  ],
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                              ],
                            ),
                          )
                        : Container(
                            padding:
                                EdgeInsets.symmetric(horizontal: defaultMargin),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Rate App",
                                      style: blackFontStyle3,
                                    ),
                                    Icon(Icons.arrow_forward_ios)
                                  ],
                                ),
                                SizedBox(
                                  height: 11,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Help Center",
                                      style: blackFontStyle3,
                                    ),
                                    Icon(Icons.arrow_forward_ios)
                                  ],
                                ),
                                SizedBox(
                                  height: 11,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Privacy & Policy",
                                      style: blackFontStyle3,
                                    ),
                                    Icon(Icons.arrow_forward_ios)
                                  ],
                                ),
                                SizedBox(
                                  height: 11,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Terms & Conditions",
                                      style: blackFontStyle3,
                                    ),
                                    Icon(Icons.arrow_forward_ios)
                                  ],
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                              ],
                            ),
                          )
                  ],
                ),
              )
            ],
          )
        ]),
      ],
    ));
  }
}

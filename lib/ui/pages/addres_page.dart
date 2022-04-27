part of 'pages.dart';

class AddresPage extends StatefulWidget {
  final User user;
  final String password;
  final File pictcure;
  AddresPage(this.user, this.password, this.pictcure);
  @override
  State<AddresPage> createState() => _AddresPageState();
}

class _AddresPageState extends State<AddresPage> {
  TextEditingController numberController = TextEditingController();
  TextEditingController addresController = TextEditingController();
  TextEditingController housController = TextEditingController();
  bool isLoading = false;
  List<String> cities;
  String selectedCities;

  @override
  void initState() {
    super.initState();
    cities = ['Bandung', 'Jakarta', 'Yogyakarta'];
    selectedCities = cities[0];
  }

  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      onBackButton: () {
        Get.back();
      },
      title: "Addres",
      subTitle: "Make sure it's valid",
      child: Column(
        children: [
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 16, defaultMargin, 0),
            child: Text(
              "Phone no",
              style: blackFontStyle2,
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 0, defaultMargin, 0),
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(8),
            ),
            child: TextField(
              controller: numberController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Type your phone number",
                  hintStyle: greyTextFont),
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 16, defaultMargin, 0),
            child: Text(
              "Address",
              style: blackFontStyle2,
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 0, defaultMargin, 0),
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(8),
            ),
            child: TextField(
              controller: addresController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Type your address",
                  hintStyle: greyTextFont),
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 16, defaultMargin, 0),
            child: Text(
              "House No.",
              style: blackFontStyle2,
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 0, defaultMargin, 0),
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(8),
            ),
            child: TextField(
              controller: housController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Type your house number",
                  hintStyle: greyTextFont),
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 16, defaultMargin, 0),
            child: Text(
              "City",
              style: blackFontStyle2,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: defaultMargin),
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.black)),
            child: DropdownButton(
                value: selectedCities,
                isExpanded: true,
                underline: SizedBox(),
                items: cities
                    .map(
                      (e) => DropdownMenuItem(
                          value: e,
                          child: Text(
                            e,
                            style: blackFontStyle3,
                          )),
                    )
                    .toList(),
                onChanged: (item) {
                  setState(() {
                    selectedCities = item;
                  });
                }),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(defaultMargin, 24, defaultMargin, 0),
            width: double.infinity,
            height: 45,
            child: (isLoading == true)
                ? Center(
                    child: loadingIndikator,
                  )
                : RaisedButton(
                    color: mainColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    child: Text(
                      "Sign Up Now",
                      style: GoogleFonts.poppins(
                          color: Colors.black, fontWeight: FontWeight.w500),
                    ),
                    onPressed: () async {
                      User user = widget.user.copyWith(
                          phoneNumber: numberController.text,
                          address: addresController.text,
                          houseNumber: housController.text,
                          city: selectedCities);
                      setState(() {
                        isLoading = true;
                      });

                      await context.bloc<UserCubit>().signUp(
                          user, widget.password,
                          picturePath: widget.pictcure);

                      /// Mengambil UserState
                      UserState userState = context.bloc<UserCubit>().state;
                      if (userState is UserLoaded) {
                        // ambil data food
                        context.bloc<FoodCubit>().getFood();
                        context.bloc<TransactionCubit>().getTransaction();
                        // jika sudah keambil semua pindah kemain page
                        Get.to(MainPage());
                      } else {
                        isLoading = false;
                        Get.snackbar("title", "message",
                            backgroundColor: 'D9435E'.toColor(),
                            titleText: Text("SignIn Failed",
                                style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500)),
                            icon: Icon(
                              MdiIcons.closeCircleOutline,
                              color: Colors.white,
                            ),
                            messageText: Text(
                                (context.bloc<UserCubit>().state
                                        as UserLoadFailed)
                                    .message,
                                style:
                                    GoogleFonts.poppins(color: Colors.white)));
                      }
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

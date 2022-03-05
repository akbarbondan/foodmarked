part of 'pages.dart';

class AddresPage extends StatefulWidget {
  @override
  State<AddresPage> createState() => _AddresPageState();
}

class _AddresPageState extends State<AddresPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController numberController = TextEditingController();
    TextEditingController addresController = TextEditingController();
    TextEditingController housController = TextEditingController();
    TextEditingController cityController = TextEditingController();
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
                isExpanded: true,
                underline: SizedBox(),
                items: [
                  DropdownMenuItem(
                      child: Text(
                    'Yogyakarta',
                    style: blackFontStyle3,
                  )),
                  DropdownMenuItem(
                      value: '1',
                      child: Text(
                        'Jakarta',
                        style: blackFontStyle3,
                      )),
                  DropdownMenuItem(
                      value: '2',
                      child: Text(
                        'Surabaya',
                        style: blackFontStyle3,
                      )),
                ],
                onChanged: (item) {}),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(defaultMargin, 24, defaultMargin, 0),
            width: double.infinity,
            height: 45,
            child: RaisedButton(
              color: mainColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              child: Text(
                "Sign Up Now",
                style: GoogleFonts.poppins(
                    color: Colors.black, fontWeight: FontWeight.w500),
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}

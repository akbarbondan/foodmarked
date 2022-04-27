part of 'pages.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  User user;
  File filePicture;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController fullnameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GeneralPage(
        onBackButton: () {
          Get.back();
        },
        title: "Sign Up",
        subTitle: "Register and eat",
        child: Column(
          children: [
            GestureDetector(
              onTap: () async {
                PickedFile pickedFile =
                    await ImagePicker().getImage(source: ImageSource.gallery);

                if (pickedFile != null) {
                  filePicture = File(pickedFile.path);
                  setState(() {});
                }
              },
              child: Container(
                margin:
                    EdgeInsets.fromLTRB(defaultMargin, 26, defaultMargin, 0),
                padding: EdgeInsets.all(10),
                width: 110,
                height: 110,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/ellipse_6.png"))),
                child: (filePicture != null)
                    ? Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: FileImage(filePicture),
                                fit: BoxFit.cover)),
                      )
                    : Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: AssetImage("assets/photo.png"),
                                fit: BoxFit.cover)),
                      ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(defaultMargin, 16, defaultMargin, 0),
              width: double.infinity,
              child: Text("Full Name", style: blackFontStyle2),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(defaultMargin, 0, defaultMargin, 0),
              padding: EdgeInsets.symmetric(horizontal: defaultMargin),
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.black)),
              child: TextField(
                  controller: fullnameController,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintStyle: greyTextFont,
                      hintText: "Teype your full name")),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(defaultMargin, 16, defaultMargin, 0),
              width: double.infinity,
              child: Text("Email address", style: blackFontStyle2),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(defaultMargin, 0, defaultMargin, 0),
              padding: EdgeInsets.symmetric(horizontal: defaultMargin),
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.black)),
              child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintStyle: greyTextFont,
                      hintText: "Type your email address")),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(defaultMargin, 16, defaultMargin, 0),
              width: double.infinity,
              child: Text("Password", style: blackFontStyle2),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(defaultMargin, 0, defaultMargin, 0),
              padding: EdgeInsets.symmetric(horizontal: defaultMargin),
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.black)),
              child: TextField(
                  obscureText: true,
                  controller: passwordController,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintStyle: greyTextFont,
                      hintText: " Type your password")),
            ),
            SizedBox(height: 30),
            Container(
              padding: EdgeInsets.symmetric(horizontal: defaultMargin),
              width: double.infinity,
              height: 45,
              child: RaisedButton(
                onPressed: () {
                  Get.to(AddresPage(
                      User(
                          email: emailController.text,
                          name: fullnameController.text),
                      passwordController.text,
                      filePicture));
                },
                color: mainColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                child: Text(
                  "Continue",
                  style: GoogleFonts.poppins(
                      color: Colors.black, fontWeight: FontWeight.w500),
                ),
              ),
            )
          ],
        ));
  }
}

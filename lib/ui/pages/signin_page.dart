part of 'pages.dart';

class SigninPage extends StatefulWidget {
  @override
  State<SigninPage> createState() => _SigninPageState();

  SigninPage() {
    print("Halo 1");
  }
}

class _SigninPageState extends State<SigninPage> {
  @override
  void initState() {
    super.initState();
    print("Hallo");
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return GeneralPage(
        title: "Sign In",
        subTitle: "Find your best ever meal",
        child: Column(
          children: [
            Container(
              width: double.infinity,
              margin: EdgeInsets.fromLTRB(defaultMargin, 26, defaultMargin, 0),
              child: Text(
                "Email Addres",
                style: blackFontStyle2,
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: defaultMargin),
              padding: EdgeInsets.symmetric(horizontal: defaultMargin),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.black)),
              child: TextField(
                controller: emailController,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintStyle: greyTextFont,
                    hintText: 'Type your email address'),
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.fromLTRB(defaultMargin, 16, defaultMargin, 0),
              child: Text(
                "Password",
                style: blackFontStyle2,
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: defaultMargin),
              padding: EdgeInsets.symmetric(horizontal: defaultMargin),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.black)),
              child: TextField(
                controller: passwordController,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintStyle: greyTextFont,
                    hintText: 'Type your password '),
              ),
            ),
            Container(
                width: double.infinity,
                margin: EdgeInsets.only(top: 24),
                height: 45,
                padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                child: isLoading
                    ? loadingIndikator
                    : RaisedButton(
                        onPressed: () async {
                          setState(() {
                            isLoading = true;
                          });

                          /// Melakukan signin
                          await context.bloc<UserCubit>().signIn(
                              emailController.text, passwordController.text);

                          /// Mengambil UserState
                          UserState state = context.bloc<UserCubit>().state;

                          if (state is UserLoaded) {
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
                                    (state as UserLoadFailed).message,
                                    style: GoogleFonts.poppins(
                                        color: Colors.white)));

                            setState(() {
                              isLoading = false;
                            });
                          }
                        },
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        color: mainColor,
                        child: Text(
                          "Sign In",
                          style: GoogleFonts.poppins(
                              color: Colors.white, fontWeight: FontWeight.w500),
                        ),
                      )),
            Container(
                width: double.infinity,
                margin: EdgeInsets.only(top: 24),
                height: 45,
                padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                child: isLoading
                    ? loadingIndikator
                    : RaisedButton(
                        onPressed: () {
                          Get.to(() => SignUpPage());
                        },
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        color: greyColor,
                        child: Text(
                          "Create New Account",
                          style: GoogleFonts.poppins(
                              color: Colors.black, fontWeight: FontWeight.w500),
                        ),
                      ))
          ],
        ));
  }
}

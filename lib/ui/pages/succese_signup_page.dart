part of 'pages.dart';

class SuccesSignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: IlustrationPage(
        title: "Yeay! Com pleted",
        subTitle: "Now you are able to order\nsome foods as a self-reward",
        picturepath: "assets/image3.png",
        buttonTitle1: "Find Foods",
        buttonTap1: () {},
      ),
    );
  }
}

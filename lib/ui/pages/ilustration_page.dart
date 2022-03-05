part of 'pages.dart';

class IlustrationPage extends StatelessWidget {
  final String title;
  final String subTitle;
  final String picturepath;
  final String buttonTitle1;
  final String buttonTitle2;
  final Function buttonTap1;
  final Function buttonTap2;

  IlustrationPage(
      {@required this.title,
      @required this.subTitle,
      @required this.picturepath,
      @required this.buttonTitle1,
      @required this.buttonTap1,
      this.buttonTap2,
      this.buttonTitle2});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 150,
              width: 150,
              margin: EdgeInsets.only(bottom: 50),
              decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage(picturepath))),
            ),
            Text(
              title,
              style: blackFontStyle3.copyWith(
                fontSize: 20,
              ),
            ),
            Text(
              subTitle,
              style: greyTextFont.copyWith(fontWeight: FontWeight.w300),
              textAlign: TextAlign.center,
            ),
            Container(
              width: 200,
              height: 45,
              margin: EdgeInsets.only(top: 30, bottom: 12),
              child: RaisedButton(
                onPressed: buttonTap1,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                color: mainColor,
                elevation: 0,
                child: Text(
                  buttonTitle1,
                  style: blackFontStyle3.copyWith(fontWeight: FontWeight.w500),
                ),
              ),
            ),
            (buttonTap2 == null)
                ? SizedBox()
                : SizedBox(
                    width: 200,
                    height: 45,
                    child: RaisedButton(
                      onPressed: buttonTap2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      color: "8D92A3".toColor(),
                      elevation: 0,
                      child: Text(
                        buttonTitle2 ?? "Title",
                        style: blackFontStyle3.copyWith(
                            fontWeight: FontWeight.w500, color: Colors.white),
                      ),
                    ),
                  )
          ],
        ),
      ),
    );
  }
}

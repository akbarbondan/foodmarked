part of 'pages.dart';

class GeneralPage extends StatelessWidget {
  final String title;
  final Function onBackButton;
  final String subTitle;
  final Widget child;
  final Color backColor;

  GeneralPage(
      {this.title = "Title",
      this.onBackButton,
      this.subTitle = "Subtile",
      this.child,
      this.backColor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(color: Colors.white),
          SafeArea(
              child: Container(
            color: backColor ?? Colors.white,
          )),
          SafeArea(
            child: ListView(
              children: [
                Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 100,
                      padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                      color: Colors.white,
                      child: Row(
                        children: [
                          onBackButton != null
                              ? GestureDetector(
                                  onTap: () {
                                    if (onBackButton != null) {
                                      onBackButton();
                                    }
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(right: 30),
                                    width: 24,
                                    height: 24,
                                    child: Icon(Icons.arrow_back_ios),
                                  ),
                                )
                              : SizedBox(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                title,
                                style: GoogleFonts.poppins(
                                    fontSize: 22, fontWeight: FontWeight.w500),
                              ),
                              Text(
                                subTitle,
                                style: GoogleFonts.poppins(
                                    color: "8D92A3".toColor(),
                                    fontWeight: FontWeight.w300),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: defaultMargin,
                      color: "FAFAFC".toColor(),
                      width: double.infinity,
                    ),
                    child ?? SizedBox()
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

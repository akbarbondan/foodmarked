part of 'pages.dart';

class MainPage extends StatefulWidget {
  final int initialPage;
  MainPage({this.initialPage = 0});
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    super.initState();
    selectPage = widget.initialPage;
    pageController = PageController(initialPage: widget.initialPage);
  }

  int selectPage = 0;
  PageController pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          color: Colors.white,
        ),
        SafeArea(child: Container(color: 'FAFAFA'.toColor())),
        SafeArea(
            child: PageView(
                controller: pageController,
                onPageChanged: (index) {
                  setState(() {
                    selectPage = index;
                  });
                },
                children: [FoodPage(), OrderHistoryPage(), ProfilePage()])),
        Align(
          alignment: Alignment.bottomCenter,
          child: CustomNavbar(
            selectedIndex: selectPage,
            ontap: (index) {
              setState(() {
                selectPage = index;
              });
              pageController.jumpToPage(selectPage);
            },
          ),
        )
      ],
    ));
  }
}

part of 'widgets.dart';

class CustomNavbar extends StatelessWidget {
  final int selectedIndex;
  final Function(int index) ontap;

  CustomNavbar({this.selectedIndex = 0, this.ontap});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: double.infinity,
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.only(left: 49, right: 49),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                if (ontap != null) {
                  ontap(0);
                }
              },
              child: Container(
                height: 32,
                width: 32,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.contain,
                        image: AssetImage("assets/ic_home" +
                            ((selectedIndex == 0) ? '.png' : '_normal.png')))),
              ),
            ),
            GestureDetector(
              onTap: () {
                if (ontap != null) {
                  ontap(1);
                }
              },
              child: Container(
                height: 32,
                width: 32,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.contain,
                        image: AssetImage("assets/ic_order" +
                            ((selectedIndex == 1) ? '.png' : '_normal.png')))),
              ),
            ),
            GestureDetector(
              onTap: () {
                if (ontap != null) {
                  ontap(2);
                }
              },
              child: Container(
                height: 32,
                width: 32,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.contain,
                        image: AssetImage("assets/ic_profile" +
                            ((selectedIndex == 2) ? '.png' : '_normal.png')))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

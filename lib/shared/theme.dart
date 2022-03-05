part of 'shared.dart';

Color mainColor = "FFC700".toColor();
Color greyColor = "8D92A3".toColor();
TextStyle greyTextFont = GoogleFonts.poppins().copyWith(color: greyColor);
TextStyle blackFontStyle1 = GoogleFonts.poppins()
    .copyWith(color: Colors.black, fontSize: 22, fontWeight: FontWeight.w500);
TextStyle blackFontStyle2 = GoogleFonts.poppins()
    .copyWith(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500);
TextStyle blackFontStyle3 = GoogleFonts.poppins()
    .copyWith(color: Colors.black, fontWeight: FontWeight.w500);
const double defaultMargin = 24;

Widget loadingIndikator = SpinKitFadingCircle(size: 45, color: mainColor);

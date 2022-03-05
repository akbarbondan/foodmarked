part of 'widgets.dart';

class Rating extends StatelessWidget {
  final double rate;
  Rating(this.rate);
  @override
  Widget build(BuildContext context) {
    int numberOfStars = rate.round();
    return Row(
        children: List<Widget>.generate(
                5,
                (index) => Icon(
                      (index < numberOfStars)
                          ? MdiIcons.star
                          : MdiIcons.starOutline,
                      color: mainColor,
                      size: 16,
                    )) +
            [
              const SizedBox(
                width: 4,
              ),
              Text(rate.toString(), style: greyTextFont.copyWith(fontSize: 12))
            ]);
  }
}

part of 'widgets.dart';

class FoodList extends StatelessWidget {
  final Food food;
  final double itemWidth;
  FoodList({@required this.food, this.itemWidth});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 60,
          width: 60,
          margin: EdgeInsets.only(right: 12),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                  image: NetworkImage(food.pictureFood), fit: BoxFit.cover)),
        ),
        SizedBox(
          width: itemWidth - 182,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                food.nameFood,
                style: blackFontStyle2,
                maxLines: 1,
                overflow: TextOverflow.clip,
              ),
              Text(
                NumberFormat.currency(
                        symbol: 'IDR ', decimalDigits: 0, locale: 'id-ID')
                    .format(food.price),
                style: greyTextFont.copyWith(fontSize: 13),
              )
            ],
          ),
        ),
        Rating(food.rate)
      ],
    );
  }
}

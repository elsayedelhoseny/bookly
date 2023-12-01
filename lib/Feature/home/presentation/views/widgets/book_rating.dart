import 'package:bookly/Core/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BookRating extends StatelessWidget {
  const BookRating(
      {super.key, this.mainAxisAlignment = MainAxisAlignment.start, required this.rating, required this.count});
  final MainAxisAlignment mainAxisAlignment;
  final num rating;
  final int count;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        const Icon(
          FontAwesomeIcons.solidStar,
          color: Color(0xffFFDD4F),
          size: 15,
        ),
        const SizedBox(
          width: 6.3,
        ),
        Text(
          rating.toString(),
          style: Style.textstyle16.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          width: 5,
        ),
         Opacity(
          opacity: .5,
          child: Text(
            '($count)',
            style: Style.textstyle14,
          ),
        ),
      ],
    );
  }
}

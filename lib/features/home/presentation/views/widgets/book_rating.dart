import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/utils/styles.dart';

class BookRating extends StatelessWidget {
  const BookRating(
      {super.key, this.mainAxisAlignment = MainAxisAlignment.start});

  final MainAxisAlignment mainAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: const [
        Icon(
          FontAwesomeIcons.solidStar,
          size: 14,
          color: Color(0xffFFDD4F),
        ),
        SizedBox(width: 6.3),
        Text(
          '4,8',
          style: Styles.textStyle16,
        ),
        SizedBox(width: 6.3),
        Opacity(
          opacity: .5,
          child: Text(
            '(245)',
            style: Styles.textStyle14,
          ),
        )
      ],
    );
  }
}

import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/utils/styles.dart';

class BookRating extends StatelessWidget {
  const BookRating({super.key, this.mainAxisAlignment = MainAxisAlignment
      .start, this.book,});

  final MainAxisAlignment mainAxisAlignment;
  final BookEntity? book;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        const Icon(
          FontAwesomeIcons.solidStar,
          size: 14,
          color: Color(0xffFFDD4F),
        ),
        const SizedBox(width: 6.3),
        Text(
          book?.rating != null ? book!.rating!.toString() : 'No Ratings',
          style: Styles.textStyle16,
        ),
        const SizedBox(width: 6.3),
        Opacity(
          opacity: .5,
          child: Text(
            book?.ratingsCount != null
                ? '(book!.ratingsCount!.toString())'
                : '(0)',
            style: Styles.textStyle14,
          ),
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/styles.dart';
import '../../../domain/entities/book_entity.dart';
import '../../manager/featured_books_cubit/featured_books_cubit.dart';
import 'book_rating.dart';
import 'books_action.dart';
import 'custom_book_image.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection(
      {super.key, required this.book}); // تمرير book بدلاً من books
  final BookEntity book;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        Widget bookImage;

        if (state is FeaturedBooksSuccess && state.books.isNotEmpty) {
          bookImage = CustomBookImage(
            image: book.image ?? '',
          );
        } else if (state is FeaturedBooksFailure) {
          bookImage = const Icon(Icons.error, color: Colors.red);
        } else {
          bookImage = const Center(child: CircularProgressIndicator());
        }

        return Column(
          children: [
            const SizedBox(height: 30),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * .2),
              child: SizedBox(
                height: 270,
                width: 250,
                child: bookImage,
              ),
            ),
            const SizedBox(height: 43),
            Text(
              book.title,
              style: Styles.textStyle30.copyWith(fontFamily: kGTSectraFine),
            ),
            const SizedBox(height: 6),
            Opacity(
              opacity: 0.7,
              child: Text(
                book.authorName ?? 'Rudyard Kipling',
                style: Styles.textStyle18.copyWith(
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(height: 16),
            BookRating(
              mainAxisAlignment: MainAxisAlignment.center,
              book: book,
            ),
            const SizedBox(height: 37),
            const BooksAction(),
          ],
        );
      },
    );
  }
}

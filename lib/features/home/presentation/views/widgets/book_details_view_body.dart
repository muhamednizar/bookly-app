import 'package:bookly_app/features/home/presentation/views/widgets/similar_books_section.dart';
import 'package:flutter/material.dart';
import 'book_details_section.dart';
import 'custom_book_details_app_bar.dart';
import '../../../domain/entities/book_entity.dart';

class BookDetailsViewBody extends StatelessWidget {
  final BookEntity book;

  const BookDetailsViewBody({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: CustomBookDetailsAppBar(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: BookDetailsSection(book: book), // مباشرة تمرير الكتاب
              ),
              const SizedBox(height: 50),
              const SimilarBooksSection(),
            ],
          ),
        ),
      ],
    );
  }
}

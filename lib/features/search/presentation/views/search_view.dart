import 'package:bookly_app/features/search/presentation/views/widget/serach_view_body.dart';
import 'package:flutter/material.dart';

import '../../../home/domain/entities/book_entity.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key, required this.book});

  final BookEntity book;
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: SearchViewBody()),
    );
  }
}

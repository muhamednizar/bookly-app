import 'package:bookly_app/features/home/presentation/views/widgets/similar_books_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/styles.dart';
import '../../manager/similar_books_cubit/similar_books_cubit.dart';

class SimilarBooksSection extends StatefulWidget {
  final String bookId;

  const SimilarBooksSection({super.key, required this.bookId});

  @override
  State<SimilarBooksSection> createState() => _SimilarBooksSectionState();
}

class _SimilarBooksSectionState extends State<SimilarBooksSection> {
  @override
  void initState() {
    super.initState();
    // استدعاء fetchSimilarBooks عند إنشاء الـ widget
    context.read<SimilarBooksCubit>().fetchSimilarBooks(bookId: widget.bookId);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'You can also like',
                style: Styles.textStyle14.copyWith(fontWeight: FontWeight.w600),
              )),
        ),
        const SizedBox(
          height: 16,
        ),
        SimilarBooksListView(bookId: widget.bookId),
        const SizedBox(
          height: 40,
        ),
      ],
    );
  }
}

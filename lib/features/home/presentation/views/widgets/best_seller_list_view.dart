import 'package:flutter/cupertino.dart';

import '../../../domain/entities/book_entity.dart';
import 'best_seller_view_item.dart';

class BestSellerListView extends StatefulWidget {
  const BestSellerListView({
    super.key,
    required this.books,
  });
  final List<BookEntity> books;

  @override
  State<BestSellerListView> createState() => _BestSellerListViewState();
}

class _BestSellerListViewState extends State<BestSellerListView> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount:widget.books.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: BookListViewItem(books: widget.books[index]),
        );
      },
    );
  }
}
import 'package:flutter/cupertino.dart';

import '../../../domain/entities/book_entity.dart';
import 'best_seller_view_item.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: 10,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: BookListViewItem(),
        );
      },
    );
  }
}

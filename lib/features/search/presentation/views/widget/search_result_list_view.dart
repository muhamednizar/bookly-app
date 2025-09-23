import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:flutter/material.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:go_router/go_router.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({
    super.key,
    required this.books,
  });
  final List<BookEntity> books;
  @override
  Widget build(BuildContext context) {
    if (books.isEmpty) {
      return const Center(child: Text('no results found'));
    }
    return ListView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      itemCount: books.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: ListTile(
            leading: CustomBookImage(image: books[index].image ?? '',),
            title: Text(books[index].title),
            subtitle: Text(books[index].authorName ?? ''),
            trailing: const Icon(Icons.arrow_forward_ios),
            minTileHeight: 100,
            contentPadding: EdgeInsets.zero,
            onTap: () {
              GoRouter.of(context).push(AppRouter.kBookDetailsView, extra: books[index]);
            },
          ),
        );
      },
    );
  }
}

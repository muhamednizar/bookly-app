import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/core/widgets/custom_fading_widget.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_bookImage_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/styles.dart';
import '../../manager/similar_books_cubit/similar_books_cubit.dart';
import 'custom_book_image.dart';

class SimilarBooksListView extends StatelessWidget {
  final String bookId;

  const SimilarBooksListView({super.key, required this.bookId});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
      builder: (context, state) {
        if (state is SimilarBooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .15,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.books.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: GestureDetector(
                    onTap: () {
                      GoRouter.of(context).push(AppRouter.kBookDetailsView , extra: state.books[index]);
                    },
                    child: CustomBookImage(
                      image: state.books[index].image ?? '',
                    ),
                  ),
                );
              },
            ),
          );
        } else if (state is SimilarBooksFailure) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .15,
            child: Center(
              child: Text(
                state.errMessage,
                style: Styles.textStyle14.copyWith(color: Colors.red),
              ),
            ),
          );
        } else if (state is SimilarBooksLoading) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .15,
            child: const Center(
              child: SimilarBooksLoadingIndicator(),
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
 class SimilarBooksLoadingIndicator extends StatelessWidget {
  const SimilarBooksLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return  CustomFadingWidget(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * .15,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (context, index) {
            return const Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: CustomBookImageLoadingIndicator(),
            );
          },
        ),
      ),
    );
  }
}
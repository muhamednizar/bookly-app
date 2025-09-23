import 'package:bookly_app/features/search/manager/search_books_cubit.dart';
import 'package:bookly_app/features/search/manager/search_books_state.dart';
import 'package:bookly_app/features/search/presentation/views/widget/search_result_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../home/presentation/views/widgets/custom_search_field.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({
    super.key,
    required this.controller,
  });
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          CustomSearchField(controller: controller),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: BlocBuilder<SearchBooksCubit, SearchBooksState>(
              builder: (context, state) {
                if (state is SearchBooksLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is SearchBooksFailure) {
                  return Center(child: Text(state.errMessage));
                } else if (state is SearchBooksSuccess) {
                  return SearchResultListView(books: state.books);
                } else {
                  return const Center(child: Text('search for a book' , style: TextStyle(fontSize: 20),));
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

